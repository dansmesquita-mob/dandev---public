import 'dart:convert';

import 'package:dandevsite/Utilis/variaveisGlobais.dart';
import 'package:http/http.dart' as http;

import 'Classes/Email.dart';

Future<Email> createEmail(String remetente, String destinatario, String assunto, String conteudo) async {
  String username = 'x';
  String password = 'x';
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));

  final response = await http.post(
    Uri.parse('https://emailsendapi.herokuapp.com/api/v1/sendmail'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "$basicAuth"
    },
    body: jsonEncode(<String, dynamic>{
      'remetente': remetente,
      "destinatario": destinatario,
      "assunto": assunto,
      "conteudo": conteudo
    }),
  );
  if (response.statusCode == 200) {
    print(response.body);
    print("Email enviado com sucesso!");
    var jsonParse = json.decode(response.body);
    retornoPostMail = jsonParse["message"];
    return Email.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Envio do email falhou!');
  }
}