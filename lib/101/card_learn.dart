import 'package:flutter/material.dart';

class CardLearn extends StatelessWidget{
  const CardLearn({super.key});

  @override
  Widget build(BuildContext context) {
  
   return  Scaffold(
    appBar: AppBar(),
    body: Column(
      children: const [Card(child: SizedBox(height: 250, width: 200,),)
        
      ],
    ),
   );

  }
} 