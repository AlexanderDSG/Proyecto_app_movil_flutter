import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
//
class CustomTitleWidget extends StatelessWidget {
  final IconData lead;
  final String label;
  final IconData end;
  final String routes;
  //mas sencillo de personalizar 
  //mas facil de usar no requiere de pocisiones 
  const CustomTitleWidget({
    super.key, 
    required this.lead, 
    required this.label,  
    this.end = Icons.arrow_back_ios_new,
    required this.routes
    });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(lead),
      title: Text(label),
      trailing: Icon(end),
      onTap: () => context.push(routes),
      
    );
  }
}