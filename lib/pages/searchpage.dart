import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/date/datatime.dart';


class RsualtSearch extends StatefulWidget {
  RsualtSearch({required this.temp,required this.humidity,required this.description,required this.currently,required this.name, required this.icon, required this.feels_like,required this.speed});
  var temp;
  var description;
  var speed;
  var currently;
  var humidity;
  var feels_like;
  var name;
  var icon;

  @override
  State<StatefulWidget> createState() {

    return _RsualtSearchState(currently: currently,description: description,feels_like: feels_like,icon: icon,humidity: humidity,name: name,speed: speed,temp: temp);
  }


}

class _RsualtSearchState extends State<RsualtSearch> {
  _RsualtSearchState({required this.temp,required this.humidity,required this.description,required this.currently,required this.name,required this.icon,required this.feels_like,required this.speed});
  var temp;
  var description;
  var speed;
  var currently;
  var humidity;
  var feels_like;
  var name;
  var icon;

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF030615),
      body:SafeArea(
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
                          Text(name.toString(),style:GoogleFonts.alata(
                            fontSize: 30.0,
                            color: Colors.white,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                          )),
                          SizedBox(
                            height: he * 0.02,
                          ),

                          Expanded(child: CachedNetworkImage(imageUrl:  icon.toString())),
                          SizedBox(
                            height: he * 0.025,
                          ),
                          Text(currently.toString(),style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.0),),
                          SizedBox(
                            height: he * 0.02,
                          ),
                          Text(temp.toString()+"°",style: GoogleFonts.asap( // 31°
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
                                    Text(speed.toString()+"mph",style: GoogleFonts.alata(
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

                                    Text(humidity.toString() + "%",style: GoogleFonts.alata(
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
                                    Text(feels_like.toString()+"°C",style: GoogleFonts.alata(
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
      )
    );
  }
}


