import 'package:get/get.dart';

abstract class RepositoryInterface{
  Future<Response> get();
  Future<Response> post(Map<String, dynamic> body);
  Future<Response> update(Map<String, dynamic> body);
  Future<Response> delete();
  Future<Response> deleteById(String id);
  Future<Response> getById(String id);
  Future<Response> postMultipartBody(Map<String, dynamic> body);

}