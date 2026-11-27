class ProdactsModel {
  final String id;
  final String name;
  final String descrption;
  final String category;
  final double price;
  final List<String> images;

  ProdactsModel({
    required this.id,
    required this.name,
    required this.descrption,
    required this.category,
    required this.price,
    required this.images,
  });

  factory ProdactsModel.fromFirestore(
      Map<String, dynamic> json, String documentId) {
    return ProdactsModel(
        id: documentId,
        name: json["name"] ?? "wieh out name",
        descrption: json["descrption"] ?? "",
        category: json["category"] ?? "",
        price: (json["price"] is num) ? (json["price"] as num).toDouble() : 0.0,
        images:
            json["images"] != null ? List<String>.from(json["images"]) : []);
  }
}
