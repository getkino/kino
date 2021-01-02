import 'package:flutter/material.dart';
import 'package:kino/api/netflix.dart';
import 'package:kino/model/expiring_netflix_movies.dart';
import 'package:kino/widget/expiring_netflix_movies_list.dart';

void main() {
  runApp(Kino());
}

class Kino extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kino',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomePage(title: 'Kino'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<ExpiringNetflixMovies>(
        //Search for Brazil
        future: NetflixApi.getExpiringMoviesByCountry(29),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData ? ExpiringNetflixMoviesList(expiringMovies: snapshot.data) : Center(child: CircularProgressIndicator());
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
