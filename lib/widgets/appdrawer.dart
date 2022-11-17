import 'package:coffeeshop/screens/editmenuscreen.dart';
import 'package:coffeeshop/screens/historyscreen.dart';

import 'package:flutter/material.dart';
class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              padding: const EdgeInsets.symmetric(horizontal:16),
              width: double.infinity,
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Coffee Shop',style: TextStyle(fontSize: 20,color: Colors.white),)
                ],
              ), 
            
            ),
     
            ListTile(leading: Icon(Icons.shop),
          title: Text('Order History'),
          onTap: (){
            Navigator.pushNamed(context, HistoryScreen.routename);
          },
          ),
            const Divider(),
          ListTile(leading: Icon(Icons.shop),
          title: Text('Edit Menu'),
          onTap: (){
            Navigator.pushNamed(context, EditMenuScreen.routename);
          },
          ),
          ],
        ),
      );
  }
}

