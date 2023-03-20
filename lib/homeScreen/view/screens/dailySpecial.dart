

// class DailySpecial{
//   final String? description;
//   final double?price;
//   DailySpecial({required this.description,required this.price});


//   factory DailySpecial.fromRTDB(Map<String,dynamic>? data) {
//     return DailySpecial(
//       description: data!['description'] as String ,
//        price:data['price'] as double 
//        );
    
//   }
//   String fancyDescription(){
//     return 'Todays Special : A delicious $description for a low price of \$${price}';
//   }
// }

class FoodSpecial{
  String foodname;
  int id;
  String image;
  FoodSpecial({required this.foodname,required this.id,required this.image});


   factory FoodSpecial.fromRTDB( dynamic data) {
   
   
    return FoodSpecial(
      foodname: data['foodname'] as String , 
      id: data["id"] as int , 
      image: data["image"]as String 
      
     
       ,);
    
  }
  //  String fancyDescription(){
  //   return 'Todays Special : A delicious $foodname  ,id is ${id}';
  // }
}
