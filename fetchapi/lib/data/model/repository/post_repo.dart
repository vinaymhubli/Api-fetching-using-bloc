import 'package:dio/dio.dart';
import 'package:fetchapi/data/model/postmodel.dart';
import 'package:fetchapi/data/model/repository/api.dart';

class Repository {
  Api api = Api();
  Future<List<Postmodel>> fetchPosts() async {
    try {
      Response response = await api.sendRequet.get("/todos");
      List<dynamic> postmaps = response.data;
      return postmaps.map((postmap) => Postmodel.fromJson(postmap)).toList();
    } catch (ex) {
      throw ex;
    }
  }
}
