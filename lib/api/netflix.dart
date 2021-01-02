import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:kino/model/expiring_netflix_movies.dart';

const baseUrl = "https://unogsng.p.rapidapi.com";

class NetflixApi {
  static Future<ExpiringNetflixMovies> getExpiringMoviesByCountry(int countryId) async {
    var url = baseUrl + "/expiring?countrylist=$countryId";
    final response = await http.get(url, headers: {
      "x-rapidapi-key": "b6d404865amsh51e31ac82eb747bp10648cjsn84237f74068a",
      "x-rapidapi-host": "unogsng.p.rapidapi.com",
      "useQueryString": "true"
    });
    return compute(parseExpiringNetflixMovies, response.body);
  }

  static ExpiringNetflixMovies parseExpiringNetflixMovies(String responseBody) {
    final responseJson = jsonDecode(responseBody);
    return ExpiringNetflixMovies.fromJson(responseJson);
  }
}
