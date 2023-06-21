import 'package:dio/dio.dart';

void main() async {
  const url =
      'http://ec2-3-27-124-243.ap-southeast-2.compute.amazonaws.com:8080/articles';
  final dio = Dio();
  await responseGet(dio, url);
}

Future<void> responseGet(Dio dio, String url) async {
  try {
    final response = await dio.get(url);
    print('get');
    print(response.statusCode);
    print(response.data);
    print('\n');
  } catch (e) {
    print(e);
  }
}
