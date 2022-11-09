import 'package:coffeeshop/provider/items.dart';
import 'package:coffeeshop/screens/receipt.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/appdrawer.dart';
import '../widgets/cardview.dart';


class HomePage extends StatefulWidget {
  static const routename = 'Homescreen';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<Items> items = Provider.of<Itemprovider>(context).getItems;
    final itemsProvider = Provider.of<Itemprovider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee Shop'),
      ),
      
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: ListView.builder(itemBuilder: (context,index){
                return Cards(index: index);
            },
            itemCount:  items.length,
            ),
          ),
         Container(
           width: double.infinity,
           decoration: BoxDecoration(
             color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 0.5
                )
              ]
           ),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
                Padding(
                 padding: const EdgeInsets.all(16.0),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                    const  Text('Total',style: TextStyle(fontSize: 20),),
                      Text('${itemsProvider.totalAmounts}',style: const TextStyle(fontSize: 20))
                   ],
                 ),
               ),
               Center(
                 child: InkWell(
                   onTap:(){
                     itemsProvider.seevalue();
                     if(itemsProvider.totalAmount<=0.0){
                       setState(() {
                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No items added'),duration: Duration(milliseconds: 1000),));
                       });
                       return;
                     }
                     Navigator.pushNamed(context, ReceiptScreen.routename);
                   } ,
                   child: Container(
                     
                     padding: const EdgeInsets.all(8),
                     margin: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8)
                      ),
                     child:const Text('Print Receipt'),
                   ),
                 ),
               )
             ],
           ),
         )
        ],
      ),

      drawer: AppDrawer(),
    );
  }
}

