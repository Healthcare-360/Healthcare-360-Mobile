import 'package:healthcare_360_mobile/core/ai_models/app_models.dart';
import 'package:healthcare_360_mobile/ui/views/cancer_hub/lymphoma/lymphoma_classifier.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';

class LymphomaClassifierFloat extends LymphomaClassifier {
  LymphomaClassifierFloat({int? numThreads}) : super(numThreads: numThreads);

  @override
  String get modelName => AppModels.lymphoma;

  @override
  // NormalizeOp get preProcessNormalizeOp => NormalizeOp(127.5, 127.5);
  NormalizeOp get preProcessNormalizeOp => NormalizeOp(0, 1);

  @override
  NormalizeOp get postProcessNormalizeOp => NormalizeOp(0, 1);
}
