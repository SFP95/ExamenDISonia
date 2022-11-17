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

  @override
  void initState() {
    super.initState();
   // userloged();
  }
  // void userloged() async{
  //   await Future.delayed(Duration(seconds: 3));
  //
  //
  // }


  @override
  Widget build(BuildContext context) {
    DataHolder().platformAdmin.initDisplayData(context);
    return Scaffold(
      backgroundColor: Colors.orange[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(widget.imgLogo)),
            const SizedBox(height:30),
            const Text("C A R G A N D O ..."),
            const SizedBox(height: 30),
            const LinearProgressIndicator(
              semanticsLabel: 'Linear progress indicator',
            )
          ],
        ),
      ),
    );
  }


}