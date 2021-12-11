import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weather/date/apiweather.dart';
import 'package:weather/date/images.dart';
import 'package:http/http.dart' as http;
import 'package:weather/pages/searchpage.dart';




class Searchweather extends StatefulWidget {
  const Searchweather({Key? key}) : super(key: key);

  @override
  _SearchweatherState createState() => _SearchweatherState();
}

class _SearchweatherState extends State<Searchweather> {


  // image //
  Images images = new Images();
  // image //

  // data //
  Dateweater dateweather = Dateweater();
  // data //


   // find weather by search city //
  Future<void> getweather(String city) async{


    // weather //
    var url = Uri.parse("http://api.openweathermap.org/data/2.5/weather?q=$city&appid={API key}"); // need api key  Read the text below ..

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

    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return  RsualtSearch(
        temp: dateweather.temp,
        currently: dateweather.currently,
        description: dateweather.description,
        feels_like: dateweather.feels_like,
        humidity: dateweather.humidity,
        icon: dateweather.icon,
        name: dateweather.name,
        speed: dateweather.speed,
      );
    }));
    // weather //


  }

  // controller for TextField //
  TextEditingController nameController = TextEditingController();






  @override
  Widget build(BuildContext context) {

    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF030615),
      body:SafeArea(
        child: SingleChildScrollView(
          child: Expanded(
            child: Column(
              children: <Widget>[

                Row(
                  // TextField & button //
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: we * 0.8,
                      height:he * 0.055,
                      margin: const EdgeInsets.only(left: 20,top: 30),
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white10,
                      ),
                      child:  TextField(
                        controller: nameController,
                          onSubmitted: (value){
                            getweather(nameController.text);
                          },
                          decoration: const InputDecoration(
                            enabledBorder: InputBorder.none,
                            border:InputBorder.none,
                            prefixIcon: Icon(Icons.search),
                            hintStyle: TextStyle(
                              color:  Colors.white,
                            ),
                          ),
                        style:  const TextStyle(color: Colors.white,fontWeight:FontWeight.bold),),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                        child: IconButton(onPressed: (){
                          Navigator.pop(context);
                        }, icon: const Icon(Icons.clear_outlined,color: Colors.red,)
                        ))
                  ],
                ),


                SizedBox(
                  height: he * 0.03,
                ),


                //   << popular cities >>  //
                Row(
                  // row cities //
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        getweather("Beijing");
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: we * 0.2,
                        height: he * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white12
                        ),

                        child: const Text("Beijing",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      ),
                    ),
                    SizedBox(
                      width: we * 0.03,
                    ),
                    GestureDetector(
                      onTap: (){
                        getweather("Shanghai");
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: we * 0.2,
                        height: he * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white12
                        ),

                        child: const Text("Shanghai",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      ),
                    ),
                    SizedBox(
                      width: we * 0.03,
                    ),
                    GestureDetector(
                      onTap: (){
                        getweather("Hong Kong");
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: we * 0.25,
                        height: he * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white12
                        ),

                        child: const Text("Hong Kong",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: he * 0.03,
                ),


                // 2 row cities //
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        getweather("Tehran");
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: we * 0.25,
                        height: he * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white12
                        ),

                        child: const Text("Tehran",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      ),
                    ),
                    SizedBox(
                      width: we * 0.03,
                    ),
                    GestureDetector(
                      onTap: (){
                        getweather("Jakarta");
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: we * 0.2,
                        height: he * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white12
                        ),

                        child: const Text("Jakarta",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      ),
                    ),
                    SizedBox(
                      width: we * 0.03,
                    ),
                  ],
                ),


                SizedBox(
                  height: he * 0.03,
                ),


                 //  3 rows cities //
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        getweather("Tokyo");
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: we * 0.25,
                        height: he * 0.05,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white12
                        ),

                        child: const Text("Tokyo",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      ),
                    ),
                    SizedBox(
                      width: we * 0.03,
                    ),
                    GestureDetector(
                      onTap: (){
                        getweather("Paris");
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: we * 0.2,
                        height: he * 0.05,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white12
                        ),

                        child: const Text("Paris",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      ),
                    ),
                    SizedBox(
                      width: we * 0.03,
                    ),
                    GestureDetector(
                      onTap: (){
                        getweather("New York");
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: we * 0.2,
                        height: he * 0.05,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white12
                        ),

                        child: const Text("New York",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ],
                ),
              ],
            ),

          ),
        ),
      ),
    );
  }
}





