import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/expense.dart';

class ExpenseProvider extends ChangeNotifier {
  final Box<Expense> _box = Hive.box<Expense>('expenses');

  List<Expense> get items => _box.values.toList();

  void add(String title, double amount, String type) {
    final expense = Expense(
      id: DateTime.now().toIso8601String(),
      title: title,
      amount: amount,
      date: DateTime.now(),
      type: type,
    );
    _box.put(expense.id, expense);
    notifyListeners();
  }

  void updateExpense(
    String id,
    String newTitle,
    double newAmount,
    String newType,
  ) {
    final expense = _box.get(id);
    if (expense != null) {
      expense.title = newTitle;
      expense.amount = newAmount;
      expense.type = newType;
      expense.date = DateTime.now();
      expense.save();
      notifyListeners();
    }
  }

  void remove(String id) {
    _box.delete(id);
    notifyListeners();
  }

  Expense? getById(String id) {
    return _box.get(id);
  }

  List<Expense> getFiltered({String? type, String? searchQuery}) {
    return items.where((e) {
      final matchesType = type == null || e.type == type;
      final matchesSearch =
          searchQuery == null ||
          e.title.toLowerCase().contains(searchQuery.toLowerCase());
      return matchesType && matchesSearch;
    }).toList();
  }
}
