class PostModel {
  String? id;
  String? userId;
  String? description;
  String? title;
  List<String>? image;
  List<String>? tags;
  String? eventCategory;
  DateTime? eventStartAt;
  DateTime? eventEndAt;
  String? eventId;
  String? eventDescription;
  int? likes;
  int? noOfComments;
  List<String>? likedUsers;
  List<dynamic>? comments;
  String? createdAt;
  int? v;
  bool? registrationRequired;
  List<dynamic>? registration;
  EventLocation? eventLocation;

  PostModel({
    required this.id,
    required this.userId,
    required this.description,
    required this.title,
    required this.image,
    required this.tags,
    required this.eventCategory,
    required this.eventStartAt,
    required this.eventEndAt,
    required this.eventId,
    required this.eventDescription,
    required this.likes,
    required this.noOfComments,
    required this.likedUsers,
    required this.comments,
    required this.createdAt,
    required this.v,
    required this.registrationRequired,
    required this.registration,
    required this.eventLocation,
  });

  factory PostModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('json must not be null');
    }
    return PostModel(
      id: json['_id'],
      userId: json['userId'],
      description: json['description'],
      title: json['title'],
      image: List<String>.from(json['image'] ?? []),
      tags: List<String>.from(json['tags'] ?? []),
      eventCategory: json['eventCategory'],
      eventStartAt: DateTime.tryParse(json['eventStartAt'] ?? ''),
      eventEndAt: DateTime.tryParse(json['eventEndAt'] ?? ''),
      eventId: json['eventId'],
      eventDescription: json['eventDescription'],
      likes: json['likes'],
      noOfComments: json['noOfComments'],
      likedUsers: List<String>.from(json['likedUsers'] ?? []),
      comments: List<dynamic>.from(json['comments'] ?? []),
      createdAt: json['createdAt'],
      v: json['__v'],
      registrationRequired: json['registrationRequired'],
      registration: List<dynamic>.from(json['registration'] ?? []),
      eventLocation: EventLocation.fromJson(json['eventLocation']),
    );
  }

 Map<String, dynamic> toJson() {
  return {
    '_id': id,
    'userId': userId,
    'description': description,
    'title': title,
    'image': image,
    'tags': tags,
    'eventCategory': eventCategory,
    'eventStartAt': eventStartAt?.toIso8601String(), // Convert DateTime to ISO 8601 string
    'eventEndAt': eventEndAt?.toIso8601String(), // Convert DateTime to ISO 8601 string
    'eventId': eventId,
    'eventDescription': eventDescription,
    'likes': likes,
    'noOfComments': noOfComments,
    'likedUsers': likedUsers,
    'comments': comments,
    'createdAt': createdAt,
    '__v': v,
    'registrationRequired': registrationRequired,
    'registration': registration,
    'eventLocation': eventLocation?.toJson(), // Convert EventLocation to map
  };
}

}

class EventLocation {
  String? type;
  List<double>? coordinates;

  EventLocation({
    required this.type,
    required this.coordinates,
  });

  factory EventLocation.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('json must not be null');
    }
    return EventLocation(
      type: json['type'],
      coordinates: (json['coordinates'] as List<dynamic>?)
          ?.map((dynamic e) => e as double)
          .toList(),
    );
  }
Map<String, dynamic> toJson() {
  return {
    'type': type,
    'coordinates': coordinates,
  };
}

}
