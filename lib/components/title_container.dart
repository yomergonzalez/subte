import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleContainer extends StatelessWidget {
  
  final String title;

  TitleContainer({Key key, @required this.title});
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.cyan[700],
          borderRadius: BorderRadius.all(Radius.circular(12))
        ),
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(20),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.all(Radius.circular(12))
          ),
          child: Text(title,style: TextStyle(fontSize: 20,color: Colors.black54,fontWeight: FontWeight.bold),) ,
        ),
      ),
    );
  }
}
