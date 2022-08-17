import 'package:app_basic_flutter/blocs/currency/currency_bloc.dart';
import 'package:app_basic_flutter/blocs/currency/currency_events.dart';
import 'package:app_basic_flutter/blocs/currency/currency_state.dart';
import 'package:app_basic_flutter/models/enums/currency_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../blocs/pagination/pagination_cubit.dart';
import '../resources/currencies.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrrencyBloc, CurrencyState>(builder: (context, state) {
      return Column(children: <Widget>[
        Text(
          'Cotação',
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
                text: 'Selecione as moedas a serem cotadas em ',
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
                itemCount: state.secondList?.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      BlocProvider.of<CurrrencyBloc>(context)
                          .add(CurrencyCotationSelected(index));
                    },
                    child: Card(
                      margin: const EdgeInsets.only(bottom: 25),
                      color: const Color(0xFF2C2C2C),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: state.selectedConversions?.indexWhere(
                                      (element) =>
                                          element.code ==
                                          currencies[
                                              state.secondList![index]]) !=
                                  -1
                              ? const BorderSide(
                                  color: Color(0xFF2555FF), width: 3)
                              : const BorderSide()),
                      child: ListTile(
                        leading: Icon(
                          const IconData(
                            0xe0b2,
                            fontFamily: 'MaterialIcons',
                          ),
                          color: state.selectedConversions?.indexWhere(
                                      (element) =>
                                          element.code ==
                                          currencies[
                                              state.secondList![index]]) !=
                                  -1
                              ? const Color(0xFF2555FF)
                              : const Color(0xFFABB0AD),
                          size: 30,
                        ),
                        title: Text(state.secondList![index],
                            style: GoogleFonts.openSans(
                                color: state.selectedConversions?.indexWhere(
                                            (element) =>
                                                element.code ==
                                                currencies[state
                                                    .secondList?[index]]) !=
                                        -1
                                    ? const Color(0xFF2555FF)
                                    : const Color(0xFFABB0AD),
                                fontSize: 18,
                                fontWeight: FontWeight.w300)),
                      ),
                    ),
                  );
                })),
        Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {
                if (state.selectedConversions!.isEmpty ||
                    state.status == CurrencyStatus.loading) {
                  return;
                }
                BlocProvider.of<PagesCubit>(context).nextPage();
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                )),
                backgroundColor: state.selectedConversions!.isEmpty ||
                        state.status == CurrencyStatus.loading
                    ? MaterialStateProperty.all(const Color(0xFFABB0AD))
                    : MaterialStateProperty.all(const Color(0xFF2555FF)),
                padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                  (Set<MaterialState> states) {
                    return const EdgeInsets.symmetric(
                        horizontal: 41, vertical: 11);
                  },
                ),
              ),
              child: state.status == CurrencyStatus.loading
                  ? const CircularProgressIndicator()
                  : Text(
                      "Próximo",
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
