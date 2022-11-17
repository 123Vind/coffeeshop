import 'package:coffeeshop/provider/dbattributes.dart';
import 'package:coffeeshop/screens/displayorder.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({Key? key,
  required this.order,
  }) : super(key: key);

  final Map order;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, DisplayOrderScreen.routename,arguments: order);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        margin:const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset:const Offset(0.5,0.5),
              blurRadius:1,
              spreadRadius: 1,
              color: Colors.grey.withOpacity(0.5)
            ),
          
          ],
          
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Text(order[dbname.time].toString()),
            const SizedBox(height: 10,),
            Text(order[dbname.phone]),
          ],
        ),
      ),
    );
  }
}