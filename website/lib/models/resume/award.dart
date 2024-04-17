import 'package:equatable/equatable.dart';

class Award extends Equatable {
  const Award({
    this.title,
    this.date,
    this.awarder,
    this.summary,
  });

  factory Award.fromMap(Map<String, dynamic> map) {
    return Award(
      title: map['title'] != null ? map['title'] as String : null,
      date:
          map['date'] != null ? DateTime.tryParse(map['date'] as String) : null,
      awarder: map['awarder'] != null ? map['awarder'] as String : null,
      summary: map['summary'] != null ? map['summary'] as String : null,
    );
  }

  final String? title;
  final DateTime? date;
  final String? awarder;
  final String? summary;

  Award copyWith({
    String? title,
    DateTime? date,
    String? awarder,
    String? summary,
  }) {
    return Award(
      title: title ?? this.title,
      date: date ?? this.date,
      awarder: awarder ?? this.awarder,
      summary: summary ?? this.summary,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'date': date?.toString(),
      'awarder': awarder,
      'summary': summary,
    };
  }

  @override
  List<Object?> get props => [title, date, awarder, summary];
}
