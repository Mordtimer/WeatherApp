import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/view_model/home_page_vm.dart';
import 'view/home_page.dart';


void main() {

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    
    statusBarBrightness: Brightness.light,//status bar brigtness
    statusBarIconBrightness:Brightness.light, //status barIcon Brightness
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
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
      routes: {
        'home': (context)=>MyHomePage()
      },
    );
  }
}

