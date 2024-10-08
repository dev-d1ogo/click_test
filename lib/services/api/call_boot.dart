import 'dart:convert';
import 'package:click_teste2/types/api_response.dart';
import 'package:http/http.dart' as http;

Future<ApiResponse> callBot(String message) async {
  print("essa é a mensagem" + message);
  var data = json.encode({"message": message}); // Encode the data to JSON
  print("essa é a data ${data}");

  // Definir a URL da API
  var url = Uri.parse("https://clic-til-ai.azurewebsites.net/chatopenai");

  // Fazer a chamada POST com o cabeçalho de Content-Type
  var response = await http.post(
    url,
    headers: {"Content-Type": "application/json"},
    body: data,
  );

  if (response.statusCode == 200) {
    // Se a resposta for bem-sucedida, converter o corpo para Map
    var responseBody = json.decode(response.body) as Map<String, dynamic>;

    // Convertendo o Map para ApiResponse
    return ApiResponse.fromJson(responseBody);
  } else {
    // Em caso de erro, lança uma exceção ou trata o erro
    return ApiResponse(
        response: "Não consegui processar sua mensagem, tente novamente!");
  }
}
