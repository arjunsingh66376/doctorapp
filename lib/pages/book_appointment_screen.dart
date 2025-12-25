import 'package:doctorapp/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:doctorapp/models/doctor_model.dart';
import 'package:doctorapp/constants/app_colors.dart';
import 'package:doctorapp/constants/app_textstyle.dart';
import 'package:doctorapp/widgets/primarybutton.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BookAppointmentScreen extends StatefulWidget {
  final Doctor doctor;

  const BookAppointmentScreen({super.key, required this.doctor});

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  String? selectedSlot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Book Appointment'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ✅ DOCTOR CARD (LIKE SCREENSHOT)
            _doctorCard(),

            const SizedBox(height: 24),

            /// Afternoon Slots
            Text('Afternoon Slots', style: AppTextStyles.title),
            const SizedBox(height: 8),
            _slotWrap(widget.doctor.slots['afternoon'] ?? []),

            const SizedBox(height: 20),

            /// Evening Slots
            Text('Evening Slots', style: AppTextStyles.title),
            const SizedBox(height: 8),
            _slotWrap(widget.doctor.slots['evening'] ?? []),

            SizedBox(height: context.hp(5)),

            /// Book Button
            Center(child: Primarybutton(onpressfunction: _bookAppointment)),
            SizedBox(height: context.hp(2)),
          ],
        ),
      ),
    );
  }

  // ================= DOCTOR CARD =================
  Widget _doctorCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),
      child: Row(
        children: [
          /// Doctor Image
          CircleAvatar(
            radius: 32,
            backgroundImage: AssetImage(widget.doctor.image),
          ),

          const SizedBox(width: 12),

          /// Doctor Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.doctor.name, style: AppTextStyles.title),
                const SizedBox(height: 4),
                Text(
                  widget.doctor.specialization,
                  style: AppTextStyles.subtitle,
                ),
                const SizedBox(height: 6),

                /// ⭐ Rating
                Row(
                  children: List.generate(5, (index) {
                    return Icon(
                      Icons.star,
                      size: 16,
                      color: index < widget.doctor.rating.round()
                          ? Colors.orange
                          : Colors.grey.shade300,
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ================= SLOT UI =================
  Widget _slotWrap(List<String> slots) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: slots.map((slot) {
        final isSelected = selectedSlot == slot;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedSlot = slot;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primary
                  : AppColors.primary.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              slot,
              style: TextStyle(
                color: isSelected ? Colors.white : AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  // ================= BOOK LOGIC =================
  void _bookAppointment() {
    if (selectedSlot == null) {
      Fluttertoast.showToast(
        msg: 'Please select a time slot',
        backgroundColor: AppColors.primary,
        textColor: AppColors.appbarheadingcolor,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
      return;
    }

    Fluttertoast.showToast(
      msg: "Appointment has been booked",

      backgroundColor: AppColors.primary,
      textColor: AppColors.appbarheadingcolor,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
    );
  }
}
