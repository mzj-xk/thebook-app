// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart';
import 'package:thebook_app/models/login_bean.dart';

class BaseNetwork {
  // 工厂模式
  factory BaseNetwork() => _instance;
  static final BaseNetwork _instance = BaseNetwork._internal();
  late Dio dio;
  late BaseOptions options;

  BaseNetwork._internal() {
    dio = Dio()
      ..options = BaseOptions(
          baseUrl: 'http://localhost:8080',
          connectTimeout: 10000,
          receiveTimeout: 1000 * 60 * 60 * 24,
          responseType: ResponseType.json,
          headers: {"Content-Type": "application/json"});
  }
}

class Repository {
  static final _network = BaseNetwork();

  static Future login({required String email, required String password}) async {
    var response =
        await _network.dio.get('/user/login/' + email + '/' + password);
    if (response.statusCode == 200) {
      return LoginBean.fromJson(response.data);
    } else {
      return response.statusMessage;
    }
  }
}

// void main(List<String> args) {
//   var test1 = BaseNetwork();
//   var test2 = BaseNetwork();
//   print(identical(test1, test2));
//   print(test1 == test2);
// }
