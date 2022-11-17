import 'package:coffeeshop/provider/dbattributes.dart';
import 'package:flutter/material.dart';

import '../provider/order.dart';

class DisplayOrderScreen extends StatelessWidget {
  const DisplayOrderScreen({Key? key}) : super(key: key);
  static const routename = 'DisplayOrderScreen';
  @override
  Widget build(BuildContext context) {
    final order = ModalRoute.of(context)!.settings.arguments as Order;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
              const SizedBox(height: 10,),
              const Text('Time'),
              Text(order.time.toString()),
              const SizedBox(height: 10,),
              const Text('Phone'),
              Text(order.phone),
              const SizedBox(height: 10,),

              Expanded(child: ListView(
                children: order.item.map((e) => OrderItemCard(item: e)).toList(),
              )),

              Expanded(child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    const Text('Total'),
                    Text('Rs.${order.totalamount(order.item)}')
                  ],

              ))


        ],
      ),

    );
  }
}

class OrderItemCard extends StatelessWidget {
  const OrderItemCard({Key? key,
  required this.item
  }) : super(key: key);
  final Map item;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(item[dbname.itemname]),
           Text('${item[dbname.quantity]}'),
             Text('Rs. ${item[dbname.price]}'),
       
            
           
          ],
        ),
    );
  }
}