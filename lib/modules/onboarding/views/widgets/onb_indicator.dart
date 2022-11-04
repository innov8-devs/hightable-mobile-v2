import 'package:flutter/material.dart';

import '../../../../utils/spacer.dart';
import '../../../../utils/ui/app_colors.dart';

class OnbIndicator extends StatefulWidget {
  const OnbIndicator({super.key});

  @override
  State<OnbIndicator> createState() => _OnbIndicatorState();
}

class _OnbIndicatorState extends State<OnbIndicator> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 8,
            width: 8,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColors.prim1),
          ),
          const XMargin(8),
          Container(
            height: 8,
            width: 8,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColors.grey03op),
          ),
          const XMargin(8),
          Container(
            height: 8,
            width: 8,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColors.grey03op),
          ),
          const XMargin(8),
          Container(
            height: 8,
            width: 8,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColors.grey03op),
          )
        ],
      ),
    );
  }
}
