import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:drift/extensions/native.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:msw_dio_interceptor/msw_dio_interceptor.dart';

import '../../../database.dart';
import '../../database/_global_base64_image.dart';
import '../../database/joins/football_player_with_country.dart';
import '../../model/model.dart';
import '../../utils/mock_response_utils.dart';
import '../form/_form_field_error.dart';
import '../form/football_player_form.dart';

// *****************************************************************************
// *****************************************************************************

void footballPlayerRestApiRegister() {
  MockRegistry.register(
    MockRule(
      path: '/rest/page/football-player-info/search',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          return await getFootballPlayerInfoPage(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  // /rest/record/football-player-data/123
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/record/football-player-data/\\d+',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          final footballPlayerId = int.parse(request.path.split('/').last);
          return await getFootballPlayerDetail(request, footballPlayerId);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  //
  MockRegistry.register(
    MockRule(
      path: '/rest/record/football-player-data/update',
      method: 'PUT',
      handler: (MockRequest request) async {
        try {
          return await updateFootballPlayer(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  //
  MockRegistry.register(
    MockRule(
      path: '/rest/record/football-player-data/create',
      method: 'POST',
      handler: (MockRequest request) async {
        try {
          return await createFootballPlayer(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  //
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/action/football-player/delete/\\d+',
      method: 'DELETE',
      handler: (MockRequest request) async {
        try {
          final footballPlayerId = int.parse(request.path.split('/').last);
          return await deleteFootballPlayer(request, footballPlayerId);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> getFootballPlayerInfoPage(MockRequest request) async {
  // "currentPage": 1,
  // "pageSize": 20,
  // "searchText": null
  Map<String, dynamic> queryParameters = request.query;
  int currentPage = queryParameters["currentPage"];
  int pageSize = queryParameters["pageSize"];
  String searchText = queryParameters["searchText"] ?? "";
  //
  final SharedDatabase db = await getSharedDatabase();

  final query = db.select(db.footballPlayer)
    ..where((e) => e.fullName.containsCase(searchText));

  final joinedQuery = query.join([
    innerJoin(db.country, db.country.id.equalsExp(db.footballPlayer.countryId)),
  ]);
  //
  final result = await joinedQuery.get();

  List<FootballPlayerWithCountry> allItems = result.map((row) {
    final footballPlayer = row.readTable(db.footballPlayer);
    final country = row.readTable(db.country);
    return FootballPlayerWithCountry(footballPlayer, country);
  }).toList();
  //
  PageData<FootballPlayerWithCountry> pageData = PageData.calculate(
    currentPage: currentPage,
    pageSize: pageSize,
    allItems: allItems,
  );
  PageData<FootballPlayerInfo> page = pageData.convert(
    converter: (footballPlayerWithCountry) => FootballPlayerInfo.fromEntity(
      footballPlayerWithCountry.footballPlayer,
      footballPlayerWithCountry.country,
    ),
  );
  FootballPlayerInfoPage p = FootballPlayerInfoPage(
    items: page.items,
    paginationInfo: PaginationInfoImpl.fromPagination(page.paginationInfo),
  );
  return MockResponse.json(p.toJson());
}

// *****************************************************************************
// *****************************************************************************

// FootballPlayerDetail.
Future<MockResponse> getFootballPlayerDetail(
  MockRequest request,
  int footballPlayerId,
) async {
  final SharedDatabase db = await getSharedDatabase();

  FootballPlayerData? entity = await db.footballPlayerDAO.findById(
    footballPlayerId,
  );

  if (entity == null) {
    return MockResponse.json({});
  }
  CountryData country = await (db.select(
    db.country,
  )..where((e) => e.id.equals(entity.countryId))).getSingle();
  //
  FootballPlayerDetail detail = FootballPlayerDetail.fromEntity(
    entity,
    country,
  );
  return MockResponse.json(detail.toJson());
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> updateFootballPlayer(MockRequest request) async {
  FormData formData = request.body;
  final FootballPlayerForm form = FootballPlayerForm(formData);
  if (form.id == null) {
    throw FormFieldError(errorMessage: "No id to update");
  }
  final SharedDatabase db = await getSharedDatabase();
  //
  final CountryData? country = await db.countryDAO.findById(form.countryId);
  if (country == null) {
    throw FormFieldError(errorMessage: "Country ${form.countryId} not found");
  }
  //
  await db.update(db.footballPlayer)
    ..where((u) => u.id.equals(form.id!))
    ..write(
      FootballPlayerCompanion(
        fullName: Value(form.fullName),
        birthday: Value(form.birthday),
        countryId: Value(form.countryId),
        description: Value(form.description),
        // imagePath: Value(form.imagePath),
      ),
    );
  //
  await storeFootballPlayerBase64Image(form.id!, form.multipartFile);
  //
  final FootballPlayerData? footballPlayer = await db.footballPlayerDAO
      .findById(form.id!);
  //
  if (footballPlayer == null) {
    return MockResponse.json({});
  } else {
    FootballPlayerDetail detail = FootballPlayerDetail.fromEntity(
      footballPlayer,
      country,
    );
    return MockResponse.json(detail.toJson());
  }
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> createFootballPlayer(MockRequest request) async {
  FormData formData = request.body;
  final FootballPlayerForm form = FootballPlayerForm(formData);
  final SharedDatabase db = await getSharedDatabase();
  //
  //
  final CountryData? country = await db.countryDAO.findById(form.countryId);
  if (country == null) {
    throw FormFieldError(errorMessage: "Country ${form.countryId} not found");
  }
  //
  final footballPlayerId = await db
      .into(db.footballPlayer)
      .insert(
        FootballPlayerCompanion.insert(
          fullName: form.fullName,
          birthday: form.birthday,
          countryId: form.countryId,
          // imagePath = const Value.absent(),
          description: Value(form.description),
        ),
      );
  //
  await storeFootballPlayerBase64Image(footballPlayerId, form.multipartFile);
  //
  final FootballPlayerData? footballPlayer = await db.footballPlayerDAO
      .findById(footballPlayerId);
  //
  if (footballPlayer == null) {
    return MockResponse.json({});
  } else {
    FootballPlayerDetail detail = FootballPlayerDetail.fromEntity(
      footballPlayer,
      country,
    );
    return MockResponse.json(detail.toJson());
  }
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> deleteFootballPlayer(
  MockRequest request,
  int footballPlayerId,
) async {
  final SharedDatabase db = await getSharedDatabase();
  //
  final FootballPlayerData? footballPlayer = await db.footballPlayerDAO
      .findById(footballPlayerId);
  if (footballPlayer == null) {
    return MockResponse.json({});
  }
  //
  await db.footballPlayerDAO.deleteById(footballPlayerId);
  return MockResponse.json({});
}

// *****************************************************************************
// *****************************************************************************
