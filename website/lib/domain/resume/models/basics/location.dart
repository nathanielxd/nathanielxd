import 'package:equatable/equatable.dart';

class Location extends Equatable {
  const Location({
    this.address,
    this.postalCode,
    this.city,
    this.countryCode,
    this.region,
  });

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      address: map['address'] as String?,
      postalCode: map['postalCode'] as String?,
      city: map['city'] as String?,
      countryCode: map['countryCode'] as String?,
      region: map['region'] as String?,
    );
  }

  final String? address;
  final String? postalCode;
  final String? city;
  final String? countryCode;
  final String? region;

  Location copyWith({
    String? address,
    String? postalCode,
    String? city,
    String? countryCode,
    String? region,
  }) {
    return Location(
      address: address ?? this.address,
      postalCode: postalCode ?? this.postalCode,
      city: city ?? this.city,
      countryCode: countryCode ?? this.countryCode,
      region: region ?? this.region,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'address': address,
      'postalCode': postalCode,
      'city': city,
      'countryCode': countryCode,
      'region': region,
    };
  }

  @override
  List<Object?> get props {
    return [
      address,
      postalCode,
      city,
      countryCode,
      region,
    ];
  }
}
