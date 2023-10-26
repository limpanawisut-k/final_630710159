import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:final_630710159/models/todo_item.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _dio = Dio(BaseOptions(responseType: ResponseType.plain));
  List<TodoItem>? _itemList;
  String? _error;
  Map<String, dynamic>? list ;

  void getTodos() async {
    try {
      final response = await _dio.get('https://cpsu-test-api.herokuapp.com/api/1_2566/weather/current?city=bangkok');
      debugPrint(response.data.toString());
      // parse

      setState(() {
        list = jsonDecode(response.data.toString());
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
      debugPrint('เกิดข้อผิดพลาด: ${e.toString()}');
    }
  }

  @override
  void initState() {
    super.initState();
    getTodos();
  }

  @override
  Widget build(BuildContext context) {
    bool _isButton1Enabled = true;

    void _toggleButtons() {
      setState(() {
        _isButton1Enabled = !_isButton1Enabled;
      });
    }
    return MaterialApp(
      title: 'Weather App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather App'),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 30, 16, 0),
                  child: Text('${list?['city']}',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold)),
                ),
                Text('${list!['country']}',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${list?['lastUpdated']}'),
                ),
                Image.network(
                  'https://cdn.weatherapi.com/weather/128x128/day/116.png',
                  width: 100,
                  height: 100,
                ),
                Text('Partly cloudy'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${list?['tempC']}',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold)),
                ),
                Text('Feels like ${list?['feelsLikeC']}',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _isButton1Enabled ? () {
                          print('Button 1 pressed');
                        } : null,
                        child: Text('°C',style: TextStyle (fontSize: 35,fontWeight: FontWeight.bold),),
                      ),
                      SizedBox.fromSize(size: Size(30, 30)),
                      ElevatedButton(
                        onPressed: _isButton1Enabled ? () {
                          print('Button 1 pressed');
                        } : null,
                        child: Text('°F',style: TextStyle (fontSize: 35,fontWeight: FontWeight.bold, color: Colors.grey),),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.water,
                                  size: 40, // ขนาดของ Icon
                                  color: Colors.grey,

                                ),
                                Text('HUMIDITY',style: TextStyle(color: Colors.grey),),
                                Text('${list?['humidity']}'),
                              ],
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.air,
                                  size: 40,
                                  color: Colors.grey,

                                ),
                                Text('WIND',style: TextStyle(color: Colors.grey),),
                                Text('${list?['windKph']} km/h'),
                              ],
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.sunny,
                                  size: 40,
                                  color: Colors.grey,

                                ),
                                Text('UV',style: TextStyle(color: Colors.grey),),
                                Text('${list?['uv']}'),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )



              ],
            ),
        ),
      ),
    );
  }

}
