import 'package:drift/drift.dart';

class DriftFilterParser {
  final GeneratedDatabase db;

  DriftFilterParser(this.db);

  // Added fieldToColumnMap as a parameter to allow context-specific mapping
  Expression<bool> parse(
    Map<String, dynamic> json,
    Map<String, GeneratedColumn> fieldToColumnMap,
  ) {
    if (json.containsKey('connector')) {
      final String connector = json['connector'];
      final List conditions = json['conditions'];

      final parsedList = conditions
          .map((c) => parse(c as Map<String, dynamic>, fieldToColumnMap))
          .toList();

      if (parsedList.isEmpty) return const Constant(true);

      if (connector == 'AND') {
        return parsedList.reduce((v, e) => v & e);
      } else {
        return parsedList.reduce((v, e) => v | e);
      }
    } else {
      return _buildLeafCondition(json, fieldToColumnMap);
    }
  }

  Expression<bool> _buildLeafCondition(
    Map<String, dynamic> leaf,
    Map<String, GeneratedColumn> fieldToColumnMap,
  ) {
    final String fieldName = leaf['field'];
    final String operatorText = leaf['operator'];
    final dynamic value = leaf['value'];

    // Get the specific column for this context (Employee, Song, etc.)
    final column = fieldToColumnMap[fieldName];

    if (column == null) return const Constant(true);

    if (value == null &&
        operatorText != "isEmpty" &&
        operatorText != "isEmptyOrNull") {
      return const Constant(true);
    }

    return _applyOperator(column, operatorText, value);
  }

  Expression<bool> _applyOperator(GeneratedColumn col, String op, dynamic val) {
    // 1. Equality & Inequality
    if (op == "equalTo") return col.isValue(val);
    if (op == "notEqualTo") return col.isNotValue(val);

    // 2. Comparison Operators
    if (val is Comparable) {
      final comparableCol = col as Expression<Comparable>;
      if (op == "greaterThan") return comparableCol.isBiggerThanValue(val);
      if (op == "greaterThanOrEqualTo")
        return comparableCol.isBiggerOrEqualValue(val);
      if (op == "lessThan") return comparableCol.isSmallerThanValue(val);
      if (op == "lessThanOrEqualTo")
        return comparableCol.isSmallerOrEqualValue(val);
    }

    // 3. String Operations (Custom Logic using lower() and like)
    if (col is TextColumn) {
      final String sVal = val?.toString() ?? "";
      if (sVal.isEmpty && !op.startsWith("isEmpty"))
        return const Constant(true);

      final strCol = col as Expression<String>;
      if (op == "contains") return strCol.like('%$sVal%');
      if (op == "containsIgnoreCase") {
        return strCol.lower().like('%${sVal.toLowerCase()}%');
      }
      if (op == "startsWith") return strCol.like('$sVal%');
      if (op == "startsWithIgnoreCase") {
        return strCol.lower().like('${sVal.toLowerCase()}%');
      }
      if (op == "endsWith") return strCol.like('%$sVal');
      if (op == "endsWithIgnoreCase") {
        return strCol.lower().like('%${sVal.toLowerCase()}');
      }
    }

    // 4. Null Checks
    if (op == "isEmpty" || op == "isEmptyOrNull") {
      if (col is TextColumn) return col.isValue("") | col.isNull();
      return col.isNull();
    }

    // 5. Collection Operations
    if (op == "in") {
      if (val is List && val.isNotEmpty) {
        return col.isIn(val.cast<Object>());
      }
      return const Constant(true);
    }

    return const Constant(true);
  }
}
