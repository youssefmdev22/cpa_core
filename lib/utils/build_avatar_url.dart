String buildImageUrl({String? fileName, String? customBaseUrl}) {
  final String name = fileName?.isNotEmpty == true ? fileName! : "avatar1.png";
  final String defaultBaseUrl =
      customBaseUrl ?? "http://localhost:3000/api/v1/uploads/avatar/";
  return "$defaultBaseUrl$name";
}
