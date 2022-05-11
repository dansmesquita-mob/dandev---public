import 'package:dandevsite/Utilis/colors.dart';
import 'package:dandevsite/Utilis/variaveisGlobais.dart';
import 'package:flutter/material.dart';

class hardSkillsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              child: Text(
                "Hard Skills",
                style: TextStyle(
                    color: fontColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Wrap(
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: FlutterLogo(),
                        width: 120,
                        height: 120,
                      ),
                      Text(
                        "Flutter",
                        style: TextStyle(
                            color: fontColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  padding: EdgeInsets.only(
                      bottom: espacamentoWidgets),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: Image.network(
                          "https://cdn3.iconfinder.com/data/icons/logos-and-brands-adobe/512/267_Python-512.png",
                          width: 120,
                          height: 120,
                        ),
                      ),
                      Text(
                        "Python",
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  padding: EdgeInsets.only(
                      bottom: espacamentoWidgets),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: Image.network(
                          "https://img.icons8.com/color/452/microsoft-sql-server.png",
                          width: 120,
                          height: 120,
                        ),
                      ),
                      Text(
                        "SQL Server",
                        style: TextStyle(
                            color: Colors.red[800],
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  padding: EdgeInsets.only(
                      bottom: espacamentoWidgets),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: Image.network(
                            "https://github.githubassets.com/images/modules/logos_page/Octocat.png"),
                        width: 120,
                        height: 120,
                      ),
                      Text(
                        "Github",
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  padding: EdgeInsets.only(
                      bottom: espacamentoWidgets),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: Image.network(
                          "https://i.pinimg.com/originals/a5/58/b4/a558b426cb8973523f37bbed94cf0f09.png",
                          width: 120,
                          height: 120,
                        ),
                      ),
                      Text(
                        "Figma",
                        style: TextStyle(
                            color: Colors.green[800],
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  padding: EdgeInsets.only(
                    bottom: espacamentoWidgets,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
