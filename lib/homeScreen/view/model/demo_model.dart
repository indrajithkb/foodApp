

// DemoModel demoModelFromJson(String str) => 
//DemoModel.fromJson(json.decode(str)as Map<String,dynamic>);

// String demoModelToJson(DemoModel data) => json.encode(data.toJson());

// class DemoModel {
//     DemoModel({
//         required this.demosub,
//     });

//     List<Nq8C9ItMdKp94BJ8Gkg> demosub;

//     factory DemoModel.fromJson(Map<String, dynamic> json) {
//     return  DemoModel(
//         demosub: List<Nq8C9ItMdKp94BJ8Gkg>.from((json["-NQ8c9ItMdKP94bJ8GKG"]as List).
//         map((x) => Nq8C9ItMdKp94BJ8Gkg.fromJson(x as Map<String,dynamic>))),
//     );
//     } 

//     Map<String, dynamic> toJson() => {
//         "-NQ8c9ItMdKP94bJ8GKG": List<dynamic>.from(demosub.map((x) => x.toJson())),
//     };
// }

// class Nq8C9ItMdKp94BJ8Gkg {
//     Nq8C9ItMdKp94BJ8Gkg({
//         required this.foodname,
//         required this.id,
//         required this.image,
//     });

//     String foodname;
//     int id;
//     String image;

//     factory Nq8C9ItMdKp94BJ8Gkg.fromJson(Map<String, dynamic> json) => Nq8C9ItMdKp94BJ8Gkg(
//         foodname: json["foodname"] as String,
//         id: json["id"]as int,
//         image: json["image"] as String,
//     );

//     Map<String, dynamic> toJson() => {
//         "foodname": foodname,
//         "id": id,
//         "image": image,
//     };
// }




// To parse this JSON data, do
//
//     final foodDemoModel = foodDemoModelFromJson(jsonString);

// ignore_for_file: lines_longer_than_80_chars, avoid_dynamic_calls


import 'dart:convert';

FoodDemoModel foodDemoModelFromJson(String str) => FoodDemoModel.fromJson(json.decode(str)as Map<String,dynamic>);

String foodDemoModelToJson(FoodDemoModel data) => json.encode(data.toJson());

class FoodDemoModel {
    FoodDemoModel({
        required this.nr2VxEfuKw1HWplkxdy,
    });

    factory FoodDemoModel.fromJson(dynamic json) => FoodDemoModel(
        nr2VxEfuKw1HWplkxdy: Nr2VxEfuKw1HWplkxdy.fromJson(json['-NR2VxEfuKw1hWplkxdy']as Map<String,dynamic>),
    );

    Nr2VxEfuKw1HWplkxdy nr2VxEfuKw1HWplkxdy;

    Map<String, dynamic> toJson() => {
        '-NR2VxEfuKw1hWplkxdy': nr2VxEfuKw1HWplkxdy.toJson(),
    };
}

class Nr2VxEfuKw1HWplkxdy {
    Nr2VxEfuKw1HWplkxdy({
        required this.banners,
        required this.foodBanners,
        required this.xploreResto,
    });

    factory Nr2VxEfuKw1HWplkxdy.fromJson(dynamic json) => Nr2VxEfuKw1HWplkxdy(
        banners: List<Banners>.from((json['banners']as List).map((x) => Banners.fromJson(x as dynamic))),
        foodBanners: List<FoodBanner>.from((json['foodBanners']as List).map((x) => FoodBanner.fromJson(x as dynamic))),
        xploreResto: List<XploreResto>.from((json['xploreResto']as List).map((x) => XploreResto.fromJson(x as dynamic))),
    );

    List<Banners> banners;
    List<FoodBanner> foodBanners;
    List<XploreResto> xploreResto;

    Map<String, dynamic> toJson() => {
        'banners': List<dynamic>.from(banners.map((x) => x.toJson())),
        'foodBanners': List<dynamic>.from(foodBanners.map((x) => x.toJson())),
        'xploreResto': List<dynamic>.from(xploreResto.map((x) => x.toJson())),
    };
}

class Banners {
    Banners({
        required this.id,
        required this.image,
    });

    factory Banners.fromJson(dynamic json) => Banners(
        id: json['id'] as int,
        image: json['image']as String,
    );

    int id;
    String image;

    Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
    };
}
class XploreResto {
    XploreResto({
        required this.id,
        required this.image,
        required this.rating,
        required this.off,
        required this.hotel,
        required this.time,
        required this.place,
        required this.distance,
    });

    factory XploreResto.fromJson(dynamic json) => XploreResto(
        id: json['id'] as int,
        image: json['image']as String,
        rating: json['rating'] as double,
        off: json['off'] as int,
        hotel: json['hotel'] as String,
        time:json['time'] as int,
        place: json['place'] as String,
        distance: json['distance']as int,
    );

    int id;
    String image;
   double rating;
   int off;
   String hotel;
   String place;
   int time; 
   int distance;

    Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'rating':rating,
        'off':off,
        'hotel':hotel,
        'time':time,
        'place':place,
        'distance':distance
    };
}

class FoodBanner {
    FoodBanner({
        required this.foodname,
        required this.id,
        required this.image,
    });

    factory FoodBanner.fromJson(dynamic json) => FoodBanner(
        foodname: json['foodname'] as String,
        id: json['id']as int,
        image: json['image']as String,
    );

    String foodname;
    int id;
    String image;

    Map<String, dynamic> toJson() => {
        'foodname': foodname,
        'id': id,
        'image': image,
    };
}
