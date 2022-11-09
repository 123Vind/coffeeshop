import 'package:coffeeshop/provider/items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReceiptScreen extends StatelessWidget {
    static const routename = 'ReceiptScreen';
  const ReceiptScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemprovider = Provider.of<Itemprovider>(context);
    List<Items> itemlist = Provider.of<Itemprovider>(context).getItems;
  
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receipt'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              margin:const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0.5,0.5),
                    blurRadius: 1,
                    spreadRadius: 1,
                  )
                ]
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10,),
                  const Text('Coffee Shop',style: TextStyle(fontSize: 20),),
                  const SizedBox(height: 10,),
                  const Text('Receipt'),
                  const SizedBox(height: 20,),
                  Row(
                    children: const [
              
                      itemnames(name:'Item'),
                      itemnames(name:'quantity'),
                      itemnames(name:'price')
                    ],
             
          
                  ),
             Expanded(child: ListView(
          
               children: itemprovider.showreceipt().map((e) => Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   itemnames(name: e.itemName),
                   itemnames(name: e.quantity.toString()),
                   itemnames(name: 'Rs.${e.price}'),
                 ],
               )).toList(),
             )),
             const Divider(),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   const Text('Total',style: TextStyle(fontSize: 16),),
                   Text('Rs. ${itemprovider.totalAmount}',style:const TextStyle(fontSize: 16),),
                   
                 ],
               ),
             ),
                
          
                ],
              ),
            ),
          ),
          InkWell(
                onTap: (){
                  itemprovider.clear();
                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Order Completed'),duration: Duration(milliseconds: 1000),));
                 Navigator.pop(context);
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 40,vertical: 8),
                  decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
              
                  ),
                  child: const Center(child:  Text('Complete Order',style: TextStyle(color: Colors.white,fontSize: 20),)),
                ),
              ),
        ],
      ),
    );
  }
}

class itemnames extends StatelessWidget {
  const itemnames({
    Key? key,
    required this.name
  }) : super(key: key);
 final  String name;
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Center(child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(name),
    )));
  }
}