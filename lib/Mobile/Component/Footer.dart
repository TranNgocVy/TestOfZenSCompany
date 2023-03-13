import 'package:flutter/material.dart';
import 'package:testofzenscompany/Mobile/Const/Const.dart';

class Footer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: EdgeInsets.fromLTRB(10,5,10,5),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 2, color: Colors.grey.shade200),
          top:  BorderSide(width: 1, color: Colors.grey.shade200)
        ),
    ),
      alignment: Alignment.bottomCenter,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  "${Const.DESCRIPTION}",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,

                ),
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  "${Const.COPYRIGHT}",
                  style: TextStyle(
                    color: Color(0xFF505351),
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.center,

                ),
              )
            ],
          )
        ],
      ),
    );
  }
}