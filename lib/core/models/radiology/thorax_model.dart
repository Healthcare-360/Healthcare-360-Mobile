class ThoraxModel {
  double? normal;
  double? thorax;

  ThoraxModel({this.normal, this.thorax});

  ThoraxModel.fromJson({json}) {
    normal = json['Normal'];
    thorax = json['Thorax Disease'];
  }
}
