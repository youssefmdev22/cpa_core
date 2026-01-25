import 'dart:typed_data';
import 'package:flutter/material.dart';

// Stub Types
class DropzoneViewController {
  Future<String> getFilename(dynamic file) async => '';
  Future<Uint8List> getFileData(dynamic file) async => Uint8List(0);
}

class DropzoneFileInterface {
  final int size = 0;
}

enum DragOperation { copy, move, link, copyLink, copyMove, linkMove, all, none }

enum CursorType {
  alias,
  allScroll,
  cell,
  contextMenu,
  colResize,
  copy,
  crosshair,
  defaultCursor,
  eResize,
  ewResize,
  grab,
  grabbing,
  help,
  move,
  nResize,
  neResize,
  neswResize,
  nsResize,
  nwResize,
  nwseResize,
  noDrop,
  none,
  notAllowed,
  pointer,
  progress,
  rowResize,
  sResize,
  seResize,
  swResize,
  text,
  verticalText,
  wResize,
  wait,
  zoomIn,
  zoomOut,
}

// Stub Widget
class DropzoneView extends StatelessWidget {
  final DragOperation operation;
  final CursorType cursor;
  final List<String>? mime;
  final Function(DropzoneViewController)? onCreated;
  final Function(dynamic)? onDropFile;

  const DropzoneView({
    super.key,
    required this.operation,
    required this.cursor,
    this.mime,
    this.onCreated,
    this.onDropFile,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
