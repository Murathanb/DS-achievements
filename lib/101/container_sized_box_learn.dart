

import 'package:flutter/material.dart';

class ContainerSizedBoxLearn extends StatelessWidget{
  const ContainerSizedBoxLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
           SizedBox(
            width: 300,
            height: 200,
            child: Text('amaolmaz' * 20),
          ),
               SizedBox.shrink(),
               SizedBox.square(
                dimension: 50,
                child:  Text('C' *50),
               ),

          Container(
            width: 50,
            height: 50,
            color: Colors.red,
            constraints: const BoxConstraints(maxWidth: 500, minWidth: 100),

            child: Text('aanabercontainer' * 50),
          
          )     
        ],
        
      ),

    );
  }

}