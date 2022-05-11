import 'dart:convert';

import 'package:dandevsite/Api/Artigo.dart';
import 'package:dandevsite/Api/Classes/Artigo.dart';
import 'package:dandevsite/Utilis/colors.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Api/Classes/Artigo.dart';

class blogWidget extends StatefulWidget {
  @override
  _blogWidgetState createState() => _blogWidgetState();
}

class _blogWidgetState extends State<blogWidget> {
  @override
  void initState() {
    super.initState();
    fetchArtigos();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<Artigo>>(
        future: fetchArtigos(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(fontColor),
                backgroundColor: Colors.black,
              ),
            );
          List<Artigo> a = snapshot.data;
          return ListView(
            scrollDirection: Axis.horizontal,
            children: a
                .map(
                  (a) => itemArtigo(a.tituloArtigo, a.descricaoArtigo,
                      a.dataPublicacaoArtigo, a.url, a.idCorRegistro),
                )
                .toList(),
          );
        },
      ),
    );
  }
}

Widget itemArtigo(
    String title, String description, String publishDate, String url, int idCor) {
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      child: Card(
        color: colors[idCor],
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          width: 180,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 20,),
              Container(
                child: Text(
                  "$title".toLowerCase(),
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              Container(
                child: Text(
                  "$publishDate",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
              SizedBox(width: 20,),
            ],
          ),
        ),
      ),
      onTap: (){
        launch(
            "$url"
        );
      },
    ),
  );
}
