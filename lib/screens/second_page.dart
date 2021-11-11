import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_json.dart';
import 'package:recipe_app/screens/ingredient_screen.dart';

class SecondPage extends StatefulWidget {
  Welcome welcome;
  String appBarTitle;
  SecondPage({Key? key, required this.welcome, required this.appBarTitle})
      : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late Future<String> data;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Recipes on ${widget.appBarTitle}",
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
          itemCount: widget.welcome.hits.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
              child: Card(
                child: ListTile(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => IngredientScreen(
                                  recipe: widget.welcome.hits[index].recipe,
                                )),
                        (route) => true);
                  },
                  title: Text(widget.welcome.hits[index].recipe.label),
                  subtitle: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: dietChipCreator(
                        widget.welcome.hits[index].recipe.dietLabels +
                            widget.welcome.hits[index].recipe.mealType),
                  ),
                  trailing:
                      Image.network(widget.welcome.hits[index].recipe.image),
                ),
              ),
            );
          }),
    );
  }

  Row dietChipCreator(List<String> dietList) {
    if (dietList.isEmpty) return Row();

    return Row(
        children: dietList
            .map<Widget>((diet) => Chip(
                  label: Text(
                    diet,
                    style: const TextStyle(fontSize: 10),
                  ),
                  backgroundColor: Colors.amber[50],
                ))
            .toList());
  }
}
