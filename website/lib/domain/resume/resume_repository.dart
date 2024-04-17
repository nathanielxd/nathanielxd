import 'dart:convert';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:nathanielxd/domain/resume/resume.dart';
import 'package:yaml/yaml.dart';

class ResumeRepository {
  ResumeRepository({required this.firebaseStorage});

  final FirebaseStorage firebaseStorage;
  Resume? _currentResume;
  String? _currentPictureURL;
  final Map<String, String> _currentIcons = {};

  Resume? get currentResume => _currentResume;

  String? get currentPictureURL => _currentPictureURL;

  Map<String, String> get currentIcons => _currentIcons;

  Future<Resume> get() async {
    final data = await firebaseStorage.ref('/resume.yaml').getData();
    final yaml = _mapFromRaw(data!);
    return _currentResume = Resume.fromMap(yaml);
  }

  Future<String> getProfilePicture() async {
    return _currentPictureURL =
        await firebaseStorage.ref('/headshot.png').getDownloadURL();
  }

  Future<Map<String, String>> getIcons() async {
    final result = await firebaseStorage.ref('/icons/').listAll();
    for (final icon in result.items) {
      _currentIcons[icon.fullPath] = await icon.getDownloadURL();
    }
    return _currentIcons;
  }

  Map<String, dynamic> _mapFromRaw(Uint8List rawData) {
    return jsonDecode(jsonEncode(loadYaml(utf8.decode(rawData.toList()))))
        as Map<String, dynamic>;
  }
}
