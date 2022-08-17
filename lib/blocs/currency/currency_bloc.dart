import 'package:app_basic_flutter/blocs/currency/currency_events.dart';
import 'package:app_basic_flutter/models/enums/currency_status.dart';
import 'package:app_basic_flutter/models/repositories/currency_repository.dart';
import 'package:app_basic_flutter/resources/currencies.dart';
import 'package:bloc/bloc.dart';
import 'currency_state.dart';

class CurrrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  CurrrencyBloc(this._currencyRepository)
      : super(CurrencyState(
            status: CurrencyStatus.initial, selectedConversions: [])) {
    on<CurrencyBaseClicked>(_onCurrencyBaseClicked);
    on<CurrencyCotationSelected>(_onCurrencyCotationSelected);
    on<FinalButtonPressed>(_finalButtonPressed);
  }

  final CurrencyRepository _currencyRepository;

  void _onCurrencyBaseClicked(
      CurrencyBaseClicked event, Emitter<CurrencyState> emit) {
    List<String> listAux = currencies.keys.toList();
    String option = listAux[event.index];
    listAux.removeAt(event.index);
    emit(state.copyWith(selectedOption: option, secondList: listAux));
  }

  void _onCurrencyCotationSelected(
      CurrencyCotationSelected event, Emitter<CurrencyState> emit) async {
    emit(state.copyWith(status: CurrencyStatus.loading));
    if (state.selectedConversions!.indexWhere((element) =>
            element.code == currencies[state.secondList![event.index]]) !=
        -1) {
      state.selectedConversions!.removeWhere(
          (item) => item.code == currencies[state.secondList![event.index]]);
    } else {
      try {
        final String code = currencies[state.secondList![event.index]]! +
            "-" +
            currencies[state.selectedOption];
        final currencyCotation =
            await _currencyRepository.getCurrencyConvertion(request: code);
        state.selectedConversions!.add(currencyCotation);
        emit(state.copyWith(
          status: CurrencyStatus.success,
        ));
      } on Exception {
        emit(state.copyWith(status: CurrencyStatus.failure));
      }
    }
  }

  void _finalButtonPressed(
      FinalButtonPressed event, Emitter<CurrencyState> emit) {
    emit(state.copyWith(
        status: CurrencyStatus.restarted,
        secondList: [],
        selectedConversions: [],
        selectedOption: ""));
  }
}
