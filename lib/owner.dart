
import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/user.dart';
class Owner extends user{

  final String path='owners';
  @override
  Future<dynamic> getUser()async{
    // serverPath=path;

    var url = Uri.parse('http://127.0.0.1:8000/$path/$Id');

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body) as Map<String, dynamic>;
        return jsonResponse;


      } else {
        return('Request failed with status: ${response.statusCode}.');
      }
    } catch (error) {
      return('Error: $error');
    }
  }
  @override
  Future<void> createUser(name,email,password,username,image)async{

    var apiUrl = Uri.parse('http://127.0.0.1:8000/$path/');
    Map<String,dynamic>data={
      "Name":name,
      "E_mail":email,
      "password":password,
      "username":username,
      "image":image
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
  @override
  Future<void> updateUser(int Id, name,email,password,username,image) async {
    var url = Uri.parse('http://127.0.0.1:8000/$path/$Id');
    Map<String,dynamic>data={
      "Name":name,
      "E_mail":email,
      "password":password,
      "username":username,
      "image":image
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
  @override
  Future<void> deleteUser() async {
    var url = Uri.parse('http://127.0.0.1:8000/$path/$Id');

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
void main()async{
   var owner=Owner();
   // owner.name=' chelwell';
   // owner.image='hgf.jpg';
   // owner.username='Bn';
   // owner.password='655521';
   // owner.email='llggl@gmail.com';
   owner.Id=1;

   // owner.createUser(owner.name, owner.email, owner.password, owner.username, owner.image);
   print( await owner.getUser());



}