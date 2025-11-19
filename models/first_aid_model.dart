import 'dart:convert';

class FirstAidModel {
  final String id;
  final String name;
  final VideoData video;
  final List<FirstAidStep> steps;

  FirstAidModel({
    required this.id,
    required this.name,
    required this.video,
    required this.steps,
  });

  factory FirstAidModel.fromJson(Map<String, dynamic> json) {
    return FirstAidModel(
      id: json['id'],
      name: json['name'],
      video: VideoData.fromJson(json['video']),
      steps: (json['steps'] as List)
          .map((e) => FirstAidStep.fromJson(e))
          .toList(),
    );
  }
}

class VideoData {
  final String videoId;
  final String title;

  VideoData({required this.videoId, required this.title});

  factory VideoData.fromJson(Map<String, dynamic> json) {
    return VideoData(
      videoId: json['videoId'],
      title: json['title'],
    );
  }
}

class FirstAidStep {
  final int stepNumber;
  final String title;
  final String description;
  final String image;

  FirstAidStep({
    required this.stepNumber,
    required this.title,
    required this.description,
    required this.image,
  });

  factory FirstAidStep.fromJson(Map<String, dynamic> json) {
    return FirstAidStep(
      stepNumber: json['stepNumber'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
    );
  }
}
