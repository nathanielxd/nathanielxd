import 'package:equatable/equatable.dart';

class Workplace extends Equatable {
  const Workplace({
    this.name,
    this.position,
    this.url,
    this.startDate,
    this.endDate,
    this.summary,
    this.highlights,
  });

  factory Workplace.fromMap(Map<String, dynamic> map) {
    return Workplace(
      name: map['name'] != null ? map['name'] as String : null,
      position: map['position'] != null ? map['position'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
      startDate: map['startDate'] != null
          ? DateTime.tryParse(map['startDate'] as String)
          : null,
      endDate: map['endDate'] != null
          ? DateTime.tryParse(map['endDate'] as String)
          : null,
      summary: map['summary'] != null ? map['summary'] as String : null,
      highlights: map['highlights'] != null
          ? List<String>.from(map['highlights'] as List)
          : null,
    );
  }

  final String? name;
  final String? position;
  final String? url;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? summary;
  final List<String>? highlights;

  Workplace copyWith({
    String? name,
    String? position,
    String? url,
    DateTime? startDate,
    DateTime? endDate,
    String? summary,
    List<String>? highlights,
  }) {
    return Workplace(
      name: name ?? this.name,
      position: position ?? this.position,
      url: url ?? this.url,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      summary: summary ?? this.summary,
      highlights: highlights ?? this.highlights,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'position': position,
      'url': url,
      'startDate': startDate?.toString(),
      'endDate': endDate?.toString(),
      'summary': summary,
      'highlights': highlights,
    };
  }

  @override
  List<Object?> get props {
    return [
      name,
      position,
      url,
      startDate,
      endDate,
      summary,
      highlights,
    ];
  }
}
