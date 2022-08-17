import 'package:app_basic_flutter/models/domain/currency.dart';
import 'package:app_basic_flutter/models/enums/currency_status.dart';

class CurrencyState {
  final CurrencyStatus status;
  final String? selectedOption;
  final List<String>? secondList;
  final List<Currency>? selectedConversions;

  CurrencyState(
      {required this.status,
      this.selectedOption,
      this.secondList,
      this.selectedConversions});

  CurrencyState copyWith(
      {CurrencyStatus? status,
      Currency? currency,
      String? selectedOption,
      List<String>? secondList,
      List<Currency>? selectedConversions}) {
    return CurrencyState(
        status: status ?? this.status,
        selectedOption: selectedOption ?? this.selectedOption,
        secondList: secondList ?? this.secondList,
        selectedConversions: selectedConversions ?? this.selectedConversions);
  }
}
