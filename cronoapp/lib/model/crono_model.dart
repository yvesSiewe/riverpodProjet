class CronoModel {
  final int heur;
  final int minutes;
  final int seconde;

  CronoModel(this.heur, this.minutes, this.seconde);

  CronoModel copyWith(int? heur, int? minutes, int? seconde){
    return CronoModel(heur?? this.heur, minutes ?? this.minutes, seconde ?? this.seconde);
  }
}