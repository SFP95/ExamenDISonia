import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/fb_proyects/Room.dart';
import '../custom_views/RFInputText.dart';
import '../fb_proyects/Perfil.dart';
import '../singleton/DataHolder.dart';

class NewCard extends StatelessWidget{
  NewCard({Key?key}):super(key: key);

  final myController = TextEditingController();

  final RFInputText inputImagen=RFInputText(
    titulo: 'Imagen:',
    ayuda: 'Introduce el URL de la imagen, debe terminar en  ".png"',);
  final RFInputText inputMiembros=RFInputText(
    titulo: 'Miembros:',
    ayuda: 'Nº de miembros',);
  final RFInputText inputNombre=RFInputText(
    titulo: 'Nombre:',
    ayuda: 'Escribe el nombre de la Card, será su titulo',);

  FirebaseFirestore db=FirebaseFirestore.instance;

  void pressed(String image, int members, String name,BuildContext context) async{

    Room room= Room(image: image, members: members, name: name);


    await db.collection("perfiles").doc(DataHolder().perfil.uid).set(room.toFirestore())
        .onError((e, _) => print("Error writing document: $e"));

    //Navigator.of(context).pop('/home');
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
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
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
            inputImagen,
            inputMiembros,
            inputNombre,
            Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: (){
                pressed(
                inputImagen.getText(),
                int.parse(inputMiembros.getText()),
                inputNombre.getText(),context);
                Navigator.of(context).popAndPushNamed('/customView');
             },
              child: Text('Send'),
              style:ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo[200]
                  ),
              ),
            ElevatedButton(
              onPressed: (){
                  Navigator.of(context).popAndPushNamed('/customView');
              },
              child: Text('Cancela'),
              style:ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo[200]
              ),
            ),
              ],
            ),
          ],
          ),
      ),
      ),
    );
  }
}