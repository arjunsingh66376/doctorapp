import 'package:doctorapp/constants/app_textstyle.dart';
import 'package:doctorapp/widgets/iconsetsection.dart';
import 'package:doctorapp/widgets/populardoctorlist.dart';
import 'package:flutter/material.dart';
import 'package:doctorapp/widgets/customappbar.dart';
import 'package:doctorapp/widgets/customsearchbar.dart';
import 'package:doctorapp/widgets/livedoctorcardsection.dart';
import 'package:doctorapp/extensions/context_extension.dart';

class DoctorListScreen extends StatelessWidget {
  const DoctorListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              CustomAppBar(),

              Positioned(
                bottom: -context.hp(3),
                left: 0,
                right: 0,
                child: const CustomSearchBar(),
              ),
            ],
          ),
          SizedBox(height: context.hp(6)),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 40),
              child: Column(
                children: [
                  LiveDoctorsCardSection(),

                  SizedBox(height: context.hp(3)),
                  Iconsetsection(),
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Text('Popular Doctors', style: AppTextStyles.title),
                        Text('See all', style: AppTextStyles.subtitle),
                      ],
                    ),
                  ),
                  SizedBox(height: context.hp(1)),
                  Populardoctorlist(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
