import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../custom_views/RFInputText.dart';
import '../fb_proyects/Perfil.dart';
import '../singleton/DataHolder.dart';

class OnBoardingView extends StatelessWidget{

  OnBoardingView({Key?key}):super(key: key);

  final myController = TextEditingController();

  final RFInputText inputNombre=RFInputText(
    titulo: 'Nombre:',
    ayuda: 'Escriba su Nombre',);
  final RFInputText inputPais=RFInputText(
    titulo: 'Pais:',
    ayuda: 'Escriba su Pais',);
  final RFInputText inputCiudad=RFInputText(
    titulo: 'Ciudad:',
    ayuda: 'Escriba su Ciudad',);
  final RFInputText inputEdad=RFInputText(
    titulo: 'Edad:',
    ayuda: 'Escriba su Edad',);

  FirebaseFirestore db=FirebaseFirestore.instance;

  void accepPressed(String nombre, String ciudad, String pais, int edad,BuildContext context) async{

    Perfil perfil= Perfil(name: nombre, country: pais, city: ciudad,edad: edad);


    await db.collection("perfiles").doc(DataHolder().perfil.uid).set(perfil.toFirestore())
        .onError((e, _) => print("Error writing document: $e"));

    Navigator.of(context).pop('/home');
  }

  void checkExistingProfile(BuildContext context) async{
    String? idUser=DataHolder().perfil.uid;
    final docRef=db.collection("perfiles").doc(idUser);

    DocumentSnapshot docsnap=await docRef.get();

    if(docsnap.exists){
      Navigator.of(context).pop('/home');
    }
  }

  @override
  Widget build(BuildContext context) {

    TextField txtMensaje=TextField(controller: myController, readOnly: true, style: TextStyle(
        color: Colors.red[400],
        fontSize: 16),
    );

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 100, bottom: 100,right: 15,left: 15),
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
          ),          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              inputNombre,
              inputPais,
              inputCiudad,
              inputEdad,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed:(){
                      accepPressed(inputNombre.getText(),inputPais.getText(),inputCiudad.getText(),int.parse(inputEdad.getText()),context);
                      Navigator.of(context).popAndPushNamed('/home');
                    },

                    child: Text("Aceptar"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent[100],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).popAndPushNamed('/loginView');
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
      ),

    );
  }
}


