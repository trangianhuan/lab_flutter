import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'di/config.dart';
import 'screens/demo/demo_noti.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

void main() async {
  // runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.setAutoInitEnabled(true);

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.instance;
  // final fcmToken =
  // print('fcmToken: $fcmToken');

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    // Parse the message received
    print(' title: ${message.notification?.title}');
    print(' body: ${message.notification?.body}');
    // PushNotification notification = PushNotification(
    //   title: message.notification?.title,
    //   body: message.notification?.body,
    // );

    // setState(() {
    //   _notificationInfo = notification;
    //   _totalNotifications++;
    // });
  });

  runApp(
    MultiProvider(
      providers: Config.providers,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: DemoNoti(),
      // home: MovieDetail(
      //   movie: MovieModel(
      //     backdropPath:
      //         'https://image.tmdb.org/t/p/w500/fOy2Jurz9k6RnJnMUMRDAgBwru2.jpg',
      //     title:
      //         'Title title title title title title title title title title title title title title title',
      //     posterPath:
      //         'https://image.tmdb.org/t/p/w500/qsdjk9oAKSQMWs0Vt5Pyfh6O4GZ.jpg',
      //     overview: 'overview nè',
      //     releaseDate: '2021-01-02 32:33:33',
      //     voteAverage: 4.5,
      //     voteCount: 2,
      //   ),
      // ),
    );
  }
}
