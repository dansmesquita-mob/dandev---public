import 'package:dandevsite/Pages/InitPage/Widgets/hardSkillsWidget.dart';
import 'package:dandevsite/Utilis/colors.dart';
import 'package:dandevsite/Utilis/variaveisGlobais.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_value.dart';

import 'Widgets/blogWidget.dart';
import 'Widgets/footerWidget.dart';
import 'Widgets/sobreRedesignWidget.dart';
import 'customDrawer.dart';

class InitScreen extends StatefulWidget {
  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text(
          "DanDev />",
          style: TextStyle(
              color: fontColor, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        backgroundColor: Colors.transparent,
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
        iconTheme: IconThemeData(color: fontColor),
      ),
      drawer: Drawer(
        child: customDrawer(),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                ResponsiveVisibility(
                  visible: false,
                  visibleWhen: [
                    Condition.largerThan(name: MOBILE),
                    Condition.largerThan(name: TABLET)
                  ],
                  replacement: sobreRedesignWidget(),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Container(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: ResponsiveVisibility(
                                  visible: false,
                                  visibleWhen: [
                                    Condition.largerThan(name: DESKTOP),
                                  ],
                                  replacement: CircleAvatar(
                                    backgroundColor: fontColor,
                                    backgroundImage: NetworkImage(
                                        "https://images.pexels.com/photos/3771091/pexels-photo-3771091.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260"),
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: fontColor,
                                    backgroundImage: NetworkImage(
                                        "https://images.pexels.com/photos/3771091/pexels-photo-3771091.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
                                  ),
                                ),
                              ),
                            )),
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Text(
                              lorem,
                              style: TextStyle(
                                  color:
                                      Get.isDarkMode ? fontColor : Colors.black,
                                  fontSize: 16),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(
                        top: 10,
                        right: 10,
                        left: 10,
                        bottom: 25
                            ),
                    width: double.infinity,
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: hardSkillsWidget(),
                    )),
                  Column(
                    children: [
                      Container(
                        child: Text(
                            "Meus artigos",
                        style: TextStyle(
                          color: fontColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 25
                        ),),
                        padding: EdgeInsets.all(10),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: 20,
                          bottom: 30
                        ),
                        width: double.infinity,
                        height: 250,
                        child: blogWidget(),
                      ),
                      Container(
                        padding: EdgeInsets.all(30),
                        child: footerWidget(),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
