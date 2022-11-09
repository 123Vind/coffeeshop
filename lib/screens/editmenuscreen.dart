import 'package:flutter/material.dart';


class EditMenuScreen extends StatelessWidget {
  const EditMenuScreen({Key? key}) : super(key: key);
static const routename = 'EditMenuScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Menu'),
      ),
    );
  }
}