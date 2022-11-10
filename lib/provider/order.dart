import 'package:coffeeshop/provider/items.dart';
import 'package:flutter/material.dart';

class OrderProvider with ChangeNotifier{

List<Order> orderHistory = [];
  
  void addOrder(Order order){
      orderHistory.add(order);
      notifyListeners();
  }
}


class Order{

  DateTime time;
  List<Items> item;
  String phone;
  Order(
    {
      required this.time,
      required this.item,
      this.phone = '987654321'
    }
  );

  double totalamount(List<Items> items){
      double total = 0.0;
      for(int i = 0;i<items.length;i++){

        total=total+(item[i].price*item[i].quantity);
      }
      return total;

  }


}