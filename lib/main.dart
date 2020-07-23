import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  int fnumber;
  int snumber;
  String texttodisplay = "";
  String res;
  String operationtoperform;

  Widget custombutton(String btnvalue) {
    return Expanded(
        child: OutlineButton(
      padding: EdgeInsets.all(25),
      onPressed: () => btnclicked(btnvalue),
      child: Text(
        "$btnvalue",
        style: TextStyle(fontSize: 25),
      ),
    ));
  }

  void btnclicked(String btntext) {
    if (btntext == "C") {
      texttodisplay = "";
      fnumber = 0;
      snumber = 0;
      res = "";
    } else if (btntext == "+" ||
        btntext == "-" ||
        btntext == "X" ||
        btntext == "/") {
      fnumber = int.parse(texttodisplay);
      res = "";
      operationtoperform = btntext;
    } else if (btntext == "=") {
      snumber = int.parse(texttodisplay);
      if (operationtoperform == "+") {
        res = (fnumber + snumber).toString();
      }
      if (operationtoperform == "-") {
        res = (fnumber - snumber).toString();
      }
      if (operationtoperform == "X") {
        res = (fnumber * snumber).toString();
      }
      if (operationtoperform == "/") {
        res = (fnumber ~/ snumber).toString();
      }
    } else {
      res = int.parse(texttodisplay + btntext).toString();
    }
    setState(() {
      texttodisplay = res;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(10.0),
              alignment: Alignment.bottomRight,
              child: Text(
                "$texttodisplay",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
            )),
            Row(
              children: <Widget>[
                custombutton("9"),
                custombutton("8"),
                custombutton("7"),
                custombutton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("6"),
                custombutton("5"),
                custombutton("4"),
                custombutton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("3"),
                custombutton("2"),
                custombutton("1"),
                custombutton("X"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("C"),
                custombutton("0"),
                custombutton("="),
                custombutton("/"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
