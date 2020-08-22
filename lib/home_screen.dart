import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  static String id = "HomeScreen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List _items = ["Chandpur", "Comilla", "Dhaka"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffffffff),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Container(
                                child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.purple,
                                    size: 40,
                                  ),
                                  hint: Text(
                                    'Current Location',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  items: <String>[
                                    'Current Location',
                                    'B',
                                    'C',
                                    'D'
                                  ].map((String value) {
                                    return new DropdownMenuItem<String>(
                                      value: value,
                                      child: new Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (_) {},
                                ),
                              ),
                            )),
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Image.asset('images/help.png'),
                                Text(
                                  'Help!',
                                  style: TextStyle(
                                    color: Color(0xffE522DB),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 5,
                            child: Container(
                              height: 50,
                              child: TextFormField(
                                decoration: new InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey[100],
                                  suffixIcon: Icon(Icons.search),
                                  labelText: "Search for a restaurant ...",
                                  labelStyle: TextStyle(color: Colors.black),
                                  border: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                    borderSide: new BorderSide(),
                                  ),
                                  //fillColor: Colors.green
                                ),
                                validator: (val) {
                                  if (val.length == 0) {
                                    return "Email cannot be empty";
                                  } else {
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.text,
                                style: new TextStyle(
                                  fontFamily: "Poppins",
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: IconButton(
                                  icon: Image.asset('images/slidericon.png')),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Moodie Food',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff2F434C),
                            ),
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "View All",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff2F434C),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.angleDoubleRight,
                                    color: Color(0xffE522DB),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Container(
                        height: 140,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            FoodCartBuilder(
                              imageID: '1',
                              foodName: 'ITALIAN',
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FoodCartBuilder(
                              imageID: '2',
                              foodName: 'SEA FOOD',
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FoodCartBuilder(
                              imageID: '3',
                              foodName: 'HEALTHY',
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FoodCartBuilder(
                              imageID: '3',
                              foodName: 'CHINESE',
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FoodCartBuilder(
                              imageID: '1',
                              foodName: 'SEA FOOD',
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FoodCartBuilder(
                              imageID: '3',
                              foodName: 'SEA FOOD',
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FoodCartBuilder extends StatelessWidget {
  const FoodCartBuilder({
    Key key,
    @required this.imageID,
    this.foodName,
  }) : super(key: key);

  final String imageID;
  final String foodName;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
          child: Image.asset(
            'images/food$imageID.jpg',
            width: 102,
            height: 129,
            fit: BoxFit.fill,
          ),
        ),
        Image.asset(
          'images/foodtrans.png',
          width: 102,
          height: 129,
        ),
        Container(
          height: 129,
          width: 102,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '$foodName',
                  style: TextStyle(
                    color: Color(0xffffffff),
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Check Italian food restaurants',
                  style: TextStyle(
                    color: Color(0xffffffff),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
