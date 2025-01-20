

import '../local/db_helper.dart';

class CategoryModel {
  int cid; //auto increment
  String cat_title;
  String cat_img;

  CategoryModel({
    required this.cid,
    required this.cat_title,
    required this.cat_img});

 /* /// methods
  ///1 fromMap to Model
  factory CategoryModel.fromMap(Map<String, dynamic> map){
    return CategoryModel(
        cid: map[DBHelper.TBL_CATEGORY_CAT_ID],
        cat_title: map[DBHelper.TBL_CATEGORY_TITLE],
        cat_img: map[DBHelper.TBL_CATEGORY_IMAGE]);
  }


  ///2 from Model toMap
  Map<String, dynamic> toMap(){
    return {
      DBHelper.TBL_CATEGORY_TITLE : cat_title,
      DBHelper.TBL_CATEGORY_IMAGE : cat_img,
    };
  }*/

}