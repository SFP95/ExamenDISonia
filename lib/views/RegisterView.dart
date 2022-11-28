import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../custom_views/RFInputText.dart';

class RegisterView extends StatelessWidget{

  RegisterView({Key?key}):super(key: key);
  var txt=TextEditingController();
  final myController = TextEditingController();
  final RFInputText inputUser=RFInputText(
    titulo: 'Escribe tu usuario:',
    ayuda: 'TuEmail@gmail.com',);
  final RFInputText inputPss=RFInputText(
    titulo: 'Escribe tu Contraseña:',
    ayuda: 'No menos de 8 caracteres',
    blIsPsswd: true,);
  final RFInputText inputRpPss=RFInputText(
    titulo: 'Escribe tu Contraseña:',
    ayuda: 'Repite la contraseña',
    blIsPsswd: true,);


  void btnPressed(BuildContext context) async{
    //print("FUNCIONO  --  "+inputUser.getText()+"--"+ inputPss.getText());
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: inputUser.getText(),
        password: inputPss.getText(),
      );
      //print(' -- ESTOY DENTRO ---- Bienvenido '+inputUser.getText());
      Navigator.of(context).popAndPushNamed('/onBoarding');

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        txt.text="----- The password provided is too weak -----";
      } else if (e.code == 'email-already-in-use') {
        txt.text="---- Ya existe una cuenta con ese email -----";
      }
    } catch (e) {
      print(" NO FUNCIONO "+e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {

    TextField txtMensaje=TextField(controller: myController, readOnly: true, style: TextStyle(color: Colors.red,fontSize: 16),);

    return Scaffold(
      backgroundColor: Colors.grey,
      /*appBar: AppBar(
        title: Text('RegisterView'),
        backgroundColor: Colors.deepPurple,
      ),*/
      body: Center( //aqui tenia el error
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
            inputPss,
            inputRpPss,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed:(){
                    if(inputPss.getText()==inputRpPss.getText()){
                      btnPressed(context);
                    }else{
                      txt.text="ERROR! LAS CONSTRASELAS NO COINCIDEN";
                    }
                  },

                  child: Text("Aceptar"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent[100],
                  ),
                ),
                ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).popAndPushNamed('/loginView');
                    //print(' -- ESTOY DENTRO ---- Bienvenido '+inputUser.getText()+ "---"+ inputPss.getText());
                  },
                  // Respond to button press

                  child: Text("Cancelar"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent[100],
                  ),
                ),
              ],
            )],
        ),
      ),
      )
    );

  }

}