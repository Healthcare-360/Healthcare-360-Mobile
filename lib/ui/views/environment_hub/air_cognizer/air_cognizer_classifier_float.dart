import 'package:healthcare_360_mobile/core/ai_models/app_models.dart';
import 'package:healthcare_360_mobile/ui/views/environment_hub/air_cognizer/air_cognizer_classifier.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';

class AirCognizerClassifierFloat extends AirCognizerClassifier {
  AirCognizerClassifierFloat({int? numThreads}) : super(numThreads: numThreads);

  @override
  String get modelName => AppModels.airCognizer;

  @override
  // NormalizeOp get preProcessNormalizeOp => NormalizeOp(127.5, 127.5);
  NormalizeOp get preProcessNormalizeOp => NormalizeOp(0, 1);

  @override
  NormalizeOp get postProcessNormalizeOp => NormalizeOp(0, 1);
}
