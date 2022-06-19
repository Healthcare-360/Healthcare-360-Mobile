class LymphomaModel {
  double? cll;
  double? fl;
  double? mcl;

  LymphomaModel({
    this.cll,
    this.fl,
    this.mcl,
  });

  LymphomaModel.fromJson({json}) {
    cll = json['CLL (Chronic Lymphocytic Leukemia)'];
    fl = json['FL (Follicular Lymphoma)'];
    mcl = json['MCL (Mantle Cell Lymphoma)'];
  }
}
