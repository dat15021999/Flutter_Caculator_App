import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello world, this is a flutter demo!',
      theme: ThemeData(
        // This is the theme of your application.
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String current = "0";

  String _output = "0";
  double num1 = 0;
  double num2 = 0;
  String operand;

  buttonPressed(String buttonText) {
    if (buttonText == "Clear") {
      _output = "0";
      num1 = 0;
      num2 = 0;
      operand= "";
    }
    else if (buttonText == "+" || buttonText == "-" ||buttonText == "X" ||buttonText == "/") {
      num1 = double.parse(current);
      operand = buttonText;
      _output = "0";
    }
    else if (buttonText == ".") {
      if (_output.contains(".")) {
        print ("Already conatins decimals!");
        return;
      }
      else {
        _output = _output + buttonText;
      }
    }
    else if (buttonText == "=") {
      num2 = double.parse(current);

      switch (operand) {
        case "+": {
          _output = (num1 + num2).toString();
        }
        break;

        case "-": {
          _output = (num1 - num2).toString();
        }
        break;

        case "X": {
          _output = (num1 * num2).toString();
        }
        break;

        case "/": {
          _output = (num1 / num2).toString();
        }
        break;

        default: {
        }
        break;
      }

      num1 = 0;
      num2 = 0;
      operand = "";

    }
    else {
      _output = _output + buttonText;
    }

    print(_output);

    setState(() {
      current = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildbutton(String buttonText) {
      return new Expanded(
        child: new OutlineButton(
          padding: new EdgeInsets.all(20),
          child: new Text(buttonText,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () => buttonPressed(buttonText)
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        child: new Column(
          children: <Widget>[
            new Container(
              alignment: Alignment.centerRight,
              padding: new EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 12
              ),
              child: new Text(
                current,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold
                ),

              )
            ),
            new Expanded(
              child: new Divider(),
            ),
            new Column(children: [
              new Row(children: [
                buildbutton("7"),
                buildbutton("8"),
                buildbutton("9"),
                buildbutton("/"),
              ]),
              new Row(children: [
                buildbutton("4"),
                buildbutton("5"),
                buildbutton("6"),
                buildbutton("X"),
              ]),
              new Row(children: [
                buildbutton("1"),
                buildbutton("2"),
                buildbutton("3"),
                buildbutton("-"),
              ]),
              new Row(children: [
                buildbutton("."),
                buildbutton("0"),
                buildbutton("00"),
                buildbutton("+"),
              ]),
              new Row(children: [
                buildbutton("Clear"),
                buildbutton("=")
              ])
            ])
          ],
        )
      ),
    );
  }
}
