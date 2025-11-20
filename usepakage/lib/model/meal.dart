
class Meal {
  final String id;
  final String name;
  final String url;

  const Meal({
    required this.id, 
    required this.name, 
    required this.url
  });

  // fonction qui permet de transformer un element json en meal

  factory Meal.fromJson(Map<String, dynamic> json){
    return Meal(
      id: json['idMeal'],
      name: json['strMeal'],
      url: json['strMealThumb']
    );
  }
}