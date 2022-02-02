import 'package:flutter/material.dart';
import 'package:healthcare_360_mobile/ui/base_view/base_view.dart';
import 'package:healthcare_360_mobile/ui/views/diabetes_prediction/diabetes_viewmodel.dart';
import 'package:slide_to_act/slide_to_act.dart';

class DiabetesResultsView extends StatelessWidget {
  const DiabetesResultsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<DiabetesViewModel>();
    return BaseViewWidget(
      avoidScrollView: true,
      body: Column(
        children: <Widget>[
          const Spacer(),
          const Spacer(),
          const CustomText(
            'Diabetes Prediction Center',
            textAlign: TextAlign.center,
            color: HcColors.blue,
            style: TextStyles.b_25,
          ),
          SizedBox(
            height: 20.h,
          ),
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
          SizedBox(
            height: 10.h,
          ),
          const CustomText(
            'Results',
            textAlign: TextAlign.center,
            style: TextStyles.m_16,
          ),
          SizedBox(
            height: 30.h,
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
          const Spacer(),
          const Spacer(),
        ],
      ),
    );
  }
}
