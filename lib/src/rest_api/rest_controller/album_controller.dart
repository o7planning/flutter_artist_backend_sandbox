import 'package:drift/extensions/native.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:msw_dio_interceptor/msw_dio_interceptor.dart';

import '../../../database.dart';
import '../../model/model.dart';
import '../../utils/mock_response_utils.dart';

// *****************************************************************************
// *****************************************************************************

void albumRestApiRegister() {
  MockRegistry.register(
    MockRule(
      path: '/rest/page/album-info/search',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          return await getAlbumInfoPage(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  MockRegistry.register(
    MockRule(
      path: '/rest/page/album-info/all',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          return await getAlbumInfoPageAll(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  // /rest/record/album-data/123
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/record/album-data/\\d+',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          final albumId = int.parse(request.path.split('/').last);
          return await getAlbumDetail(request, albumId);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> getAlbumInfoPageAll(MockRequest request) async {
  final SharedDatabase db = await getSharedDatabase();

  List<AlbumData> allAlbumDatas = await (db.select(db.album)).get();
  //
  List<AlbumInfo> albumInfos = allAlbumDatas
      .map((e) => AlbumInfo.fromEntity(e))
      .toList();

  AlbumInfoPage p = AlbumInfoPage(items: albumInfos, paginationInfo: null);
  return MockResponse.json(p.toJson());
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> getAlbumInfoPage(MockRequest request) async {
  // "currentPage": 1,
  // "pageSize": 20,
  // "searchText": null
  Map<String, dynamic> queryParameters = request.query;
  int currentPage = queryParameters["currentPage"];
  int pageSize = queryParameters["pageSize"];
  String searchText = queryParameters["searchText"] ?? "";
  //
  final SharedDatabase db = await getSharedDatabase();

  List<AlbumData> allAlbumDatas = await (db.select(
    db.album,
  )..where((e) => e.name.containsCase(searchText))).get();
  //
  PageData<AlbumData> pageData = PageData.calculate(
    currentPage: currentPage,
    pageSize: pageSize,
    allItems: allAlbumDatas,
  );
  PageData<AlbumInfo> page = pageData.convert(
    converter: (albumData) => AlbumInfo.fromEntity(albumData),
  );
  AlbumInfoPage p = AlbumInfoPage(
    items: page.items,
    paginationInfo: PaginationInfoImpl.fromPagination(page.paginationInfo),
  );

  return MockResponse.json(p.toJson());
}

// *****************************************************************************
// *****************************************************************************

// AlbumDetail.
Future<MockResponse> getAlbumDetail(MockRequest request, int albumId) async {
  final SharedDatabase db = await getSharedDatabase();

  AlbumData? entity = await db.albumDAO.findById(albumId);

  if (entity == null) {
    return MockResponse.json({});
  }
  AlbumDetail detail = AlbumDetail.fromEntity(entity);
  return MockResponse.json(detail.toJson());
}

// *****************************************************************************
// *****************************************************************************
