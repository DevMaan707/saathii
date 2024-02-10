import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatApi{
  Future chatresponse(String uin) async {
    const url = 'http://10.0.51.135:8080/login';
    print("Sending req to : $url");


    var response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body:jsonEncode({
          "prompt": uin,

        },)
    );

    if (response.body != null && response.body.isNotEmpty) {
      var bdy = json.decode(response.body);
      if (bdy.containsKey('success')) {
        print(bdy['success']);
        // Continue processing the response...
      }
    }

    print(response.statusCode);
    if (response.statusCode == 200) {
      var token = json.decode(response.body);
      if (token.containsKey("response")) {
        return token["response"].toString();
      }
    } else {
      return null;
    }
  }
}
