
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  String get _uid => _auth.currentUser!.uid;

  /// ✅ Checkbox ve subCheckbox durumlarını kaydet
  Future<void> saveItem(
    String itemId,
    bool isChecked,
    List<bool> subChecked,
  ) async {
    await _db
        .collection('checklists')
        .doc(_uid)
        .collection('items')
        .doc(itemId)
        .set({
      'isChecked': isChecked,
      'subChecked': subChecked,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  /// ✅ Belirli bir item’ı yükle
  Future<Map<String, dynamic>?> getItem(String itemId) async {
    final doc = await _db
        .collection('checklists')
        .doc(_uid)
        .collection('items')
        .doc(itemId)
        .get();
    return doc.exists ? doc.data() : null;
  }
}
