import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';

import 'custom_data_grid_controller.dart';
import 'custom_data_row.dart';

class CustomDataGrid extends StatelessWidget {
  final CustomDataGridController controller;
  final bool isEditable;

  const CustomDataGrid({
    super.key,
    required this.controller,
    this.isEditable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      children: [
        TableRow(
          children: controller.columns
              .map(
                (c) => TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      c.column.toUpperCase(),
                      style: context.bodyLarge,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        for (int i = 0; i < controller.rows.length; i++)
          CustomDataRow(
            columns: controller.columns,
            row: controller.rows[i],
            index: i,
            isEditable: isEditable,
          ),
      ],
    );
  }
}
