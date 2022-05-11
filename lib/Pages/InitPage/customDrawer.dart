import 'package:dandevsite/Pages/HomePage/DialogWidget.dart';
import 'package:dandevsite/Utilis/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class customDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 20,
            left: 10
          ),
          child: FlatButton(
            child: Icon(Icons.close,
            size: 25,
            color: Colors.red[900]),
            onPressed: (){
              Get.back();
            },
          ),
          alignment: Alignment.topRight,
        ),
        Container(
          child: FlatButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Home ",
                style: TextStyle(
                  color: fontColor,
                  fontSize: 20
                ),),
                Icon(Icons.home,
                color: fontColor,
                size: 25,)
              ],
            ),
            onPressed: (){
              Get.offAllNamed("/home");
            },
          ),
        ),
        SizedBox(height: 15,),
        Container(
          child: FlatButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Início ",
                  style: TextStyle(
                      color: fontColor,
                      fontSize: 20
                  ),),
                Icon(Icons.pageview,
                  color: fontColor,
                  size: 25,)
              ],
            ),
            onPressed: (){
              Get.offAllNamed("/inicio");
            },
          ),
        ),
        SizedBox(height: 15,),
        Container(
          child: FlatButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Meus artigos ",
                  style: TextStyle(
                      color: fontColor,
                      fontSize: 20
                  ),),
                Icon(Icons.insert_drive_file,
                  color: fontColor,
                  size: 25,)
              ],
            ),
            onPressed: (){
              Get.offAllNamed("/artigos");
            },
          ),
        ),
        SizedBox(height: 15,),
        Container(
          child: FlatButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Contato ",
                  style: TextStyle(
                      color: fontColor,
                      fontSize: 20
                  ),),
                Icon(Icons.message,
                  color: fontColor,
                  size: 25,)
              ],
            ),
            onPressed: (){
              Get.dialog(DialogWidget());
            },
          ),
        ),
      ],
    );
  }
}
