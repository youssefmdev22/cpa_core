import 'package:flutter/cupertino.dart';

import 'custom_data_grid_model.dart';

typedef CellTapCallback = void Function(int index, CustomDataGridModel row);
typedef IconBuilder = IconData Function(int index, CustomDataGridModel row);
typedef ColorBuilder = Color Function(int index, CustomDataGridModel row);

class CustomDataButtonModel {
  final IconData? icon;
  final IconBuilder? iconBuilder;
  final Color? color;
  final ColorBuilder? colorBuilder;
  final CellTapCallback onTap;

  CustomDataButtonModel({
    this.icon,
    this.iconBuilder,
    this.color,
    this.colorBuilder,
    required this.onTap,
  });
}