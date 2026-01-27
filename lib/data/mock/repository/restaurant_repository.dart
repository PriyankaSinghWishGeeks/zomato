import '../../config/app_config.dart';
import '../mock/mock_restaurants.dart';

class RestaurantRepository {
  Future<List<Map<String, dynamic>>> getRestaurants() async {
    if (AppConfig.useMock) {
      await Future.delayed(const Duration(seconds: 1));
      return mockRestaurants;
    }

    // 🔥 real API later
    throw UnimplementedError();
  }
}
