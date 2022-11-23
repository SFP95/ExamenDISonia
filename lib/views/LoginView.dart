import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget{

  LoginView ({Key?key}):super (key: key);

  late RFInputText inputUser= RFInputText(
    titulo: 'USUARIO:',
    ayuda: 'MrPotato@gmai.com',);
  late RFInputText inputPsswd= RFInputText(
    titulo: 'PASSWORD:',
    ayuda: 'No menos de 8 caracteres',
    blIsPsswd: true,);

  void LogPressed(RFInputText inputUser, RFInputText inputPsswd, BuildContext context) async{
    try{
      final credential= await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: inputUser.getText(),
        password: inputPsswd.getText(),
      );
      print("ESTOY LOGEADO");
      Navigator.of(context).popAndPushNamed('/onBoarding');
    }on FirebaseAuthException catch (e){
      if(e.code=='user-not-found'){
        print('No user found for that email');
      }else if(e.code=='wrong-password'){
        print('Wrong password provided for that user');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white24,
        title: Text('Login',
        style: TextStyle(
          color: Colors.white,
          fontSize: 10,
        ),),
      ),
    );
  }
  
}