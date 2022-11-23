import 'package:flutter/material.dart';

class RFInputText extends StatelessWidget{

  final String titulo;
  final String ayuda;
  final bool blIsPsswd;
  final TextEditingController myController = TextEditingController();

  RFInputText({Key? key,  this.titulo="",  this.blIsPsswd=false,  this.ayuda=""}): super (key:key);


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
        icon: Icon(Icons.star,
          color: Colors.white,
        size: 40),
        labelText:  titulo ,
        labelStyle: TextStyle(
          color: Colors.blueAccent[200],
        ),
        helperText: ayuda ,
        suffixIcon: Icon(
          Icons.abc_rounded,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.white),
        ),
      ),
    );
  }

}