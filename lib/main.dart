import 'weather.dart';
import 'package:flutter/material.dart';
import 'Quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
// TODO: implement build
    return MaterialApp(
      home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(tabs: [
                Tab(
                  icon: Icon(Icons.directions_car),
                ),
                Tab(
                  icon: Icon(Icons.transit_enterexit),
                ),
              ]),
              title: Text('Tab Demo'),
            ),
            body: TabBarView(children: [Quiz(), Weather()]),
          )),
    );
  }
}
