import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:firebase_messaging/firebase_messaging.dart';

abstract class NotificationsHelper {
  // create instance of fbm
  final _firebaseMessaging = FirebaseMessaging.instance;

  // initialize notifications for this app or device
  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    // get device token
    String? deviceToken = await _firebaseMessaging.getToken();
    print(
        "===================Device FirebaseMessaging Token====================");
    print(deviceToken);
    print(
        "===================Device FirebaseMessaging Token====================");
  }

  static Future<String?> getAccessToken() async {
    final serviceAccountJson = {
      "type": "service_account",
      "project_id": "udemy-course-ce7b6",
      "private_key_id": "5b33f79f0feec35cc0930f32106912a478b63d5c",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCyEUBHOqc8bo/y\nXWR4e+m0pP42GpXGHmUO1ep7hry9mYu/yBZ4LFfrz/8y7JM2NzdiC2UwHHbXJCSS\nBRDf3RuKt/OZlMZm3zIXVT2eyxkfmc0Tm4d9oiWmsSg7Q2GCPpDxgqTzoJAPXHRT\nxIwUsDTJzqyqhp8+yWjRYlN/xPdTpYdKBWkud4K69Do7pZuiLwETZ7H992hAPsEx\nUdwLUrW69AGT5/LmfHnQJv4n5Pl3yT/yqdPr8ZH+ZyyfEXj/LnS9maxLmjYhBNng\n+y/4dFm2a6fGYnpGTV52+MvSi5yRA+tEe6vQrIFDDEHJhInGOI6kCXBGUzq7+4+F\nXORQviKbAgMBAAECggEAEDoH4wB3zpx+q/CRysmenZ0ZeKxfMKuCvGGHBCmzl7g0\nfCNg1M5UVsNgt0RyvSfhTqMeM05XZWSVm+Qv9PktB4JFhciBH00V6fq/v5w0wQ9J\nbmYnvdhMWQ6KIthm5tu1EU+9S2GQLy4sKu6yxeHcIEsgAKF9moGidnjg22MDbND2\nRMl0ZOa1XoUCjNpdIRvcpzaJEphlJF9+2FogkV/YCosA6tQzQfJP9LKTjapWEdlZ\n0Orxm0pKho+88hXPErCpstbRmU4b1KrG9oKhq0o6Zy2ARRcRqEHbhZXjYad1z7LB\nw7US448V6qb6LAUybH87wMqo1oBT3jK4XjsJDcGdnQKBgQDjiAtio8wyokgfgzgv\n2lWF0HDY5wQr6NWPyS5icDhAkGeurNbVoWfbvetTSKy/jHyP5e0oQZ/GViomJBr0\nIaEwPlRv8DJijGLRT+ZoKXhYOMs43fKqWiq8zKVbXJr8BFpiwMCCj6eiIrR3rfwQ\nKJiDtZzHm4aIP/wl0Ot72No+VwKBgQDIWNi36w/rwoZhNiQxdMbLkSDqWDUGK1xW\nmWKVaUamBCyoJ6579etSGyBUd1UoVEYCBL7n2k4AsCoSQSXdRLnlNP+A3XjaQXvH\nDk8IwM61y1Tp4Mj4EPaYvp6VfqQru/Cia9Guz2I2WPOOVr4+vvQZMLDuURbaXp+4\nTtsaLR5LXQKBgQCbvPDeEXOhbMalGzIIPw+uyh+Tt3x5eaNECdY/9sPqHW16eD+M\ndjAajoJWvTXQ3p4b+Ks9lL2CClRLSwdP9vzXgrJU9DnojmLNFj2FKm1/JVCkmfaR\nd6otFH5SbK6AtZIQahLayu1Y4xxXlrUjckYCUPsA/Yk2FWXHlJq6aJHpfQKBgDl7\n5JLAy0yl/9CcrD3Ud8Wo2nzi2jPu9QuT7wlXr4Gq6PVGjXXb1a01Q014/+IWbA/g\nNLZpmL/xy+B4+NhIA96UGktrQGW/LDitDlhAmg7nTHHeoUsr8tVYvD/AmnJB9oVj\n0kIKFu/pDdjlYqi2OWuQ4PNAKQJ26/UCCzOzhmGxAoGBAMQw9aPIczRwfw02QnIp\nr5jbwadlKKeDQUJikC5qIt3Sagak39HkDluL7QQ2nCCLu2SAjRMaRzczryDtFvVD\nbblo/JvrDJm1tcHlWU/oaHQ7pgoBFfLdfMVbY8sMLnPqc/MTedYwp4rPc4qjwAY2\nKtLoV1w2a5OuEnPbtpdVfLyP\n-----END PRIVATE KEY-----\n",
      "client_email":
          "firebase-adminsdk-1ihwp@udemy-course-ce7b6.iam.gserviceaccount.com",
      "client_id": "107810005107957008863",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-1ihwp%40udemy-course-ce7b6.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    };

    List<String> scopes = [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging"
    ];

    try {
      http.Client client = await auth.clientViaServiceAccount(
          auth.ServiceAccountCredentials.fromJson(serviceAccountJson), scopes);

      auth.AccessCredentials credentials =
          await auth.obtainAccessCredentialsViaServiceAccount(
              auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
              scopes,
              client);

      client.close();
      print(
          "Access Token: ${credentials.accessToken.data}"); // Print Access Token
      return credentials.accessToken.data;
    } catch (e) {
      print("Error getting access token: $e");
      return null;
    }
  }

  Map<String, dynamic> getBody({
    required String fcmToken,
    required String title,
    required String body,
    required String userId,
    String? type,
  }) {
    return {
      "message": {
        "token": fcmToken,
        "notification": {"title": title, "body": body},
        "android": {
          "notification": {
            "notification_priority": "PRIORITY_MAX",
            "sound": "default"
          }
        },
        "apns": {
          "payload": {
            "aps": {"content_available": true}
          }
        },
        "data": {
          "type": type,
          "id": userId,
          "click_action": "FLUTTER_NOTIFICATION_CLICK"
        }
      }
    };
  }

  Future<void> sendNotifications({
    required String fcmToken,
    required String title,
    required String body,
    required String userId,
    String? type,
  }) async {
    try {
      var serverKeyAuthorization = await getAccessToken();

      // change your project id
      const String urlEndPoint =
          "https://fcm.googleapis.com/v1/projects/udemy-course-ce7b6/messages:send";

      Dio dio = Dio();
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $serverKeyAuthorization';

      var response = await dio.post(
        urlEndPoint,
        data: getBody(
          userId: userId,
          fcmToken: fcmToken,
          title: title,
          body: body,
          type: type ?? "message",
        ),
      );

      // Print response status code and body for debugging
      print('Response Status Code: ${response.statusCode}');
      print('Response Data: ${response.data}');
    } catch (e) {
      print("Error sending notification: $e");
    }
  }
}
