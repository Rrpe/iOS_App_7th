import 'package:fake_store_app/models/cart_item.dart';

class PaymentService {
  Future<Map<String, dynamic>> processPayment({
    required double amount,
    required Map<String, String> shippingAddress,
    required List<CartItem> items,
  }) async {
    await Future.delayed(const Duration(seconds: 2));
    return {'status': 'success', 'message': 'Payment was sucessful'};
  }

  Future<String> _createTextPaymentIntent(double amount) async {
    await Future.delayed(const Duration(seconds: 1));
    return 'pi_test_dummy_client_secret_value';
  }

  Future<Map<String, dynamic>> processDummyPayment({
    required double amount,
    required String paymentMethod,
    required Map<String, String> shippingAddress,
    required List<CartItem> items,
  }) async {
    return {'status': 'success', 'message': 'Payment was successful'};
  }

  Future<Map<String, dynamic>> getDummyOrderStatus(String orderId) async {
    await Future.delayed(const Duration(seconds: 1));
    return {'status': 'success', 'message': 'Order is being processed'};
  }
}
