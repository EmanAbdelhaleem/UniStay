import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
class Notification{
  int notification_id=0;
  String Name='';
  String description='';
  int admin_id=0;
  Future<dynamic> getNotification() async {

    var url = Uri.parse('http://127.0.0.1:8000/notifications/$notification_id');

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body) as Map<String, dynamic>;
        // Process the response data here
        return jsonResponse;
        print('Response: $jsonResponse');
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> createNotification(Name,description,admin_id)async{
    var apiUrl = Uri.parse('http://127.0.0.1:8000/notifications/');
Map<String,dynamic>data={"Name":Name,
  "description":description,
  "admin_id":admin_id

};
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };



    final http.Response response = await http.post(
      apiUrl ,
      headers: headers,
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      print('Data posted successfully');
      print('Response: ${response.body}');
    } else {
      print('Failed to post data. Error: ${response.reasonPhrase}');
    }

  }

  Future<void> updateNotification(int notificationId, Name,description,admin_id) async {
    var url = Uri.parse('http://127.0.0.1:8000/notifications/$notificationId');

    Map<String,dynamic>data={"Name":Name,
      "description":description,
      "admin_id":admin_id

    };
    try {
      var response = await http.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json'
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        print('Data sent successfully');
      } else {
        print('Failed to send data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error sending data: $error');
    }
  }



  Future<void> deleteNotification() async {
    var url = Uri.parse('http://127.0.0.1:8000/notifications/$notification_id');

    try {
      var response = await http.delete(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json'
        },
      );

      if (response.statusCode == 200) {
        print('Data deleted successfully');
      } else {
        print('Failed to delete data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error deleting data: $error');
    }
  }
}