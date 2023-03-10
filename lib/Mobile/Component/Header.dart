import 'package:flutter/material.dart';
import 'package:testofzenscompany/Mobile/Const/Const.dart';

class Header extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20,5,20,10),
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Image(image: AssetImage('assets/images/logo.png')),
          Container(
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.max,

                      children: [
                        Text(
                          "Handicrafted by",
                          style: TextStyle(
                            color: Colors.black26,
                            fontSize: Const.COMMENTSIZE,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 2,),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Jim HLS",
                          style: TextStyle(
                            fontSize: Const.CONTENTSIZE,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.end,

                        ),
                      ],
                    )



                  ],
                ),
                SizedBox(width: 5,),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                  maxRadius: 40,
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}