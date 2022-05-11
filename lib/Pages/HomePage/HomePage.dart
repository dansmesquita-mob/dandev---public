import 'package:dandevsite/Api/Classes/nasaClass.dart';
import 'package:dandevsite/Api/apiNasa.dart';
import 'package:dandevsite/Utilis/colors.dart';
import 'package:dandevsite/Utilis/variaveisGlobais.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'DialogWidget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<NASA> futureNasa;

  @override
  void initState() {
    super.initState();
    futureNasa = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 70,
        title: Text(
          "DanDev />",
          style: TextStyle(
              color: fontColor, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        elevation: 3,
        actions: [
          FlatButton(
              onPressed: () {
                Get.changeTheme(
                    Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
              },
              child: Icon(
                Icons.invert_colors,
                color: fontColor,
              ))
        ],
      ),
      body: Center(
        child: FutureBuilder<NASA>(
          future: futureNasa,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage("${snapshot.data.hdurl}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 320,
                      height: 70,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 4,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                child: ResponsiveVisibility(
                                  child: Container(
                                    child: FlatButton(
                                        onPressed: () {
                                          Get.offAllNamed("/inicio");
                                        },
                                        child: Text(
                                          "VISITAR SITE",
                                          style: TextStyle(
                                              color: fontColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                  visible: false,
                                  visibleWhen: [
                                    Condition.largerThan(name: MOBILE)
                                  ],
                                  replacement: Container(
                                    child: FlatButton(
                                        onPressed: () {
                                          Get.offAllNamed("/inicio");
                                        },
                                        child: Text(
                                          "VISITAR SITE",
                                          style: TextStyle(
                                              color: fontColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ResponsiveVisibility(
                                  visible: false,
                                  visibleWhen: [
                                    Condition.largerThan(name: MOBILE)
                                  ],
                                  replacement: Container(
                                    child: FlatButton(
                                        onPressed: () {
                                          Get.dialog(DialogWidget());
                                        },
                                        child: Text(
                                          "CONTATO",
                                          style: TextStyle(
                                              color: fontColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                  child: Container(
                                    child: FlatButton(
                                        onPressed: () {
                                          Get.dialog(DialogWidget());
                                        },
                                        child: Text(
                                          "CONTATO",
                                          style: TextStyle(
                                              color: fontColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
