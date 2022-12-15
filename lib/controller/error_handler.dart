



import 'package:flutter_riverpod/flutter_riverpod.dart';

final errorProvider = StateProvider.autoDispose<String>((ref) {
  return "";
});

final formatProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});