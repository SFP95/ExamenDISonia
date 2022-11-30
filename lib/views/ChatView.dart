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
              margin: const EdgeInsets.only(top: 50, bottom: 25,right: 15,left: 15),
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
                  child: Column(
                    children: [
                      Divider(
                        height: 20,
                        thickness: 3,

                      ),
                      Image(image: AssetImage('assets/images/egg.png'),
                        height: 60,
                        color: Colors.indigo[300]),
                      Divider(
                        height: 30,
                        thickness: 3,
                        color: Colors.pink[200],
                      ),
                      Text('DATOS DE LA PAGINA'),
                      Divider(
                        height: 20,
                        thickness: 3,
                        color: Colors.pink[200],
                      ),
                      Text('Back Home',
                      style: TextStyle(
                        height: 2,
                        color: Colors.indigo[400]
                      ),),
                      RFButton(),
                    ],
                  ),
                ),

            ),
        ),
      );
    }
}

  
  
