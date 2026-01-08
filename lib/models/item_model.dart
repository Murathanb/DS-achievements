class ItemModel {
  final String id; // 🔥 Firestore document ID
  final String title;
  final List<String> subItems;
  final String imagePath; // 🔥 EKLENDİ


  bool isChecked;
  List<bool> subItemsChecked;
  bool isExpanded;

  ItemModel({
    required this.id,
    required this.title,
    required this.subItems,
    required this.isChecked,
    required this.subItemsChecked,
    required this.imagePath,
    
    this.isExpanded = false,
  });

  /// 🔹 Firestore'a yazmak için
  Map<String, dynamic> toFirestore() {
    return {
      'isChecked': isChecked,
      'subChecked': subItemsChecked,
    };
  }

  /// 🔹 Firestore'dan okumak için
  void loadFromFirestore(Map<String, dynamic> data) {
    isChecked = data['isChecked'] ?? false;

    final List list = data['subChecked'] ?? [];
    subItemsChecked = list.map((e) => e as bool).toList();
  }
}
