import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:weather_app/view_model/home_page_vm.dart';
import 'view/home_page.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    
    statusBarBrightness: Brightness.light,//status bar brigtness
    statusBarIconBrightness:Brightness.light, //status barIcon Brightness
    /*
    systemNavigationBarColor: Colors.blue, // navigation bar color
    
    systemNavigationBarDividerColor: Colors.greenAccent,//Navigation bar divider color
    systemNavigationBarIconBrightness: Brightness.light, //navigation bar icon */
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,

        scaffoldBackgroundColor: Colors.black,

        appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 1
        ),
        
        cardColor: Colors.blueGrey[900],

        primaryTextTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.white
            )
        ),
        textTheme: Theme.of(context).textTheme.apply(
          displayColor: Colors.white,
        )
      ),
      home: 
      ChangeNotifierProvider(
        create: (context) => HomePageVM(),
        child: MyHomePage(),
      ),
    );
  }
}

