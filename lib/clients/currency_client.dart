import 'dart:convert';

import 'package:app_basic_flutter/models/dto/currency_dto.dart';
import 'package:http/http.dart' as http;

class CurrenciesRequestError implements Exception {}

class CurrencyClient {
  static const _baseUrl = "economia.awesomeapi.com.br";
  static const _basePath = "json/last";
  CurrencyClient(this._httpClient);
  final http.Client _httpClient;

  Uri getUri({required String request}) {
    final currencyUri = Uri.https(_baseUrl, '$_basePath/$request');
    return currencyUri;
  }

  Future<CurrencyDto> getCurrencies({required String request}) async {
    final currencyUri = Uri.https(_baseUrl, '$_basePath/$request');
    final currencyResponse = await _httpClient.get(currencyUri);

    if (currencyResponse.statusCode == 200 &&
        currencyResponse.body.isNotEmpty) {
      print(currencyResponse.body);
      return CurrencyDto.fromJson(jsonDecode(currencyResponse.body));
    }
    print(currencyResponse.statusCode);
    print(currencyResponse.body);
    throw CurrenciesRequestError();
  }
}
