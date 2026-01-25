import 'package:flutter/foundation.dart';
import 'handlers/dropzone_platform_interface.dart';
import 'package:image_picker/image_picker.dart';

class CustomDropPickImageController extends ChangeNotifier {
  late final DropzoneViewController _dropzoneController;
  final ImagePicker _picker = ImagePicker();

  Uint8List? _imageBytes;
  String? _fileName;
  int? _fileSize;

  List<String> allowedMimeTypes = const ["png", "jpeg", "jpg"];

  void setDropzoneController(DropzoneViewController controller) {
    _dropzoneController = controller;
  }

  Future<void> dropImage(DropzoneFileInterface droppedImage) async {
    _fileName = await _dropzoneController.getFilename(droppedImage);
    _imageBytes = await _dropzoneController.getFileData(droppedImage);
    _fileSize = droppedImage.size;
    notifyListeners();
  }

  Future<void> pickImage({ImageSource source = ImageSource.gallery}) async {
    final XFile? pickedImage = await _picker.pickImage(source: source);
    if (pickedImage != null) {
      final extension = pickedImage.name.split('.').last.toLowerCase();
      if (!allowedMimeTypes.contains(extension)) return;
      _fileName = pickedImage.name;
      _imageBytes = await pickedImage.readAsBytes();
      _fileSize = await pickedImage.length();
      notifyListeners();
    }
  }

  Uint8List? get imageBytes => _imageBytes;

  String? get fileName => _fileName;

  int? get fileSize => _fileSize;

  void clear() {
    _imageBytes = null;
    _fileName = null;
    _fileSize = null;
    notifyListeners();
  }
}
