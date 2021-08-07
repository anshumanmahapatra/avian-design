import './screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((val) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: "Avenir",
          primaryColor: const Color(0xFF1BBAD6),
          textTheme: const TextTheme().apply(
            bodyColor: const Color(0xFF2E2F2E),
            displayColor: const Color(0xFF2E2F2E),
          )),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
