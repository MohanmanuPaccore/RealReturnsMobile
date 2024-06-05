abstract class BaseApiServices {
  Future<dynamic> getGetApiResponse(String url);
  Future<dynamic> postApi(String url,Map<String,dynamic> body);


}
