import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:healthcare_360_mobile/ui/base_view/base_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ChatBotView extends StatefulWidget {
  const ChatBotView({Key? key}) : super(key: key);

  @override
  State<ChatBotView> createState() => _ChatBotViewState();
}

class _ChatBotViewState extends State<ChatBotView> {
  @override
  Widget build(BuildContext context) {
    WebViewController? _controller;
    // ignore: prefer_const_constructors
    return BaseViewWidget(
      avoidScrollView: false,
      appBar: AppBar(
        backgroundColor: AppColors.purple,
        title: const CustomText(
          'Healthcare ChatBot',
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
              _controller!.reload();
            },
            child: const Icon(
              Icons.replay_outlined,
              color: AppColors.white,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: 'https://www.google.com',
              onWebViewCreated: (WebViewController cont) {
                log('WebView Created');
                setState(() {
                  _controller = cont;
                });
              },
              onPageStarted: (url) {
                log('Page Load Started');
                // vm.setWebState(true);
              },
              onPageFinished: (url) {
                log('Page Load Finished');
                // vm.setWebState(false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
