import 'package:AnimeGo/core/Util.dart';
import 'package:AnimeGo/ui/page/Favourite.dart';
import 'package:AnimeGo/ui/page/History.dart';
import 'package:AnimeGo/ui/page/Movie.dart';
import 'package:AnimeGo/ui/page/PopularAnime.dart';
import 'package:AnimeGo/ui/page/SeasonalAnime.dart';
import 'package:AnimeGo/ui/page/Settings.dart';
import 'package:AnimeGo/ui/widget/GenreList.dart';
import 'package:flutter/material.dart';

/// AnimeDrawer class
class AnimeDrawer extends StatelessWidget {
  AnimeDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool darkMode = Util(context).isDarkMode();

    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'AnimeGo Re',
                style: TextStyle(
                  fontSize: 32, 
                  // Different colour for dark mode
                  color: darkMode ? Colors.orange : Colors.white, 
                  fontWeight: FontWeight.w700
                ),
              ),
            ),
            decoration: BoxDecoration(
              // Use black instead orange to not hurt users' eyes at night
              color: darkMode ? Colors.black38 : Colors.deepOrange,
            ),
          ),
          Expanded(
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView(
                children: <Widget>[
                  ListTile(
                    title: Text('Seasonal'),
                    leading: Icon(Icons.fiber_new),
                    onTap: () => this.push(context, SeasonalAnime())
                  ),
                  ListTile(
                    title: Text('Movie'),
                    leading: Icon(Icons.movie),
                    onTap: () => this.push(context, Movie())
                  ),
                  ListTile(
                    title: Text('Popular'),
                    leading: Icon(Icons.label),
                    onTap: () => this.push(context, PopularAnime())
                  ),
                  ExpansionTile(
                    title: Text('Genre'),
                    leading: Icon(Icons.list),
                    children: <Widget>[
                      GenreList()
                    ],
                  ),
                  Divider(),
                  ListTile(
                    title: Text('History'),
                    leading: Icon(Icons.history),
                    onTap: () => this.push(context, History())
                  ),
                  ListTile(
                    title: Text('Favourite'),
                    leading: Icon(Icons.favorite),
                    onTap: () => this.push(context, Favourite())
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Settings'),
                    leading: Icon(Icons.settings),
                    onTap: () => this.push(context, Settings())
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Push to new screen and also remove all routes in the middle
  void push(BuildContext context, Widget screen) {
    // Pop the drawer
    Navigator.pop(context);
    // How to push to new screen?
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}
