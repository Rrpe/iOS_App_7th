// dart 기본 패키지 임포트
import 'dart:convert';
// 서드파티 라이브러리 임포트
import 'package:http/http.dart' as http;
// 프로젝트 파일 임포트
import '../models/product.dart';

class ApiService {
  final String _baseUrl = 'https://fakestoreapi.com';
  final String _simpleServerUrl = 'https://472e-114-203-36-159.ngrok-free.app/';

  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse('$_baseUrl/products'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Product> products =
          body.map((dynamic item) => Product.fromJson(item)).toList();
      return products;
    } else {
      throw 'Failed to load products';
    }
  }

  Future<Product> getProduct(int id) async {
    final response = await http.get(Uri.parse('$_baseUrl/products/$id'));
    if (response.statusCode == 200) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw 'Failed to load product';
    }
  }

  Future<String> createPaymentIntent() async {
    final response = await http.post(
      Uri.parse('$_simpleServerUrl/create-payment-intent'),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['clientSecret'];
    } else {
      throw 'Failed to create checkout session';
    }
  }
}
