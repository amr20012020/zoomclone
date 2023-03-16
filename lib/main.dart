import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoomclone/resources/auth_method.dart';
import 'package:zoomclone/screens/home_screen.dart';
import 'package:zoomclone/screens/loginScreen.dart';
import 'package:zoomclone/screens/video_call_screen.dart';
import 'package:zoomclone/utils/colors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zoom Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      routes: {
        '/login' : (context) => const LoginScreen(),
        '/home' : (context) => const HomScreen(),
        '/video-call' : (context) => const VideoCallScreen(),
      },
      home: StreamBuilder(
        stream: AuthMethods().authChanges,
        builder: (context,snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }

          if(snapshot.hasData){
            return const HomScreen();
          }
          return const LoginScreen();
        },

      ),
    );
  }
}
