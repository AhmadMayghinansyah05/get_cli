class Recipe {
  final int id;
  final String title;
  final String description;
  final String cookingMethod;
  final String ingredients;
  final String photoUrl;

  Recipe({
    required this.id,
    required this.title,
    required this.description,
    required this.cookingMethod,
    required this.ingredients,
    required this.photoUrl,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      cookingMethod: json['cooking_method'],
      ingredients: json['ingredients'],
      photoUrl: json['photo_url'] ?? '',
    );
  }
}
