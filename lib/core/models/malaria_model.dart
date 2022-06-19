class MalariaModel {
  double? uninfected;
  double? parasitized;

  MalariaModel({this.uninfected, this.parasitized});

  MalariaModel.fromJson({json}) {
    uninfected = json['Uninfected / No Malaria'];
    parasitized = json['Parasitized / Malaria'];
  }
}
