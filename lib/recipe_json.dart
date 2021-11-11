import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

Map<String, dynamic> nullMap = {'null': 'null'};

class Welcome {
  Welcome({
    required this.from,
    required this.to,
    required this.count,
    required this.links,
    required this.hits,
  });

  int from;
  int to;
  int count;
  Links links;
  List<Hit> hits;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        from: json["from"],
        to: json["to"],
        count: json["count"],
        links: Links.fromJson(json["_links"]),
        hits: List<Hit>.from(json["hits"].map((x) => Hit.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
        "count": count,
        "_links": links.toJson(),
        "hits": List<dynamic>.from(hits.map((x) => x.toJson())),
      };
}

class Hit {
  Hit({
    required this.recipe,
    required this.links,
  });

  Recipe recipe;
  Links links;

  factory Hit.fromJson(Map<String, dynamic> json) => Hit(
        recipe: Recipe.fromJson(json["recipe"]),
        links: Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "recipe": recipe.toJson(),
        "_links": links.toJson(),
      };
}

class Links {
  Links({
    required this.self,
    required this.next,
  });

  Next self;
  Next next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: Next.fromJson(json["self"] ?? nullMap),
        next: Next.fromJson(json["next"] ?? nullMap),
      );

  Map<String, dynamic> toJson() => {
        "self": self.toJson(),
        "next": next.toJson(),
      };
}

class Next {
  Next({
    required this.href,
    required this.title,
  });

  String href;
  String title;

  factory Next.fromJson(Map<String, dynamic> json) => Next(
        href: json["href"] ?? "null",
        title: json["title"] ?? "null",
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "title": title,
      };
}

class Recipe {
  Recipe({
    required this.uri,
    required this.label,
    required this.image,
    required this.source,
    required this.url,
    required this.shareAs,
    required this.recipeYield,
    required this.dietLabels,
    required this.healthLabels,
    required this.cautions,
    required this.ingredientLines,
    required this.ingredients,
    required this.calories,
    required this.totalWeight,
    required this.cuisineType,
    required this.mealType,
    required this.dishType,
  });

  String uri;
  String label;
  String image;
  String source;
  String url;
  String shareAs;
  double recipeYield;
  List<String> dietLabels;
  List<String> healthLabels;
  List<String> cautions;
  List<String> ingredientLines;
  List<Ingredient> ingredients;
  double calories;
  double totalWeight;
  List<String> cuisineType;
  List<String> mealType;
  List<String> dishType;

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        uri: json["uri"],
        label: json["label"],
        image: json["image"],
        source: json["source"],
        url: json["url"],
        shareAs: json["shareAs"],
        recipeYield: json["yield"],
        dietLabels: List<String>.from(json["dietLabels"].map((x) => x)),
        healthLabels: List<String>.from(json["healthLabels"].map((x) => x)),
        cautions: List<String>.from(json["cautions"].map((x) => x)),
        ingredientLines:
            List<String>.from(json["ingredientLines"].map((x) => x)),
        ingredients: List<Ingredient>.from(
            json["ingredients"].map((x) => Ingredient.fromJson(x))),
        calories: json["calories"],
        totalWeight: json["totalWeight"],
        cuisineType: List<String>.from(json["cuisineType"].map((x) => x)),
        mealType: List<String>.from(json["mealType"].map((x) => x)),
        dishType: List<String>.from(json["dishType"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "uri": uri,
        "label": label,
        "image": image,
        "source": source,
        "url": url,
        "shareAs": shareAs,
        "yield": recipeYield,
        "dietLabels": List<dynamic>.from(dietLabels.map((x) => x)),
        "healthLabels": List<dynamic>.from(healthLabels.map((x) => x)),
        "cautions": List<dynamic>.from(cautions.map((x) => x)),
        "ingredientLines": List<dynamic>.from(ingredientLines.map((x) => x)),
        "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
        "calories": calories,
        "totalWeight": totalWeight,
        "cuisineType": List<dynamic>.from(cuisineType.map((x) => x)),
        "mealType": List<dynamic>.from(mealType.map((x) => x)),
        "dishType": List<dynamic>.from(dishType.map((x) => x)),
      };
}

class Ingredient {
  Ingredient({
    required this.text,
    required this.quantity,
    required this.measure,
    required this.food,
    required this.weight,
    required this.foodId,
  });

  String text;
  double quantity;
  String measure;
  String food;
  double weight;
  String foodId;

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        text: json["text"],
        quantity: json["quantity"],
        measure: json["measure"] ?? "null",
        food: json["food"],
        weight: json["weight"],
        foodId: json["foodId"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "quantity": quantity,
        "measure": measure,
        "food": food,
        "weight": weight,
        "foodId": foodId,
      };
}
