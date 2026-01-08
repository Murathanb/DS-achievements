import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children:  [
          TextButton(child: Text('Save'),
          onPressed: () {},),
          ElevatedButton(onPressed: () {}, child: Text('data')),
          IconButton(onPressed: () {}, icon: Icon(Icons.abc_rounded)),
          FloatingActionButton(onPressed:() {},
          child: const Icon(Icons.add) ),
          OutlinedButton(onPressed: () {} , child: const Text('data')),
          InkWell(onTap: () {},child: Text('22'),),
          const ElevatedButton(onPressed: null, child: Text('data')),
        ],
      ),
    );
  }
}