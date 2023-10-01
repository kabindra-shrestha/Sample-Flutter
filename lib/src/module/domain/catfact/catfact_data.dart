import 'package:sample_application/src/module/domain/catfact/catfact.dart';

/// Derived model class used in the UI
class CatFactData {
  CatFactData({
    required this.fact,
    required this.length,
  });

  factory CatFactData.from(CatFact catFact) {
    return CatFactData(
      fact: catFact.fact,
      length: catFact.length,
    );
  }

  final String fact;
  final int length;
}
