import 'package:msw_dio_interceptor/msw_dio_interceptor.dart';

import '../../../database.dart';
import '../../model/model.dart';
import '../../utils/mock_response_utils.dart';

// *****************************************************************************
// *****************************************************************************

void bestSellingRestApiRegister() {
  // /rest/report/best-selling/1000
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/report/best-selling/\\d+',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          final days = int.parse(request.path.split('/').last);
          return await getBestSellings(request, days);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
}

// *****************************************************************************
// *****************************************************************************

// BestSellingDetail
Future<MockResponse> getBestSellings(MockRequest request, int days) async {
  final SharedDatabase db = await getSharedDatabase();

  final bestSellings = await db.bestSellingDAO.getBestSellings(days);

  BestSellingDetailPage p = BestSellingDetailPage(
    items: bestSellings,
    paginationInfo: null,
  );

  return MockResponse.json(p.toJson());
}

// *****************************************************************************
// *****************************************************************************
