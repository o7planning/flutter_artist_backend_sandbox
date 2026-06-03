part of '../../../database.dart';

@DriftAccessor(tables: [PaymentGateway])
class PaymentGatewayDAO extends DatabaseAccessor<SharedDatabase>
    with _$PaymentGatewayDAOMixin {
  PaymentGatewayDAO(super.db);

  Future<PaymentGatewayData?> findById(String paymentGatewayId) async {
    return await (db.select(
      db.paymentGateway,
    )..where((e) => e.id.equals(paymentGatewayId))).getSingleOrNull();
  }
}
