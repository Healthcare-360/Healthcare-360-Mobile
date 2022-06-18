import 'dart:io';
import 'package:flutter/foundation.dart' as notify;
import 'package:flutter/material.dart';
import 'package:healthcare_360_mobile/core/models/retinal_models/ocular_model.dart';
import 'package:healthcare_360_mobile/core/models/tflite_return_model.dart';
import 'package:healthcare_360_mobile/ui/views/retinal_hub/ocular_diseases/ocular_results_view.dart';
import 'package:healthcare_360_mobile/ui/views/retinal_hub/retinopathy/retinopathy_classifer_float.dart';
import 'package:healthcare_360_mobile/ui/views/retinal_hub/retinopathy/retinopathy_classifier.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';
import 'package:get/get.dart';

class OcularDiseaseViewModel with notify.ChangeNotifier {
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
  RetinopathyClassifer _classifier = RetinopathyClassiferFloat();
  RetinopathyClassifer get classifier => _classifier;

  Category? _category;
  Category? get category => _category;

  OcularModel? _ocularDiseasesReults;
  OcularModel? get ocularDiseasesReults => _ocularDiseasesReults;

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
    // Get.to(() => const DiabetesResultsView(),
    //     transition: Transition.noTransition);

    _predict();
  }

  _reshapeResults() {
    // final body = jsonDecode(_results.results);

    _ocularDiseasesReults = OcularModel.fromJson(json: _results!.results);
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
    TfLiteReturnModel pred = _classifier.predictDiabetes(imageInput);

    _results = pred;
    _reshapeResults();

    setState(false);
    Get.to(() => const OcularResultsView(),
        transition: Transition.noTransition);
  }
}
