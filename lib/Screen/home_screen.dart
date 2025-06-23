import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp_uiclone/Provider/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 final List<Map<String,dynamic>> WaetherList=[
   {
     "image":"assets/image/rain.png",
     "title":"90%",
     "subtitle":"Rain"
   },
   {
     "image":"assets/image/wind.png",
     "title":"7Km/h",
     "subtitle":"Wind"
   },
   {
     "image":"assets/image/Jun_21__2025__07_20_51_AM-removebg-preview.png",
     "title":"21%",
     "subtitle":"Humidity"
   },
 ];
  @override
  Widget build(BuildContext context) {
    final themeProvide=Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("About Today",style: TextStyle(
                color:Theme.of(context).textTheme.bodyLarge!.color,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),),
              SizedBox(height: 17,),
              Container(
                height: 290,
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
                child: Image.asset("assets/image/raining.png",
                  height: 150,width: 150,),
              ),
              SizedBox(height: 13,),
              Center(
                child: Text("Wednesday, 25 May",style: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge!.color?.withOpacity(0.8),
                  fontSize: 20,
                ),),
              ),
              SizedBox(height: 8,),
              Center(
                child: Text("19°",style: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                  fontWeight: FontWeight.bold,
                  fontSize: 100
                ),),
              ),
              SizedBox(height: 8,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                       childAspectRatio: 0.7
                      ),
                      shrinkWrap: true,
                      itemCount: WaetherList.length,
                      itemBuilder: (context, index){
                        final data=WaetherList[index];
                      return Container(
                        margin:EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: themeProvide.isDarkMode ? Color(0xFF222446):Theme.of(context).scaffoldBackgroundColor,
                         // color: Theme.of(context).scaffoldBackgroundColor,
                          //color: Color(0xFF222446),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color(0xFF0E1330))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(data["image"]),
                              Text(data["title"],style: TextStyle(
                                color: Theme.of(context).textTheme.bodyLarge!.color,
                                fontSize: 18
                              ),),
                              SizedBox(height: 5,),
                              Text(data["subtitle"],style: TextStyle(
                                  color:Theme.of(context).textTheme.bodyLarge!.color,
                                fontSize: 18
                              ),)
                            ],
                          ),
                        ),
                      );
                    },),
                  ),
                ],
              )
            ],
          ),
        ),
      ),


    );
  }
}
