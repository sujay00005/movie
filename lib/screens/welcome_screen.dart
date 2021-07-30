import 'package:flutter/material.dart';
import 'package:movie/screens/about_screen.dart';
import 'package:movie/networking.dart';
import 'package:movie/screens/registration_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  //static String id = 'welcome_screen';
  const WelcomeScreen({required this.prefs});
  final SharedPreferences prefs;

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  var name;
  var posterUrl;
  var genre;
  var director;
  var starring;
  var playTime;
  var language;
  var views;
  var votes;

  var data;

  void getData() async {
    data = await NetworkHelper().postData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        //removing local data on logout
        backgroundColor: Colors.green,
        child: Icon(Icons.logout),
        onPressed: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.remove('email');
          prefs.remove('password');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return RegistrationScreen(prefs: widget.prefs);
              },
            ),
          );
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Movie'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return AboutScreen();
                }),
              );
            },
            icon: Icon(Icons.info_outline),
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          name = data['result'][index]['title'];
          posterUrl = data['result'][index]['poster'];
          genre = data['result'][index]['genre'];
          director = data['result'][index]['director'][0];
          starring = data['result'][index]['stars'][0];
          playTime = data['result'][index]['runTime'];
          language = data['result'][index]['language'];
          views = data['result'][index]['pageViews'];
          votes = data['results'][index]['voting'];

          return Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    posterUrl,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
                    TextLine(
                      category: 'Genere',
                      text: genre,
                    ),
                    TextLine(category: 'Director', text: director),
                    TextLine(category: 'Starring', text: starring),
                    Row(
                      children: [
                        Text('$playTime'),
                        Divider(
                          height: 3.0,
                        ),
                        Text('$language'),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '$views views',
                          style: TextStyle(color: Colors.lightBlue),
                        ),
                        Divider(
                          height: 3.0,
                        ),
                        Text(
                          'Voted by $votes People',
                          style: TextStyle(color: Colors.lightBlue),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: 4,
      ),
    );
  }
}

class TextLine extends StatelessWidget {
  const TextLine({
    Key? key,
    required this.category,
    required this.text,
  }) : super(key: key);

  final String category;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$category',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
        Row(
          children: [
            Text(
              'Genre: ',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            Text(
              '$text',
            ),
          ],
        )
      ],
    );
  }
}
