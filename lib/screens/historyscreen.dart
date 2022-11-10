import 'package:coffeeshop/provider/order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/ordercard.dart';


class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);
static const routename = 'HistoryScreen';
  @override
  Widget build(BuildContext context) {

    final orderprovider = Provider.of<OrderProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Order History'),),
      body: orderprovider.orderHistory.isEmpty?const Center(child: Text('NO ORDERS',style: TextStyle(fontSize: 20),),):ListView(
        children: orderprovider.orderHistory.map((e) =>OrderCard(order: e)).toList(),
      ),
    );
  }
}

