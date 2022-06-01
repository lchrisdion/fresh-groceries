import 'package:dio/dio.dart';

import '../models/user_info_model.dart';

class UserRepository {
  var dio = Dio();

  Future<List<UserInfo>> getUserInfo() async {
    var response = await dio.get('https://randomuser.me/api/');
    return (response.data['results'] as List)
        .map((e) => UserInfo.fromJson(e))
        .toList();
  }
}
