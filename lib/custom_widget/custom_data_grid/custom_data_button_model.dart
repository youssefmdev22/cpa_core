import 'package:flutter/cupertino.dart';

import 'custom_data_grid_model.dart';

typedef CellTapCallback = void Function(int index, CustomDataGridModel row);

class CustomDataButtonModel {
  final IconData icon;
  final Color color;
  final CellTapCallback onTap;

  CustomDataButtonModel({required this.icon, required this.color, required this.onTap});
}