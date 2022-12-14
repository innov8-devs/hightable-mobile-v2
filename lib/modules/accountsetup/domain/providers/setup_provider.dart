// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hightable_mobile_v2/utils/helpers.dart';

import '../../../../core/application/domain/models/request_response_model.dart';

ChangeNotifierProvider<SetupProvider> setupProvider =
    ChangeNotifierProvider<SetupProvider>((ref) => SetupProvider(ref));

class SetupProvider extends ChangeNotifier {
  SetupProvider(this.ref);
  final Ref ref;

  bool _loading = false;

  bool interests = false;
  bool prefrences = false;
  bool allergies = false;

  String prefrenceTitle = "";
  List<String> selectedPrefrence = [];

  int setupStage = 0;

  List<String> selectedInterests = [];

  // getters
  bool get loading => _loading;

  // setters
  set loading(bool state) {
    _loading = state;
    notifyListeners();
  }

  void addInterests(String filter) {
    if (!selectedInterests.contains(filter)) {
      selectedInterests.add(filter);
    } else {
      selectedInterests.remove(filter);
    }
    notifyListeners();
  }

  void addPrefrences(String filter) {
    if (!selectedPrefrence.contains(filter)) {
      selectedPrefrence.add(filter);
    } else {
      selectedPrefrence.remove(filter);
    }
    notifyListeners();
  }

  Future<void> saveInterests(BuildContext context) async {
    Helpers.logc(selectedInterests);
    interests = true;
    notifyListeners();
  }

  Future<void> savePrefrences(BuildContext context) async {
    Helpers.logc(selectedPrefrence);
    prefrences = true;
    notifyListeners();
  }

  Future<void> saveAllergies(BuildContext context) async {
    // Helpers.logc(selectedInterests);
    allergies = true;
    notifyListeners();
  }
}
