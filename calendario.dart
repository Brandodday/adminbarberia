import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:intl/date_symbol_data_local.dart';
 // importar esta librería

import 'citas.dart';
import 'usuarios.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _currentDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    // Inicializa el lenguaje en español
    initializeDateFormatting('es', null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.08,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  child: Text(
                    'Barberos',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Citas()),
                    );
                  },
                ),
                TextButton(
                  child: Text(
                    'Usuarios',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 0.0),
                  child: CalendarCarousel<Event>(
                    locale: 'es', // Establece el lenguaje en español
                    onDayPressed: (DateTime date, List<Event> events) {
                      setState(() {
                        _currentDate = date;
                      });
                    },
                    weekendTextStyle: TextStyle(
                      color: Colors.red,
                    ),
                    thisMonthDayBorderColor: Colors.grey,
                    selectedDateTime: _currentDate,
                    height: 820.0,
                    daysHaveCircularBorder: false,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                  child: Text(
                    DateFormat.yMMMEd('es').format(_currentDate), // Establece el lenguaje en español
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
