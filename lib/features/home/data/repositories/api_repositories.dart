import 'dart:convert';
import 'package:bloc_state_management/features/home/data/models/home_mode.dart';
import 'package:http/http.dart';

class ApiRepositories {
  final String _url = 'https://reqres.in/api/users?page=2';
  Future<List<HomeModel>> fetchData() async {
    Response response = await get(Uri.parse(_url));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => HomeModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
