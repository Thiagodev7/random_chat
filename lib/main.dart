import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/home/homePage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return Container(child: Text('Deu erro aqui'));
    }
    if (!_initialized) {
      return Container(child: Text("aguarde"));
    }
    return MaterialApp(
      home: HomeViwer(),
    );
  }
}
