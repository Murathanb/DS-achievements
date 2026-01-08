import 'package:flutter/material.dart';

class ImageLearn extends StatelessWidget {
  const ImageLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [ SizedBox( height:400, width: 400,
      child: PngImage(name: ImageItems().ds2)),],),
    );
  }
}

class ImageItems {
    final String twitter = "assets/twitter.png"; 
    final String ds = "assets/png/ds.png"; 
    final String ds2 = "ds"; 

}

class PngImage extends StatelessWidget {
  const PngImage({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/png/$name.png', fit: BoxFit.cover,);
  }
}
  