part of '../../../database.dart';

@DriftAccessor(tables: [Coupon])
class CouponDAO extends DatabaseAccessor<SharedDatabase> with _$CouponDAOMixin {
  CouponDAO(super.db);

  Future<CouponData?> findById(int couponId) async {
    return await (db.select(
      db.coupon,
    )..where((e) => e.id.equals(couponId))).getSingleOrNull();
  }

  Future<CouponData?> findByCode(String code) async {
    return await (db.select(
      db.coupon,
    )..where((e) => e.code.equals(code))).getSingleOrNull();
  }
}
