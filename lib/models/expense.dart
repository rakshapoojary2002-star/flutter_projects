import 'package:hive/hive.dart';

part 'expense.g.dart';

@HiveType(typeId: 0)
class Expense extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  double amount;

  @HiveField(3)
  DateTime date;

  @HiveField(4)
  String type; // ✅ New field

  Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.type,
  });
}
