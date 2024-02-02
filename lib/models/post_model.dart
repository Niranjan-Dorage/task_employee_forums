class PostModel {
  String id;
  String userId;
  String description;
  String title;
  List<String> image;
  List<dynamic> tags;
  String eventCategory;
  String eventStartAt;
  String eventEndAt;
  String eventId;
  String eventDescription;
  int likes;
  int noOfComments;
  List<String> likedUsers;
  List<dynamic> comments;
  String createdAt;
  int v;
  bool registrationRequired;
  List<dynamic> registration;
  EventLocation eventLocation;

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

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['_id'],
      userId: json['userId'],
      description: json['description'],
      title: json['title'],
      image: List<String>.from(json['image']),
      tags: List<dynamic>.from(json['tags']),
      eventCategory: json['eventCategory'],
      eventStartAt: json['eventStartAt'],
      eventEndAt: json['eventEndAt'],
      eventId: json['eventId'],
      eventDescription: json['eventDescription'],
      likes: json['likes'],
      noOfComments: json['noOfComments'],
      likedUsers: List<String>.from(json['likedUsers']),
      comments: List<dynamic>.from(json['comments']),
      createdAt: json['createdAt'],
      v: json['__v'],
      registrationRequired: json['registrationRequired'],
      registration: List<dynamic>.from(json['registration']),
      eventLocation: EventLocation.fromJson(json['eventLocation']),
    );
  }
}

class EventLocation {
  String type;
  List<double> coordinates;

  EventLocation({
    required this.type,
    required this.coordinates,
  });

  factory EventLocation.fromJson(Map<String, dynamic> json) {
    return EventLocation(
      type: json['type'],
      coordinates:
          List<double>.from(json['coordinates'].map((x) => x.toDouble())),
    );
  }
}
