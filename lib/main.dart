import 'package:app_basic_flutter/blocs/currency/currency_bloc.dart';
import 'package:app_basic_flutter/blocs/pagination/pagination_cubit.dart';
import 'package:app_basic_flutter/clients/currency_client.dart';
import 'package:app_basic_flutter/models/repositories/currency_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'pages/home_page.dart';

void main() {
  final currencyClient = CurrencyClient(http.Client());
  final currencyRepository = CurrencyRepository(currencyClient);
  runApp(MyApp(
    currencyRepository: currencyRepository,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.currencyRepository}) : super(key: key);

  final CurrencyRepository currencyRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: currencyRepository,
      child: MaterialApp(
          home: MultiBlocProvider(
        providers: [
          BlocProvider<CurrrencyBloc>(
            create: (BuildContext context) => CurrrencyBloc(currencyRepository),
          ),
          BlocProvider<PagesCubit>(
              create: (BuildContext context) => PagesCubit())
        ],
        child: const HomePage(title: 'Desafio M02'),
      )),
    );
  }
}
