// product_model.dart
import 'package:nohunger/utilities/constants.dart';

class ProductModel {
  final String image, brandName, title;
  final double price;
  final double? priceAfterDiscount;
  final int? dicountpercent;

  ProductModel({
    required this.image,
    required this.brandName,
    required this.title,
    required this.price,
    this.priceAfterDiscount,
    this.dicountpercent,
  });
}

List<ProductModel> demoPopularProducts = [
  ProductModel(
    image: productDemoImg1,
    title: "Freshly Cooked",
    brandName: "Mama Cash",
    price: 540,
    priceAfterDiscount: 420,
    dicountpercent: 20,
  ),
  ProductModel(
    image: productDemoImg4,
    title: "Freshly Baked",
    brandName: "Mama Cash",
    price: 800,
  ),
  ProductModel(
    image: productDemoImg5,
    title: "Freshly Baked",
    brandName: "Mama Cash",
    price: 650.62,
    priceAfterDiscount: 390.36,
    dicountpercent: 40,
  ),
  ProductModel(
    image: productDemoImg6,
    title: "Instant supply No delay...",
    brandName: "Mama Cash",
    price: 1264,
    priceAfterDiscount: 1200.8,
    dicountpercent: 5,
  ),
  ProductModel(
    image: productDemoImg7,
    title: "Instant supply No delay...",
    brandName: "Mama Cash",
    price: 650.62,
    priceAfterDiscount: 390.36,
    dicountpercent: 40,
  ),
  ProductModel(
    image: productDemoImg8,
    title: "Instant supply No delay...",
    brandName: "Mama Cash",
    price: 1264,
    priceAfterDiscount: 1200.8,
    dicountpercent: 5,
  ),
];
List<ProductModel> demoFlashSaleProducts = [
  ProductModel(
    image: productDemoImg5,
    title: "Cheapest price you can afford",
    brandName: "Mama Cash",
    price: 650.62,
    priceAfterDiscount: 390.36,
    dicountpercent: 40,
  ),
  ProductModel(
    image: productDemoImg6,
    title: "Cheapest price you can afford",
    brandName: "Mama Cash",
    price: 1264,
    priceAfterDiscount: 1200.8,
    dicountpercent: 5,
  ),
  ProductModel(
    image: productDemoImg4,
    title: "Cheapest price you can afford",
    brandName: "Mama Cash",
    price: 800,
    priceAfterDiscount: 680,
    dicountpercent: 15,
  ),
];
List<ProductModel> demoBestSellersProducts = [
  ProductModel(
    image: productDemoImg7,
    title: "Freshly Cooked",
    brandName: "Mama Cash",
    price: 650.62,
    priceAfterDiscount: 390.36,
    dicountpercent: 40,
  ),
  ProductModel(
    image: productDemoImg9,
    title: "Freshly Cooked",
    brandName: "Mama Cash",
    price: 1264,
    priceAfterDiscount: 1200.8,
    dicountpercent: 5,
  ),
  ProductModel(
    image: productDemoImg4,
    title: "Freshly Cooked",
    brandName: "Mama Cash",
    price: 800,
    priceAfterDiscount: 680,
    dicountpercent: 15,
  ),
];
List<ProductModel> kidsProducts = [
  ProductModel(
    image: productDemoImg7,
    title: "Freshly Cooked",
    brandName: "Mama Cash",
    price: 650.62,
    priceAfterDiscount: 590.36,
    dicountpercent: 24,
  ),
  ProductModel(
    image: productDemoImg10,
    title: "Freshly Cooked",
    brandName: "Mama Cash",
    price: 650.62,
  ),
  ProductModel(
    image: productDemoImg11,
    title: "Freshly Cooked",
    brandName: "Mama Cash",
    price: 400,
  ),
  ProductModel(
    image: productDemoImg12,
    title: "Freshly Cooked",
    brandName: "Mama Cash",
    price: 400,
    priceAfterDiscount: 360,
    dicountpercent: 20,
  ),
  ProductModel(
    image: productDemoImg13,
    title: "Freshly Cooked",
    brandName: "Mama Cash",
    price: 654,
  ),
  ProductModel(
    image: productDemoImg14,
    title: "Freshly Cooked",
    brandName: "Mama Cash",
    price: 250,
  ),
];


// // For demo only
// import 'package:client/utilities/constants.dart';


// class ProductModel {
//   final String image, brandName, title;
//   final double price;
//   final double? priceAfterDiscount;
//   final int? dicountpercent;

//   ProductModel({
//     required this.image,
//     required this.brandName,
//     required this.title,
//     required this.price,
//     this.priceAfterDiscount,
//     this.dicountpercent,
//   });
// }

