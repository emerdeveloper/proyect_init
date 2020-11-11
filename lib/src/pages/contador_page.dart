import 'package:flutter/material.dart';

import 'package:proyect_init/src/BLoC/counter_BLoc.dart';
import 'package:proyect_init/src/BLoC_event/counter_event.dart';

class ContadorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ContadorPageState();
  }
}

class ContadorPageState extends State {
  final _bloc = CounterBloc();

  final TextStyle textStyle = TextStyle(fontSize: 25);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Title'),
        ),
        body: Center(
          child: StreamBuilder(
            stream: _bloc.counter,
            initialData: 0,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Column(children: <Widget>[
                Text('Número de cliks', style: textStyle),
                Text('${snapshot.data}', style: textStyle),
              ], mainAxisAlignment: MainAxisAlignment.center);
            },
          ),
        ),
        floatingActionButton: _createButtonsRow()
        //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        );
  }

  Widget _createButtonsRow() {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
      SizedBox(width: 30.0),
      FloatingActionButton(
        child: Icon(Icons.exposure_zero),
        tooltip: 'Reset',
        onPressed: () => _bloc.counterEventSink.add(ResetEvent())),
      Expanded(child: SizedBox()),
      FloatingActionButton(
        child: Icon(Icons.remove),
        tooltip: 'Decrement',
        onPressed: () => _bloc.counterEventSink.add(DecrementEvent())),
      SizedBox(width: 10.0),
      FloatingActionButton(
        child: Icon(Icons.add), 
        tooltip: 'Increment',
        onPressed: () => _bloc.counterEventSink.add(IncrementEvent())),
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}
