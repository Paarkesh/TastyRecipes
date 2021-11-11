import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

import '../recipe_json.dart';

class IngredientScreen extends StatefulWidget {
  Recipe recipe;

  IngredientScreen({Key? key, required this.recipe}) : super(key: key);

  @override
  _IngredientScreenState createState() => _IngredientScreenState();
}

class _IngredientScreenState extends State<IngredientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          widget.recipe.label,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(widget.recipe.image), fit: BoxFit.cover)),
        child: Column(
          children: [
            BackdropFilter(
                child: AlertDialog(
                  content: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Ingredients of this recipe: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                            children: widget.recipe.ingredientLines
                                .map<Widget>((ing) => Row(children: [
                                      Flexible(
                                          child: Text(
                                        " - " + ing,
                                        style: const TextStyle(fontSize: 16),
                                      )),
                                    ]))
                                .toList()),
                      ),
                      Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                                "So, what say? Do you want to check out the full recipe?"),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FloatingActionButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(
                                    Icons.close,
                                    color: Colors.amber,
                                  ),
                                  backgroundColor: Colors.white,
                                ),
                                FloatingActionButton(
                                  backgroundColor: Colors.amber[50],
                                  onPressed: () {
                                    Share.share(
                                        'Hey! Check ${widget.recipe.label} out for ${widget.recipe.mealType.join(", ")}!\n\n${widget.recipe.url}');
                                  },
                                  child: const Icon(
                                    Icons.share,
                                    color: Colors.amber,
                                  ),
                                ),
                                FloatingActionButton.extended(
                                    onPressed: () {
                                      launchURL(widget.recipe.url);
                                    },
                                    label: Row(
                                      children: const [
                                        Text(
                                          "Go",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Icon(
                                          Icons.open_in_new,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                    icon: Container())
                              ])
                        ],
                      )
                    ],
                  ),
                ),
                filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6)),
          ],
        ),
      ),
    );
  }

  void launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}
