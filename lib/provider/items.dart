import 'dart:developer';

import 'package:flutter/material.dart';

class Itemprovider with ChangeNotifier{
  double totalAmounts = 0.0;
List<Items>  itemList = [
  Items(itemName: 'Cappucino', price: 70.0, size: 'Large',category: 'coffee'),
  Items(itemName: 'Americano', price: 70.0, size: 'Large',category: 'coffee'),
  Items(itemName: 'Latte', price: 70.0, size: 'Large',category: 'coffee'),
  Items(itemName: 'Espresso', price: 70.0, size: 'Large',category: 'coffee'),
  Items(itemName: 'Crossaint', price: 70.0, size: 'Large',category: 'Buns'),
];

List<Items> get getItems{
  return[...itemList];
}

double get totalAmount{
  return totalAmounts;
}

void addItems(Items additem){

    itemList.add(additem);
    log('item added');
    log(itemList.toString());
    notifyListeners();

}


void seevalue(){
  for(int i = 0;i<itemList.length;i++){
    log('${itemList[i].itemName} ${itemList[i].price} ${itemList[i].quantity}');
  }
}
void changequantity(int index,int value){
  double total = 0.0;
 itemList[index].quantity = value;

  for(int i = 0;i<itemList.length;i++){
    total = total+(itemList[i].price*itemList[i].quantity);
  }
  totalAmounts = total;

  notifyListeners();

}
List<Items> getreceipt(){
List<Items> it = [];
  for(int i = 0;i<itemList.length;i++){
      if(itemList[i].quantity>0){
        it.add(
          Items(itemName: itemList[i].itemName, price:itemList[i].price, size: itemList[i].size, category: itemList[i].category,quantity: itemList[i].quantity)
        );
      }

     
  }
 return it;
}
List<Items> showreceipt(){
  return itemList.where((e) =>e.quantity>0 ).toList();
}

void clear(){
  totalAmounts = 0.0;
  for(int i = 0;i<itemList.length;i++){
    itemList[i].quantity = 0;
  }
notifyListeners();

}





}



class Items{

  String itemName;
  String category;
  int quantity;
  double price;
  String size;
  String imageUrl;


Items(
{
  required this.itemName,
  required this.price,
  required this.size,
  required this.category,
  this.quantity = 0,
  this.imageUrl='https://images.immediate.co.uk/production/volatile/sites/30/2020/08/flat-white-3402c4f.jpg'
}

);



}