import 'package:doctorapp/constants/app_colors.dart';
import 'package:doctorapp/constants/app_textstyle.dart';
import 'package:doctorapp/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.wp(4)),
      height: context.hp(20),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.wp(4),
            vertical: context.hp(1.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hi Priya !', style: AppTextStyles.appbarheading),
                  Text(
                    'Find Your Doctor',
                    style: AppTextStyles.appbarboldheading,
                  ),
                ],
              ),

              CircleAvatar(
                radius: context.wp(8),
                backgroundImage: const AssetImage(
                  'assets/images/profile_pic.jpg',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
