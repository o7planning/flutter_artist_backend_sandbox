import 'package:drift/drift.dart';
import 'package:msw_dio_interceptor/msw_dio_interceptor.dart';

import '../../../database.dart';
import '../../model/model.dart';
import '../../utils/mock_response_utils.dart';

// *****************************************************************************
// *****************************************************************************

void contributorRestApiRegister() {
  // /rest/contributor/123
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/contributor/\\d+',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          final contributorId = int.parse(request.path.split('/').last);
          return await getContributorDetail(request, contributorId);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  // /rest/page/contributor-info/all/by-project-id/1
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/page/contributor-info/all/by-project-id/\\d+',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          final projectId = int.parse(request.path.split('/').last);
          return await getContributorInfoPage(request, projectId);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  //
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/action/contributor/add-multi-by-project-id/\\d+',
      method: 'POST',
      handler: (MockRequest request) async {
        try {
          final projectId = int.parse(request.path.split('/').last);
          return await addMultiContributors(request, projectId);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  //
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/action/contributor/delete/\\d+',
      method: 'DELETE',
      handler: (MockRequest request) async {
        try {
          final contributorId = int.parse(request.path.split('/').last);
          return await deleteContributor(request, contributorId);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
}

// *****************************************************************************
// *****************************************************************************

// Future<MockResponse> getContributorInfoPageAll(MockRequest request) async {
//   final SharedDatabase db = await getSharedDatabase();
//
//   List<ContributorData> allContributorDatas = await (db.select(db.contributor)).get();
//   //
//   List<ContributorInfo> contributorInfos = allContributorDatas
//       .map((e) => ContributorInfo.fromEntity(e))
//       .toList();
//
//   ContributorInfoPage p = ContributorInfoPage(items: contributorInfos, paginationInfo: null);
//   return MockResponse.json(p.toJson());
// }

// *****************************************************************************
// *****************************************************************************

// ContributorDetail.
Future<MockResponse> getContributorDetail(
  MockRequest request,
  int contributorId,
) async {
  final SharedDatabase db = await getSharedDatabase();

  ContributorData? entity = await db.contributorDAO.findById(contributorId);

  if (entity == null) {
    return MockResponse.json({});
  }
  AppUserData appUser =
      await db.appUserDAO.findById(entity.appUserId) as AppUserData;

  ContributorDetail detail = ContributorDetail.fromEntity(entity, appUser);
  return MockResponse.json(detail.toJson());
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> getContributorInfoPage(
  MockRequest request,
  int projectId,
) async {
  final SharedDatabase db = await getSharedDatabase();
  //
  final select = db.select(db.contributor)
    ..where((e) => e.projectId.equals(projectId));

  final joinedQuery = select.join([
    innerJoin(db.appUser, db.appUser.id.equalsExp(db.contributor.appUserId)),
  ]);
  //
  final result = await joinedQuery.get();

  List<ContributorInfo> contributorInfos = result.map((row) {
    final AppUserData appUser = row.readTable(db.appUser);
    final AppUserInfo appUserInfo = AppUserInfo.fromEntity(appUser);
    final contributor = row.readTable(db.contributor);
    return ContributorInfo.named(id: contributor.id, appUser: appUserInfo);
  }).toList();
  //
  ContributorInfoPage p = ContributorInfoPage(
    items: contributorInfos,
    paginationInfo: null,
  );
  //
  return MockResponse.json(p.toJson());
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> addMultiContributors(
  MockRequest request,
  int projectId,
) async {
  final SharedDatabase db = await getSharedDatabase();
  //
  await db.contributorDAO.addMultiContributors(projectId);
  //
  return MockResponse.json({});
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> deleteContributor(
  MockRequest request,
  int contributorId,
) async {
  final SharedDatabase db = await getSharedDatabase();
  //
  final ContributorData? contributor = await db.contributorDAO.findById(
    contributorId,
  );
  if (contributor == null) {
    return MockResponse.json({});
  }
  //
  await db.contributorDAO.deleteById(contributorId);
  return MockResponse.json({});
}

// *****************************************************************************
// *****************************************************************************
