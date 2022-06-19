import 'package:healthcare_360_mobile/core/ai_models/app_models.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';

import 'covid_classifier_2.dart';

class CovidClassifierFloat extends CovidClassifier {
  CovidClassifierFloat({int? numThreads}) : super(numThreads: numThreads);

  @override
  String get modelName => AppModels.covidCNN;

  @override
  // NormalizeOp get preProcessNormalizeOp => NormalizeOp(127.5, 127.5);
  NormalizeOp get preProcessNormalizeOp => NormalizeOp(0, 1);

  @override
  NormalizeOp get postProcessNormalizeOp => NormalizeOp(0, 1);
}
