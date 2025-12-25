class Doctor {
  final int id;
  final String name;
  final String specialization;
  final double rating;
  final String image;
  final Map<String, List<String>> slots;

  Doctor({
    required this.id,
    required this.name,
    required this.specialization,
    required this.rating,
    required this.image,
    required this.slots,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      name: json['name'],
      specialization: json['specialization'],
      rating: (json['rating'] as num).toDouble(),
      image: json['image'],
      slots: Map<String, List<String>>.from(
        json['slots'].map(
          (key, value) => MapEntry(key, List<String>.from(value)),
        ),
      ),
    );
  }
}
