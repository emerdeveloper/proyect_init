import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ContadorPageState();
  }
  
}

class ContadorPageState extends State {
  final TextStyle textStyle = TextStyle(fontSize: 25);
  int _contador = 0;

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
            Text('$_contador',  style: textStyle),
          ],
          mainAxisAlignment: MainAxisAlignment.center
        )
        ),
        floatingActionButton: _createButtonsRow()
          //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _createButtonsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
      SizedBox(width: 30.0),
      FloatingActionButton(
          child: Icon(Icons.exposure_zero),
          onPressed: _reset
          ),
      Expanded(child: SizedBox()),
      FloatingActionButton(
          child: Icon(Icons.remove),
          onPressed: _substract
          ),
      SizedBox(width: 10.0),
      FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _add
          ),
    ]); 
  }

  void _add() {
    setState(() => _contador++);
  }

  void _substract() {
    setState(() => _contador--);
  }

  void _reset() {
    setState(() => _contador = 0);
  }

}