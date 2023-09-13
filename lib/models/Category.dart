class Category {
 late String imageurl  ;
 late String title ;
 late bool selected ;

 Category(this.imageurl, this.title, this.selected);
}

List<Category> categories = [
    Category("assets/Categories/MobilePhone.png", "smartphones" , false),
  Category("assets/Categories/Laptop.png", "laptops", false),
  Category("assets/Categories/Fragrances.png", "fragrances", false),
  Category("assets/Categories/SkinCare.png", "skincare", false),
  Category("assets/Categories/Groceries.png", "groceries", false),
  Category("assets/Categories/Home_decoration.png", "home-decoration", false),
];







