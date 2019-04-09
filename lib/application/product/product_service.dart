import 'package:luxos/core/core.dart';
import 'package:luxos/environment.dart';
import 'package:luxos/application/application.dart';

class Product {
  String id;
  String name;
  List<String> images;

  Product.fromJson(product) {
    id = product['id'];
    name = product['name'];
    images = List<String>.from(product['images'].map((i) => i['url']));
  }
}

class ProductListResponse {
  int page;
  int perPage;
  int total;
  List<Product> data;

  ProductListResponse.fromJson(response) {
    page = response['page'];
    perPage = response['perPage'];
    total = response['total'];
    data = List<Product>.from(response['data'].map((i) => Product.fromJson(i)));
  }
}

class ProductService {
  ProductService();

  Future getProducts() {
    final url = '$BASE_PATH/products';
    final options = Options(headers: {'Authorization': Auth.token});
    return httpClient.get(url, options: options).then((res) {
      var response = ProductListResponse.fromJson(res.data['data']);
      return response;
    }, onError: (err) {
      return err;
    });
  }
}

final productService = ProductService();