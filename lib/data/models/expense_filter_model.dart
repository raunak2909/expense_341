import 'package:expenso_341/data/models/expenses_model.dart';

class ExpenseFilterModel {
  num millis;
  String type;
  num balance;
  List<ExpensesModel> allExpenses;

  ExpenseFilterModel({required this.millis, required this.type, required this.balance, required this.allExpenses});
}