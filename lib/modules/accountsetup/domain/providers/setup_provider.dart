// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/application/domain/models/request_response_model.dart';

ChangeNotifierProvider<SetupProvider> setupProvider =
    ChangeNotifierProvider<SetupProvider>((ref) => SetupProvider(ref));

class SetupProvider extends ChangeNotifier {
  SetupProvider(this.ref);
  final Ref ref;

  bool _loading = false;

  List<String> selectedInterests = [];

  // getters
  bool get loading => _loading;

  // setters
  set loading(bool state) {
    _loading = state;
    notifyListeners();
  }

  void addItem(String filter) {
    if (!selectedInterests.contains(filter)) {
      selectedInterests.add(filter);
    } else {
      selectedInterests.remove(filter);
    }
    notifyListeners();
  }
}
