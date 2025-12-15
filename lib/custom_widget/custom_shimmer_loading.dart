import 'package:cpa_core/cpa_core.dart';
import 'package:flutter/material.dart';

Widget buildShimmerDataTable({
  final int? length,
  final double? height,
  final double? separatorHeight,
}) {
  return CustomWidgetWrapperItems(
    child: ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) => Shimmer.fromColors(
        baseColor: Colors.white.withValues(alpha: 0.15),
        highlightColor: Colors.white.withValues(alpha: 0.35),
        child: Container(
          width: double.infinity,
          height: height ?? 20,
          decoration: BoxDecoration(color: Colors.grey.shade300),
        ),
      ),
      separatorBuilder: (context, index) =>
          SizedBox(height: separatorHeight ?? 15),
      itemCount: length ?? 10,
    ),
  );
}