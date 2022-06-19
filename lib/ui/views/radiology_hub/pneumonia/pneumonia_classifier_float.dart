import 'package:healthcare_360_mobile/core/ai_models/app_models.dart';
import 'package:healthcare_360_mobile/ui/views/radiology_hub/pneumonia/pneumonia_classifier.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';

class PneumoniaClassifierFloat extends PneumoniaClassifier {
  PneumoniaClassifierFloat({int? numThreads}) : super(numThreads: numThreads);

  @override
  String get modelName => AppModels.pneumonia;

  @override
  // NormalizeOp get preProcessNormalizeOp => NormalizeOp(127.5, 127.5);
  NormalizeOp get preProcessNormalizeOp => NormalizeOp(0, 1);

  @override
  NormalizeOp get postProcessNormalizeOp => NormalizeOp(0, 1);
}
