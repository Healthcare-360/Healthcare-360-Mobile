class CervicalModel {
  double? stage1;
  double? stage2;
  double? stage3;

  CervicalModel({
    this.stage1,
    this.stage2,
    this.stage3,
  });

  CervicalModel.fromJson({json}) {
    stage1 = json['Stage 1 (1A, 1B & 2A)'];
    stage2 = json['Stage 2 (2B, 3 & 4A)'];
    stage3 = json['Stage 3 (4B)'];
  }
}
