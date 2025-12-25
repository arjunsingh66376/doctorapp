import 'package:doctorapp/constants/app_textstyle.dart';
import 'package:doctorapp/widgets/primarybutton.dart';
import 'package:doctorapp/pages/book_appointment_screen.dart';
import 'package:doctorapp/services/local_data_service.dart';
import 'package:flutter/material.dart';
import 'package:doctorapp/models/doctor_model.dart';
import 'package:doctorapp/extensions/context_extension.dart';

class Populardoctorlist extends StatelessWidget {
  const Populardoctorlist({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Doctor>>(
      future: LocalDataService().getdoctor(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.greenAccent),
          );
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No doctors found'));
        }

        final doctors = snapshot.data!;

        return SizedBox(
          height: context.hp(35),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: context.wp(4)),
            child: Row(
              children: doctors.map((doctor) {
                return Container(
                  width: context.wp(55),
                  margin: EdgeInsets.only(right: context.wp(4)),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 8),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /// Doctor Image (TOP)
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                        child: Image.asset(
                          doctor.image,
                          height: context.hp(18),
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),

                      SizedBox(height: context.hp(1.5)),

                      /// Doctor Name
                      Text(
                        doctor.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 4),

                      /// Specialization
                      Text(
                        doctor.specialization,
                        style: AppTextStyles.subtitle,
                      ),

                      const SizedBox(height: 6),

                      /// Rating
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (index) {
                          return Icon(
                            Icons.star,
                            size: 16,
                            color: index < doctor.rating.round()
                                ? Colors.orange
                                : Colors.grey.shade300,
                          );
                        }),
                      ),

                      SizedBox(height: context.hp(1.5)),
                      Primarybutton(
                        doctor: doctor,
                        onpressfunction: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                BookAppointmentScreen(doctor: doctor),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
