class ReviewModel {
  final String id;
  final String userId;
  final String userName;
  final String storeId;
  final double rating;
  final String comment;

  ReviewModel({
    required this.id,
    required this.userId,
    required this.userName,
    required this.storeId,
    required this.rating,
    required this.comment,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      userName: json['userName'] ?? '',
      storeId: json['storeId'] ?? '',
      rating: (json['rating'] ?? 0.0).toDouble(),
      comment: json['comment'] ?? '',
    );
  }
}
