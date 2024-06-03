import 'package:atmakitchen/view/homeViewCustomer.dart';
import 'package:atmakitchen/view/homeViewGuest.dart';
import 'package:atmakitchen/view/profileView.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _currentIndex = 0;

  List<Widget> listWidget = [
    HomeViewGuest(),
    Center(
      child: Text("COMINGSOON"),
    ),
    Center(
      child: Text("HISTORY"),
    ),
    ProfileView(),
  ];
  Widget? routeAktif;

  @override
  void initState() {
    super.initState();
    routeAktif = listWidget[_currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(""),
          backgroundColor: Colors.transparent,
          elevation: 0, // Remove shadow
        ),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() {
            setState(() {
              _currentIndex = i;
              routeAktif = listWidget[i];
            });
          }),
          items: [
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              selectedColor: Colors.purple,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.favorite_border),
              title: Text("Comingsoon"),
              selectedColor: Colors.pink,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.search),
              title: Text("History"),
              selectedColor: Colors.orange,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile"),
              selectedColor: Colors.teal,
            ),
          ],
        ),
        body: routeAktif,
      ),
    );
  }
}
