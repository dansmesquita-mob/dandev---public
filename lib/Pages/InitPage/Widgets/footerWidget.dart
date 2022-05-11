import 'package:dandevsite/Utilis/colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_value.dart';
class footerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveVisibility(
      visible: false,
      visibleWhen: [
        Condition.largerThan(name: MOBILE)
      ],
      replacement: widgetfooterMobile(),
      child: Column(
        children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Desenvolvido por Daniel Mesquita ",
                    style: TextStyle(
                      color: fontColor,
                      fontSize: 18,
                      fontWeight: FontWeight.normal
                    ),),
                    Icon(Icons.copyright,
                    size: 22,
                    color: fontColor,)
                  ],
                ),
              ),
        ],
      ),
    );
  }
}

Widget widgetfooterMobile  () {
  return  Column(
    children: [
      Align(
        alignment: Alignment.center,
        child: Container(
          child: Wrap(
            children: [
              Text("Desenvolvido por Daniel Mesquita ",
                style: TextStyle(
                    color: fontColor,
                    fontSize: 18,
                    fontWeight: FontWeight.normal
                ),),
              Icon(Icons.copyright,
                size: 22,
                color: fontColor,)
            ],
          ),
        ),
      ),
    ],
  );
}