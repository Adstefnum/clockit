import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';

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
      setState(() {
        txtcolor = Colors.white;
        bgcolor = Colors.black;
        btncolor = Colors.green;
      });
  }

surprisetheme(){
  setState(() {
   txtcolor = txtlst[_random.nextInt(txtlst.length)];
        bgcolor = bglst[_random.nextInt(bglst.length)];
        btncolor = btnlst[_random.nextInt(btnlst.length)];
  });
}

@override
Widget build(BuildContext context){

  DateTime now = DateTime.now();
  String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);
  return Scaffold(
    backgroundColor: bgcolor,
    body:Column(
      children: <Widget>[
        Center(
          child:Container(
          margin: EdgeInsets.only(top: 250.0),
          child:Text(
            formattedDate,
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