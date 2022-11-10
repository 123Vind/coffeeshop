import 'dart:developer';

import 'package:coffeeshop/provider/items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class EditMenuScreen extends StatelessWidget {
  EditMenuScreen({Key? key}) : super(key: key);
static const routename = 'EditMenuScreen';
final _form = GlobalKey<FormState>();
var namecontroller = TextEditingController();
var pricecontroller = TextEditingController();




  @override
  Widget build(BuildContext context) {
    final itemprovider = Provider.of<Itemprovider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Menu'),
      ),
      body: Form(
        key: _form,
        child: ListView(
          children: [
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: namecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:'Item Name',
                ),
                 keyboardType: TextInputType.name,
                   validator: (v){
                if(v!.isEmpty){
                  return 'Name cannot be empty';
                }
              },
              ),
            ),
                    Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: pricecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefix: Text('Rs.'),
                  labelText:'Amount',

                ),
              keyboardType: TextInputType.number,
              validator: (v){
                if(v!.isEmpty){
                  return 'Price cannot be empty';
                }
              },
              ),
            ),

            InkWell(
              onTap: (){
                if( _form.currentState!.validate()){
                      try{
                            if(double.parse(pricecontroller.text)>=0){
                                  itemprovider.addItems(Items(itemName: namecontroller.text, price: double.parse(pricecontroller.text), size: 'S', category: 'Coffee'));
                         
                                  
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Item Added'),duration: Duration(milliseconds: 2000),));
                                }
                         
                      }catch(e){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Error adding item'),duration: Duration(milliseconds: 2000),));
                      }
                } else{

                }
              },
              child: Container(
                margin: const EdgeInsets.all(16),
                height: 50,
                width: double.infinity,
               
                decoration: BoxDecoration(
                  color: Colors.brown.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(8)
                ),
                 child: const Center(child: Text('Add Item',style: TextStyle(fontSize: 16),)),
              ),
            )




          ],
        ),
      ),
    );
  }
}