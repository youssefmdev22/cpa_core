import 'custom_data_button_model.dart';

enum CustomColumnType { text, linkText, selectableText, button }

class CustomColumnModel {
  final String column;
  final CustomColumnType type;
  final List<CustomDataButtonModel>? buttons;

  CustomColumnModel({required this.column, required this.type, this.buttons});
}
