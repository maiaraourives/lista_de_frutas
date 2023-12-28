class FrutaDatabaseModel {
  FrutaDatabaseModel({required this.title, required this.iconPath});

  final String title;
  final String iconPath;

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'iconPath': iconPath,
    };
  }
}