// List<ProductModel> demoPopularProducts = [
//   ProductModel(
//     image: productDemoImg1,
//     title: "Freshly Cooked",
//     brandName: "Mama Cash",
//     price: 540,
//     priceAfterDiscount: 420,
//     dicountpercent: 20,
//   ),
//   ProductModel(
//     image: productDemoImg4,
//     title: "Freshly Baked",
//     brandName: "Mama Cash",
//     price: 800,
//   ),
//   ProductModel(
//     image: productDemoImg5,
//     title: "Freshly Baked",
//     brandName: "Mama Cash",
//     price: 650.62,
//     priceAfterDiscount: 390.36,
//     dicountpercent: 40,
//   ),
//   ProductModel(
//     image: productDemoImg6,
//     title: "Instant supply No delay...",
//     brandName: "Mama Cash",
//     price: 1264,
//     priceAfterDiscount: 1200.8,
//     dicountpercent: 5,
//   ),
//   ProductModel(
//     image: "https://i.imgur.com/tXyOMMG.png",
//     title: "Instant supply No delay...",
//     brandName: "Mama Cash",
//     price: 650.62,
//     priceAfterDiscount: 390.36,
//     dicountpercent: 40,
//   ),
//   ProductModel(
//     image: "https://i.imgur.com/h2LqppX.png",
//     title: "Instant supply No delay...",
//     brandName: "Mama Cash",
//     price: 1264,
//     priceAfterDiscount: 1200.8,
//     dicountpercent: 5,
//   ),
// ];
// List<ProductModel> demoFlashSaleProducts = [
//   ProductModel(
//     image: productDemoImg5,
//     title: "Cheapest price you can afford",
//     brandName: "Mama Cash",
//     price: 650.62,
//     priceAfterDiscount: 390.36,
//     dicountpercent: 40,
//   ),
//   ProductModel(
//     image: productDemoImg6,
//     title: "Cheapest price you can afford",
//     brandName: "Mama Cash",
//     price: 1264,
//     priceAfterDiscount: 1200.8,
//     dicountpercent: 5,
//   ),
//   ProductModel(
//     image: productDemoImg4,
//     title: "Cheapest price you can afford",
//     brandName: "Mama Cash",
//     price: 800,
//     priceAfterDiscount: 680,
//     dicountpercent: 15,
//   ),
// ];
// List<ProductModel> demoBestSellersProducts = [
//   ProductModel(
//     image: "https://i.imgur.com/tXyOMMG.png",
//     title: "Freshly Cooked",
//     brandName: "Mama Cash",
//     price: 650.62,
//     priceAfterDiscount: 390.36,
//     dicountpercent: 40,
//   ),
//   ProductModel(
//     image: "https://i.imgur.com/h2LqppX.png",
//     title: "Freshly Cooked",
//     brandName: "Mama Cash",
//     price: 1264,
//     priceAfterDiscount: 1200.8,
//     dicountpercent: 5,
//   ),
//   ProductModel(
//     image: productDemoImg4,
//     title: "Freshly Cooked",
//     brandName: "Mama Cash",
//     price: 800,
//     priceAfterDiscount: 680,
//     dicountpercent: 15,
//   ),
// ];
// List<ProductModel> kidsProducts = [
//   ProductModel(
//     image: "https://i.imgur.com/dbbT6PA.png",
//     title: "Freshly Cooked",
//     brandName: "Mama Cash",
//     price: 650.62,
//     priceAfterDiscount: 590.36,
//     dicountpercent: 24,
//   ),
//   ProductModel(
//     image: "https://i.imgur.com/7fSxC7k.png",
//     title: "Freshly Cooked",
//     brandName: "Mama Cash",
//     price: 650.62,
//   ),
//   ProductModel(
//     image: "https://i.imgur.com/pXnYE9Q.png",
//     title: "Freshly Cooked",
//     brandName: "Mama Cash",
//     price: 400,
//   ),
//   ProductModel(
//     image: "https://i.imgur.com/V1MXgfa.png",
//     title: "Freshly Cooked",
//     brandName: "Mama Cash",
//     price: 400,
//     priceAfterDiscount: 360,
//     dicountpercent: 20,
//   ),
//   ProductModel(
//     image: "https://i.imgur.com/8gvE5Ss.png",
//     title: "Freshly Cooked",
//     brandName: "Mama Cash",
//     price: 654,
//   ),
//   ProductModel(
//     image: "https://i.imgur.com/cBvB5YB.png",
//     title: "Freshly Cooked",
//     brandName: "Mama Cash",
//     price: 250,
//   ),
// ];