import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/custom_views/RFButton.dart';

class CustomView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.grey,
       /* appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey,
          title: Text('Dragon',style: TextStyle(color: Colors.white,fontSize: 20),),
        ),*/
        body: Center(
            child: Container(
              margin: const EdgeInsets.only(top: 50, bottom: 25,right: 15,left: 15),
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
                child:Center(
                  child: Column(
                    children: [
                      Divider(
                        height: 15,
                        indent: 800,
                      ),
                      Image(image: AssetImage('assets/images/ArtDragons.png'),
                        height: 220,
                      ),
                      Divider(
                        height: 30,
                        thickness: 3,
                        color: Colors.pink[200],
                      ),
                      Text('Es un ser mitológico que aparece de diversas formas en varias culturas de todo el mundo, con diferentes simbolismos asociados.\n\n'+
                          'Hay dos tradiciones principales sobre dragones: los dragones europeos, derivados de las tradiciones populares europeas y de la'+
                          'mitología de Grecia y Oriente Próximo, y los dragones orientales, de origen chino, coreano, japonés, vietnamita y de otros países ' +
                          'de Extremo Oriente. Las dos tradiciones china y japonesa surgieron probablemente de forma independiente, pero en su desarrollo se han influido mutuamente.\n\n'+
                          'La palabra aparece también en la tradición cristiana: el Apocalipsis se refiere a Satanás como el gran dragón, la serpiente antigua.\n\n'+
                        'El dragón, uno de los más conocidos seres mitológicos, ha sido inspiración de diferentes relatos y poemas, algunos de los cuales han sido'+
                          'llevados al cine. La primera aparición de los dragones fueron unos amuletos de jade de la cultura Hongshan, en China hace aproximadamente 6,700 y 4900 años. '),
                      Divider(
                        height: 20,
                        thickness: 3,
                        color: Colors.pink[200],
                      ),
                      Text('Back Home',
                      style: TextStyle(
                        height: 2,
                        color: Colors.indigo[400]
                      ),),
                      RFButton(),
                    ],
                  ),
                ),

            ),
        ),
      );
    }
}

  
  
