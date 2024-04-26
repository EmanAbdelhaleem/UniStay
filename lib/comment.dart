import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
class Comment{
  int comment_id=0;
  String comment='';
  String comment_date='';
  String comment_time='';
  int app_id=0;
  int admin_id=0;
  int cust_id=0;
  Future<dynamic> getComments() async {
    var url = Uri.parse('http://127.0.0.1:8000/comments/$comment_id');

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body) as Map<String, dynamic>;
        return jsonResponse;
        // Process the response data here
        print('Response: $jsonResponse');
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> createComment(comment,comment_date,comment_time,app_id,admin_id,cust_id)async{
    var apiUrl = Uri.parse('http://127.0.0.1:8000/comments/');
    Map<String,dynamic>data={
      "comment":comment,
      "comment_date":comment_date,
      "comment_time":comment_time,
      "app_id":app_id,
      "admin_id":admin_id,
      "cust_id":cust_id
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

  Future<void> updateComment(int commentId, comment,comment_date,comment_time,app_id,admin_id,cust_id) async {
    var url = Uri.parse('http://127.0.0.1:8000/comments/$commentId');
    Map<String,dynamic>data={
      "comment":comment,
      "comment_date":comment_date,
      "comment_time":comment_time,
      "app_id":app_id,
      "admin_id":admin_id,
      "cust_id":cust_id
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



  Future<void> deleteComment() async {
    var url = Uri.parse('http://127.0.0.1:8000/comments/$comment_id');

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