import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:doctorapp/pages/bookedpage.dart';
import 'package:doctorapp/pages/doctor_list_screen.dart';
import 'package:doctorapp/pages/searchpage.dart';
import 'package:flutter/material.dart';

class Bottomtabnavigationpage extends StatefulWidget {
  const Bottomtabnavigationpage({super.key});

  @override
  State<Bottomtabnavigationpage> createState() =>
      _BottomtabnavigationpageState();
}

class _BottomtabnavigationpageState extends State<Bottomtabnavigationpage> {
  List<Widget> allwidgetpages = [
    DoctorListScreen(),
    Searchpage(),
    Bookedpage(),
  ];

  int intialindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: Colors.white,
        //  change  the background color  according to  themee like  when   theme is  white then  put the  bg   color    white
        backgroundColor: Color(0xFF22C55E),
        color: Colors.white,
        items: <Widget>[
          Icon(Icons.home_outlined, size: 30, color: Color(0xFF22C55E)),
          Icon(Icons.search, size: 30, color: Color(0xFF22C55E)),
          Icon(
            Icons.perm_device_information_outlined,
            size: 30,
            color: Color(0xFF22C55E),
          ),
        ],
        onTap: (index) {
          setState(() {
            intialindex = index;
          });
        },
      ),
      body: IndexedStack(index: intialindex, children: allwidgetpages),
    );
  }
}
