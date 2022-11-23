import 'package:flutter/material.dart';

class RFInputText extends StatelessWidget{

  final String titulo;
  final String ayuda;
  final bool blIsPsswd;
  final TextEditingController myController = TextEditingController();
  final String img;

  RFInputText({Key? key, this.img="" , this.titulo="",  this.blIsPsswd=false,  this.ayuda=""}): super (key:key);


  String getText(){
    return myController.text;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: blIsPsswd,
      controller: myController,
      cursorColor: Colors.white,
      maxLength: 80,
      enableSuggestions: !blIsPsswd,
      autocorrect: !blIsPsswd,
      decoration: InputDecoration(
        icon: Image(
            image: AssetImage('assets/images/dragon.png'),
            height: 40,
        ),
        labelText:  titulo ,
        labelStyle: TextStyle(
          color: Colors.blueAccent[200]
        ),
        helperText: ayuda ,
        suffixIcon: Icon(
          Icons.local_fire_department,
          color: Colors.redAccent[100],
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.white),
        ),
      ),
    );
  }

}