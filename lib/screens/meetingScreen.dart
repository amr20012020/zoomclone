import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/jitsi_meet_methods.dart';
import '../utils/colors.dart';
import '../widgets/home_meeting_button.dart';

class MeetingsScreen extends StatelessWidget {
  MeetingsScreen({Key? key}) : super(key: key);

   final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();


  createNewMeeting() async{

    var random = Random();
    String roomName = (random.nextInt(100000000) + 10000000).toString();
     _jitsiMeetMethods.createMeeting(
         roomName: roomName,
         isAudioMuted: true,
         isVideoMuted: true);
  }


  joinMeeting(BuildContext context){
    Navigator.pushNamed(context, '/video-call');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
              onPressed: createNewMeeting,
              icon: Icons.videocam,
              text: 'New Meeting',
              color: Colors.deepOrange,
            ),
            HomeMeetingButton(
              onPressed: () => joinMeeting(context),
              icon: Icons.add_box_rounded,
              text: 'Join Meeting',
              color: buttonColor,
            ),
            HomeMeetingButton(
              onPressed: () {},
              icon: CupertinoIcons.calendar,
              text: 'Schedule',
              color: buttonColor,
            ),
            HomeMeetingButton(
              onPressed: () {},
              icon: Icons.arrow_upward_rounded,
              text: 'Share Screen',
              color: buttonColor,
            ),
          ],
        ),
        const Expanded(
            child: Center(
              child: Text(
                'Create/Join Meetings with just a click!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            )),
      ],
    );
  }
}
