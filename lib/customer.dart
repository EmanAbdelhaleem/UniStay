import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/user.dart';

class customer extends user{
  final String path='customers';
  @override
  Future<dynamic> getUser()async{
    // serverPath=path;
    // id=Id;
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
Future<void> updateUser(int custId, name,email,password,username,image) async {
  var url = Uri.parse('http://127.0.0.1:8000/$path/$custId');
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
 //  void main(){
 // var cust=customer();
 //
 // cust.username='fdfds';
 // cust.password='gtghgh';
 // cust.name='kjn';
 // cust.email='ddf@gmail.com';
 // cust.image='h';
 // // cust.createUser(cust.name, cust.email  , cust.password, cust.username, cust.image);
 // cust.deleteCustomer(12);
 // print(cust.getUser(12, cust.path));
 //  }
