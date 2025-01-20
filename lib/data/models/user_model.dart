import 'package:expenso_341/data/local/db_helper.dart';

class UserModel {
  int? uId;
  String uName;
  String uEmail;
  String uMobNo;
  String uPass;
  String uCreatedAt;

  UserModel(
      {this.uId,
      required this.uName,
      required this.uEmail,
      required this.uMobNo,
      required this.uPass,
      required this.uCreatedAt});

  ///fromMap (From DB)
  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
      uId: map[DBHelper.TBL_USER_UID],
      uName: map[DBHelper.TBL_USER_UNAME],
      uEmail: map[DBHelper.TBL_USER_UEMAIL],
      uMobNo: map[DBHelper.TBL_USER_MOB],
      uPass: map[DBHelper.TBL_USER_PASSWRD],
      uCreatedAt: map[DBHelper.TBL_USER_CREATED_AT]);

  ///toMap (to DB)
  Map<String, dynamic> toMap() => {
    DBHelper.TBL_USER_UNAME : uName,
    DBHelper.TBL_USER_UEMAIL : uEmail,
    DBHelper.TBL_USER_PASSWRD : uPass,
    DBHelper.TBL_USER_MOB : uMobNo,
    DBHelper.TBL_USER_CREATED_AT : uCreatedAt,
  };
}
