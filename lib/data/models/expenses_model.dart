

import '../local/db_helper.dart';

class ExpensesModel {
  int? eid; //auto increment
  int? uid;
  int? cid;
  double? amt;
  double? bal;
  String title;
  String desc;
  String exp_type;
  String created_at;

  ExpensesModel({
    this.eid,
    required this.uid,
    required this.amt,
    required this.bal,
    required this.cid,
    required this.title,
    required this.desc,
    required this.exp_type,
    required this.created_at});

  /// methods
  ///1 fromMap to Model
  factory ExpensesModel.fromMap(Map<String, dynamic> map){
    return ExpensesModel(
        eid: map[DBHelper.TBL_USER_UID],
        uid: map[DBHelper.TBL_EXPENSE_UID],
        title: map[DBHelper.TBL_EXPENSE_TITLE],
        desc: map[DBHelper.TBL_EXPENSE_DESC],
        amt: map[DBHelper.TBL_EXPENSE_AMOUNT],
        bal: map[DBHelper.TBL_EXPENSE_BALANCE],
        exp_type: map[DBHelper.TBL_EXPENSE_TYPE],
        cid: map[DBHelper.TBL_EXPENSE_CAT_ID],
        created_at: map[DBHelper.TBL_USER_CREATED_AT]);
  }


  ///2 from Model toMap
  Map<String, dynamic> toMap(){
    return {
      DBHelper.TBL_EXPENSE_UID:uid,
      DBHelper.TBL_EXPENSE_TITLE : title,
      DBHelper.TBL_EXPENSE_DESC : desc,
      DBHelper.TBL_EXPENSE_TYPE : exp_type,
      DBHelper.TBL_EXPENSE_AMOUNT : amt,
      DBHelper.TBL_EXPENSE_BALANCE:bal,
      DBHelper.TBL_EXPENSE_CAT_ID : cid,
      DBHelper.TBL_USER_CREATED_AT : created_at,
    };
  }

}