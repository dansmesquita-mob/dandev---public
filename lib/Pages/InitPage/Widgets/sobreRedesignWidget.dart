import 'package:dandevsite/Utilis/colors.dart';
import 'package:dandevsite/Utilis/variaveisGlobais.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class sobreRedesignWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 10,
        left: 15,
        right: 15,
        bottom: 10
      ),
      child: Column(
        children: [
          Container(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.380,
              width: MediaQuery.of(context).size.width * 0.7,
              child: CircleAvatar(
                  backgroundColor: fontColor,
                  backgroundImage: NetworkImage(
                    "https://images.pexels.com/photos/3771091/pexels-photo-3771091.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
                  ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(lorem,
              style: TextStyle(
                  color: Get.isDarkMode ? fontColor : Colors.black,
                  fontSize: 16
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
