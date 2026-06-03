https://drift.simonbinder.eu/platforms/web/



--------------------------------------------------------------

import 'package:drift/drift.dart';
import 'package:drift_example/database.dart'; // Import your database

@DriftAccessor(tables: [TodoItems, Categories])
class MyDao extends DatabaseAccessor<MyDatabase> with _$MyDaoMixin {
  MyDao(MyDatabase db) : super(db);

  Stream<List<CategorySummary>> getCategorySummaries() {
    // Define the aggregate function (count())
    final countTodos = todoItems.id.count();

    // Create the join query
    final query = select(categories).join(
      [
        innerJoin(
          todoItems,
          todoItems.category.equalsExp(categories.id),
        ),
      ],
    );

    // Add the columns, including the aggregate and the GROUP BY clause
    query
      ..addColumns([countTodos])
      ..groupBy([categories.id])
      ..orderBy(
        [OrderingTerm.desc(countTodos)],
      );

    // Watch the query for changes and map the results
    return query.watch().map((rows) {
      return rows.map((row) {
        return CategorySummary(
          row.read(categories.description)!,
          row.read(countTodos)!,
        );
      }).toList();
    });
  }
}
