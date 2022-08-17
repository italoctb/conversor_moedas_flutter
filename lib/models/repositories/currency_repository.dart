import 'package:app_basic_flutter/clients/currency_client.dart';
import 'package:app_basic_flutter/models/domain/currency.dart';

class CurrencyRepository {
  final CurrencyClient _currencyClient;

  CurrencyRepository(this._currencyClient);

  Future<Currency> getCurrencyConvertion({required String request}) async {
    final currencyDto = await _currencyClient.getCurrencies(request: request);
    return Currency(
        code: currencyDto.codeConversion!.code!,
        codein: currencyDto.codeConversion!.codein!,
        name: currencyDto.codeConversion!.name!,
        bid: currencyDto.codeConversion!.bid!);
  }
}
