class PneumoniaModel {
  double? normal;
  double? pneumonia;

  PneumoniaModel({this.normal, this.pneumonia});

  PneumoniaModel.fromJson({json}) {
    normal = json['Normal / No Pneumonia'];
    pneumonia = json['Pneumonia'];
  }
}
