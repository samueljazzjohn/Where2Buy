import 'package:flutter/material.dart';

class ColumnDiveder extends StatelessWidget {
  const ColumnDiveder({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:const [
          Expanded(child: Padding(
            padding: EdgeInsets.only(right:2.0),
            child: Divider(color:Colors.black38),
          )),
          Text('Or Continue with',style: TextStyle(color:Colors.black38)),
          Expanded(child: Padding(
            padding: EdgeInsets.only(left:2.0),
            child: Divider(color:Colors.black38),
          ))
        ]
      ) ,
    );
  }
}