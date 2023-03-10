import 'package:flutter/material.dart';
import 'package:testofzenscompany/Mobile/Const/Const.dart';

class Footer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20,5,20,10),
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
                    fontSize: Const.COMMENTSIZE,
                  ),
                  textAlign: TextAlign.center,

                ),
              )
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  "${Const.COPYRIGHT}",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: Const.TITLESIZE,
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