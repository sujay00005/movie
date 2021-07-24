import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  dynamic postData() async {
    //?category=movie&language=hindi&genre=all&sort=voting
    var url = Uri.parse('https://hoblist.com/movieList');
    var response = await http.post(url, body: {
      'category': 'movie',
      'language': 'hindi',
      'genre': 'all',
      'sort': 'voting'
    });

    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data;

        //on posting the request same data comes back i.e the parameters, so couldn't use the data form this dart file.

      } else {
        print(response.statusCode);
      }
    } catch (error) {
      print(error);
    }
  }
}
