import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dbattributes.dart';



class Itemprovider with ChangeNotifier{


    Box box = Hive.box(dbname.boxname2);

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

//   Items(itemName: 'Cappucino', price: 70.0, size: 'Large',category: 'coffee'),
//   Items(itemName: 'Americano', price: 70.0, size: 'Large',category: 'coffee'),
//   Items(itemName: 'Latte', price: 70.0, size: 'Large',category: 'coffee'),
//   Items(itemName: 'Espresso', price: 70.0, size: 'Large',category: 'coffee'),
//   Items(itemName: 'Crossaint', price: 70.0, size: 'Large',category: 'Buns'),






List itemList = Hive.box(dbname.boxname2).get(dbname.boxitemname);




List get getItems{
  return[...itemList];
}

double get totalAmount{
  return totalAmounts;
}




void addItems(Map additem){

    itemList.add(additem);
    box.put(dbname.boxitemname,itemList);
    log('item added');
    updatedb();
    //log(itemList.toString());
    notifyListeners();

}
void updatedb(){
  itemList = box.get(dbname.boxitemname);
  log(itemList.length.toString());

}

void seevalue(){
  for(int i = 0;i<itemList.length;i++){
    log('${itemList[i][dbname.itemname]} ${itemList[i][dbname.price]} ${itemList[i][dbname.quantity]}');
  }
}
void changequantity(int index,int value){
  double total = 0.0;
 itemList[index][dbname.quantity] = value;

  for(int i = 0;i<itemList.length;i++){
    total = total+(itemList[i][dbname.price]*itemList[i][dbname.quantity]);
  }
  totalAmounts = total;
 box.put(dbname.boxitemname,itemList);

  updatedb();

  notifyListeners();

}
List getreceipt(){
List it = box.get(dbname.boxitemname);
  for(int i = 0;i<itemList.length;i++){
      if(itemList[i][dbname.quantity]>0){
        it.add({
          dbname.itemname:itemList[i][dbname.itemname],
          dbname.price:itemList[i][dbname.price],
          dbname.category:itemList[i][dbname.category],
          dbname.size:itemList[i][dbname.size],
          dbname.quantity:itemList[i][dbname.quantity],
          });
      }

     
  }
 return it;
}
List showreceipt(){
  return itemList.where((e) =>e[dbname.quantity]>0 ).toList();
}

void clear(){
  totalAmounts = 0.0;
  for(int i = 0;i<itemList.length;i++){
    itemList[i][dbname.quantity] = 0;
  }

  box.put(dbname.boxitemname,itemList);
  updatedb();
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