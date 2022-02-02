import 'dart:io';

import 'package:flutter/foundation.dart' as notify;
import 'package:healthcare_360_mobile/ui/views/diabetes_prediction/diabetes_classifier_float.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';

import 'diabetes_classifer.dart';

class DiabetesViewModel with notify.ChangeNotifier {
  // ignore: prefer_final_fields
  DiabetesClassifier _classifier = DiabetesClassifierFloat();
  DiabetesClassifier get classifier => _classifier;

  Category? _category;
  Category? get category => _category;

  File? _imageFile;
  File? get imageFile => _imageFile;

  Future<void> getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    _imageFile = File(pickedFile!.path);
    notifyListeners();

    _predict();
  }

  void _predict() async {
    img.Image imageInput = img.decodeImage(_imageFile!.readAsBytesSync())!;
    var pred = _classifier.predict(imageInput);

    _category = pred;
    notifyListeners();
  }
}
