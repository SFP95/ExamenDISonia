import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/singleton/DataHolder.dart';

class SplashView extends StatefulWidget{
  final String imgLogo;
  const SplashView (this.imgLogo,{super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashView();
  }
}

class _SplashView extends State<SplashView>{


  //DataHolder().perfil.uid  FirebaseAuth.instance.currentUser?.uid
  Future<bool> checkExistingProfile() async{
    String? idUser=FirebaseAuth.instance.currentUser?.uid;
    FirebaseFirestore db=FirebaseFirestore.instance;
    final docRef=db.collection("perfiles").doc(idUser);
    DocumentSnapshot docsnap=await docRef.get();
    return docsnap.exists;
  }

  @override
  void initState() {
    super.initState();
    userloged();
  }
  void userloged() async{
    await Future.delayed(Duration(seconds: 3));

    if(DataHolder().perfil.uid!=null){
      Navigator.of(context).popAndPushNamed('/loginView');
    }else{
      bool existeUS=await checkExistingProfile();
      if(existeUS){
        Navigator.of(context).popAndPushNamed('/home');
      }else{
        Navigator.of(context).popAndPushNamed('/registerView');
      }
    }

  }


  @override
  Widget build(BuildContext context) {
    DataHolder().platformAdmin.initDisplayData(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(widget.imgLogo)),
            const SizedBox(height:30),
            const Text("C A R G A N D O ...",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey),),
            const SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 70),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const LinearProgressIndicator(
                  color: Colors.grey,
                  minHeight: 10,
                  backgroundColor: Colors.white38,

                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}