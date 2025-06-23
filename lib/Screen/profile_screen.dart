import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../Provider/theme_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvide=Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actionsPadding: EdgeInsets.symmetric(horizontal: 10),
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.1),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(0,0)
                  )
                ]
            ),
            child: Icon(Icons.menu,color: Theme.of(context).textTheme.bodyLarge!.color,size: 28,),
          ),
        ),
        actions: [
          Row(
            children: [
              FaIcon(FontAwesomeIcons.locationDot, color: Colors.lightBlue),
              SizedBox(width: 10,),
              Text("Florida, USA",style: TextStyle(
                  color:Theme.of(context).textTheme.bodyLarge!.color,
                  fontSize: 15,
                  fontWeight: FontWeight.w600
              ),),
              SizedBox(width: 10,),
              Container(
                width: 30,
                height: 40,
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.1),
                          spreadRadius: 3,
                          blurRadius: 3,
                          offset: Offset(0,0)
                      )
                    ]
                ),
                child: Icon(Icons.keyboard_arrow_down_rounded,color: Theme.of(context).textTheme.bodyLarge!.color,),
              ),
              IconButton(onPressed: () {
                themeProvide.toggleTheme();
              }, icon: Icon(themeProvide.isDarkMode ? Icons.light_mode:Icons.dark_mode))


            ],
          )
        ],
      ),
      body: Center(
        child: Text("Profile_Screen",style: TextStyle(
          color:Theme.of(context).textTheme.bodyLarge!.color,
        ),),
      ),
    );
  }
}
