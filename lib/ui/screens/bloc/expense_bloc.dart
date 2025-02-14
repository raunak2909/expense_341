import 'package:bloc/bloc.dart';
import 'package:expenso_341/data/models/category_model.dart';
import 'package:expenso_341/data/models/expense_filter_model.dart';
import 'package:expenso_341/data/models/expenses_model.dart';
import 'package:expenso_341/domain/app_constants.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import '../../../data/local/db_helper.dart';

part 'expense_event.dart';

part 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  DBHelper db;
  DateFormat df = DateFormat.yMMMd();

  ExpenseBloc({required this.db}) : super(ExpenseInitialState()) {
    on<AddExpenseEvent>((event, emit) async {
      ///1
      emit(ExpenseLoadingState());
      bool check = await db.addExpense(expense: event.newExpense);

      if (check) {
        List<ExpensesModel> allExpenses = await db.fetchExpense();
        /// store last index balance in prefs
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setDouble("lastBal", allExpenses.last.bal ?? 0.0);
        ///2
        //emit(ExpenseLoadedState(mExpenses: allExpenses));
        emit(ExpenseFilterLoadedState(
            mFilteredExpenses: filterExp(allExpenses, 0), bal: allExpenses.isNotEmpty ? allExpenses.last.bal ?? 0.0 : 0.0));
      } else {
        ///3
        emit(ExpenseErrorState(errorMsg: "Expense not added"));
      }
    });

    on<FetchInitialExpense>((event, emit) async {
      emit(ExpenseLoadingState());

      List<ExpensesModel> allExpenses = await db.fetchExpense();

      emit(ExpenseLoadedState(mExpenses: allExpenses));
    });

    on<FetchFilteredExpense>((event, emit) async {
      emit(ExpenseLoadingState());

      List<ExpensesModel> allExpenses = await db.fetchExpense();

      /// store last index balance in prefs
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if(allExpenses.isNotEmpty) {
        prefs.setDouble("lastBal", allExpenses.last.bal ?? 0.0);
      } else {
        prefs.setDouble("lastBal", 0.0);
      }

      if (event.type == 0) {
        df = DateFormat.yMMMd();

        ///Jan 28, 2025
      } else if (event.type == 1) {
        df = DateFormat.yMMM();

        ///Jan, 2025
      } else if (event.type == 2) {
        df = DateFormat.y();

        ///2025
      }

      emit(ExpenseFilterLoadedState(mFilteredExpenses: filterExp(allExpenses, event.type), bal: allExpenses.isNotEmpty ? allExpenses.last.bal ?? 0.0 : 0.0));
    });
  }

  List<ExpenseFilterModel> filterExp(
      List<ExpensesModel> allExpenses, int type) {
    ///filtering data
    List<ExpenseFilterModel> filteredExpenses = [];

    if (type < 3) {
      List<String> uniqueDates = [];

      for (ExpensesModel eachExp in allExpenses) {
        String eachDate = df.format(
            DateTime.fromMillisecondsSinceEpoch(int.parse(eachExp.created_at)));

        if (!uniqueDates.contains(eachDate)) {
          uniqueDates.add(eachDate);
        }
      }

      print(uniqueDates);

      for (String eachDate in uniqueDates) {
        num balance = 0.0;
        List<ExpensesModel> eachDateExp = [];

        for (ExpensesModel eachExp in allExpenses) {
          String eachExpDate = df.format(DateTime.fromMillisecondsSinceEpoch(
              int.parse(eachExp.created_at)));

          if (eachExpDate == eachDate) {
            eachDateExp.add(eachExp);

            if (eachExp.exp_type == "Debit") {
              balance -= eachExp.amt!;
            } else {
              balance += eachExp.amt!;
            }
          }
        }
        print("eachDate: $eachDate");
        print("bal: $balance");
        print("items: ${eachDateExp.length}");

        filteredExpenses.add(ExpenseFilterModel(
            type: eachDate, balance: balance, allExpenses: eachDateExp));
      }
    } else {
      ///cat wise
      var uniqueCat = AppConstant.mCat;

      for (CategoryModel eachCat in uniqueCat) {
        num balance = 0.0;
        List<ExpensesModel> eachCatExp = [];

        for (ExpensesModel eachExp in allExpenses) {
          if (eachCat.cid == eachExp.cid) {
            eachCatExp.add(eachExp);

            if (eachExp.exp_type == "Debit") {
              balance -= eachExp.amt!;
            } else {
              balance += eachExp.amt!;
            }
          }
        }

        filteredExpenses.add(ExpenseFilterModel(
            type: eachCat.cat_title,
            balance: balance,
            allExpenses: eachCatExp));
      }
    }

    return filteredExpenses;
  }
}
