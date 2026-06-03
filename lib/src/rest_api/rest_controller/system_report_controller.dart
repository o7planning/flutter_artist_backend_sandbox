import 'package:msw_dio_interceptor/msw_dio_interceptor.dart';

import '../../../database.dart';
import '../../model/model.dart';
import '../../utils/mock_response_utils.dart';

// *****************************************************************************
// *****************************************************************************

void systemReportRestApiRegister() {
  MockRegistry.register(
    MockRule(
      path: '/rest/report/system-summary',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          return await getSystemReport(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> getSystemReport(MockRequest request) async {
  final SharedDatabase db = await getSharedDatabase();

  int noteCount = await db.noteDAO.getCountAll();
  int categoryCount = await db.categoryDAO.getCountAll();
  int productCount = await db.productDAO.getCountAll();
  int salesOrderCount = await db.salesOrderDAO.getCountAll();
  int employeeCount = await db.employeeDAO.getCountAll();
  int supplierCount = await db.supplierDAO.getCountAll();
  //
  SystemReportDetail systemReportDetail = SystemReportDetail.named(
    employeeCount: employeeCount,
    supplierCount: supplierCount,
    categoryCount: categoryCount,
    productCount: productCount,
    saleOrderCount: salesOrderCount,
    noteCount: noteCount,
  );
  return MockResponse.json(systemReportDetail.toJson());
}

// *****************************************************************************
// *****************************************************************************
