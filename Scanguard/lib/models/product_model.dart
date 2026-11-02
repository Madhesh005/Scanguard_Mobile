class ProductModel {
  final String id;
  final String storeId;
  final String name;
  final String barcode;
  final double price;
  final String description;
  final String imageUrl;
  final int stock;

  ProductModel({
    required this.id,
    required this.storeId,
    required this.name,
    required this.barcode,
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.stock,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? '',
      storeId: json['storeId'] ?? '',
      name: json['name'] ?? '',
      barcode: json['barcode'] ?? '',
      price: (json['price'] ?? 0.0).toDouble(),
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      stock: json['stock'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'storeId': storeId,
      'name': name,
      'barcode': barcode,
      'price': price,
      'description': description,
      'imageUrl': imageUrl,
      'stock': stock,
    };
  }
}
