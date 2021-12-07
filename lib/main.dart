import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:random_chat/screens/auth/view/auth_view.dart';

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
    //firebase boot
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
      //handling firebase startup errors
      return Container(child: Text('Erro com banco de Dados...'));
    }
    if (!_initialized) {
      return CircularProgressIndicator();
    }
    return MaterialApp(
      title: "Random Chat",
      theme: ThemeData(
        primaryColor: Colors.cyan,
      ),
      home: AuthView(), //forwarding to authentication screen
    );
  }
}
