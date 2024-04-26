import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
class Room{
  int price=0;
  int size=0;
  String room_type='';
  int app_id=0;
  int room_id=0;
  Future<dynamic> getRoom() async {
    var url = Uri.parse('http://127.0.0.1:8000/rooms/$room_id');

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

  Future<void> createRoom(size,room_type,price,app_id)async{
    var apiUrl = Uri.parse('http://127.0.0.1:8000/rooms/');
    Map<String,dynamic>data={
      "size":size,
      "room_type":room_type,
      "price":price,
      "app_id":app_id,
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

  Future<void> updateRoom(int roomId, size,room_type,price,app_id) async {
    var url = Uri.parse('http://127.0.0.1:8000/rooms/$roomId');
    Map<String,dynamic>data={
      "size":size,
      "room_type":room_type,
      "price":price,
      "app_id":app_id,
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



  Future<void> deleteRoom( ) async {
    var url = Uri.parse('http://127.0.0.1:8000/rooms/$room_id');

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