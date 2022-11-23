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

    if(DataHolder().perfil.uid==null){
      setState(() {
        Navigator.of(context).popAndPushNamed('/loginView');
      });
    }else{
      bool existeUS=await checkExistingProfile();
      if(existeUS){
        setState(() {
          Navigator.of(context).popAndPushNamed('/home');
        });
      }else{
        setState(() {
          Navigator.of(context).popAndPushNamed('/register');
        });
      }
    }

  }


  @override
  Widget build(BuildContext context) {
    DataHolder().platformAdmin.initDisplayData(context);
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(widget.imgLogo)),
            const SizedBox(height:30),
            const Text("C A R G A N D O ...",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.deepPurple),),
            const SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 70),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const LinearProgressIndicator(
                  color: Colors.deepPurple,
                  minHeight: 10,
                  backgroundColor: Colors.white,

                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}