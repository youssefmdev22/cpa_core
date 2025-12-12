import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

class CustomPagination extends StatelessWidget {
  final int numberPages;
  final int initialPage;
  final Function(int)? onPageChange;
  const CustomPagination({super.key, required this.numberPages, required this.initialPage, required this.onPageChange});

  @override
  Widget build(BuildContext context) {
    return NumberPaginator(
      numberPages: numberPages,
      initialPage: initialPage,
      onPageChange: onPageChange,
      child: const SizedBox(
        height: 48,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrevButton(),
            Flexible(child: ScrollableNumberContent(shrinkWrap: true)),
            NextButton(),
          ],
        ),
      ),
    );
  }
}