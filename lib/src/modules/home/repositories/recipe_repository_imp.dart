import 'dart:convert';

import 'package:food_delivery/src/modules/home/models/recipe_model.dart';
import 'package:food_delivery/src/modules/home/repositories/recipe_repository.dart';
import 'package:http/http.dart' as http;

abstract class IHttpClient{
 Future get({required String url});
}

class HttpClient implements IHttpClient{
  final client = http.Client();
  
  @override
  Future get({required String url}) async{
    return await client.get(Uri.parse(url));
  }

}


class RecipeRepositoryImp implements RecipeRepository{
    IHttpClient client;

  RecipeRepositoryImp({required this.client});

  @override
  Future<List<RecipeModel>> getRecipes() async {
    final response = await client.get(url: 'http://192.168.2.17:8080/recipes');

    if (response.statusCode == 200) {
      final List<RecipeModel> books = [];

      final body = jsonDecode(response.body);

      body.map((item){
        final RecipeModel book = RecipeModel.fromMap(item);
        books.add(book);
      }).toList();

      return books;
    }else if(response.statusCode == 404){
      throw ('url não valida');
    }else{
      throw Exception('não deu p carregar');
    }
  }

 
}
