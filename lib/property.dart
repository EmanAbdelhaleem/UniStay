import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;

class Property {
  int price=0;
  String Name='';
  String state='';
  int size=0;
  String description='';
  int owner_id=0;
  int app_id=0;
  Future<dynamic> getProperty() async {
    // app_id=appId;
    var url = Uri.parse('http://127.0.0.1:8000/properties/$app_id');

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

  Future<void> createProperty(price,Name,size,status,description,owner_id)async{
    var apiUrl = Uri.parse('http://127.0.0.1:8000/properties/');
Map<String,dynamic>data={
  "price":price,
  "Name":Name,
  "size":size,
  "status":status,
  "description":description,
  "owner_id":owner_id
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

  Future<void> updateProperty(int appId, price,Name,size,status,description,owner_id) async {
    var url = Uri.parse('http://127.0.0.1:8000/owner_addresses/$appId');
    Map<String,dynamic>data={
      "price":price,
      "Name":Name,
      "size":size,
      "status":status,
      "description":description,
      "owner_id":owner_id
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



  Future<void> deleteProperty() async {
    var url = Uri.parse('http://127.0.0.1:8000/properties/$app_id');

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
// void main()async{
//   var p=Property();
//   p.app_id=2;
//   print(await p.getProperty());
// }