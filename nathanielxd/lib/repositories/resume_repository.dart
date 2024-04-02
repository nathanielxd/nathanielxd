import 'dart:convert';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:nathanielxd/models/models.dart';
import 'package:yaml/yaml.dart';

class ResumeRepository {
  ResumeRepository({required this.firebaseStorage});

  final FirebaseStorage firebaseStorage;
  Resume? _currentResume;
  String? _currentPictureURL;

  Resume? get currentResume => _currentResume;

  String? get currentPictureURL => _currentPictureURL;

  Future<Resume> get() async {
    final data = await firebaseStorage.ref('/resume.yaml').getData();
    final yaml = _mapFromRaw(data!);
    return _currentResume = Resume.fromMap(yaml);
  }

  Future<String> getProfilePicture() async {
    return _currentPictureURL =
        await firebaseStorage.ref('/headshot.png').getDownloadURL();
  }

  Map<String, dynamic> _mapFromRaw(Uint8List rawData) {
    return jsonDecode(jsonEncode(loadYaml(utf8.decode(rawData.toList()))))
        as Map<String, dynamic>;
  }
}
