import 'package:flutter/material.dart';

/// GenreList class
class GenreList extends StatelessWidget {
  /// The entire genre list all in one
  final genreList = ['Action', 'Adventure', 'Cars', 'Comedy', 'Dementia', 'Demons', 'Drama', 'Ecchi', 'Fantasy', 
                    'Game', 'Harem', 'Historical', 'Horror', 'Josei', 'Kids', 'Magic', 'Martial Arts', 'Mecha', 'Military', 
                    'Music', 'Mystery', 'Parody', 'Police', 'Psychological', 'Romance', 'Samurai', 'School', 'Sci-Fi', 
                    'Seinen', 'Shoujo', 'Shoujo Ai', 'Shounen', 'Shounen Ai', 'Slice of Life', 'Space', 'Sports', 'Super Power', 
                    'Supernatural', 'Thriller', 'Vampire', 'Yaoi', 'Yuri'];

  GenreList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Wrap(
          alignment: WrapAlignment.center,
          children: this.renderGenres(),
        ),
      ],
    );
  }

  /// Render all genres as chips
  List<Widget> renderGenres() {
    // Return a fixed length array (growable to be false)
    return this.genreList.map((item) => FlatButton(
        child: Text(item), 
        onPressed: () {}, 
      ),
    ).toList(growable: false);
  }
}