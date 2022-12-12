import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EighthRoute extends StatefulWidget {
  const EighthRoute({Key? key}) : super(key: key);
  @override
  _EighthRouteState createState() => _EighthRouteState();
}

//   ThemeData _darkTheme = ThemeData(
//               accentColor: Colors.red,
//               brightness: Brightness.dark,
//               primaryColor: Colors.amber,

//             );

//             ThemeData _lightTheme = ThemeData(
//               accentColor: Colors.pink,
//               brightness: Brightness.light,
//               primaryColor: Colors.blue
//             );

// bool _light = true;

// class _EighthRouteState extends State<EighthRoute> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // theme:_light ? _lightTheme:_darkTheme,
//       appBar: AppBar(

//         title: const Text(
//           "Themes",
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.amber,
//       ), // AppBar
//       body: Center(
//         child: Switch(
//             value: _light,
//             onChanged: (state) {
//               setState(() {
//                 _light = state;
//               });
//             }),
//       ), // Center
//     ); // Scaffold
//   }
// }

class _EighthRouteState extends State<EighthRoute> {
  bool _lightIsOn = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: _lightIsOn ? ThemeData.dark() : ThemeData.light(),
        home: Scaffold(
            appBar: AppBar(
              title: Text('Themes', style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.amber,
            ),
            body: Column(children: <Widget>[
              Container(
                margin: EdgeInsets.all(20),
                height: 200,
                width: 400,
                child: Image.asset('assets/images/logo-color.png'),
              ),
              Divider(
                color: Colors.black,
                thickness: 2,
              ),
              Container(
// alignment: FractionalOffset.center,
                child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
// Toggle light when tapped.
                          _lightIsOn = !_lightIsOn;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.8, 10, 1, 6),
                        width: 40, height: 40,
                        padding: const EdgeInsets.all(0),
// Change button text when light changes state.
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.amber,
                        ),
                        child: Icon(
                            _lightIsOn
                                ? Icons.light_mode_outlined
                                : Icons.dark_mode_outlined,
                            color: Colors.black,
                            size: 40),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                  'In publishing and graphic design, '
                  'Lorem ipsum is a placeholder text commonly used to demonstrate '
                  'the visual form of a document or a typeface without relying on '
                  'meaningful content. Lorem ipsum may be used as a placeholder '
                  'before final copy is available.',
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: GoogleFonts.notoSerif(
                    textStyle: TextStyle(
                        color: _lightIsOn ? Colors.white : Colors.black,
                        fontSize: 20),
                  )),
            ])));
  }
}
