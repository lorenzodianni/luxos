import 'package:luxos/core/core.dart';
import 'package:luxos/environment.dart';

class Auth {
  static String token;

  Auth();

  Future login(String sha1) {
    final url = '$BASE_PATH/adfs/finalize/' + sha1;
    return httpClient.post(url).then((dynamic response) {
      Auth.token = response.data['data']['sessionId'];
      return Auth.token;
    }, onError: (err) {
      Auth.token = null;
    });
  }
}

final auth = Auth();
