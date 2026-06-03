part of '../../database.dart';

SharedDatabase? __database;

Future<SharedDatabase> getSharedDatabase() async {
  if (__database == null) {
    final database = SharedDatabase();

    print("Insert Albums...");
    await initAlbums(database);
    print("Insert Books...");
    await initBooks(database);
    print("Insert Categories...");
    await initCategories(database);
    print("Insert Companies...");
    await initCompanies(database);
    print("Insert Countries...");
    await initCountries(database);
    print("Insert Currencies...");
    await initCurrencies(database);
    print("Insert Genders...");
    await initGenders(database);
    print("Insert Universities...");
    await initUniversities(database);
    print("Insert SupplierTypes...");
    await initSupplierTypes(database);
    print("Insert EmployeePositions...");
    await initEmployeePositions(database);
    print("Insert Notes...");
    await initNotes(database);
    print("Insert Languages...");
    await initLanguages(database);
    print("Insert SystemLogs...");
    await initSystemLogs(database);
    print("Insert CouponTypes...");
    await initCouponTypes(database);
    print("Insert TeacherPositions...");
    await initTeacherPositions(database);
    //
    print("Insert Coupons...");
    await initCoupons(database);
    print("Insert Products...");
    await initProducts(database);
    print("Insert Songs...");
    await initSongs(database);
    print("Insert Suppliers...");
    await initSuppliers(database);
    print("Insert Teachers...");
    await initTeachers(database);
    print("Insert Lessons...");
    await initLessons(database);
    print("Insert FootballPlayers...");
    await initFootballPlayers(database);
    print("Insert Departments...");
    await initDepartments(database);
    print("Insert Employees...");
    await initEmployees(database);
    print("Insert Customers...");
    await initCustomers(database);
    print("Insert EmploymentHistory...");
    await initEmploymentHistories(database);
    print("Insert AppUsers...");
    await initAppUsers(database);
    print("Insert Projects...");
    await initProjects(database);
    print("Insert Contributors...");
    await initContributors(database);
    print("Insert SaleOrders...");
    await initSaleOrders(database);
    __database = database;
  }
  return __database!;
}
