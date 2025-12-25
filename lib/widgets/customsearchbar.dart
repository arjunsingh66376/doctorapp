import 'package:flutter/material.dart';
import 'package:doctorapp/constants/app_colors.dart';
import 'package:doctorapp/constants/app_textstyle.dart';
import 'package:doctorapp/extensions/context_extension.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.hp(6.5),
      margin: EdgeInsets.symmetric(horizontal: context.wp(5)),
      padding: EdgeInsets.symmetric(horizontal: context.wp(4)),
      decoration: BoxDecoration(
        color: AppColors.appbarheadingcolor,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: AppColors.textfield),
          SizedBox(width: context.wp(3)),
          Expanded(child: Text('Search.....', style: AppTextStyles.inputfield)),
          const Icon(Icons.close, color: AppColors.textfield),
        ],
      ),
    );
  }
}
