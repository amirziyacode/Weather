import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/pages/search.dart';
import 'date/apiweather.dart';
import 'date/datatime.dart';
import 'date/images.dart';
import 'package:location/location.dart';
import 'pages/loading.dart';



enum Gender{
  weather,
  add,
}

class MyHomePage extends StatefulWidget {




  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  // image //
  Images images = new Images();
  // image //

  // data //
  Dateweater dateweather = Dateweater();
  // data //


   //  colors //
  Color deactivecolor = Colors.white24;
  Color active = Colors.white;
  Gender ? selected;


  Future<void> getweather_location() async{
    // location //
    Location location = new Location();
    var currentlyloc = await location.getLocation();

    var lon = currentlyloc.longitude;
    var lat = currentlyloc.latitude;
    // location //

    // weather //
    var url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid={API key}"); // need api key  Read the text below ..

    // >> How can get api
    // _ Go  to site  https://openweathermap.org/api and make a account
    // - finely get api key and past in url



    http.Response  response =  await http.get(url);
    var result =  jsonDecode(response.body);


    setState(() {
      dateweather.temp = result['main']['temp'];
      dateweather.description = result["weather"][0]['description'];
      dateweather.currently = result["weather"][0]['main'];
      dateweather.feels_like = result["main"]['feels_like'];
      dateweather.humidity = result["main"]['humidity'];
      dateweather.speed = result["wind"]['speed'];
      dateweather.name = result["name"];

      // faction ///
      if(dateweather.currently.toString() == "Clouds"){
        dateweather.icon = images.Clouds;
      }
      else if (dateweather.currently.toString() == "Clear"){
        dateweather.icon = images.Clear;
      }
      else if (dateweather.currently.toString() == "Mist"){
        dateweather.icon = images.Mist;
      }
      else if (dateweather.currently.toString() == "Haze"){
        dateweather.icon = images.Mist;
      }
      else if (dateweather.currently.toString() == "Snow"){
        dateweather.icon = images.Snow;
      }
    });
    // weather //


  }
  // getweather  and  location//

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getweather_location();
  }






  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF030615),
      body: SafeArea(
        child:dateweather.humidity != null  ? Expanded(
          child: SizedBox(
            width: we,
            height: he,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    alignment: Alignment.topCenter,
                    width: we * 0.97,
                    height: he * 0.88,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF1488CC),Color(0xFF2B32B2)],
                        begin: FractionalOffset(0.0,0.0),
                        end: FractionalOffset(0.0, 1.6),
                      )
                    ),
                    child:Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        SizedBox(
                          height: he * 0.07,
                        ),
                        Text(formattedDate.toString(),style: const TextStyle(color: Colors.white60,fontWeight: FontWeight.bold,fontSize: 20.0),),
                        SizedBox(
                          height: he * 0.02,
                        ),
                        Text(dateweather.name.toString(),style:GoogleFonts.alata(
                          fontSize: 30.0,
                          color: Colors.white,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                        )),
                        SizedBox(
                          height: he * 0.02,
                        ),

                        Expanded(child: CachedNetworkImage(imageUrl:  dateweather.icon.toString())),
                        SizedBox(
                          height: he * 0.025,
                        ),
                        Text(dateweather.currently.toString(),style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.0),),
                        SizedBox(
                          height: he * 0.02,
                        ),
                        Text(dateweather.temp.toString()+"°",style: GoogleFonts.asap( // 31°
                          color: Colors.white60,
                          fontSize: 70.0,
                          fontWeight: FontWeight.bold,
                        )),


                        SizedBox(
                          height: he * 0.03,
                        ),


                        Container(
                          // box of information //
                          width: we * 0.85,
                          height:he * 0.19,
                          margin: const EdgeInsets.only(bottom: 50.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: const Color(0xFF092B62),
                          ),
                          child: Row(


                            children: <Widget>[

                              SizedBox(
                                width: we * 0.08,
                              ),

                              // >>>  Wind >> //
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: he * 0.01,
                                  ),
                                  Text("Wind",style: GoogleFonts.alata(
                                   color: Colors.white60,
                                    fontSize: 18.0
                                  )),
                                  CachedNetworkImage(imageUrl: "https://img.icons8.com/fluency/2x/wind.png",width: we * 0.1,height: he * 0.1,),
                                  Text(dateweather.speed.toString()+"mph",style: GoogleFonts.alata(
                                      color: Colors.white,
                                      fontSize: 16.0
                                  )),

                                ],
                              ),


                              SizedBox(
                                width: we * 0.09,
                              ),


                              // >>>  Humidity >> //
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: he * 0.01,
                                  ),
                                  Text("Humidity",style: GoogleFonts.alata(
                                      color: Colors.white60,
                                      fontSize: 18.0
                                  )),
                                  SizedBox(
                                    height: he * 0.001,
                                  ),
                                  CachedNetworkImage(imageUrl:"https://img.icons8.com/fluency/2x/wet.png",width: we * 0.12,height: he * 0.1),

                                  Text(dateweather.humidity.toString() + "%",style: GoogleFonts.alata(
                                      color: Colors.white,
                                      fontSize: 16.0
                                  )),
                                ],
                              ),



                              SizedBox(
                                width: we * 0.075,
                              ),


                              // >>>  Feeling >> //
                              Column(

                                children: <Widget>[
                                  SizedBox(
                                    height: he * 0.01,
                                  ),
                                  Text("Feeling",style: GoogleFonts.alata(
                                      color: Colors.white60,
                                      fontSize: 18.0
                                  )),
                                  SizedBox(
                                    height: he * 0.001,
                                  ),
                                  CachedNetworkImage(imageUrl:"https://img.icons8.com/color/2x/temperature.png",width: we * 0.1,height: he * 0.1),
                                  Text(dateweather.feels_like.toString()+"°C",style: GoogleFonts.alata(
                                      color: Colors.white,
                                      fontSize: 16.0
                                  )),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ),
                ),
              ],
            )
          ),
        ):const Loading(),
      ),


      bottomNavigationBar: dateweather.humidity != null ? SizedBox(
        width: we * 0.08,
        height: he * 0.08,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  <Widget>[
             GestureDetector(
               onTap: (){
                 setState(() {
                   selected = Gender.weather;
                 });
               },
                 child: Icon(Icons.filter_drama_outlined,color:selected == Gender.weather ? active : deactivecolor,size: 38.0,)
             ),
            SizedBox(
              width: we * 0.08,
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selected = Gender.add;
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return const Searchweather();
                  }));
                });
              },
                child:  Icon(Icons.add_circle_outlined,color: selected == Gender.add ? active : deactivecolor,size: 38.0,)
            ),

          ],
        ),
      ): const Loading(),
    );
  }
}