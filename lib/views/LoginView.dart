import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../custom_views/RFInputText.dart';

class LoginView extends StatelessWidget{

  LoginView ({Key?key}):super (key: key);

  late RFInputText inputUser= RFInputText(
    titulo: 'USUARIO:',
    ayuda: 'TuEmail@gmai.com',);
  late RFInputText inputPsswd= RFInputText(
    titulo: 'PASSWORD:',
    ayuda: 'No menos de 8 caracteres',
    blIsPsswd: true,);
/*
  void LogPressed(RFInputText inputUser, RFInputText inputPsswd, BuildContext context) async{
    try{
      final credential= await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: inputUser.getText(),
        password: inputPsswd.getText(),
      );
      print("ESTOY LOGEADO");
      Navigator.of(context).popAndPushNamed('/home');
    }on FirebaseAuthException catch (e){
      if(e.code=='user-not-found'){
        print('No user found for that email');
      }else if(e.code=='wrong-password'){
        print('Wrong password provided for that user');
      }
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0,
      ),
      body:  Center(
        child: Container(
          margin: const EdgeInsets.only(top: 110, bottom: 150,right: 15,left: 15),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              inputUser,
              inputPsswd,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: ()async{
                      print("FUNCIONO  --  "+inputUser.getText() +" -- "+inputPsswd.getText());

                      try {
                        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: inputUser.getText(),
                          password: inputPsswd.getText(),
                        );
                        print(' -- ESTOY DENTRO ---- Bienvenido '+inputUser.getText()+ "---"+ inputPsswd.getText());
                        Navigator.of(context).popAndPushNamed('/home');

                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          print('----- La contraseña es debil -----');
                        } else if (e.code == 'email-already-in-use') {
                          print('---- Ya existe una cuenta con ese email -----');
                        } else if (e.code == 'user-not-found') {
                          print("---- No encuentro al usuario ----- ");
                        } else if (e.code == 'wrong-password') {
                          print("---- La contraseña no cohincide ----- ");
                        }
                        print(e.code); //Add this line to see other firebase exceptions.
                      } catch (e) {
                        print(e);
                      }
                    },

                    child: Text("LOGIN"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent[100],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).popAndPushNamed('/registerView');
                      },
                      // Respond to button press

                      child: Text("REGISTRO"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent[100],
                      ))
                ],
              )],
          ),
        ),
      ),
    );
  }

}