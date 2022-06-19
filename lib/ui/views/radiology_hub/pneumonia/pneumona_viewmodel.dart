import 'dart:io';
import 'package:flutter/foundation.dart' as notify;
import 'package:flutter/material.dart';
import 'package:healthcare_360_mobile/core/models/radiology/pneumonia_model.dart';
import 'package:healthcare_360_mobile/core/models/tflite_return_model.dart';
import 'package:healthcare_360_mobile/ui/views/radiology_hub/pneumonia/pneumonia_classifier.dart';
import 'package:healthcare_360_mobile/ui/views/radiology_hub/pneumonia/pneumonia_classifier_float.dart';
import 'package:healthcare_360_mobile/ui/views/radiology_hub/pneumonia/pneumonia_results_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';
import 'package:get/get.dart';

class PneumoniaViewModel with notify.ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  setState(bool state) {
    _loading = state;
    notifyListeners();
  }

  void showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    getImageFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library'),
                    onTap: () {
                      getImageFromGallery();

                      Navigator.of(context).pop();
                    }),
              ],
            ),
          );
        });
  }

  // ignore: prefer_final_fields
  PneumoniaClassifier _classifier = PneumoniaClassifierFloat();
  PneumoniaClassifier get classifier => _classifier;

  Category? _category;
  Category? get category => _category;

  PneumoniaModel? _modelResults;
  PneumoniaModel? get modelResults => _modelResults;

  TfLiteReturnModel? _results;
  TfLiteReturnModel? get results => _results;

  File? _imageFile;
  File? get imageFile => _imageFile;

  Future<void> getImageFromGallery() async {
    _imageFile = null;
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    _imageFile = File(pickedFile!.path);
    notifyListeners();
    _predict();
  }

  _reshapeResults() {
    _modelResults = PneumoniaModel.fromJson(json: _results!.results);
  }

  Future<void> getImageFromCamera() async {
    _imageFile = null;

    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    _imageFile = File(pickedFile!.path);
    notifyListeners();

    _predict();
  }

  void _predict() async {
    setState(true);
    img.Image imageInput = img.decodeImage(_imageFile!.readAsBytesSync())!;
    // var pred = _classifier.predict(imageInput);
    TfLiteReturnModel pred = _classifier.predictDisease(imageInput);

    _results = pred;
    _reshapeResults();

    setState(false);
    Get.to(() => const PneumoniaResultsView(),
        transition: Transition.noTransition);
  }
}
