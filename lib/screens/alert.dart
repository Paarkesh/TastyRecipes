import 'package:flutter/material.dart';
class SixthRoute extends StatefulWidget {
  const SixthRoute({Key? key}) : super(key: key);
   @override
  _SixthRouteState createState() => _SixthRouteState();

}


class _SixthRouteState extends State<SixthRoute> {
@override
Widget build(BuildContext context) {
	return Scaffold(
	appBar: AppBar(
		title: const Text("Alert Box",style: TextStyle(color: Colors.white),),
		backgroundColor: Colors.amber,
	),
	// ignore: avoid_unnecessary_containers
	body: Container(
		child: Center(
		child: ElevatedButton(
			onPressed: () {
			showDialog(
				context: context,
				builder: (ctx) => AlertDialog(
				title: const Text("Hey!!"),
				content: const Text("You are now using the Fooder App"),
				actions: <Widget>[
					TextButton(
					onPressed: () {
						Navigator.of(ctx).pop();
					},
					child: Container(
						color: Colors.amber,
						padding: const EdgeInsets.all(14),
						child: const Text("Okay",style: TextStyle(color: Colors.black),),
					),
					),
				],
				),
			);
			},
			child: const Text("Click Me!!!"),
		),


		),
	),
	);
}
}
