import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget {
  const TextLearnView({super.key});

  final String name = 'dsa';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome $name ${name.length}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.red)
            ),
            Text(
              'Welcome $name ${name.length}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
             
              textAlign: TextAlign.left,
            ),
             Text(
              'Welcome $name ${name.length}',
            
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectStyles {
  static const TextStyle welcomeStyle = TextStyle(
    wordSpacing: 2,
    decoration: TextDecoration.underline,
    fontStyle: FontStyle.italic,
    letterSpacing: 2,
    color: Colors.lime,
    fontSize: 16,
    fontWeight: FontWeight.w600,
   
  );
}
