import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_application/src/module/data/catfact_repository.dart';
import 'package:sample_application/src/module/domain/catfact/catfact_data.dart';

final catFactProvider =
    FutureProvider.autoDispose<CatFactData>((ref) async {
  final catFact =
      await ref.watch(catFactRepositoryProvider).getCatFact();
  return CatFactData.from(catFact);
});
