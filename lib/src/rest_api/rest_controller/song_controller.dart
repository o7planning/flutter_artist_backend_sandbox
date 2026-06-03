import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:drift/extensions/native.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:msw_dio_interceptor/msw_dio_interceptor.dart';

import '../../../database.dart';
import '../../database/joins/song_with_album.dart';
import '../../database/utils/drift_filter_parser.dart';
import '../../model/model.dart';
import '../../utils/mock_response_utils.dart';
import '../field_mapping/song_field_mapping.dart';

// *****************************************************************************
// *****************************************************************************

void songRestApiRegister() {
  MockRegistry.register(
    MockRule(
      path: '/rest/features/field-based-json/page/song-info/56a',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          return await getSongInfoPageByJSON(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  MockRegistry.register(
    MockRule(
      path: '/rest/page/song-info/search',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          return await getSongInfoPage(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  // /rest/record/song-data/123
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/record/song-data/\\d+',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          final songId = int.parse(request.path.split('/').last);
          return await getSongDetail(request, songId);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
}

// *****************************************************************************
// *****************************************************************************

// "currentPage": 1,
// "pageSize": 5,
// "searchText": null,
// "albumId": null,
Future<MockResponse> getSongInfoPage(MockRequest request) async {
  Map<String, dynamic> queryParameters = request.query;
  int currentPage = queryParameters["currentPage"];
  int pageSize = queryParameters["pageSize"];
  String searchText = queryParameters["searchText"] ?? "";
  int? albumId = queryParameters["albumId"];
  //
  final SharedDatabase db = await getSharedDatabase();

  final select = db.select(db.song)
    ..where((e) => e.name.containsCase(searchText));

  final joinedQuery = select.join([
    if (albumId == null)
      innerJoin(db.album, db.album.id.equalsExp(db.song.albumId)),
    if (albumId != null)
      innerJoin(
        db.album,
        db.album.id.equals(albumId) & db.album.id.equalsExp(db.song.albumId),
      ),
  ]);
  //
  final result = await joinedQuery.get();

  List<SongWithAlbum> allSongWithAlbum = result.map((row) {
    final song = row.readTable(db.song);
    final album = row.readTable(db.album);
    return SongWithAlbum(song, album);
  }).toList();

  PageData<SongWithAlbum> pageData = PageData.calculate(
    currentPage: currentPage,
    pageSize: pageSize,
    allItems: allSongWithAlbum,
  );
  PageData<SongInfo> page = pageData.convert(
    converter: (empWithPos) {
      return SongInfo.fromEntity(empWithPos.song);
    },
  );
  SongInfoPage p = SongInfoPage(
    items: page.items,
    paginationInfo: PaginationInfoImpl.fromPagination(page.paginationInfo),
  );
  return MockResponse.json(p.toJson());
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> getSongDetail(MockRequest request, int songId) async {
  final SharedDatabase db = await getSharedDatabase();

  SongData? entity = await db.songDAO.findById(songId);

  if (entity == null) {
    return MockResponse.json({});
  }
  int albumId = entity.albumId;
  AlbumData album = await db.albumDAO.findById(albumId) as AlbumData;

  SongDetail detail = SongDetail.fromEntity(entity, album);
  return MockResponse.json(detail.toJson());
}

Future<MockResponse> getSongInfoPageByJSON(MockRequest request) async {
  try {
    Map<String, dynamic> queryParameters = request.query;
    int currentPage =
        int.tryParse(queryParameters["currentPage"]?.toString() ?? '1') ?? 1;
    int pageSize =
        int.tryParse(queryParameters["pageSize"]?.toString() ?? '10') ?? 10;

    // 1. Decode the dynamic filter JSON
    String fieldBasedJSONRaw = queryParameters["fieldBasedJSON"] ?? "{}";
    Map<String, dynamic> filterMap = jsonDecode(fieldBasedJSONRaw);

    final SharedDatabase db = await getSharedDatabase();

    // 2. Use the smart parser to generate the WHERE clause
    final parser = DriftFilterParser(db);
    final whereExpression = parser.parse(
      filterMap,
      SongFieldMapping.fieldToColumnMap(db),
    );

    // 3. Build the query with Join between Song and Album
    final query = db.select(db.song).join([
      innerJoin(db.album, db.album.id.equalsExp(db.song.albumId)),
    ]);

    // 4. Inject the dynamic WHERE clause
    query.where(whereExpression);

    // 5. Execute and fetch data
    final rows = await query.get();

    // 6. Map database rows to your SongInfo domain models
    List<SongInfo> allItems = rows.map((row) {
      final song = row.readTable(db.song);
      final album = row.readTable(db.album);

      // Use your existing factory/converter logic
      return SongInfo.fromEntity(song);
    }).toList();

    // 7. Apply local pagination
    PageData<SongInfo> pageData = PageData.calculate(
      currentPage: currentPage,
      pageSize: pageSize,
      allItems: allItems,
    );

    // 8. Construct the final page object
    SongInfoPage p = SongInfoPage(
      items: pageData.items,
      paginationInfo: PaginationInfoImpl.fromPagination(
        pageData.paginationInfo,
      ),
    );

    return MockResponse.json(p.toJson());
  } catch (e) {
    // Standard error handling for the mock environment
    return MockResponseUtils.handleError(e);
  }
}
