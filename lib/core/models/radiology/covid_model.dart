class CovidModel {
  double? covid;
  double? normal;
  double? pneumonia;
  double? lungsInfection;

  CovidModel({this.covid, this.normal, this.pneumonia, this.lungsInfection});

  CovidModel.fromJson({json}) {
    covid = json['COVID-19'];
    normal = json['Normal / No COVID'];
    pneumonia = json['Viral Pneumonia'];
    lungsInfection = json['Non-COVID Lungs Infection'];
  }
}
