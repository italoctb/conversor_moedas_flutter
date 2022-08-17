import 'package:app_basic_flutter/blocs/currency/currency_bloc.dart';
import 'package:app_basic_flutter/blocs/currency/currency_events.dart';
import 'package:app_basic_flutter/blocs/currency/currency_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../blocs/pagination/pagination_cubit.dart';
import '../resources/currencies.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrrencyBloc, CurrencyState>(builder: (context, state) {
      return Column(children: <Widget>[
        Text(
          'Resultado',
          style: GoogleFonts.openSans(
              color: const Color(0xFF2555FF),
              fontSize: 24,
              fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 20,
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
                text: 'Confira os valores de compra referentes ao ',
                style: GoogleFonts.openSans(
                  color: Colors.white,
                  fontSize: 18,
                )),
            TextSpan(
                text: state.selectedOption,
                style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600))
          ]),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.40,
            child: ListView.builder(
                itemCount: state.selectedConversions?.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 25),
                    color: const Color(0xFF2C2C2C),
                    child: ListTile(
                      leading: const Icon(
                        IconData(
                          0xe0b2,
                          fontFamily: 'MaterialIcons',
                        ),
                        size: 30,
                        color: Color(0xFFABB0AD),
                      ),
                      title: Text(
                          currencies.keys.firstWhere(
                              (k) =>
                                  currencies[k] ==
                                  state.selectedConversions?[index].code,
                              orElse: () => ""),
                          style: GoogleFonts.openSans(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              color: const Color(0xFFABB0AD))),
                      trailing: Text(
                          state.selectedConversions?[index].bid ?? "",
                          style: GoogleFonts.openSans(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: double.parse(state
                                              .selectedConversions?[index]
                                              .bid ??
                                          "") >=
                                      5
                                  ? Colors.redAccent
                                  : double.parse(state
                                                  .selectedConversions?[index]
                                                  .bid ??
                                              "") >=
                                          1
                                      ? const Color(0xFFD8EC5B)
                                      : const Color(0xFF36FF93))),
                    ),
                  );
                })),
        Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {
                BlocProvider.of<PagesCubit>(context).reset();
                BlocProvider.of<CurrrencyBloc>(context)
                    .add(FinalButtonPressed());
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                )),
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xFF2555FF)),
                padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                  (Set<MaterialState> states) {
                    return const EdgeInsets.symmetric(
                        horizontal: 41, vertical: 11);
                  },
                ),
              ),
              child: Text(
                "Concluir",
                style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ))
      ]);
    });
  }
}
