import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe_app/recipe_json.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/screens/not_found.dart';
import 'package:recipe_app/screens/second_page.dart';

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
      title: 'Recipe App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'Recipe App'),
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
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 16.0),
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
                      hintText: "Enter the ingredient",
                      suffixIcon: IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {
                            getData(ingredientController.text);
                          }))),
            ),
            Text(
              "Let's Go",
              style: Theme.of(context).textTheme.headline4,
            ),
            IconButton(
              icon: const Icon(Icons.search),
              iconSize: 50,
              color: Colors.amber,
              splashColor: Colors.amber,
              onPressed: () {
                getData(ingredientController.text);
              },
            ),
          ],
        ),
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
    return "https://api.edamam.com/api/recipes/v2?type=public&q=$ing&app_id=$YOUR_APP_ID&app_key=$YOUR_APP_KEY";
  }
}
