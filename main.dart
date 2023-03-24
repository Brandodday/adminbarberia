import 'package:flutter/material.dart';
import 'usuarios.dart';
import 'citas.dart';
import 'calendario.dart';
import 'package:intl/date_symbol_data_local.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barbería admin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalendarScreen(),
    );
  }
}


