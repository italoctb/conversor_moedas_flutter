abstract class CurrencyEvent {
  const CurrencyEvent();
}

class CurrencyBaseClicked extends CurrencyEvent {
  final int index;

  CurrencyBaseClicked(this.index);
}

class CurrencyCotationSelected extends CurrencyEvent {
  final int index;

  CurrencyCotationSelected(this.index);
}

class FinalButtonPressed extends CurrencyEvent {}
