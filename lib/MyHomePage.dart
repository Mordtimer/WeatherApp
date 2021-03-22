import 'package:flutter/material.dart';

import 'custom_icons/my_flutter_app_icons.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
          title: Text(
            'Tarnowskie Góry',
            style: Theme.of(context).primaryTextTheme.headline6,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ]),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    padding: EdgeInsets.fromLTRB(8, 0, 0, 8),
                    child: Text(
                      '24 Grudnia, 14:00',
                      style: TextStyle(color: Colors.white),
                    )),
              ]),
            ),
            Expanded(
              flex: 20,
              child: Row(
                children: [
                  Expanded(
                    child: Card(
                      color: Colors.black,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Icon(
                              MyFlutterApp.wi_day_sunny,
                              size: 100,
                              color: Colors.white,
                            )),
                          ),
                        ],
                      ),
                    ),
                    flex: 10,
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 5,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [

                        Column(
                          children: [
                            Icon(MyFlutterApp.wi_sunrise, size:40, color: Colors.white),
                            Text('8:00',
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                        Column(
                              children: [
                                Icon(MyFlutterApp.wi_sunset, size:40, color: Colors.white),
                        Text('8:00',
                                style: TextStyle(color: Colors.white)),
                              ],
                            ),
                      ],
                    ),
                  
                ),
            Expanded(
              flex: 10,
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 150,
                      child: Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(MyFlutterApp.wi_barometer, size:40, color: Colors.white),
                            Text(
                              '1021hPA',
                              style:
                                  Theme.of(context).primaryTextTheme.headline5,
                            ),
                            
                          ],
                        ),
                      ),
                    ),
                    flex: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 150,
                      child: Card(
                        child: Center(
                            child: Row( 
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(MyFlutterApp.wi_thermometer, size:40, color: Colors.white),
                                Text(
                          '10 °C',
                          style: Theme.of(context).primaryTextTheme.headline5,
                        ),
                              ],
                            )),
                      ),
                    ),
                    flex: 10,
                  )
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 150,
                      child: Card(
                        child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(MyFlutterApp.wi_windy, size:40, color: Colors.white),
                                Text(
                          '12m/s',
                          style: Theme.of(context).primaryTextTheme.headline5,
                        ),
                              ],
                            )),
                      ),
                    ),
                    flex: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 150,
                      child: Card(
                        child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(MyFlutterApp.wi_humidity, size:40, color: Colors.white),
                                Text(
                          '70%',
                          style: Theme.of(context).primaryTextTheme.headline5,
                        ),
                              ],
                            )),
                      ),
                    ),
                    flex: 10,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
