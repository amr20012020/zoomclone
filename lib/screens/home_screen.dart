import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoomclone/resources/auth_method.dart';
import 'package:zoomclone/utils/colors.dart';
import 'package:zoomclone/widgets/custom_button.dart';

import 'histroy_meeting_Screen.dart';
import 'meetingScreen.dart';

class HomScreen extends StatefulWidget {
  const HomScreen({Key? key}) : super(key: key);

  @override
  State<HomScreen> createState() => _HomScreenState();
}

class _HomScreenState extends State<HomScreen> {

  int _selectedPage = 0;
  onPageChanged(int page) {
    setState(() {
      _selectedPage = page;
    });
  }


  List<Widget> pages = [
    MeetingsScreen(),
    const HistoryMeetingScreen(),
    const Text('Contacts'),
    CustomButton(text: 'Log Out', onPressed: () => AuthMethods().signOut())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meet & Chat'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: pages[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onPageChanged,
        currentIndex: _selectedPage,
        type: BottomNavigationBarType.shifting,
        unselectedFontSize: 14,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.comment_bank),
            label: 'Meet & Char',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_clock),
            label: 'Meetings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
