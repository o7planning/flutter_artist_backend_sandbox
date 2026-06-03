import 'package:msw_dio_interceptor/msw_dio_interceptor.dart';

import '../../../database.dart';
import '../../model/model.dart';
import '../../utils/mock_response_utils.dart';

// *****************************************************************************
// *****************************************************************************

void supplierTypeRestApiRegister() {
  MockRegistry.register(
    MockRule(
      path: '/rest/page/supplier-type-info/all',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          return await getSupplierTypeInfoPageAll(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> getSupplierTypeInfoPageAll(MockRequest request) async {
  final SharedDatabase db = await getSharedDatabase();

  List<SupplierTypeData> allSupplierTypeDatas = await (db.select(
    db.supplierType,
  )).get();
  //
  List<SupplierTypeInfo> supplierTypeInfos = allSupplierTypeDatas
      .map((e) => SupplierTypeInfo.fromEntity(e))
      .toList();

  SupplierTypeInfoPage p = SupplierTypeInfoPage(
    items: supplierTypeInfos,
    paginationInfo: null,
  );
  return MockResponse.json(p.toJson());
}

// *****************************************************************************
// *****************************************************************************
