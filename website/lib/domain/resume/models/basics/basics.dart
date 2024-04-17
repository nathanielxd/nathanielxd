import 'package:equatable/equatable.dart';
import 'package:nathanielxd/domain/resume/resume.dart';

class Basics extends Equatable {
  const Basics({
    required this.name,
    required this.label,
    required this.email,
    required this.phone,
    required this.url,
    required this.summary,
    required this.location,
    required this.profiles,
  });

  factory Basics.fromMap(Map<String, dynamic> map) {
    return Basics(
      name: map['name'] as String,
      label: map['label'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      url: map['url'] as String,
      summary: map['summary'] as String,
      location: Location.fromMap(map['location'] as Map<String, dynamic>),
      profiles: List<Profile>.from(
        (map['profiles'] as List).map<Profile>(
          (x) => Profile.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  final String name;
  final String label;
  final String email;
  final String phone;
  final String url;
  final String summary;
  final Location location;
  final List<Profile> profiles;

  Basics copyWith({
    String? name,
    String? label,
    String? email,
    String? phone,
    String? url,
    String? summary,
    Location? location,
    List<Profile>? profiles,
  }) {
    return Basics(
      name: name ?? this.name,
      label: label ?? this.label,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      url: url ?? this.url,
      summary: summary ?? this.summary,
      location: location ?? this.location,
      profiles: profiles ?? this.profiles,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'label': label,
      'email': email,
      'phone': phone,
      'url': url,
      'summary': summary,
      'location': location.toMap(),
      'profiles': profiles.map((x) => x.toMap()).toList(),
    };
  }

  @override
  List<Object> get props {
    return [
      name,
      label,
      email,
      phone,
      url,
      summary,
      location,
      profiles,
    ];
  }
}
