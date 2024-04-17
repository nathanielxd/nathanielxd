import 'package:equatable/equatable.dart';

class PortfolioProjectUrl extends Equatable {
  const PortfolioProjectUrl({
    required this.label,
    required this.url,
  });

  factory PortfolioProjectUrl.fromMap(Map<String, dynamic> map) {
    return PortfolioProjectUrl(
      label: map['label'] as String,
      url: map['url'] as String,
    );
  }
  final String label;
  final String url;

  PortfolioProjectUrl copyWith({
    String? label,
    String? url,
  }) {
    return PortfolioProjectUrl(
      label: label ?? this.label,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'label': label,
      'url': url,
    };
  }

  @override
  List<Object> get props => [label, url];
}
