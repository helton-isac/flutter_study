import 'package:flutter/material.dart';
import 'package:flutter_study/addLanguage.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        "/": (context) => MyHomePage(),
        "/add": (context) => AddLanguage()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<bool> selects = [false, false, false, false, false, false];
  List<String> labels = [
    "Android Nativo",
    "iOS Nativo",
    "Flutter",
    "React Native",
    "PWA",
    "Ionic"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minhas Linguagens"),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: _goToNewLanguage)
        ],
      ),
      body: Column(
        children: <Widget>[
          Wrap(
            spacing: 10,
            children: <Widget>[
              buildItemWrap(0),
              buildItemWrap(1),
              buildItemWrap(2),
              buildItemWrap(3),
              buildItemWrap(4),
              buildItemWrap(5),
            ],
          ),
          Expanded(
            child: ListView(children: buildListItens()),
          ),
        ],
      ),
    );
  }

  void _goToNewLanguage() {
    Navigator.pushNamed(context, "/add");
  }

  ChoiceChip buildItemWrap(int index) => ChoiceChip(
        label: Text(labels[index]),
        selected: selects[index],
        onSelected: (value) {
          setState(() {
            selects[index] = value;
          });
        },
      );

  Widget getNativeAndroidOption = Card(
    child: ListTile(
      leading: Icon(Icons.android),
      title: Text('Android Nativo'),
      subtitle: Text('Linguagens C, Java e Kotlin'),
    ),
  );

  Widget getNativeiOSOption = Card(
    child: ListTile(
      leading: SvgPicture.asset("images/apple.svg"),
      title: Text('iOS Nativo'),
      subtitle: Text('Linguagens Swift e Objective-C'),
    ),
  );

  Widget getFlutterOption = Card(
    child: ListTile(
      leading: FlutterLogo(),
      title: Text('Flutter'),
      subtitle: Text('Linguagem DART'),
    ),
  );

  Widget getReactNativeOption = Card(
    child: ListTile(
      leading: SvgPicture.asset("images/react.svg"),
      title: Text('React Native'),
      subtitle: Text('Linguagens stack-web'),
    ),
  );

  Widget getIonicOption = Card(
    child: ListTile(
      leading: Icon(Icons.blur_circular),
      title: Text('Ionic'),
      subtitle: Text('Linguagens JavaScipt e TypeScript'),
    ),
  );

  Widget getPwaOption = Card(
    child: ListTile(
      leading: Icon(Icons.blur_circular),
      title: Text('PWA'),
      subtitle: Text('Linguagens stack-web'),
    ),
  );

  List<Widget> buildListItens() {
    return [
      if (selects[0]) getNativeAndroidOption,
      if (selects[1]) getNativeiOSOption,
      if (selects[2]) getFlutterOption,
      if (selects[3]) getReactNativeOption,
      if (selects[4]) getPwaOption,
      if (selects[5]) getIonicOption
    ];
  }
}
