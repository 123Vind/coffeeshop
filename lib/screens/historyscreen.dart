import 'package:coffeeshop/provider/dbattributes.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';


import '../provider/order.dart';
import '../widgets/ordercard.dart';


class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);
static const routename = 'HistoryScreen';

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
      late Box box;

    
    @override
  void initState() {
    box = Hive.box(dbname.boxnameorder);
    OrderProvider p = OrderProvider();
    p.updateorder();
        // TODO: implement initState
    super.initState();
  }
  
  
  @override
  Widget build(BuildContext context) {


   final orderprovider = Provider.of<OrderProvider>(context);
      return Scaffold(
        appBar: AppBar(title: const Text('Order History'),),
        body: box.get(dbname.boxitemorder)==null?const Center(child: Text('NO ORDERS',style: TextStyle(fontSize: 20),),):ListView(
        children: orderprovider.orderHistory.map((e) =>OrderCard(order: e)).toList(),
      ),
    );
  }
}

