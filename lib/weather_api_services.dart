// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:weather_api_app/weather_model.dart';
//
// class WeatherApiServices {
//
//   final String apiKey;
//
//   WeatherApiServices(this.apiKey);
//
//   Future<WeatherCurrentModel> weatherGetData() async {
//     var baseurl = 'http://api.weatherapi.com/v1';
//     var endpoint = '/current.json';
//
//     var url = Uri.parse("$baseurl$endpoint?key=$apiKey");
//     var response = await http.get(url);
//
//     if (response.statusCode == 200) {
//
//       print("success");
//       var responseData = jsonDecode(response.body);
//       var data = WeatherCurrentModel.fromJson(responseData);
//       return data;
//     } else {
//
//       print("not success");
//       throw Exception('Failed to load weather data');
//     }
//   }
// }



// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:untitled4/wether_model.dart';
//
// class ApiService {
//   // API key
//   final String apiKey = "1777929741cd47b798e84554240806";
//
//   // City ID for Berlin
//   final String cityId = "2801268";
//
//
//   final String apiUrl =
//       "http://api.weatherapi.com/v1/current.json?key=$apiKey&q=id:$cityId";
//
//   // Function to fetch weather data
//   Future<Current> getWeatherData() async {
//     final response = await http.get(Uri.parse(apiUrl));
//
//     if (response.statusCode == 200) {
//       // If the call to the server was successful, parse the JSON
//       Map<String, dynamic> jsonData = json.decode(response.body);
//       return Current.fromJson(jsonData);
//     } else {
//       // If that call was not successful, throw an error.
//       throw Exception('Failed to load weather data');
//     }
//   }
// }




















import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:weather_api_app/weather_model.dart';

class WeatherApiClass {

  Future<TimezoneModal> getMarineVeiw(String city) async {
    const String apiKey = '7c59607231fd4a65ba084531240806';
    var url = Uri.parse(
        'http://api.weatherapi.com/v1/marine.json?key=$apiKey&q=$city');
    var respons = await http.get(url);
    if (respons.statusCode == 200) {
      var decode = jsonDecode(respons.body);
      var data = TimezoneModal.fromJson(decode);
      return data;
    }
    else {
      return TimezoneModal();
    }
  }
}

