import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Classes/nasaClass.dart';

Future<NASA> getData() async {
  final response = await http.get(Uri.parse('https://api.nasa.gov/planetary/apod?api_key=x'));


  if (response.statusCode == 200) {
    return NASA.fromJson(jsonDecode(response.body));
  } else {
    print("Exception get");
    throw Exception('Falha ao carregar imagem de fundo');
  }
}