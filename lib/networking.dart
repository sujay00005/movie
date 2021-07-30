import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  dynamic postData() async {
    //?category=movie&language=hindi&genre=all&sort=voting
    var url = Uri.parse('https://hoblist.com/movieList');
    var response = await http.post(url, body: {
      'category': 'movies',
      'language': 'kannada',
      'genre': 'all',
      'sort': 'voting'
    });

    try {
      if (response.statusCode == 200) {
        var body = response.body;
        var data = jsonDecode(response.body);
        print(data);

        return data;
      } else {
        print(response.statusCode);
      }
    } catch (error) {
      print(error);
    }
  }
}
