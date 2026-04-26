import 'package:flutter/material.dart';

class CustomDataGridModel {
  final String id;
  final Map<String, dynamic> cells;
  final Map<String, ValueNotifier<String>> _notifiers = {};

  CustomDataGridModel({required this.id, required this.cells});

  ValueNotifier<String> getNotifier(String column) {
    if (_notifiers.containsKey(column)) {
      return _notifiers[column]!;
    }

    final value = cells[column];
    final notifier = ValueNotifier(value is String ? value : value.toString());
    _notifiers[column] = notifier;
    return notifier;
  }

  void updateCell(String column, dynamic value) {
    cells[column] = value;

    if (_notifiers.containsKey(column)) {
      _notifiers[column]!.value = value is String ? value : value.toString();
    }
  }

  void updateRow(Map<String, dynamic> newValues) {
    for (var entry in newValues.entries) {
      updateCell(entry.key, entry.value);
    }
  }

  void dispose() {
    if (_notifiers.isNotEmpty) {
      for (var notifier in _notifiers.values) {
        notifier.dispose();
      }
      _notifiers.clear();
    }
  }
}
