import 'package:coffeeshop/provider/dbattributes.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class OrderProvider with ChangeNotifier{
Box box = Hive.box(dbname.boxnameorder);
List orderHistory =[];
  
  void addOrder(Order order){
    Map orders = {
      dbname.time:order.time,
      dbname.orderlist:order.item,
      dbname.phone:order.phone,

      };
      orderHistory.add(orders);
      box.put(dbname.boxitemorder,orderHistory);
      notifyListeners();
  }

  void updateorder(){
    if(box.get(dbname.boxitemorder)==null){
        orderHistory = [];
    }
    else{
        orderHistory = box.get(dbname.boxitemorder);
    }
    notifyListeners();
  }

  List get ordershistory{
    return[...orderHistory];
  }


}


class Order{

  DateTime time;
  List item;
  String phone;
  Order(
    {
      required this.time,
      required this.item,
      this.phone = '987654321'
    }
  );

  double totalamount(List items){
      double total = 0.0;
      for(int i = 0;i<items.length;i++){

        total=total+(item[i][dbname.price]*item[i][dbname.quantity]);
      }
      return total;

  }


}