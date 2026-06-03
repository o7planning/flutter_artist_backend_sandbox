import 'package:msw_dio_interceptor/msw_dio_interceptor.dart';

import '../../../database.dart';
import '../../model/model.dart';
import '../../utils/mock_response_utils.dart';

// *****************************************************************************
// *****************************************************************************

void employeePositionRestApiRegister() {
  MockRegistry.register(
    MockRule(
      path: '/rest/page/employee-position-info/all',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          return await getEmployeePositionInfoPageAll(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> getEmployeePositionInfoPageAll(MockRequest request) async {
  final SharedDatabase db = await getSharedDatabase();

  List<EmployeePositionData> allEmployeePositionDatas = await (db.select(
    db.employeePosition,
  )).get();
  //
  List<EmployeePositionInfo> employeePositionInfos = allEmployeePositionDatas
      .map((e) => EmployeePositionInfo.fromEntity(e))
      .toList();

  EmployeePositionInfoPage p = EmployeePositionInfoPage(
    items: employeePositionInfos,
    paginationInfo: null,
  );
  return MockResponse.json(p.toJson());
}

// *****************************************************************************
// *****************************************************************************
