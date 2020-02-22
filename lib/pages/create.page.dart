import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  DateTime _dateTime = DateTime.now();
  String _description = "";
  String _title = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova Tarefa'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                isDense: true,
                labelText: "Titulo",
                labelStyle: TextStyle(
                  color: Colors.blue,
                  fontSize: 20
                ),
              ),
              keyboardType: TextInputType.text,
              onChanged: (value) => setState(() => this._title = value )
            ),
            TextField(
              decoration: InputDecoration(
                // isDense: true,
                labelText: "Descrição",
                labelStyle: TextStyle(
                  color: Colors.blue,
                  fontSize: 20
                ),
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              onChanged: (value) => setState(() => this._description = value )
            ),
            CalendarCarousel<Event>(
              height: 340,
              selectedDateTime: this._dateTime,
              onDayPressed: (DateTime date, List<Event> events) {
                this.setState(() => this._dateTime = date);
              },
            ),
            SizedBox(
              height: 12,
            ),
            Align(
              alignment: Alignment.center,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
                ),
                padding: EdgeInsets.all(6),
                color: Colors.blue,
                child: Text(
                  "Criar nova tarefa",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                onPressed: () => print(this._dateTime.toString() + " " + this._description + " " + this._title)
              ),
            )
            
          ],
        ),
      )
    );
  }
}