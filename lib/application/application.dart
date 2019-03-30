import 'package:fluro/fluro.dart';
import 'home/home.dart';
import 'product/product.dart';

export 'home/home.dart';
export 'product/product.dart';

class Application {
  static Router router;

  static configureRoutes() {
    final router = new Router();
    router.define(
      HomeView.routerPath,
      handler: HomeView.routerHandler(),
      transitionType: TransitionType.native,
    );
    router.define(
      ProductListView.routerPath,
      handler: ProductListView.routerHandler(),
      transitionType: TransitionType.native,
    );
    Application.router = router;
  }
}
