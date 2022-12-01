import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/singleton/DataHolder.dart';
import 'package:untitled/views/CustomView.dart';
import 'package:untitled/views/LoginView.dart';
import 'package:untitled/home_views/OnBoardingView.dart';
import 'package:untitled/views/RegisterView.dart';
import 'package:untitled/views/SplashView.dart';
import 'home_views/Home.dart';

class App extends StatelessWidget{

  App ({Key?key}):super (key: key);
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    MaterialApp materialAppMobile=const MaterialApp();

    if(DataHolder().platformAdmin.isAndroidPlatform() ||
        DataHolder().platformAdmin.isIOSPlatform()){
      //print("ENTRO EN ANDROID O IOS");
      materialAppMobile=MaterialApp(
        title: 'Examen DI Sonia',
        initialRoute: '/home',
        routes: {
          '/home': (context) => HomeView(),
          '/loginView': (context) => LoginView(),
          '/registerView': (context) => RegisterView(),
          '/onBoarding': (context) => OnBoardingView(),
          '/splashView': (context) => SplashView("assets/images/dragon.png"),
          '/chatView': (context) => CustomView(),
        },
      );
    }
    else{
      materialAppMobile=MaterialApp(
        initialRoute: '/onBoarding',
        routes: {
          '/home': (context) => HomeView(),
          '/loginView': (context) => LoginView(),
          '/registerView': (context) => RegisterView(),
          '/onBoarding': (context) => OnBoardingView(),
          '/splashView': (context) => SplashView("assets/images/Nia_.png"),
          '/chatView': (context) => CustomView(),
        },
      );
    }
    //print("La PLATAFORMA ES ..... --> "+DataHolder().platformAdmin.isAndroidPlatform().toString());

    return materialAppMobile;
  }
}
  
