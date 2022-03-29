import 'package:flutter/material.dart';
import 'package:interview_task/src/screens/albums/album_screen.dart';
import 'package:interview_task/src/screens/favourites/favourites_screen.dart';
import 'package:interview_task/src/screens/photos/photos_screen.dart';
import 'package:interview_task/src/screens/posts/posts_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<BottomNavigationBarItem> bottomTabItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.file_present),
      label: 'Posts',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.album),
      label: 'Albums',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.image),
      label: 'Photos',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.star),
      label: 'Favourites',
    ),
  ];

  List<Widget> bodyWidgets = [
    PostsScreen(),
    AlbumsScreen(),
    PhotosScreen(),
    FavouriteScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyWidgets.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomTabItems,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
