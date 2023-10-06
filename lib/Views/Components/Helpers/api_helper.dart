import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../Model/wallpaper_model.dart';
class ApiHelper {
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();

  fatchWallpaper({required search}) async{
    String apiKey = "39873543-c65671a4d953b3322f3847eeb";
    String searchData = search;
    String HostName = "https://pixabay.com";
    String api = "$HostName/api/?key=$apiKey&q=$searchData&image_type=photo&pretty=true";

     http.Response response = await http.get(Uri.parse(api));

     if(response.statusCode == 200){
       Map decodedData = jsonDecode(response.body);
       List imglist = decodedData['hits'];
        List<WallPaperModel> AllWallpaper = imglist.map((e) => WallPaperModel.fromJson(data: e)).toList();

        return AllWallpaper;

     }else{
       return null;
     }

  }
}