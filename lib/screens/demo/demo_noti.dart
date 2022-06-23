import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class DemoNoti extends StatelessWidget {
  final _firebaseMessaging = FirebaseMessaging.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Center(
          child: Text(
            'Demo Noti',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const Text('aaa'),
          Padding(
            padding: const EdgeInsets.all(32),
            child: InkWell(
              child: const Text('btn'),
              onTap: () async {
                // var fcm =await  FirebaseMessaging.instance.getToken();
                // final firebaseToken = await FirebaseMessaging.instance.getToken();
                // print('firebaseToken: $firebaseToken');

                var rs = await _firebaseMessaging.getInitialMessage();

                print('rs $rs');

                final firebaseToken =
                    await FirebaseMessaging.instance.getToken();
                print('firebaseToken: $firebaseToken');

                // var apnsToken = await _firebaseMessaging.getAPNSToken();
                // print('apnsToken $apnsToken');
                // FirebaseInstanceId.getInstance().getToken();

                // await _firebaseMessaging.subscribeToTopic('fcm_test');

                // _firebaseMessaging.getToken().then((token) {
                //   print("token $token");
                // });
                // print('on tap: $fcm');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: InkWell(
              child: const Text('Signin'),
              onTap: () async {
                // var fcm = _firebaseMessaging.getToken();
                var userCredential =
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: 'dangki92@gmail.com',
                  password: '12345678',
                );
                print('userCredential $userCredential');
                // print('on tap: $fcm');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: InkWell(
              child: const Text('CreateUser'),
              onTap: () async {
                // var fcm = _firebaseMessaging.getToken();

                var userCredential =
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: 'dangki92@gmail.com',
                  password: '12345678',
                );
                print('userCredential $userCredential');
                // print('on tap: $fcm');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: InkWell(
              child: const Text('Request permission'),
              onTap: () async {
                // var fcm = _firebaseMessaging.getToken();

                await _firebaseMessaging
                    .setForegroundNotificationPresentationOptions(
                  alert: true,
                  badge: true,
                  sound: true,
                );

                NotificationSettings settings =
                    await _firebaseMessaging.requestPermission(
                  alert: true,
                  badge: true,
                  provisional: false,
                  sound: true,
                );
                print(
                    'settings.authorizationStatus ${settings.authorizationStatus}');

                // print('on tap: $fcm');
              },
            ),
          ),
        ],
      ),
    );
  }
}
