class CategoryModel {
  final String title;
  final String? image;
  final String? svgSrc;
  final List<CategoryModel>? subCategories;

  CategoryModel({
    required this.title,
    this.image,
    this.svgSrc,
    this.subCategories,
  });
}

final List<CategoryModel> demoCategoriesWithImage = [
  CategoryModel(title: "Free", image: "https://i.imgur.com/5M89G2P.png"),
  CategoryModel(title: "Discount", image: "https://i.imgur.com/UM3GdWg.png"),
  CategoryModel(title: "On Sale", image: "https://i.imgur.com/Lp0D6k5.png"),
  CategoryModel(title: "Collabo", image: "https://i.imgur.com/3mSE5sN.png"),
  CategoryModel(title: "Woman’s", image: "https://i.imgur.com/5M89G2P.png"),
  CategoryModel(title: "Man’s", image: "https://i.imgur.com/UM3GdWg.png"),
  CategoryModel(title: "Kid’s", image: "https://i.imgur.com/Lp0D6k5.png"),
  CategoryModel(title: "Accessory", image: "https://i.imgur.com/3mSE5sN.png"),
];


final List<CategoryModel> demoCategories = [
  CategoryModel(
    title: "Free",
    image: "assets/images/user/stocks/other/butter.png",
    subCategories: [
      CategoryModel(title: "Beverages", image: "assets/images/user/stocks/other/provision.png"),
      CategoryModel(title: "Canned Food", image: "assets/images/user/stocks/other/provision.png"),
      CategoryModel(title: "Frozen", image: "assets/images/user/stocks/other/provision.png"),
    ],
  ),
  CategoryModel(
    title: "Discount",
    image: "assets/images/user/stocks/other/provision.png",
    subCategories: [
      CategoryModel(title: "Beverages", image: "assets/images/user/stocks/other/provision.png"),
      CategoryModel(title: "Canned Food", image: "assets/images/user/stocks/other/provision.png"),
      CategoryModel(title: "Frozen", image: "assets/images/user/stocks/other/provision.png"),
    ],
  ),
  CategoryModel(
    title: "On Sale",
    image: "assets/images/user/stocks/other/soft_drinks.png",
    subCategories: [
      CategoryModel(title: "Beverages", image: "assets/images/user/stocks/other/provision.png"),
      CategoryModel(title: "Canned Food", image: "assets/images/user/stocks/other/provision.png"),
      CategoryModel(title: "Frozen", image: "assets/images/user/stocks/other/provision.png"),
    ],
  ),
  CategoryModel(
    title: "Collabo",
    image: "assets/images/user/stocks/other/provision.png",
    subCategories: [
      CategoryModel(title: "Beverages", image: "assets/images/user/stocks/other/provision.png"),
      CategoryModel(title: "Canned Food", image: "assets/images/user/stocks/other/provision.png"),
      CategoryModel(title: "Frozen", image: "assets/images/user/stocks/other/provision.png"),
    ],
  ),
];


// final List<CategoryModel> demoCategories = [
//   CategoryModel(
//     title: "Woman's",
//     image: "https://i.imgur.com/5M89G2P.png",
//     subCategories: [
//       CategoryModel(title: "Dresses", image: "https://i.imgur.com/5M89G2P.png"),
//       CategoryModel(title: "Tops", image: "https://i.imgur.com/UM3GdWg.png"),
//       CategoryModel(title: "Bottoms", image: "https://i.imgur.com/Lp0D6k5.png"),
//     ],
//   ),
//   CategoryModel(
//     title: "Man's",
//     image: "https://i.imgur.com/UM3GdWg.png",
//     subCategories: [
//       CategoryModel(title: "Shirts", image: "https://i.imgur.com/6SZPjIm.png"),
//       CategoryModel(title: "Pants", image: "https://i.imgur.com/8dE6DfB.png"),
//       CategoryModel(title: "Accessories", image: "https://i.imgur.com/3mSE5sN.png"),
//     ],
//   ),
//   CategoryModel(
//     title: "Kid's",
//     image: "https://i.imgur.com/Lp0D6k5.png",
//     subCategories: [
//       CategoryModel(title: "Boys", image: "https://i.imgur.com/VNrTaZR.png"),
//       CategoryModel(title: "Girls", image: "https://i.imgur.com/Kx4RIlP.png"),
//       CategoryModel(title: "Babies", image: "https://i.imgur.com/bXgJg7F.png"),
//     ],
//   ),
//   CategoryModel(
//     title: "Accessory",
//     image: "https://i.imgur.com/3mSE5sN.png",
//     subCategories: [
//       CategoryModel(title: "Jewelry", image: "https://i.imgur.com/Y9hYW8L.png"),
//       CategoryModel(title: "Bags", image: "https://i.imgur.com/Hm8P7kj.png"),
//       CategoryModel(title: "Shoes", image: "https://i.imgur.com/qNOjJje.png"),
//     ],
//   ),
// ];




// final List<CategoryModel> demoCategories = [
//   CategoryModel(
//     title: "On sale",
//     svgSrc: "assets/icons/Sale.svg",
//     subCategories: [
//       CategoryModel(title: "All Clothing"),
//       CategoryModel(title: "New In"),
//       CategoryModel(title: "Coats & Jackets"),
//       CategoryModel(title: "Dresses"),
//       CategoryModel(title: "Jeans"),
//     ],
//   ),
//   CategoryModel(
//     title: "Man’s & Woman’s",
//     svgSrc: "assets/icons/Man&Woman.svg",
//     subCategories: [
//       CategoryModel(title: "All Clothing"),
//       CategoryModel(title: "New In"),
//       CategoryModel(title: "Coats & Jackets"),
//     ],
//   ),
//   CategoryModel(
//     title: "Kids",
//     svgSrc: "assets/icons/Child.svg",
//     subCategories: [
//       CategoryModel(title: "All Clothing"),
//       CategoryModel(title: "New In"),
//       CategoryModel(title: "Coats & Jackets"),
//     ],
//   ),
//   CategoryModel(
//     title: "Accessories",
//     svgSrc: "assets/icons/Accessories.svg",
//     subCategories: [
//       CategoryModel(title: "All Clothing"),
//       CategoryModel(title: "New In"),
//     ],
//   ),
// ];