
import 'dart:async';

import 'package:cronoapp/model/crono_model.dart';
import 'package:flutter_riverpod/legacy.dart';

class CronoViewmodel extends StateNotifier<CronoModel> {
  Timer? _timer;

  CronoViewmodel() : super(CronoModel(0, 0, 0));

  /// Démarre le chrono. Si un timer est déjà actif, on ne démarre pas un autre.
  Future<void> started() async {
    if (_timer != null && _timer!.isActive) return;

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      int heure = state.heur;
      int minute = state.minutes;
      int seconde = state.seconde;

      seconde++;
      if (seconde == 60) {
        seconde = 0;
        minute++;
      }
      if (minute == 60) {
        minute = 0;
        heure++;
      }

      state = state.copyWith(heure, minute, seconde);
    });
  }

  /// Réinitialise le chrono à 00:00:00 et arrête le timer en cours.
  void reset(){
    stop();
    state = CronoModel(0, 0, 0);
  }

  /// Arrête le timer si actif.
  void stop(){
    _timer?.cancel();
    _timer = null;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

final cronoProvider = StateNotifierProvider<CronoViewmodel, CronoModel>((ref){
  return CronoViewmodel();
});