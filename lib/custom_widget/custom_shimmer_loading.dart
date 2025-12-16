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

Widget buildShimmerList({
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

Widget buildShimmerItem({double? height}) {
  return Shimmer.fromColors(
    baseColor: Colors.white.withValues(alpha: 0.15),
    highlightColor: Colors.white.withValues(alpha: 0.35),
    child: Container(
      width: double.infinity,
      height: height ?? 20,
      decoration: BoxDecoration(color: Colors.grey.shade300),
    ),
  );
}
