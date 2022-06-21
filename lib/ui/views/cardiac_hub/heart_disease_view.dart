// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:healthcare_360_mobile/ui/base_view/base_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HeartDiseaseView extends StatefulWidget {
  const HeartDiseaseView({Key? key}) : super(key: key);

  @override
  State<HeartDiseaseView> createState() => _HeartDiseaseViewState();
}

class _HeartDiseaseViewState extends State<HeartDiseaseView> {
  bool _isLoad = false;
  WebViewController? _controller;

  @override
  void dispose() {
    _controller?.clearCache();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return BaseViewWidget(
      avoidScrollView: true,
      appBar: AppBar(
        backgroundColor: AppColors.purple,
        title: const CustomText(
          'Heart Disease Detection',
          color: AppColors.white,
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.white,
          ),
        ),
        elevation: 0.0,
        actions: [
          InkWell(
            onTap: () {
              _controller?.reload();
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.replay_outlined,
                color: AppColors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: Links.heartDisease,
              onWebViewCreated: (WebViewController cont) {
                log('WebView Created');
                setState(() {
                  _controller = cont;
                });
              },
              onPageStarted: (url) {
                log('Page Load Started');
                _isLoad = true;
                setState(() {});
                // vm.setWebState(true);
              },
              onWebResourceError: (error) {
                _isLoad = false;
                setState(() {});
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: CustomText(
                    'Failed to Load',
                    color: AppColors.white,
                  ),
                  backgroundColor: AppColors.purple,
                ));
              },
              onPageFinished: (url) {
                log('Page Load Finished');
                _isLoad = false;
                setState(() {});

                // vm.setWebState(false);
              },
            ),
            if (_isLoad)
              const Center(
                child: SpinKitChasingDots(
                  color: AppColors.purple,
                ),
              )
          ],
        ),
      ),
    );
  }
}
