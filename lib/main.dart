import 'package:flutter/material.dart';
import 'package:mvvm_sample/ui/login/login_page.dart';
import 'ui/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MVVM Sample',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: "/",
      routes: <String, WidgetBuilder>{
        "/": (BuildContext context) => LoginPage(),
        "/home": (BuildContext context) => const HomePage()
      },
    );
  }
}
