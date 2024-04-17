import 'dart:convert';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:nathanielxd/domain/portfolio/portfolio.dart';
import 'package:yaml/yaml.dart';

class PortfolioRepository {
  PortfolioRepository({required this.firebaseStorage});

  final FirebaseStorage firebaseStorage;

  List<PortfolioProject>? _currentPortfolio;
  final Map<String, String> _currentMedia = {};

  List<PortfolioProject>? get currentPortfolio => _currentPortfolio;

  Map<String, String> get currentMedia => _currentMedia;

  Future<List<PortfolioProject>> get() async {
    final data = await firebaseStorage.ref('/portfolio.yaml').getData();
    final yaml = _mapFromRaw(data!);
    final p0 = yaml
        .map((e) => PortfolioProject.fromMap(e as Map<String, dynamic>))
        .toList();
    _currentPortfolio = p0;
    return p0;
  }

  Future<void> getMedia([String? path = '/projects/']) async {
    final result = await firebaseStorage.ref(path).listAll();
    for (final item in result.items) {
      _currentMedia[item.fullPath] = await item.getDownloadURL();
    }
    for (final prefix in result.prefixes) {
      await getMedia(prefix.fullPath);
    }
  }

  List<dynamic> _mapFromRaw(Uint8List rawData) {
    return jsonDecode(jsonEncode(loadYaml(utf8.decode(rawData.toList()))))
        as List<dynamic>;
  }
}
