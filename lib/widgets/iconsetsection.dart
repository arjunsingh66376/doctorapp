import 'package:doctorapp/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class Iconsetsection extends StatelessWidget {
  const Iconsetsection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Expanded(child: IconCard(imagePath: 'assets/images/icon_set1.png')),
          Expanded(child: IconCard(imagePath: 'assets/images/icon_set2.png')),
          Expanded(child: IconCard(imagePath: 'assets/images/icon_set3.png')),
        ],
      ),
    );
  }
}

class IconCard extends StatelessWidget {
  final String imagePath;

  const IconCard({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.hp(15), // ✅ visible size
      width: context.wp(30), // ✅ matches UI cards
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
    );
  }
}
