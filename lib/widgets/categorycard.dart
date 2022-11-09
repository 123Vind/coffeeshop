
import 'package:flutter/material.dart';
class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.categoryname,
  }) : super(key: key);
  final String categoryname;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      
      padding: const EdgeInsets.all(8),
      height: 20,
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
        
      ),                    
      child: Text(categoryname),
            
    );
  }
}