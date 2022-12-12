import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe_app/recipe_json.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/screens/not_found.dart';
import 'package:recipe_app/screens/second_page.dart';
import 'package:recipe_app/screens/calculator.dart';
import 'package:recipe_app/screens/geolocation.dart';
import 'package:recipe_app/screens/shapes.dart';
import 'package:recipe_app/screens/alarm.dart';
import 'package:recipe_app/screens/alert.dart';
import 'package:recipe_app/screens/accel.dart';
import 'package:recipe_app/screens/themes.dart';

import 'config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fooder App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'Fooder App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController ingredientController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
          style: GoogleFonts.sriracha(
            fontStyle: FontStyle.italic,
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 100,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.amber,
                ),
                child: Text(
                  'Miscellaneous',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            ListTile(
              // ignore: prefer_const_constructors
              leading: Icon(
                Icons.calculate,
              ),
              title: const Text('Calculator'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctxt) => const SecondRoute()),
                );
              },
            ),
            ListTile(
              // ignore: prefer_const_constructors
              leading: Icon(
                Icons.pentagon,
              ),
              title: const Text('Shapes'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctxt) => const ThirdRoute()),
                );
              },
            ),
            ListTile(
              // ignore: prefer_const_constructors
              leading: Icon(
                Icons.pin_drop,
              ),
              title: const Text('Geolocation'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctxt) => const FourthRoute()),
                );
              },
            ),
            ListTile(
              // ignore: prefer_const_constructors
              leading: Icon(
                Icons.alarm,
              ),
              title: const Text('Alarm Clock'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctxt) => const FifthRoute()),
                );
              },
            ),
            ListTile(
              // ignore: prefer_const_constructors
              leading: Icon(
                Icons.message,
              ),
              title: const Text('Alert Box'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctxt) => const SixthRoute()),
                );
              },
            ),
            ListTile(
              // ignore: prefer_const_constructors
              leading: Icon(
                Icons.speed,
              ),
              title: const Text('Accelerometer'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctxt) => const SeventhRoute()),
                );
              },
            ),
            ListTile(
              // ignore: prefer_const_constructors
              leading: Icon(
                Icons.format_paint,
              ),
              title: const Text('Themes'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctxt) => const EighthRoute()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 15.0, right: 4.0),
              child: TextFormField(
                  textInputAction: TextInputAction.go,
                  controller: ingredientController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.amber,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: "Search Recipes,Cuisines,Ingredients...",
                      suffixIcon: IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {
                            getData(ingredientController.text);
                          }))),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              // height: MediaQuery.of(context).size.height * .6,
              child: Image.asset(
                "assets/images/logo-color.png",
                height: MediaQuery.of(context).size.height * .6,
              ),
            )
          ],
        ),
        // ignore: avoid_unnecessary_containers
        //child: Image.asset("assets/images/logo-color.png"),
      ),
    );
  }

  Future<void> getData(String ing) async {
    var url = Uri.parse(makeURL(ing));

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      final parsedJson = jsonDecode(data);
      final welcome = Welcome.fromJson(parsedJson);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => SecondPage(
              welcome: welcome,
              appBarTitle: ingredientController.text,
            ),
          ),
          (route) => true);
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const NotFound()),
          (route) => true);
    }
  }

  String makeURL(String ing) {
    return "https://api.edamam.com/api/recipes/v2?type=public&q=$ing&app_id=$appId&app_key=$appKey";
  }
}
