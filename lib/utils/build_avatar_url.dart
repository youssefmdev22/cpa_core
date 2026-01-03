String buildImageUrl({String? fileName, String? customBaseUrl}) {
  final String name = fileName?.isNotEmpty == true ? fileName! : "avatar1.png";
  final String defaultBaseUrl =
      customBaseUrl ?? "https://zlunix.com/api/v1/uploads/avatar/";
  return "$defaultBaseUrl$name";
}
