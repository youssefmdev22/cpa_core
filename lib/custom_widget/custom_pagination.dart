import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

class CustomPagination extends StatelessWidget {
  final int numberPages;
  final int initialPage;
  final Function(int)? onPageChange;
  final NumberPaginatorController? controller;
  const CustomPagination({super.key, required this.numberPages, required this.initialPage, required this.onPageChange, this.controller});

  @override
  Widget build(BuildContext context) {
    return NumberPaginator(
      numberPages: numberPages,
      initialPage: initialPage,
      onPageChange: onPageChange,
      controller: controller,
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