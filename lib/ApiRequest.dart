import 'dart:convert';
import 'model.dart';
import 'package:http/http.dart' as http;


class ApiRequest {

static final String myUrl = 'https://todoapp-api-vldfm.ondigitalocean.app/todos' ;

static final String myKey = '58901247-9d2d-4e38-8ae4-c3f6e46a4b9e';

static Future<List<Item>> getMyItems() async {
http.Response response = await http.get(myUrl + '?key=' + myKey);

return _myResponseList(response);

}


 
 //post
static Future<List<Item>> postMyItems(Item item) async {
    http.Response response = await http.post(
      myUrl + '?key=' + myKey,
      headers: <String, String>{"Content-type": "application/json"},
      body: jsonEncode(<String, dynamic>{
        "title": item.name,
        "done": item.isDone,
      }),
    );
    
    return _myResponseList(response);
  }

// Put
static Future<List<Item>> putMyItem(Item item) async {
    http.Response response = await http.put(
      myUrl + '/${item.id}?key=' + myKey,
       headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(<String, dynamic>{
        "title": item.name,
        "done": item.isDone,
      }),
    );
    return _myResponseList(response);
  }
  
 // DELETE
  static Future<List<Item>> deleteMyItems(Item item) async {
    http.Response response = await http.delete(myUrl + '/${item.id}?key=' + myKey);
    return _myResponseList(response);
  }
static List<Item> _myResponseList(http.Response response) {
    List<Item> todoList = [];
    var jsonResponseBody = response.body;

    var responseBody = jsonDecode(jsonResponseBody);

    responseBody
        .map((object) => todoList.add(Item(
              id: object["id"],
              name: object["title"],
              isDone: object["done"],
            )))
        .toList();

    return todoList;
   }



}





