import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/custom_views/RFButton.dart';

class ChatView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.grey,
       /* appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey,
          title: Text('Dragon',style: TextStyle(color: Colors.white,fontSize: 20),),
        ),*/
        body: Center(
            child: Container(
              margin: const EdgeInsets.only(top: 50, bottom: 30,right: 15,left: 15),
              decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      color: Colors.white,
                    ),
                    gradient: LinearGradient(
                        colors: [
                          Colors.white70,
                          Colors.white54,
                          Colors.white54,
                          Colors.white70,
                        ]
                    )
                ),

                child:Center(
                  child: RFButton(),
                ),

            ),
        ),
      );
    }
}

  
  
