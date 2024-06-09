// import 'package:flutter/material.dart';
// import 'package:weather_api_app/weather_model.dart';
// import 'package:weather_api_app/weather_api_services.dart';
//
// class WeatherScreen extends StatefulWidget {
//   const WeatherScreen({super.key});
//
//   @override
//   State<WeatherScreen> createState() => _WeatherScreenState();
// }
//
// class _WeatherScreenState extends State<WeatherScreen> {
//   String weatherApiKey = 'be070af185d445a4b7785440240806';
//   late Future<WeatherCurrentModel> _weatherFuture;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _weatherFuture = _fetchWeatherData();
//   }
//
//   Future<WeatherCurrentModel> _fetchWeatherData() async {
//     var apiKey = WeatherApiServices(weatherApiKey);
//     return apiKey.weatherGetData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Items Screen",
//           style: TextStyle(fontSize: 20, color: Colors.white),
//         ),
//         backgroundColor: Colors.lightGreen,
//       ),
//       backgroundColor: Colors.white,
//       body: FutureBuilder<WeatherCurrentModel>(
//         future: _weatherFuture,
//         builder: (_, snapshot) {
//          if (snapshot.hasData) {
//             var weatherData = snapshot.data!;
//             return RefreshIndicator(
//               onRefresh: _refresh,
//               child: ListView(
//                 children: [
//                   ListTile(
//                     title: Text('Temperature: ${weatherData.current.tempC}°C'),
//                   ),
//                   ListTile(
//                     title: Text('Condition: ${weatherData.current.condition.text}'),
//                   ),
//                   ListTile(
//                     title: Text('Condition: ${weatherData.current.uv}'),
//                   ),
//
//                 ],
//               ),
//             );
//           } else {
//             return const Center(
//               child: Text('No data available'),
//             );
//           }
//         },
//       ),
//     );
//   }
//
//   Future<void> _refresh() async {
//     setState(() {
//       _weatherFuture = _fetchWeatherData();
//     });
//   }
// }











// import 'package:flutter/material.dart';
//
// import 'apiservicecs.dart';
//
// class ViewDataWetherApi extends StatelessWidget {
//   const ViewDataWetherApi({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: FutureBuilder<Map<String, dynamic>>(
//           future: ApiService().getWeatherData(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               // If we have data, display it
//               Map<String, dynamic> weatherData = snapshot.data!;
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text(
//                       "${weatherData.}"
//                   ),
//                   Text(
//                     'Condition: ${weatherData['current']['condition']['text']}',
//                     style: TextStyle(fontSize: 20),
//                   ),
//                   // Text("${weatherData[]}")
//                 ],
//               );
//             } else if (snapshot.hasError) {
//               // If there's an error, display it
//               return Text("${snapshot.error}");
//             }
//
//             // By default, show a loading spinner
//             return CircularProgressIndicator();
//           },
//         ),
//       ),
//     );
//   }
// }














import 'package:flutter/material.dart';
import 'package:weather_api_app/weather_api_services.dart';
import 'package:weather_api_app/weather_model.dart';


class TimezoneViewScreen extends StatefulWidget {
  const TimezoneViewScreen({super.key});

  @override
  State<TimezoneViewScreen> createState() => _TimezoneViewScreenState();
}

class _TimezoneViewScreenState extends State<TimezoneViewScreen> {
  final TextEditingController _searchController = TextEditingController();
  late Future<TimezoneModal> _futuresearch;

  @override
  void initState() {
    super.initState();
    _futuresearch = _searchBooks("");
  }
  Future<TimezoneModal> _searchBooks(String query) async {
    return WeatherApiClass().getMarineVeiw(query);
  }
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          elevation: 50,
          backgroundColor: Colors.lightBlueAccent,
          title: const Text("COUNTRY TIME ZON"),


        ),
        body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                child: TextFormField(
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {
                      _futuresearch = value.isNotEmpty
                          ? WeatherApiClass().getMarineVeiw(value)
                          : Future.value(); // Empty data if search is empty
                    });

                  },
                  decoration: InputDecoration(
                    hintText: "Search..",
                    filled: true,
                    fillColor: Colors.black12,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    prefixIcon: IconButton(
                      onPressed: () {

                        // Navigator.push(context, MaterialPageRoute(builder: (context) => Astronomy_Screen(),));
                      },
                      icon: const Icon(Icons.search),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              FutureBuilder(future: _futuresearch, builder: (context, snapshot) {
                var viewdata=snapshot.data?.location;
                return
                  Center(
                    child: SizedBox(
                      width: 250,
                      height: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10,),

                          Text("Name:-${viewdata?.name??""}"),
                          Text("Region:-${viewdata?.region??""}"),
                          Text("Country:-${viewdata?.country??""}"),
                          Text("Lat:-${viewdata?.lat??""}"),
                          Text("Lon:-${viewdata?.lon??""}"),
                          Text("TzId:-${viewdata?.tzId??""}"),
                          Text("LocaltimeEpoch:-${viewdata?.localtimeEpoch??""}"),
                          Text("Localtime:-${viewdata?.localtime??""}"),

                        ],
                      ),
                    ),
                  );
                },),
            ],
            ),
        );
    }
}