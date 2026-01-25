import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'handlers/dropzone_platform_interface.dart';

import '../constants/app_fonts.dart';
import 'custom_drop_pick_image_controller.dart';

class CustomDropPickImage extends FormField<Uint8List?> {
  final CustomDropPickImageController controller;
  final DragOperation? operation;
  final CursorType? cursor;
  final Widget child;

  CustomDropPickImage({
    super.key,
    required this.controller,
    super.validator,
    this.operation,
    this.cursor,
    required this.child,
  }) : super(
         builder: (state) {
           return Stack(
             children: [
               Positioned.fill(
                 child: DropzoneView(
                   operation: operation ?? DragOperation.move,
                   cursor: cursor ?? CursorType.grabbing,
                   mime: controller.allowedMimeTypes
                       .map((extension) => 'image/$extension')
                       .toList(),
                   onCreated: (ctrl) {
                     controller.setDropzoneController(ctrl);
                   },
                   onDropFile: (file) {
                     controller.dropImage(file);
                   },
                 ),
               ),
               GestureDetector(
                 onTap: () {
                   controller.pickImage();
                 },
                 child: Column(
                   children: [
                     child,
                     if (state.hasError)
                       Padding(
                         padding: EdgeInsets.only(top: 8),
                         child: Text(
                           state.errorText!,
                           style: TextStyle(
                             color: Colors.red,
                             fontSize: 14,
                             fontFamily: AppFonts.poppinsFont,
                           ),
                         ),
                       ),
                   ],
                 ),
               ),
             ],
           );
         },
       );
}
