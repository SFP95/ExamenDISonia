
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

    //getProfile();
    actualizarLista();
  }


  void getRoomList() async{
    // String Query= SELECT * FROM ROOMS WHERE members>50;
    final docRef=db.collection('rooms').where('members', isGreaterThan:50).orderBy('members',descending: true)
        .withConverter(
        fromFirestore: Room.fromFirestore,
        toFirestore: (Room room, _) => room.toFirestore());

    //stmt.exexuteQuery(Query);
    final docSnap= await docRef.get();

    setState(() {
      for(int i=0;i<docSnap.docs.length;i++){
        chatRooms.add(docSnap.docs[i].data());
      }
    });
  }


  void actualizarLista()async{
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
          title: Text('HOME'),
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.only(top: 50, bottom: 80,right: 15,left: 15),
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
                crossAxisCount: 3,
              ),
              itemCount: chatRooms.length,
              itemBuilder: (BuildContext context, int index) {
                return RoomCard(
                  imgURL:chatRooms[index].image!,
                  name :chatRooms[index].name!,
                  onShorClick: listItemShortClicked,
                  index: index,);
              }
          ),
        )
        )
    );
  }
}
