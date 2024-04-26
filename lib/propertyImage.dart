import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;

class propertImage{
  int img_id=0;
  String description='';
  int app_id=0;
  Future<dynamic> getPropertyImage() async {
    var url = Uri.parse('http://127.0.0.1:8000/property_images/$img_id');

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

  Future<void> createPropertyImage(img_id,description,app_id)async{
    var apiUrl = Uri.parse('http://127.0.0.1:8000/property_images/');
Map<String,dynamic>data={

  "description":description,
  "app_id":app_id
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

  Future<void> updatePropertyImage(int img_id, description,app_id) async {
    var url = Uri.parse('http://127.0.0.1:8000/property_images/$img_id');
    Map<String,dynamic>data={

      "description":description,
      "app_id":app_id
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



  Future<void> deletePropertyImage() async {
    var url = Uri.parse('http://127.0.0.1:8000/property_images/$img_id');

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