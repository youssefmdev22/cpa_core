import 'package:cpa_core/cpa_core.dart';
import 'package:flutter/material.dart';

Widget buildShimmerDataTable({
  int? length,
  double? height,
  double? separatorHeight,
}) {
  return CustomWidgetWrapperItems(
    child: buildShimmerList(
      length: length,
      height: height,
      separatorHeight: separatorHeight,
    ),
  );
}

Widget buildShimmerListDataTable({
  int? length,
  double? height,
  double? separatorHeight,
}) {
  return ListView.separated(
    shrinkWrap: true,
    itemBuilder: (context, index) => buildShimmerItem(height: height),
    separatorBuilder: (context, index) =>
        SizedBox(height: separatorHeight ?? 15),
    itemCount: length ?? 10,
  );
}
