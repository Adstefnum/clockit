import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import 'dart:async';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
Widget build(BuildContext context) {
return MaterialApp(
  title: 'Clockit',
  home: Scaffold(
      body: Center(
        child: Clockit()
        )
      )
    );

}
}

  class Clockit extends StatefulWidget {
 
  @override
  ClockitState createState() => ClockitState();
}

class ClockitState extends State<Clockit> {

  var txtcolor = Colors.black;
 var bgcolor = Colors.white;
  var btncolor = Colors.blue;
  var txtlst = [Colors.amber,Colors.black,Colors.blue,Colors.white,Colors.yellow,Colors.purple,Colors.red,Colors.green,Colors.orange,Colors.pink,Colors.indigo,Colors.brown,Colors.cyan,Colors.grey,Colors.teal,Colors.lime,Colors.lightBlue,Colors.lightGreen,Colors.deepOrange,Colors.deepPurple];
  var bglst = [Colors.amber,Colors.black,Colors.blue,Colors.white,Colors.yellow,Colors.purple,Colors.red,Colors.green,Colors.orange,Colors.pink,Colors.indigo,Colors.brown,Colors.cyan,Colors.grey,Colors.teal,Colors.lime,Colors.lightBlue,Colors.lightGreen,Colors.deepOrange,Colors.deepPurple];
  var btnlst = [Colors.amber,Colors.black,Colors.blue,Colors.white,Colors.yellow,Colors.purple,Colors.red,Colors.green,Colors.orange,Colors.pink,Colors.indigo,Colors.brown,Colors.cyan,Colors.grey,Colors.teal,Colors.lime,Colors.lightBlue,Colors.lightGreen,Colors.deepOrange,Colors.deepPurple];
  final _random = new Random();

  switchtheme(){
    if (txtcolor == Colors.white && bgcolor == Colors.black && btncolor == Colors.green){
      setState(() {
        txtcolor = Colors.black;
        bgcolor = Colors.white;
        btncolor = Colors.blue;
      });
    }
    else if (txtcolor == Colors.black && bgcolor == Colors.white && btncolor == Colors.blue){
      setState(() {
        txtcolor = Colors.white;
        bgcolor = Colors.black;
        btncolor = Colors.green;
      });
    }
    else{
      setState(() {
        txtcolor = Colors.white;
        bgcolor = Colors.black;
        btncolor = Colors.green;
      });}
  }

surprisetheme(){
  
  setState(() {
   txtcolor = txtlst[_random.nextInt(txtlst.length)];
        bgcolor = bglst[_random.nextInt(bglst.length)];
        btncolor = btnlst[_random.nextInt(btnlst.length)];
  });

}

String _timestring;

@override
void initState(){
  _timestring = _formatDateTime(DateTime.now());
  Timer.periodic(Duration(seconds:1), (Timer t) => _getTime());
  super.initState();
}
void _getTime(){
  final DateTime now = DateTime.now();
  final String formattedDateTime = _formatDateTime(now);
  setState((){
    _timestring = formattedDateTime;});}

    String _formatDateTime (DateTime dateTime) {
      return DateFormat('HH:mm:ss MM/dd/yyyy').format(dateTime);
    }

@override
Widget build(BuildContext context){

  return Scaffold(
    backgroundColor: bgcolor,
    body:Column(
      children: <Widget>[
        Center(
          child:Container(
          margin: EdgeInsets.only(top: 250.0),
          child:Text(
            _timestring,
            textAlign:TextAlign.center,
            style:new TextStyle(fontWeight:FontWeight.bold, fontSize: 45.0, color: txtcolor),
            )))]),

  floatingActionButton: Column(
       children:<Widget>[
         SizedBox(height:500.0),
       FloatingActionButton(
        onPressed: switchtheme,
        backgroundColor:btncolor,
        foregroundColor: Colors.black,
        tooltip: 'Change Theme',
        child: Icon(Icons.brightness_4)),

        SizedBox(height:20.0),

        FloatingActionButton(
        onPressed: surprisetheme,
        backgroundColor:btncolor,
        foregroundColor: Colors.black,
        tooltip: 'Random theme',
        child: Icon(Icons.all_inclusive),
      )]
      
  ));
}
}
