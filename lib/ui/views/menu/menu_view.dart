import 'package:flutter/material.dart';
import 'package:healthcare_360_mobile/ui/base_view/base_view.dart';

class MenuView extends StatelessWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseViewWidget(
      avoidScrollView: true,
      body: Column(
        children: [
          CustomText(
            'Logo',
            style: TextStyles.r_23,
          ),
          SizedBox(
            height: 25.h,
          ),
          CustomText(
            'Our Services',
            style: TextStyles.m_29,
            color: HcColors.purple,
          ),
          SizedBox(
            height: 25.h,
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    // childAspectRatio: 3 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: 8,
                itemBuilder: (BuildContext ctx, index) {
                  return Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.w),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 15,
                            offset: const Offset(
                                0, 0), // changes position of shadow
                          ),
                        ],
                        color: HcColors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(HcIcons.drIcon),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          'Diabetes\nPrediction',
                          textAlign: TextAlign.center,
                          style: TextStyles.r_15.copyWith(
                            color: HcColors.blue,
                            height: 1,
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 25.h,
          ),
        ],
      ),
    );
  }
}
