import 'package:flutter/material.dart';
import 'package:healthcare_360_mobile/ui/base_view/base_view.dart';
import 'package:healthcare_360_mobile/ui/views/retinal_hub/ocular_diseases/ocular_disease_viewmodel.dart';

class OcularResultsView extends StatelessWidget {
  const OcularResultsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<OcularDiseaseViewModel>();
    return BaseViewWidget(
      avoidScrollView: false,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 30.h,
          ),
          const CustomText(
            'Ocular Diseases Center',
            textAlign: TextAlign.center,
            color: AppColors.blue,
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
            'Max Chances',
            textAlign: TextAlign.center,
            style: TextStyles.m_18,
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            // ignore: unnecessary_null_comparison
            vm.results != null ? vm.results!.category!.label : '',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
              color: AppColors.purple,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            // ignore: unnecessary_null_comparison
            vm.results != null
                ? 'Confidence: ${vm.results?.category?.score.toStringAsFixed(3)}'
                : '',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 20,
          ),
          Divider(
            thickness: 5.h,
            color: Colors.grey.withOpacity(0.1),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            // ignore: unnecessary_null_comparison
            'Complete Result Card',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            // ignore: unnecessary_null_comparison
            'AMD (Age-related macular degeneration): ${vm.ocularDiseasesReults?.amd?.toStringAsFixed(3)}',
            style: const TextStyle(fontSize: 14),
          ),
          Text(
            // ignore: unnecessary_null_comparison
            'Cataract: ${vm.ocularDiseasesReults?.cataract?.toStringAsFixed(3)}',
            style: const TextStyle(fontSize: 14),
          ),
          Text(
            // ignore: unnecessary_null_comparison
            'Glaucoma: ${vm.ocularDiseasesReults?.glaucoma?.toStringAsFixed(3)}',
            style: const TextStyle(fontSize: 14),
          ),
          Text(
            // ignore: unnecessary_null_comparison
            'Hypertension: ${vm.ocularDiseasesReults?.hypertension?.toStringAsFixed(3)}',
            style: const TextStyle(fontSize: 14),
          ),
          Text(
            // ignore: unnecessary_null_comparison
            'Myopia: ${vm.ocularDiseasesReults?.myopia?.toStringAsFixed(3)}',
            style: const TextStyle(fontSize: 14),
          ),
          Text(
            // ignore: unnecessary_null_comparison
            'Normal Eye: ${vm.ocularDiseasesReults?.normal?.toStringAsFixed(3)}',
            style: const TextStyle(fontSize: 14),
          ),
          Text(
            // ignore: unnecessary_null_comparison
            'Minor Diseases: ${vm.ocularDiseasesReults?.minor?.toStringAsFixed(3)}',
            style: const TextStyle(fontSize: 14),
          ),
          SizedBox(
            height: 30.h,
          ),
        ],
      ),
    );
  }
}
