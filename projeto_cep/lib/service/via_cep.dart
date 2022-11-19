// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:projeto_cep/model/resul_cep.dart';
import 'package:http/http.dart';

class ViaCep {
  var client = Client();

  Future<ResultCep> fetchCep({required String cep}) async {
    final response = await client.get('https://viacep.com.br/ws/$cep/json/');
    if (response.statusCode == 200) {
      return ResultCep.fromJson(response.body);
    } else {
      throw Exception('Requisição inválida!');
    }
  }
}
