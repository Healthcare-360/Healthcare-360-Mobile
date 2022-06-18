// AMD (Age-related macular degeneration)
// Cataract
// Glaucoma
// Hypertension
// Myopia
// Normal Eye
// Other Minor Diseases

class OcularModel {
  double? amd;
  double? cataract;
  double? glaucoma;
  double? hypertension;
  double? myopia;
  double? normal;
  double? minor;

  OcularModel(
      {this.amd,
      this.cataract,
      this.glaucoma,
      this.hypertension,
      this.minor,
      this.myopia,
      this.normal});
  OcularModel.fromJson({json}) {
    amd = json['AMD (Age-related macular degeneration)'];
    cataract = json['Cataract'];
    glaucoma = json['Glaucoma'];
    hypertension = json['Hypertension'];
    minor = json['Other Minor Diseases'];
    myopia = json['Myopia'];
    normal = json['Normal Eye'];
  }
}
