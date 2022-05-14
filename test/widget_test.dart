import 'package:get_cli_dempster_flutter/app/data/config/api.dart';
import 'package:http/http.dart' as http;

void main() async {
  Uri url = Uri.parse(Api().getPenyakits);
  print(url);
  var res = await http.get(url);
  print(res.body);
}
