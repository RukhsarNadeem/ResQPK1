class ImagesModels {
  final String image;
  final String description;
  final String title;
  final String stepNumber;
  final String id;

  ImagesModels({required this.image, required this.description,required this.title, required this.stepNumber,required this.id});

  factory ImagesModels.fromJson(Map<String, dynamic> json) {
    return ImagesModels(
      id: json['id'],
      image: json['image'],
      description: json['description'],
      title: json['title'],
      stepNumber: json['stepNumber']
    );
  }
}