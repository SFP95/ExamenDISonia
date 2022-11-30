import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RFButton extends StatelessWidget{
  final String img;
  final String texto;
  final TextEditingController myController = TextEditingController();


  RFButton({Key? key, this.img="" , this.texto=""}): super (key:key);

  String getText(){
    return myController.text;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
        ),
        onPressed: (){
          Navigator.of(context).popAndPushNamed('/home');
        },
        child: Container(
          height: 50,
          width:50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            image: DecorationImage(
              image:AssetImage('assets/images/dragon.png'),
              fit: BoxFit.cover,
            ),
            color: Colors.white,
          ),
          /*child:Text('MENU',
          style: TextStyle(
            height: 5,
            fontSize: 20,
            color: Colors.indigo[400],
          ),*/
          )// Padding(padding: const EdgeInsets.all(10),),
        );
  //  );

  }
  
}