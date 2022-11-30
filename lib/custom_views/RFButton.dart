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
        onPressed: (){
          Navigator.of(context).popAndPushNamed('/home');
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              scale: 5,
              image: AssetImage('assets/images/dragon.png'),
              fit: BoxFit.cover,
            ),
            color: Colors.grey,
          ),
        )
    );

  }
  
}