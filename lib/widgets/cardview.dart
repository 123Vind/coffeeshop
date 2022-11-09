import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/items.dart';
import 'categorycard.dart';
class Cards extends StatelessWidget {
  const Cards({Key? key,required this.index}) : super(key: key);
  final int index;
  
  @override
  Widget build(BuildContext context) {
        List<Items> items = Provider.of<Itemprovider>(context).getItems;
        final itemprovider = Provider.of<Itemprovider>(context);
      return Container(
        height: 120,
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        decoration:  BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 5,
              offset: const Offset(0.5, 0.5),
              spreadRadius: 2.5
            )
          ]
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 100,
                margin: EdgeInsets.only(right: 8),
                clipBehavior:Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(8),
                  
                ),
                child: Image.network(items[index].imageUrl,fit: BoxFit.cover,),
                )
                ),
            Expanded(         
              flex: 3,
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(items[index].itemName),
            const SizedBox(height: 20,),
            Text(items[index].price.toString()),
            const SizedBox(height: 20,),
            Expanded(
              child: ListView(
                
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryCard(categoryname: 'S'),
                  CategoryCard(categoryname: 'M'),
                  CategoryCard(categoryname: 'L'),

                ],
              ),
            ),

          ],
        ),
            ),
       Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                    
                      items[index].quantity++;
                      itemprovider.changequantity(index,items[index].quantity);
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey)
                      ),
                      child: const Center(child:  Text('+',style: TextStyle(fontSize: 20),)),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Center(child: Text(items[index].quantity.toString(),style: const TextStyle(fontSize: 20),)),
                    ),
                  ), 
                  InkWell(
                      onTap: (){
                        // log('Added ${items[index].quantity--}');
                         items[index].quantity--;
                         if(items[index].quantity <= 0){
                           itemprovider.changequantity(index,0);
                         }
                         else{
                      itemprovider.changequantity(index,items[index].quantity);
                         }
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey)
                      ),
                      child: const Center(child:  Text('-',style: TextStyle(fontSize: 20),)),
                    ),
                  ), 
                ],
              ),
            )

          ],
        ),


      );
  }
}
class AddCard extends StatelessWidget {
  const AddCard({
    Key? key,
    required this.categoryname,
  }) : super(key: key);
  final String categoryname;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      
      padding: const EdgeInsets.all(8),
      height: 20,
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
        
      ),                    
      child: Text(categoryname),
            
    );
  }
}