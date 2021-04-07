import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/view_model/home_page_vm.dart';
import 'Tile.dart';
import 'custom_icons/custom_icons.dart';
import 'search.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomePageVM>(context, listen: false).fetchForecast();
  }

  @override
  Widget build(BuildContext context) {
    HomePageVM vm = Provider.of<HomePageVM>(context);

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
          title: Text(
            vm.currentCity,
            style: Theme.of(context).primaryTextTheme.headline6,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () async {
                final result = await showSearch(
                    context: context,
                    delegate: Search(vm.searchHistory, vm.allCities)) as String;
                vm.currentCity = result;
                print(result + ' XD ' + vm.currentCity);
                vm.fetchForecast();
              },
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
                      vm.getCurrentDate(),
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
                                child: Image.network(vm.getIconUrl(),
                                    fit: BoxFit.cover)),
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
              flex: 7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(MyFlutterApp.wi_sunrise,
                          size: 40, color: Colors.white),
                      Text(vm.getSunriseTime(),
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(MyFlutterApp.wi_sunset,
                          size: 40, color: Colors.white),
                      Text(vm.getSunetTime(),
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Tile(
                    Icon(MyFlutterApp.wi_barometer,
                        size: 40, color: Colors.white),
                    vm.getPressure()),
                Tile(
                    Icon(MyFlutterApp.wi_thermometer,
                        size: 40, color: Colors.white),
                    vm.getTempreture()),
              ],
            ),
            Row(
              children: [
                Tile(Icon(MyFlutterApp.wi_windy, size: 40, color: Colors.white),
                    vm.getWindSpeed()),
                Tile(
                    Icon(MyFlutterApp.wi_humidity,
                        size: 40, color: Colors.white),
                    vm.getHumidity()),
              ],
            )
          ],
        ),
      ),
    );
  }
}
