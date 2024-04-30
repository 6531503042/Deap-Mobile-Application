class Doctor {
  final int? id;
  final String name;
  final String experience;
  final String specialization;
  final String description;
  final String reviews;
  final double rating;
  final String image;

  //foreign - Key
  final int userId;

  Doctor({
    required this.id,
    required this.name,
    required this.experience,
    required this.specialization,
    required this.description,
    required this.reviews,
    required this.rating,
    required this.image,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'experience': experience,
      'specialization': specialization,
      'description': description,
      'reviews': reviews,
      'rating': rating,
      'img_url': image,
      'user_id': userId
    };
  }

  factory Doctor.fromMap(Map<String, dynamic> map) {
    return Doctor(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      experience: map['experience'].toString(),
      specialization: map['specialization'] ?? '',
      description: map['description'] ?? '',
      reviews: map['reviews'] ?? '',
      rating: map['rating']?.toDouble() ?? 0.0,
      image: map['img_url']?.toString() ?? '',
      userId: map["user_id"]?.toInt() ?? 0,
    );

    //   String toString() {
    //     return  "Doctor(id: $id, name: $name, experience: $experience, specialization: $specialization, description: $description, reviews: $reviews, image: $img_url,
    //   }
  }
}
