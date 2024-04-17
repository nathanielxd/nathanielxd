import 'package:equatable/equatable.dart';
import 'package:nathanielxd/domain/portfolio/portfolio.dart';

class PortfolioProject extends Equatable {
  const PortfolioProject({
    required this.name,
    required this.icon,
    required this.description,
    this.tags,
    this.urls,
    this.screenshots,
  });

  factory PortfolioProject.fromMap(Map<String, dynamic> map) {
    return PortfolioProject(
      name: map['name'] as String,
      icon: map['icon'] as String,
      description: map['description'] as String,
      tags: map['tags'] != null
          ? (map['tags'] as List).map((e) => e as String).toList()
          : null,
      urls: map['urls'] != null
          ? (map['urls'] as List)
              .map(
                (x) => PortfolioProjectUrl.fromMap(x as Map<String, dynamic>),
              )
              .toList()
          : null,
      screenshots: map['screenshots'] != null
          ? (map['screenshots'] as List).map((e) => e as String).toList()
          : null,
    );
  }
  final String name;
  final String icon;
  final String description;
  final List<String>? tags;
  final List<PortfolioProjectUrl>? urls;
  final List<String>? screenshots;

  PortfolioProject copyWith({
    String? name,
    String? icon,
    String? description,
    List<String>? tags,
    List<PortfolioProjectUrl>? urls,
    List<String>? screenshots,
  }) {
    return PortfolioProject(
      name: name ?? this.name,
      icon: icon ?? this.icon,
      description: description ?? this.description,
      tags: tags ?? this.tags,
      urls: urls ?? this.urls,
      screenshots: screenshots ?? this.screenshots,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'icon': icon,
      'description': description,
      'tags': tags,
      'urls': urls?.map((x) => x.toMap()).toList(),
      'screenshots': screenshots,
    };
  }

  @override
  List<Object?> get props {
    return [
      name,
      icon,
      description,
      tags,
      urls,
      screenshots,
    ];
  }
}
