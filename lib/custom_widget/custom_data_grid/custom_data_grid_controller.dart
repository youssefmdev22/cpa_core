import 'package:flutter/material.dart';

import 'custom_column_model.dart';
import 'custom_data_grid_model.dart';

class CustomDataGridController extends ChangeNotifier {
  final List<CustomColumnModel> columns;
  final List<CustomDataGridModel> _rows = [];

  CustomDataGridController({
    required this.columns,
    List<CustomDataGridModel>? initialRows,
  }) {
    if (initialRows != null) {
      _rows.addAll(initialRows);
    }
  }

  List<CustomDataGridModel> get rows => List.unmodifiable(_rows);

  void addRow(CustomDataGridModel row) {
    _rows.add(row);
    notifyListeners();
  }

  void removeRow(String id) {
    final row = getRow(id);
    if (row != null) {
      row.dispose();
      _rows.remove(row);
      notifyListeners();
    }
  }

  CustomDataGridModel? getRow(String id) {
    return _rows.firstWhere((r) => r.id == id);
  }

  void updateRow(String id, Map<String, dynamic> values) {
    final row = getRow(id);
    if (row != null) {
      row.updateRow(values);
    }
  }

  void updateCell(String rowId, String column, dynamic value) {
    final row = getRow(rowId);
    row?.updateCell(column, value);
  }

  void clear() {
    for (var row in _rows) {
      row.dispose();
    }
    _rows.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    clear();
    super.dispose();
  }
}

