import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class RecipeDetailView extends StatefulWidget {
  final int recipeId;

  RecipeDetailView({required this.recipeId});

  @override
  _RecipeDetailViewState createState() => _RecipeDetailViewState();
}

class _RecipeDetailViewState extends State<RecipeDetailView> {
  final box = GetStorage();
  bool isLoading = true;
  Map<String, dynamic>? recipe;

  @override
  void initState() {
    super.initState();
    fetchRecipeDetail();
  }

  Future<void> fetchRecipeDetail() async {
    try {
      var token = box.read('token');
      var response = await Dio().get(
        'https://recipe.incube.id/api/recipes/${widget.recipeId}',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200 && response.data['status'] == 'success') {
        setState(() {
          recipe = response.data['data'];
          isLoading = false;
        });
      } else {
        Get.snackbar('Error', response.data['message']);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch recipe details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe?['title'] ?? 'Recipe Detail')),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(recipe?['photo_url'] ?? '', height: 200, fit: BoxFit.cover),
                  SizedBox(height: 10),
                  Text(recipe?['title'] ?? '', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text(recipe?['description'] ?? '', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 10),
                  Text("Cooking Method:", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(recipe?['cooking_method'] ?? ''),
                  SizedBox(height: 10),
                  Text("Ingredients:", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(recipe?['ingredients'] ?? ''),
                ],
              ),
            ),
    );
  }
}
