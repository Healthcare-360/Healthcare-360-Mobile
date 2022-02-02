import 'package:flutter/material.dart';
import 'package:healthcare_360_mobile/ui/base_view/base_view.dart';
import 'package:healthcare_360_mobile/ui/views/diabetes_prediction/diabetes_viewmodel.dart';

class DiabetesPredictionView extends StatelessWidget {
  const DiabetesPredictionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<DiabetesViewModel>();
    return BaseViewWidget(
      avoidScrollView: true,
      body: Column(
        children: <Widget>[
          Center(
            child: vm.imageFile == null
                ? const Text('No image selected.')
                : Container(
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height / 2),
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Image.file(vm.imageFile!),
                  ),
          ),
          const SizedBox(
            height: 36,
          ),
          Text(
            // ignore: unnecessary_null_comparison
            vm.category != null ? vm.category!.label : '',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            // ignore: unnecessary_null_comparison
            vm.category != null
                ? 'Confidence: ${vm.category?.score.toStringAsFixed(3)}'
                : '',
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
      fab: FloatingActionButton(
        onPressed: () async =>
            await context.read<DiabetesViewModel>().getImage(),
        tooltip: 'Pick Image',
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }
}
