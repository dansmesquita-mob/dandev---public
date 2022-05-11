import 'package:dandevsite/Api/Artigo.dart';
import 'package:dandevsite/Api/Classes/Artigo.dart';
import 'package:dandevsite/Pages/InitPage/Widgets/blogWidget.dart';
import 'package:dandevsite/Pages/InitPage/customDrawer.dart';
import 'package:dandevsite/Utilis/colors.dart';
import 'package:dandevsite/Utilis/variaveisGlobais.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/route_manager.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

class ArtigosPage extends StatefulWidget {
  @override
  _ArtigosPageState createState() => _ArtigosPageState();
}

class _ArtigosPageState extends State<ArtigosPage> {
  @override
  void initState() {
    super.initState();
    fetchArtigos();
  }

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
      body: Column(
        children: [
          Container(
            child: Text(
              "Meus artigos",
              style: TextStyle(
                  color: fontColor, fontWeight: FontWeight.bold, fontSize: 25),
            ),
            padding: EdgeInsets.all(15),
          ),
          ResponsiveVisibility(
            visible: false,
            visibleWhen: [Condition.largerThan(name: MOBILE)],
            replacement: Expanded(
              child: Center(
                child: FutureBuilder<List<Artigo>>(
                  future: fetchArtigos(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData)
                      return Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              new AlwaysStoppedAnimation<Color>(fontColor),
                          backgroundColor: Colors.black,
                        ),
                      );
                    List<Artigo> a = snapshot.data;
                    return ListView(
                      children: a
                          .map(
                            (a) => expandedArtigos(
                                a.tituloArtigo,
                                a.descricaoArtigo,
                                a.dataPublicacaoArtigo,
                                a.url),
                          )
                          .toList(),
                    );
                  },
                ),
              ),
            ),
            child: Expanded(
              child: Center(
                child: FutureBuilder<List<Artigo>>(
                  future: fetchArtigos(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData)
                      return Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              new AlwaysStoppedAnimation<Color>(fontColor),
                          backgroundColor: Colors.black,
                        ),
                      );
                    List<Artigo> a = snapshot.data;
                    return ListView(
                      children: a
                          .map(
                            (a) => expandedArtigos(
                                a.tituloArtigo,
                                a.descricaoArtigo,
                                a.dataPublicacaoArtigo,
                                a.url),
                          )
                          .toList(),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget expandedArtigos(
    String title, String description, String publishDate, String url) {
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      child: Container(
        padding: EdgeInsets.all(5),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          elevation: 3,
          child: Container(
            child: Column(
              children: [
                Container(
                  child: Text(
                    "$title",
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.green : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  padding: EdgeInsets.all(10),
                ),
                Container(
                  child: Text(
                    "$description".toLowerCase(),
                    style: TextStyle(
                        color: Get.isDarkMode ? fontColor : Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 15),
                  ),
                  padding: EdgeInsets.all(20),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Wrap(
                      children: [
                        Text(
                          "Publicado em Medium: ",
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Text(
                          "$url",
                          style: TextStyle(
                              color: Get.isDarkMode ? fontColor : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  padding: EdgeInsets.all(20),
                ),
                Container(
                  child: Text(
                    "Data publicação: ${publishDate}",
                    style: TextStyle(
                        color: Get.isDarkMode ? fontColor : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.all(10),
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        launch(url);
      },
    ),
  );
}
