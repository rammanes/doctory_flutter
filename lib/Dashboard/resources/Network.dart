import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' show Client, Response;

class NetworkCall{
  Client client = Client();
  final String url;
  final Map <String, String> headers;

  NetworkCall(this.url, this.headers);

  Future getRequest() async{
    print("calling uri: $url");
    Response response = await client.get(url,headers:headers);
    if(response.statusCode == 200){
      return response.body;
    }else{
      print(response.statusCode);
    }
  }


}