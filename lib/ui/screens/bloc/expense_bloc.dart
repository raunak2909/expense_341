import 'package:bloc/bloc.dart';
import 'package:expenso_341/data/models/expenses_model.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';

import '../../../data/local/db_helper.dart';

part 'expense_event.dart';
part 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  DBHelper db;
  ExpenseBloc({required this.db}) : super(ExpenseInitialState()) {

    on<AddExpenseEvent>((event, emit) async{
      ///1
      emit(ExpenseLoadingState());
      bool check = await db.addExpense(expense: event.newExpense);

      if(check){
        List<ExpensesModel> allExpenses = await db.fetchExpense();
        ///2
        emit(ExpenseLoadedState(mExpenses: allExpenses));
      } else {
        ///3
        emit(ExpenseErrorState(errorMsg: "Expense not added"));
      }

    });

    on<FetchInitialExpense>((event, emit) async{
      emit(ExpenseLoadingState());

      List<ExpensesModel> allExpenses = await db.fetchExpense();

      emit(ExpenseLoadedState(mExpenses: allExpenses));

    });
  }
}
