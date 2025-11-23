import 'package:flutter/material.dart';

class CustomDataGridModel {
  final String id;
  final Map<String, String> cells;
  final Map<String, ValueNotifier<String>> _notifiers = {};

  CustomDataGridModel({required this.id, required this.cells});

  ValueNotifier<String> getNotifier(String column) {
    if (_notifiers.containsKey(column)) {
      return _notifiers[column]!;
    }

    final notifier = ValueNotifier(cells[column]!);
    _notifiers[column] = notifier;
    return notifier;
  }

  void updateCell(String column, String value) {
    cells[column] = value;

    if (_notifiers.containsKey(column)) {
      _notifiers[column]!.value = value;
    }
  }

  void updateRow(Map<String, String> newValues) {
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
