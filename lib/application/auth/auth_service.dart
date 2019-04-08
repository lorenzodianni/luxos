import 'package:luxos/core/core.dart';
import 'package:luxos/environment.dart';

class Auth {
  static Map<String, dynamic> jwt;

  Auth();

  Future login(sha1) {
    final url = '$BASE_PATH/adfs/finalize/$sha1';
    return httpClient.post(url).then((dynamic response) {
      Auth.jwt = response.data['data'];
      return Auth.jwt;
    }, onError: (err) {
      Auth.jwt = Map();
    });
  }
}

final auth = Auth();
