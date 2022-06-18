class RetinopathyModel {
  double? mild;
  double? moderate;
  double? no;
  double? proliferative;
  double? severe;

  RetinopathyModel(
      {this.mild, this.moderate, this.no, this.proliferative, this.severe});

  RetinopathyModel.fromJson({json}) {
    mild = json['Mild Diabetic Retinopathy'];
    moderate = json['Moderate Diabetic Retinopathy'];
    no = json['No Diabetic Retinopathy'];
    proliferative = json['Proliferative Diabetic Retinopathy'];
    severe = json['Severe Diabetic Retinopathy'];
  }
}
