part of 'expense_bloc.dart';

@immutable
sealed class ExpenseEvent {}

class AddExpenseEvent extends ExpenseEvent{
  ExpensesModel newExpense;
  AddExpenseEvent({required this.newExpense});
}

class FetchInitialExpense extends ExpenseEvent{}

class FetchFilteredExpense extends ExpenseEvent{
  int type;
  FetchFilteredExpense({required this.type}); ///0 for date, 1 for month, 2 for year, 3 for cat
}

///update
///delete
///filter

