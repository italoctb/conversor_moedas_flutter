import 'package:bloc/bloc.dart';

class PagesCubit extends Cubit<int> {
  PagesCubit({initialState = 0}) : super(initialState);

  void nextPage() {
    emit(state + 1);
  }

  void previous() {
    emit(state - 1);
  }

  void reset() {
    emit(state - 2);
  }
}
