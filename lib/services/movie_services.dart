import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class MovieServices {
  static final MovieServices _instance = new MovieServices.internal();

  factory MovieServices() => _instance;

  MovieServices.internal();


}