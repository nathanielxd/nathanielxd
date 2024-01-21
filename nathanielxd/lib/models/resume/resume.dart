import 'package:equatable/equatable.dart';
import 'package:nathanielxd/models/models.dart';

class Resume extends Equatable {
  const Resume({
    required this.basics,
    this.work,
    this.awards,
    this.projects,
  });

  factory Resume.fromMap(Map<String, dynamic> map) {
    return Resume(
      basics: Basics.fromMap(map['basics'] as Map<String, dynamic>),
      work: map['work'] != null
          ? List<Workplace>.from(
              (map['work'] as List).map<Workplace?>(
                (x) => Workplace.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      awards: map['awards'] != null
          ? List<Award>.from(
              (map['awards'] as List).map<Award?>(
                (x) => Award.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      projects: map['projects'] != null
          ? List<Project>.from(
              (map['projects'] as List).map<Project?>(
                (x) => Project.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }
  final Basics basics;
  final List<Workplace>? work;
  final List<Award>? awards;
  final List<Project>? projects;

  Resume copyWith({
    Basics? basics,
    List<Workplace>? work,
    List<Award>? awards,
    List<Project>? projects,
  }) {
    return Resume(
      basics: basics ?? this.basics,
      work: work ?? this.work,
      awards: awards ?? this.awards,
      projects: projects ?? this.projects,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'basics': basics.toMap(),
      'work': work?.map((x) => x.toMap()).toList(),
      'awards': awards?.map((x) => x.toMap()).toList(),
      'projects': projects?.map((x) => x.toMap()).toList(),
    };
  }

  @override
  List<Object?> get props => [basics, work, awards, projects];
}
