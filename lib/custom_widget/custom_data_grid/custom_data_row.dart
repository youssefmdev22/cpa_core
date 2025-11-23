import 'package:flutter/material.dart';

import 'custom_cell_widget.dart';
import 'custom_column_model.dart';
import 'custom_data_grid_model.dart';

class CustomDataRow extends TableRow {
  CustomDataRow({
    required List<CustomColumnModel> columns,
    required CustomDataGridModel row,
    required int index,
    required bool isEditable,
  }) : super(
         key: ValueKey(row.id),
         children: columns
             .map(
               (c) => CustomCellWidget(
                 cell: isEditable ? row.getNotifier(c.column) : null,
                 value: row.cells[c.column]!,
                 column: c,
                 index: index,
                 row: row,
                 isEditable: isEditable,
               ),
             )
             .toList(),
       );
}
