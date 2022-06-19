class TuberculosisModel {
  double? normal;
  double? tuberculosis;

  TuberculosisModel({this.normal, this.tuberculosis});

  TuberculosisModel.fromJson({json}) {
    normal = json['Normal / No TB'];
    tuberculosis = json['Tuberculosis (TB)'];
  }
}
