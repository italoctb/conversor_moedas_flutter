import 'package:app_basic_flutter/blocs/currency/currency_bloc.dart';
import 'package:app_basic_flutter/blocs/currency/currency_events.dart';
import 'package:app_basic_flutter/blocs/pagination/pagination_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../resources/currencies.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({
    Key? key,
  }) : super(key: key);
  //final Function(String) nextPageCardFunction;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Moeda base',
          style: GoogleFonts.openSans(
              color: const Color(0xFF2555FF),
              fontSize: 24,
              fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Selecione uma moeda base para as conversões',
          style: GoogleFonts.openSans(
            color: Colors.white,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: ListView.builder(
              itemCount: currencies.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    BlocProvider.of<PagesCubit>(context).nextPage();
                    BlocProvider.of<CurrrencyBloc>(context)
                        .add(CurrencyBaseClicked(index));
                  },
                  child: Card(
                    margin: const EdgeInsets.only(bottom: 25),
                    color: const Color(0xFF2C2C2C),
                    child: ListTile(
                      leading: const Icon(
                        IconData(
                          0xe0b2,
                          fontFamily: 'MaterialIcons',
                        ),
                        color: Color(0xFFABB0AD),
                        size: 30,
                      ),
                      title: Text(currencies.keys.elementAt(index),
                          style: GoogleFonts.openSans(
                              color: const Color(0xFFABB0AD),
                              fontSize: 18,
                              fontWeight: FontWeight.w300)),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
