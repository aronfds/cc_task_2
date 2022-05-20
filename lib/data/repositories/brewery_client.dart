
import 'dart:convert';

import 'package:brewery/data/models/breweryModel.dart';
import 'package:http/http.dart' as http;


//https://api.openbrewerydb.org/breweries/ Base URL
//dev: flutter run --flavor dev --dart-define=BASE_URL=https://api.openbrewerydb.org/breweries/
//prod: flutter run --flavor prod --dart-define=BASE_URL=https://api.openbrewerydb.org/breweries/

class BreweryClient {
  BreweryClient({
    http.Client? httpClient,
  }) : this.httpClient = httpClient ?? http.Client();

  static const baseUrl = String.fromEnvironment('BASE_URL');
  final http.Client httpClient;

  Future<SearchResult> search(String term) async {
    final response = await httpClient.get(Uri.parse("$baseUrl" + "autocomplete?query=$term"));
    final results = json.decode(response.body);
    if (response.statusCode == 200) {
      return SearchResult.fromJson(results);
    } else {
      throw SearchResultError.fromJson(results);
    }
  }

  Future<dynamic> breweryDetails(String id) async {
    final response = await httpClient.get(Uri.parse("$baseUrl$id"));
    final results = json.decode(response.body);
    if (response.statusCode == 200) {
      return results;
    } else {
      throw SearchResultError.fromJson(results);
    }
  }
}