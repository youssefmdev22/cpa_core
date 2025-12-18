import 'package:flutter/cupertino.dart';

import 'custom_data_button_model.dart';
import 'custom_data_grid_model.dart';

typedef CustomDataChildBuilder = Widget Function(int index, CustomDataGridModel row);

enum CustomColumnType { text, linkText, selectableText, button, custom }

class CustomColumnModel {
  final String column;
  final CustomColumnType type;
  final List<CustomDataButtonModel>? buttons;
  final Map<int, TextStyle>? columnTextStyle;
  final CustomDataChildBuilder? childBuilder;

  CustomColumnModel({
    required this.column,
    required this.type,
    this.buttons,
    this.columnTextStyle,
    this.childBuilder,
  });
}
