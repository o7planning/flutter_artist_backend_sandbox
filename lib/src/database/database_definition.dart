part of '../../database.dart';

@DriftDatabase(
  tables: [
    Album,
    AppUser,
    Book,
    Category,
    Company,
    Country,
    CouponType,
    Coupon,
    Currency,
    Customer,
    Department,
    Employee,
    EmployeePosition,
    EmploymentHistory,
    FootballPlayer,
    Gender,
    Language,
    Lesson,
    Note,
    NotificationMessage,
    PaymentGateway,
    Product,
    SalesOrder,
    SalesOrderLine,
    Song,
    Supplier,
    SupplierType,
    SystemLog,
    Teacher,
    TeacherPosition,
    University,
    Project,
    Contributor,
  ],
  daos: [
    BestSellingDAO,
    SupplierDAO,
    SupplierTypeDAO,
    AlbumDAO,
    BookDAO,
    CategoryDAO,
    AppUserDAO,
    CompanyDAO,
    CountryDAO,
    CouponDAO,
    CouponTypeDAO,
    CurrencyDAO,
    CustomerDAO,
    DepartmentDAO,
    EmployeeDAO,
    EmployeePositionDAO,
    EmploymentHistoryDAO,
    FootballPlayerDAO,
    GenderDAO,
    LanguageDAO,
    LessonDAO,
    NoteDAO,
    PaymentGatewayDAO,
    ProductDAO,
    SalesOrderDAO,
    SalesOrderLineDAO,
    SongDAO,
    SystemLogDAO,
    TeacherDAO,
    TeacherPositionDAO,
    UniversityDAO,
    ProjectDAO,
    ContributorDAO,
  ],
)
class SharedDatabase extends _$SharedDatabase {
  SharedDatabase([QueryExecutor? e]) : super(e ?? _connectWithDriftFlutter());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _connectWithDriftFlutter() {
    return driftDatabase(
      name: 'my_app_db',
      // web: DriftWebOptions(
      //   sqlite3Wasm: Uri.parse('sqlite3.wasm'),
      //   driftWorker: Uri.parse('drift_worker.js'),
      // ),
      web: DriftWebOptions(
        sqlite3Wasm: Uri.parse('sqlite3.wasm'),
        driftWorker: Uri.parse('sqlite3_worker1.js'),
      ),
    );
  }
}
