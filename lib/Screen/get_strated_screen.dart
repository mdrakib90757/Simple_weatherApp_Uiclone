import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp_uiclone/Provider/theme_provider.dart';
import 'package:weatherapp_uiclone/Screen/home_screen.dart';
import 'package:weatherapp_uiclone/Widgets/custom_navigationbar.dart';

class GetStratedScreen extends StatefulWidget {
  const GetStratedScreen({super.key});

  @override
  State<GetStratedScreen> createState() => _GetStratedScreenState();
}

class _GetStratedScreenState extends State<GetStratedScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider=Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor:Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(onPressed: () {
                  themeProvider.toggleTheme();
                }, icon: Icon(themeProvider.isDarkMode ? Icons.light_mode:Icons.dark_mode)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 100,horizontal: 20),
              child: Container(
                height: 300,
                width: 400,
                decoration: BoxDecoration(
                    shape:BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white.withOpacity(0.1),
                          spreadRadius: 40,
                          blurRadius:70,
                          offset: Offset(10,10)
                      )
                    ]
                ),
                child: Image.asset("assets/image/weather-app.png",
                  height: 150,width: 150,),
              ),
            ),
            Text("Daily",style: TextStyle(
                color:Theme.of(context).textTheme.bodyLarge!.color,
                fontSize: 32,
                fontWeight: FontWeight.bold
            ),),
            Text("Weather",style: TextStyle(
                color:Theme.of(context).textTheme.bodyLarge!.color,
                fontSize: 32,
                fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 8,),
            Text("Get to know your weather maps",style: TextStyle(
                color:Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.6),
              fontSize: 16
            ),),
            Text("maps add radar precipitation",style: TextStyle(
                color:Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.6),
                fontSize: 16
            ),),
            Text("forecast",style: TextStyle(
                color:Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.6),
                fontSize: 16
            ),),
            SizedBox(height: 50,),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CustomNavigationbar(),));
              },
              child: Container(
                height: 60,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.blue.shade400,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.1),
                      spreadRadius: 8,
                      blurRadius: 8,
                      offset: Offset(0, 0)
                    )
                  ]
                ),
                child:Center(
                  child: Text("Get Started",style: TextStyle(
                      color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ) ,
                  ),
                )),
            ),

          ],
        ),
      )
    );
  }
}
