import 'package:app_basic_flutter/blocs/currency/currency_bloc.dart';
import 'package:app_basic_flutter/blocs/currency/currency_state.dart';
import 'package:app_basic_flutter/models/enums/currency_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/pagination/pagination_cubit.dart';
import 'first_page.dart';
import 'result_page.dart';
import 'second_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1f1f1f),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 32, right: 32, top: 15, bottom: 20),
        child: Center(
            child: Column(
          children: [
            BlocBuilder<CurrrencyBloc, CurrencyState>(
              builder: (context, state) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: BlocBuilder<PagesCubit, int>(
                    builder: (context, pageState) {
                      if (state.status != CurrencyStatus.initial ||
                          pageState != 0) {
                        pageController.animateToPage(pageState,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease);
                      }
                      if (pageState != 0) {}
                      return PageView(
                        controller: pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: const [
                          FirstPage(),
                          SecondPage(),
                          ResultPage()
                        ],
                      );
                    },
                  ),
                );
              },
            ),
            BlocBuilder<PagesCubit, int>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                          color: state == 0
                              ? const Color(0xFF2555FF)
                              : const Color(0xFFC4C4C4),
                          borderRadius: BorderRadius.circular(100)),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                          color: state == 1
                              ? const Color(0xFF2555FF)
                              : const Color(0xFFC4C4C4),
                          borderRadius: BorderRadius.circular(100)),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                          color: state == 2
                              ? const Color(0xFF2555FF)
                              : const Color(0xFFC4C4C4),
                          borderRadius: BorderRadius.circular(100)),
                    )
                  ],
                );
              },
            )
          ],
        )),
      ),
    );
  }
}
