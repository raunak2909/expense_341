part of 'expense_bloc.dart';

@immutable
sealed class ExpenseEvent {}

class AddExpenseEvent extends ExpenseEvent{
  ExpensesModel newExpense;
  AddExpenseEvent({required this.newExpense});
}

class FetchInitialExpense extends ExpenseEvent{}

///update
///delete
///filter

