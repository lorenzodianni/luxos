import 'package:fluro/fluro.dart';
import 'auth/auth.dart';
import 'home/home.dart';
import 'product/product.dart';
import 'basket/basket.dart';

export 'auth/auth.dart';
export 'home/home.dart';
export 'product/product.dart';
export 'basket/basket.dart';

class Application {
  static double mainAxisSpacing = 16;

  static Router router;

  static configureRoutes() {
    final router = new Router();
    AuthView.defineRoute(router);
    HomeView.defineRoute(router);
    ProductListView.defineRoute(router);
    BasketView.defineRoute(router);
    Application.router = router;
  }
}
