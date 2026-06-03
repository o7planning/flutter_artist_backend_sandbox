part of '../../../database.dart';

@DriftAccessor(tables: [CouponType])
class CouponTypeDAO extends DatabaseAccessor<SharedDatabase>
    with _$CouponTypeDAOMixin {
  CouponTypeDAO(super.db);

  Future<CouponTypeData?> findById(String couponTypeId) async {
    return await (db.select(
      db.couponType,
    )..where((e) => e.id.equals(couponTypeId))).getSingleOrNull();
  }
}
