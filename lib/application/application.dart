import 'package:fluro/fluro.dart';
import 'login/login.dart';
import 'home/home.dart';
import 'product/product.dart';
import 'basket/basket.dart';

export 'login/login.dart';
export 'home/home.dart';
export 'product/product.dart';
export 'basket/basket.dart';

class Application {
  static Router router;

  static configureRoutes() {
    final router = new Router();
    LoginView.defineRoute(router);
    HomeView.defineRoute(router);
    ProductListView.defineRoute(router);
    BasketView.defineRoute(router);
    Application.router = router;
  }
}
