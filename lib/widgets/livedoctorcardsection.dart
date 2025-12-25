import 'package:flutter/material.dart';
import 'package:doctorapp/extensions/context_extension.dart';
import 'package:doctorapp/constants/app_textstyle.dart';

class LiveDoctorsCardSection extends StatelessWidget {
  const LiveDoctorsCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.wp(5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Section Heading
          Text('Live Doctors', style: AppTextStyles.title),

          SizedBox(height: context.hp(0.5)),

          /// Cards (Direct, no builder)
          SizedBox(
            height: context.hp(23),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  doctorCard(context, 'assets/images/doctor1.jpg'),
                  SizedBox(width: context.wp(4)),
                  doctorCard(context, 'assets/images/doctor2.jpg'),
                  SizedBox(width: context.wp(4)),
                  doctorCard(context, 'assets/images/doctor3.jpg'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Single Doctor Card
  Widget doctorCard(BuildContext context, String imagePath) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              imagePath,
              width: context.wp(35),
              height: double.infinity,
              fit: BoxFit.cover,
            ),

            /// Play Button
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black45,
              ),
              child: const Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
