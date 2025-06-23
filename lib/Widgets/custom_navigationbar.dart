import 'package:flutter/material.dart';
import 'package:weatherapp_uiclone/Screen/explore_screen.dart';
import 'package:weatherapp_uiclone/Screen/home_screen.dart';
import 'package:weatherapp_uiclone/Screen/profile_screen.dart';
import 'package:weatherapp_uiclone/Screen/search_screen.dart';

class CustomNavigationbar extends StatefulWidget {
  const CustomNavigationbar({super.key});

  @override
  State<CustomNavigationbar> createState() => _CustomNavigationbarState();
}



class _CustomNavigationbarState extends State<CustomNavigationbar> {

 final List<Widget>_screen=[
   HomeScreen(),
   SearchScreen(),
   ExploreScreen(),
   ProfileScreen()
 ];

 int _currentIndex=0;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: _screen[_currentIndex],
      bottomNavigationBar:ClipRRect(
        borderRadius:BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30)
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
            onTap: (value) {
              setState(() {
                _currentIndex=value;
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            elevation: 50,
            iconSize: 35,

            items: [
          BottomNavigationBarItem(icon:Center(child: Icon(Icons.home)),label: ""),

          BottomNavigationBarItem(icon:Center(child: Icon(Icons.search)),label: ""),

          BottomNavigationBarItem(icon:Center(child: Icon(Icons.explore_outlined)),label: ""),

          BottomNavigationBarItem(icon: Center(
            child: Image.asset(
              "assets/image/profile.png",height: 40,width: 40,),
          ),label: "")
        ]),
      ),

    );
  }
}
