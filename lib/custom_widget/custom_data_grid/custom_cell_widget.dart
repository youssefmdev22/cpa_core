import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import 'custom_column_model.dart';
import 'custom_data_button_model.dart';
import 'custom_data_grid_model.dart';

class CustomCellWidget extends StatelessWidget {
  final dynamic value;
  final ValueNotifier<String>? cell;
  final CustomColumnModel column;
  final CustomDataGridModel row;
  final int index;
  final bool isEditable;

  const CustomCellWidget({
    super.key,
    required this.value,
    required this.cell,
    required this.column,
    required this.row,
    required this.index,
    required this.isEditable,
  });

  @override
  Widget build(BuildContext context) {
    return isEditable
        ? ValueListenableBuilder(
            valueListenable: cell!,
            builder: (context, val, _) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildCell(context, val),
              );
            },
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildCell(context, value),
          );
  }

  Widget _buildCell(BuildContext context, dynamic value) {
    switch (column.type) {
      case CustomColumnType.linkText:
        return _linkTextCell(
          context: context,
          value: value,
          buttons: column.buttons!,
        );

      case CustomColumnType.selectableText:
        return _selectableTextCell(context: context, value: value);

      case CustomColumnType.button:
        return _buttonCell(
          context: context,
          value: value,
          buttons: column.buttons!,
        );

      case CustomColumnType.custom:
        return column.childBuilder?.call(index, row) ?? SizedBox();

      default:
        return _textCell(context: context, value: value);
    }
  }

  Widget _textCell({required BuildContext context, required dynamic value}) {
    return Text(
      textAlign: TextAlign.center,
      value.toString(),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: column.columnTextStyle?[1] ??
          context.bodySmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
    );
  }

  Widget _linkTextCell({
    required BuildContext context,
    required dynamic value,
    required List<CustomDataButtonModel> buttons,
  }) {
    return TextButton(
      onPressed: () => buttons[0].onTap(index, row),
      child: Text(
        value.toString(),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: column.columnTextStyle?[1] ??
            context.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.blue,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.blue,
            ),
      ),
    );
  }

  Widget _selectableTextCell({
    required BuildContext context,
    required dynamic value,
  }) {
    return SelectableText(
      textAlign: TextAlign.center,
      value.toString(),
      maxLines: 1,
      style: column.columnTextStyle?[1] ??
          context.bodySmall?.copyWith(
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w600,
          ),
    );
  }

  Widget _buttonCell({
    required BuildContext context,
    required dynamic value,
    required List<CustomDataButtonModel> buttons,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: buttons
          .map(
            (b) {
              final icon = b.iconBuilder?.call(index, row) ?? b.icon ?? Icons.error;
              final color = b.colorBuilder?.call(index, row) ?? b.color ?? Colors.grey;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Material(
                  color: Colors.transparent,
                  child: Ink(
                    decoration: ShapeDecoration(
                      color: color,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                    ),
                    child: IconButton(
                      style: IconButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                      ),
                      icon: Icon(icon, size: 18),
                      color: AppColors.white,
                      onPressed: () {
                        b.onTap(index, row);
                      },
                    ),
                  ),
                ),
              );
            },
          )
          .toList(),
    );
  }
}
