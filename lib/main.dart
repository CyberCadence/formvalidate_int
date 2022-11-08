import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:formvalidate/Views/Listdetails.dart';


void main()async {

WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();


  runApp(MaterialApp(home: HomeApp()));
}

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return ListDetails();
  }
}