import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_application/src/module/application/providers.dart';
import 'package:sample_application/src/module/domain/catfact/catfact_data.dart';

class CatFactDetails extends ConsumerWidget {
  const CatFactDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final catFactDataValue = ref.watch(catFactProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Cat Fact Details", style: Theme.of(context).textTheme.headlineMedium),
        catFactDataValue.when(
          data: (catFactData) => CatFactDetailsContents(data: catFactData),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, __) => Text(e.toString()),
        ),
      ],
    );
  }
}

class CatFactDetailsContents extends ConsumerWidget {
  const CatFactDetailsContents({Key? key, required this.data})
      : super(key: key);
  final CatFactData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    final fact = data.fact;
    final length = data.length.toString();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(fact, style: textTheme.bodyMedium),
        Text(length, style: textTheme.bodyMedium),
      ],
    );
  }
}
