
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../fb_proyects/Perfil.dart';
import '../fb_proyects/Room.dart';
import '../gridItem/RoomCard.dart';
import '../singleton/DataHolder.dart';

class HomeView extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    return _HomeView();
  }

}

class _HomeView extends State<HomeView> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String name = " **** ";
  bool blIsRefresBtnVisible = true;
  List<Room> chatRooms= [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getPerfiles();
    getRooms();
  }

  void getPerfiles() async {
    final ref = db.collection("perfiles").doc(FirebaseAuth.instance.currentUser?.uid).withConverter(
      fromFirestore: Perfil.fromFirestore,
      toFirestore: (Perfil perfil, _) => perfil.toFirestore(),
    );
    final docSnap = await ref.get();
    final perfil = docSnap.data();
    if (perfil != null) {
      print("---------->"+perfil.toString());
    } else {
      print("No such document.");
    }

  }
  void getRooms()async{
    final docRef = db.collection("rooms").withConverter(fromFirestore: Room.fromFirestore,
        toFirestore: (Room room, _) => room.toFirestore());

    final docSnap= await docRef.get();

    setState(() {
      for(int i=0;i<docSnap.docs.length;i++){
        chatRooms.add(docSnap.docs[i].data());
      }
    });
  }

  void listItemShortClicked(int index){
    print("DEBUG: "+index.toString());
    print("DEBUG: "+chatRooms[index].name!);
   // print("PRINT: "+chatRooms.length.toString());
    DataHolder().selectedChatRoom=chatRooms[index];
    Navigator.of(context).pushNamed('/chatView');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey,
          title: Text('Wiki Dragons',
          style: TextStyle(
            fontSize:25,
          ),
          ),
        ),
        body:
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 20, bottom: 80,right: 15,left: 15),
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
              child:
              GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: chatRooms.length,
                  itemBuilder: (BuildContext context, int index) {
                    return RoomCard(
                      imgURL:chatRooms[index].image!,
                      name : chatRooms[index].name!,
                      onShorClick: listItemShortClicked,
                      index: index,);
                  }
              ),
            )
            ),
      floatingActionButton:  FloatingActionButton(
        backgroundColor: Colors.white70,
        child:Text('+',style: TextStyle(
          color: Colors.grey,
          fontSize: 30
        ),
        ),
        onPressed: () {

        },
      ),
        );
  }


}
