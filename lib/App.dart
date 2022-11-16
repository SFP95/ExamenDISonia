import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        theme: ThemeData(
            backgroundColor: Colors.purple[100],
            fontFamily:'Reach Story'
        ),
        title: 'MyfirstFlutter',
        initialRoute: '/splashView',
        routes: {
         // '/home': (context) => HomeView(),
         // '/loginPhoneView': (context) => LoginPhoneView(),
         // '/loginView': (context) => LoginView(),
         // '/registerView': (context) => RegisterView(),
         // '/onBoarding': (context) => OnBoardingView(),
        //  '/splashView': (context) => SVLogoWait("assets/images/Logo.png"),
          //'/prueba': (context) => PruebaNewView(),
        //  '/chatView': (context) => ChatView(),
        },
      );
    }
    else{
      materialAppMobile=MaterialApp(
        initialRoute: '/splashView',
        routes: {
          //'/home': (context) => HomeView(),
          //'/loginPhoneView': (context) => LoginPhoneView(),
          //'/loginView': (context) => LoginView(),
          //'/registerView': (context) => RegisterView(),
         // '/onBoarding': (context) => OnBoardingView(),
          //'/splashView': (context) => SVLogoWait("assets/images/Logo.png"),
          //'/prueba': (context) => PruebaNewView(),
          //'/chatView': (context) => ChatView(),
        },
      );
    }
    //print("La PLATAFORMA ES ..... --> "+DataHolder().platformAdmin.isAndroidPlatform().toString());

    return materialAppMobile;
  }
}
  
