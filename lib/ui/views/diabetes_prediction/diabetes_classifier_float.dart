import 'package:healthcare_360_mobile/ui/views/diabetes_prediction/diabetes_classifer.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';

class DiabetesClassifierFloat extends DiabetesClassifier {
  DiabetesClassifierFloat({int? numThreads}) : super(numThreads: numThreads);

  @override
  String get modelName => 'diabetes_model.tflite';

  @override
  NormalizeOp get preProcessNormalizeOp => NormalizeOp(127.5, 127.5);

  @override
  NormalizeOp get postProcessNormalizeOp => NormalizeOp(0, 1);
}
