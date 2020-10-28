import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final TextStyle textStyle = TextStyle(fontSize: 25);
  final contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Número de cliks', style: textStyle),
            Text('$contador',  style: textStyle),
          ],
          mainAxisAlignment: MainAxisAlignment.center
        )
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () { 
            print('Hello');
            //contador++;
            },
          ),
          //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}