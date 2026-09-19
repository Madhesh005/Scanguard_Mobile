class StoreModel {
  final String id;
  final String name;
  final String location;
  final String imageUrl;

  StoreModel({
    required this.id,
    required this.name,
    required this.location,
    required this.imageUrl,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      location: json['location'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'imageUrl': imageUrl,
    };
  }
}
