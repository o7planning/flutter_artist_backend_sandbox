import 'dart:math';

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'src/model/model.dart';
import 'src/utils/assets_utils.dart';
import 'src/utils/date_utils.dart';
import 'src/utils/demo_color_utils.dart';

part 'database.g.dart';

part 'src/database/database_definition.dart';

part 'src/database/init_data_base.dart';

part 'src/database/init/init_album.dart';

part 'src/database/init/init_contributor.dart';

part 'src/database/init/init_teacher_position.dart';

part 'src/database/init/init_book.dart';

part 'src/database/init/init_category.dart';

part 'src/database/init/init_university.dart';

part 'src/database/init/init_supplier_type.dart';

part 'src/database/init/init_system_log.dart';

part 'src/database/init/init_coupon_type.dart';

part 'src/database/init/init_product.dart';

part 'src/database/init/init_coupon.dart';

part 'src/database/init/init_teacher.dart';

part 'src/database/init/init_song.dart';

part 'src/database/init/init_supplier.dart';

part 'src/database/init/init_language.dart';

part 'src/database/init/init_employee_position.dart';

part 'src/database/init/init_company.dart';

part 'src/database/init/init_note.dart';

part 'src/database/init/init_currency.dart';

part 'src/database/init/init_country.dart';

part 'src/database/init/init_gender.dart';

part 'src/database/init/init_lesson.dart';

part 'src/database/init/init_employment_history.dart';

part 'src/database/init/init_department.dart';

part 'src/database/init/init_employee.dart';

part 'src/database/tables/album.dart';

part 'src/database/tables/contributor.dart';

part 'src/database/tables/project.dart';

part 'src/database/init/init_customer.dart';

part 'src/database/init/init_project.dart';

part 'src/database/init/init_app_user.dart';

part 'src/database/init/init_sale_order.dart';

part 'src/database/init/init_football_player.dart';

part 'src/database/tables/app_user.dart';

part 'src/database/tables/book.dart';

part 'src/database/tables/category.dart';

part 'src/database/tables/company.dart';

part 'src/database/tables/country.dart';

part 'src/database/tables/coupon.dart';

part 'src/database/tables/coupon_type.dart';

part 'src/database/tables/currency.dart';

part 'src/database/tables/customer.dart';

part 'src/database/tables/department.dart';

part 'src/database/tables/employee.dart';

part 'src/database/tables/employee_position.dart';

part 'src/database/tables/employment_history.dart';

part 'src/database/tables/football_player.dart';

part 'src/database/tables/gender.dart';

part 'src/database/tables/language.dart';

part 'src/database/tables/lesson.dart';

part 'src/database/tables/note.dart';

part 'src/database/dao/best_selling_dao.dart';

part 'src/database/dao/contributor_dao.dart';

part 'src/database/dao/project_dao.dart';

part 'src/database/dao/supplier_dao.dart';

part 'src/database/dao/album_dao.dart';

part 'src/database/dao/book_dao.dart';

part 'src/database/dao/category_dao.dart';

part 'src/database/dao/company_dao.dart';

part 'src/database/dao/country_dao.dart';

part 'src/database/dao/coupon_dao.dart';

part 'src/database/dao/coupon_type_dao.dart';

part 'src/database/dao/currency_dao.dart';

part 'src/database/dao/customer_dao.dart';

part 'src/database/dao/app_user_dao.dart';

part 'src/database/dao/department_dao.dart';

part 'src/database/dao/employee_dao.dart';

part 'src/database/dao/employee_position_dao.dart';

part 'src/database/dao/employment_history_dao.dart';

part 'src/database/dao/system_log_dao.dart';

part 'src/database/dao/teacher_dao.dart';

part 'src/database/dao/teacher_position_dao.dart';

part 'src/database/dao/university_dao.dart';

part 'src/database/dao/supplier_type_dao.dart';

part 'src/database/dao/football_player_dao.dart';

part 'src/database/dao/gender_dao.dart';

part 'src/database/dao/language_dao.dart';

part 'src/database/dao/lesson_dao.dart';

part 'src/database/dao/note_dao.dart';

part 'src/database/dao/notification_message_dao.dart';

part 'src/database/dao/product_dao.dart';

part 'src/database/dao/song_dao.dart';

part 'src/database/dao/sales_order_dao.dart';

part 'src/database/dao/sales_order_line_dao.dart';

part 'src/database/dao/payment_gateway_dao.dart';

part 'src/database/tables/notification_message.dart';

part 'src/database/tables/payment_gateway.dart';

part 'src/database/tables/product.dart';

part 'src/database/tables/sales_order.dart';

part 'src/database/tables/sales_order_line.dart';

part 'src/database/tables/song.dart';

part 'src/database/tables/supplier.dart';

part 'src/database/tables/supplier_type.dart';

part 'src/database/tables/system_log.dart';

part 'src/database/tables/teacher.dart';

part 'src/database/tables/teacher_position.dart';

part 'src/database/tables/university.dart';

// https://drift.simonbinder.eu/setup/
