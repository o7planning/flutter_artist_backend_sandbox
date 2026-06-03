import 'package:drift/drift.dart';
import 'package:drift/native.dart';

import '../../../database.dart';

// SharedDatabase constructDb() {
//   final db = LazyDatabase(() async {
//     final dbFolder = await getApplicationDocumentsDirectory();
//     final file = File(p.join(dbFolder.path, 'db.sqlite'));
//     return NativeDatabase(file);
//   });
//   return SharedDatabase(db);
// }

SharedDatabase constructDb() {
  final db = LazyDatabase(() async {
    // This is the magic string for In-Memory database
    return NativeDatabase.memory();
  });
  return SharedDatabase(db);
}
