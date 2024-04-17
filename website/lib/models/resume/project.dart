import 'package:equatable/equatable.dart';

class Project extends Equatable {
  const Project({
    this.name,
    this.startDate,
    this.endDate,
    this.description,
    this.highlights,
    this.url,
    this.image,
  });

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      name: map['name'] != null ? map['name'] as String : null,
      startDate: map['startDate'] != null
          ? DateTime.tryParse(map['startDate'] as String)
          : null,
      endDate: map['endDate'] != null
          ? DateTime.tryParse(map['endDate'] as String)
          : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      highlights: map['highlights'] != null
          ? List<String>.from(map['highlights'] as List)
          : null,
      url: map['url'] as String?,
      image: map['image'] as String?,
    );
  }

  final String? name;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? description;
  final List<String>? highlights;
  final String? url;
  final String? image;

  Project copyWith({
    String? name,
    DateTime? startDate,
    DateTime? endDate,
    String? description,
    List<String>? highlights,
    String? url,
    String? image,
  }) {
    return Project(
      name: name ?? this.name,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      description: description ?? this.description,
      highlights: highlights ?? this.highlights,
      url: url ?? this.url,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'startDate': startDate?.millisecondsSinceEpoch,
      'endDate': endDate?.millisecondsSinceEpoch,
      'description': description,
      'highlights': highlights,
      'url': url,
      'image': image,
    };
  }

  @override
  List<Object?> get props {
    return [
      name,
      startDate,
      endDate,
      description,
      highlights,
      url,
      image,
    ];
  }
}
