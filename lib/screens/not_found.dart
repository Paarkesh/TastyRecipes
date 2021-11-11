import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotFound extends StatefulWidget {
  const NotFound({Key? key}) : super(key: key);

  @override
  _NotFoundState createState() => _NotFoundState();
}

class _NotFoundState extends State<NotFound> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Text(
              "Ooops! Sorry we can't find what you are searching for",
              style: GoogleFonts.gloriaHallelujah(),
            ),
          ),
          Center(child: Image.asset("assets/images/404.png")),
          Center(
            child: Text(
              "TRY AGAIN",
              style: GoogleFonts.gloriaHallelujah(),
            ),
          ),
        ],
      ),
    );
  }
}
