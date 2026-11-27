import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:trndy_stor/Entity/home_entity.dart';

class ProdactRespons {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ProdactsModel>> getProdactFromBackend() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection("jacet2").get();

      return snapshot.docs.map((doc) {
        return ProdactsModel.fromFirestore(
          doc.data() as Map<String, dynamic>,
          doc.id,
        );
      }).toList();
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }
}
