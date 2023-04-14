import 'package:get/get.dart';
import 'package:movie_api/datasource/movie_data_api.dart';
import 'package:movie_api/network/dio_client.dart';
import 'package:movie_api/repository/impl/movie_repository_impl.dart';
import 'package:movie_api/repository/movie_repository.dart';

class DependencyInjection {
  static Future<void> init() async {
    final dioClient = await DioClient.setUp();
    MovieDataAPI movieDataAPI = MovieDataAPI(dioClient);
    MovieDataRepository repository = MovieDataRepositoryImpl(movieDataAPI);
    Get.put(repository);
  }
}
