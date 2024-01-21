import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  const Profile({
    required this.network,
    required this.username,
    required this.url,
  });

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      network: map['network'] as String,
      username: map['username'] as String,
      url: map['url'] as String,
    );
  }

  final String network;
  final String username;
  final String url;

  Profile copyWith({
    String? network,
    String? username,
    String? url,
  }) {
    return Profile(
      network: network ?? this.network,
      username: username ?? this.username,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'network': network,
      'username': username,
      'url': url,
    };
  }

  @override
  List<Object> get props => [network, username, url];
}
