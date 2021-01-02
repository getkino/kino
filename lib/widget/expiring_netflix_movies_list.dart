import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kino/model/expiring_netflix_movies.dart';

class ExpiringNetflixMoviesList extends StatelessWidget {
  final ExpiringNetflixMovies expiringMovies;

  ExpiringNetflixMoviesList({Key key, this.expiringMovies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expiringMovies.total,
      itemBuilder: (context, index) {
        final item = expiringMovies.results[index];

        return ListTile(
          title: Text(
            item.title,
            style: Theme.of(context).textTheme.headline5,
          ),
          subtitle: Text(
            item.expiredate,
            style: Theme.of(context).textTheme.headline5,
          ),
        );
      },
    );
  }
}
