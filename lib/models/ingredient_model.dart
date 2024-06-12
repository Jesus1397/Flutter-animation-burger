class Ingredient {
  String name;
  String image;
  bool selected;
  double width;

  Ingredient({
    required this.name,
    required this.image,
    required this.selected,
    this.width = 200.0,
  });
}
