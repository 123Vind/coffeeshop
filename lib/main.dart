import 'package:coffeeshop/provider/order.dart';
import 'package:coffeeshop/screens/displayorder.dart';
import 'package:coffeeshop/screens/editmenuscreen.dart';
import 'package:coffeeshop/screens/historyscreen.dart';
import 'package:coffeeshop/screens/receipt.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/items.dart';
import '../screens/homescreen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(context)=>Itemprovider() ),
        ChangeNotifierProvider(create:(context)=>OrderProvider() ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Coffee Shop',
        theme: ThemeData(
          primarySwatch: Colors.blue,
    
        ),
        home: const HomePage(),
        routes: {
          HomePage.routename:(context)=>const HomePage(),
          ReceiptScreen.routename:(context)=>const ReceiptScreen(),
          EditMenuScreen.routename:(context)=>EditMenuScreen(),
          HistoryScreen.routename:(context)=>const HistoryScreen(),
          DisplayOrderScreen.routename:(context)=>const DisplayOrderScreen(),
        },
      ),
    );
  }
}
