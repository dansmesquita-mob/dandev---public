import 'package:dandevsite/Api/Classes/Email.dart';
import 'package:dandevsite/Api/Email.dart';
import 'package:dandevsite/Utilis/colors.dart';
import 'package:dandevsite/Utilis/variaveisGlobais.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:responsive_framework/responsive_framework.dart';

class DialogWidget extends StatefulWidget {
  @override
  _DialogWidgetState createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  final _formKey = GlobalKey<FormState>();
  Future<Email> _futureEmail;

  /*CONTROLLERS*/
  TextEditingController remetente = TextEditingController();
  TextEditingController assunto = TextEditingController();
  TextEditingController conteudo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ResponsiveVisibility(
            visible: false,
            visibleWhen: [
              Condition.largerThan(name: MOBILE)
            ],
            replacement: Container(
              decoration: BoxDecoration(
                  color: Get.isDarkMode ? Colors.grey[900] : Colors.white,
                  borderRadius: BorderRadius.circular(20)),
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.8,
              child: FlatButton(
                child: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.close,
                        color: Colors.red[900],
                        size: 20,
                      ),
                      alignment: Alignment.centerRight,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          personaliedTextForm(remetente, 'Informe o seu nome',
                              'Nome inválido', 1),
                          personaliedTextForm(assunto, 'Informe o seu endereço de email',
                              'Assunto inválido', 1),
                          personaliedTextForm(
                              conteudo,
                              'Escreva o conteúdo :)',
                              'Conteúdo inválido',
                              18)
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          right: 5,
                          top: 10,
                          bottom: 10
                      ),
                      alignment: Alignment.centerRight,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Text(
                          "Enviar",
                          style: TextStyle(color: Get.isDarkMode ? Colors.black : Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          if("${remetente.text}" != "" && "${assunto.text}" != "" && "${conteudo.text}" != "" ){
                            print("caiu na condicao 1");
                            print("${remetente.text}");
                            _futureEmail = createEmail(
                                "${remetente.text}",
                                "daniel.s.mesquita@hotmail.com",
                                "Enviado por: ${assunto.text}",
                                "${conteudo.text}");
                            Get.back();
                            Get.snackbar("Sucesso", "Contato realizado com sucesso!",
                              colorText: Colors.white,
                              icon: Icon(Icons.error_outline,
                                color: Colors.white,
                                size: 30,),
                              shouldIconPulse: true,
                              barBlur: 20,
                              isDismissible: true,
                              backgroundColor: fontColor,
                              duration: Duration(seconds: 4),);
                          }
                          else if("${remetente.text}" != null || "${assunto.text}" != null || "${conteudo.text}" != null){
                            print("caiu na condicao 2");
                            return Get.snackbar("Erro", "Nenhum campo pode estar em branco, revise o preenchimento.",
                              colorText: Colors.white,
                              icon: Icon(Icons.error_outline,
                                color: Colors.white,
                                size: 30,),
                              shouldIconPulse: true,
                              barBlur: 20,
                              isDismissible: true,
                              backgroundColor: Colors.red[900],
                              duration: Duration(seconds: 4),);
                          }
                        },
                        color: fontColor,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  Get.back();
                },
              ),
              alignment: Alignment.topRight,
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: Get.isDarkMode ? Colors.grey[900] : Colors.white,
                  borderRadius: BorderRadius.circular(20)),
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.6,
              child: FlatButton(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.close,
                        color: Colors.red[900],
                        size: 20,
                      ),
                      alignment: Alignment.centerRight,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          personaliedTextForm(remetente, 'Informe o seu nome',
                              'Nome inválido', 1),
                          personaliedTextForm(assunto, 'Informe o seu endereço de email',
                              'Assunto inválido', 1),
                          personaliedTextForm(
                              conteudo,
                              'Escreva o conteúdo :)',
                              'Conteúdo inválido',
                              7)
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        right: 5,
                        top: 10,
                        bottom: 10
                      ),
                      alignment: Alignment.centerRight,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Text(
                          "Enviar",
                          style: TextStyle(color: Get.isDarkMode ? Colors.black : Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          if("${remetente.text}" != "" && "${assunto.text}" != "" && "${conteudo.text}" != "" ){
                            print("caiu na condicao 1");
                              print("${remetente.text}");
                            _futureEmail = createEmail(
                                "${remetente.text}",
                                "daniel.s.mesquita@hotmail.com",
                                "Enviado por: ${assunto.text}",
                                "${conteudo.text}");
                            Get.back();
                            Get.snackbar("Sucesso", "Contato realizado com sucesso!",
                              colorText: Colors.white,
                              icon: Icon(Icons.error_outline,
                                color: Colors.white,
                                size: 30,),
                              shouldIconPulse: true,
                              barBlur: 20,
                              isDismissible: true,
                              backgroundColor: fontColor,
                              duration: Duration(seconds: 4),);
                          }
                          else if("${remetente.text}" != null || "${assunto.text}" != null || "${conteudo.text}" != null){
                            print("caiu na condicao 2");
                            return Get.snackbar("Erro", "Nenhum campo pode estar em branco, revise o preenchimento.",
                              colorText: Colors.white,
                              icon: Icon(Icons.error_outline,
                              color: Colors.white,
                              size: 30,),
                              shouldIconPulse: true,
                              barBlur: 20,
                              isDismissible: true,
                              backgroundColor: Colors.red[900],
                              duration: Duration(seconds: 4),);
                          }
                        },
                        color: fontColor,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  Get.back();
                },
              ),
              alignment: Alignment.topRight,
            ),
          ),
        ],
      ),
    );
  }
}

Widget personaliedTextForm(TextEditingController controller, String labelText,
    String isEmpty, int maxLines) {
  return Container(
    child: TextFormField(
      style: TextStyle(color: fontColor, fontSize: 12),
      cursorColor: fontColor,
      controller: controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: (BorderRadius.all(Radius.circular(10))),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: (BorderRadius.all(Radius.circular(10))),
            borderSide: BorderSide(
              color: fontColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: (BorderRadius.all(Radius.circular(10))),
              borderSide: BorderSide(
                color: Colors.grey[600],
              )),
          labelText: "$labelText",
          labelStyle: TextStyle(color: fontColor, fontSize: 13),
          hintText: "$labelText",
          hintStyle: TextStyle(color: fontColor, fontSize: 13)),
      maxLines: maxLines,
      validator: (text) {
        if (text.isEmpty) return "$isEmpty";
      },
    ),
    padding: EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 5),
  );
}

