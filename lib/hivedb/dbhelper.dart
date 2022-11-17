import 'dart:developer';

import 'package:coffeeshop/provider/dbattributes.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../provider/items.dart';
import '../provider/order.dart';

class DbHelper with ChangeNotifier{

  var box = Hive.box(dbname.boxname2);
double totalAmounts = 0.0;
 List  s = [
    {
      dbname.itemname:'Black coffee',
      dbname.price:60,
      dbname.size:'Large',
      dbname.category:'coffee',
      dbname.quantity:0,
    },
    {
      dbname.itemname:'Latte',
      dbname.price:60,
      dbname.size:'Small',
      dbname.category:'coffee',
      dbname.quantity:0,
    },

        {
      dbname.itemname:'Bread',
      dbname.price:40,
      dbname.size:'Small',
      dbname.category:'Buns',
      dbname.quantity:0,
    },
        {
      dbname.itemname:'Americano',
      dbname.price:60,
      dbname.size:'Large',
      dbname.category:'coffee',
      dbname.quantity:0,
    },


 ];

void addinitials(){
  box.delete('itemlist');
box.put(dbname.boxitemname, s);
  log('added');

}

  void addorders(List<Order> orders){

      box.put(dbname.boxitemorder,orders);

  }




}