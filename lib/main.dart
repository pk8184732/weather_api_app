// import 'package:flutter/material.dart';
// import 'package:weather_api_app/weather_screen.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return  MaterialApp(
//      debugShowCheckedModeBanner: false,
//       home: WeatherScreen(),
//     );
//   }
// }






import 'package:flutter/material.dart';
import 'package:weather_api_app/weather_screen.dart';
void main(){
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home:TimezoneViewScreen(),
        );
    }
}
