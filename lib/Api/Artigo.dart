import 'dart:convert';
import 'package:dandevsite/Utilis/variaveisGlobais.dart';
import 'package:http/http.dart' as http;

import 'Classes/Artigo.dart';


Future<List<Artigo>> fetchArtigos() async {
  String username = 'x';
  String password = 'xxxx';
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));

  Map<String, String> headers = {
    'Content-Type': 'application/json;charset=UTF-8',
    'Charset': 'utf-8',
    "Authorization": "$basicAuth"
  };

  final response = await http.get(Uri.parse("https://artigosmediumapi.herokuapp.com/api/v1/artigos"),
  headers: headers);

  List responseJson = json.decode(response.body);
  if (response.statusCode == 200) {
    itemsReturn =  response.body.length;
    return responseJson.map((m) => new Artigo.fromJson(m)).toList();
  } else {

    throw Exception('Failed to load album');
  }
}