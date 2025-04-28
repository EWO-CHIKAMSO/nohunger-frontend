import 'package:nohunger/screen/user/models/category_model.dart';
import 'package:nohunger/screen/user/screens/home/components/category_modal.dart';
import 'package:nohunger/utilities/constants.dart';
import 'package:flutter/material.dart';

import 'category_card.dart';
import 'section_header.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: "Categories",
          onViewMore: () {
            // Handle View More action
          },
        ),
        const SizedBox(height: defaultPadding / 2),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoCategories.length,
                (index) => Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? defaultPadding : defaultPadding / 2,
                    right: index == demoCategories.length - 1 ? defaultPadding :  defaultPadding / 2,
                  ),
                  child: CategoryCard(
                    category: demoCategories[index],
                    press: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(16)),
                        ),
                        builder: (context) => CategoryBottomSheet(
                          categoryName: demoCategories[index].title,
                          subCategories: demoCategories[index].subCategories ?? [],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}






// class Categories extends StatelessWidget {
//   const Categories({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: [
//           ...List.generate(
//             demoCategories.length,
//             (index) => Padding(
//               padding: EdgeInsets.only(
//                   left: index == 0 ? defaultPadding : defaultPadding / 2,
//                   right:
//                       index == demoCategories.length - 1 ? defaultPadding : 0),
//               child: CategoryBtn(
//                 category: demoCategories[index].name,
//                 svgSrc: demoCategories[index].svgSrc,
//                 isActive: index == 0,
//                 press: () {
//                   if (demoCategories[index].route != null) {
//                     Navigator.pushNamed(context, demoCategories[index].route!);
//                   } else {
//                     // Open the bottom sheet for categories without a route
//                     showModalBottomSheet(
//                       context: context,
//                       isScrollControlled:
//                           true, // Allows the sheet to take up more space
//                       shape: const RoundedRectangleBorder(
//                         borderRadius: BorderRadius.vertical(
//                           top: Radius.circular(16),
//                         ),
//                       ),
//                       builder: (context) => CategoryBottomSheet(
//                         categoryName: demoCategories[index].name,
//                         subCategories:
//                             _getSubCategories(demoCategories[index].name),
//                       ),
//                     );
//                   }
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   List<String> _getSubCategories(String categoryName) {
//     // Define sub-categories based on the selected category
//     switch (categoryName) {
//       case 'Free':
//         return ['Groceries', 'Snacks', 'Foodstuffs', 'Student Combo'];
//       case 'Discount':
//         return ['Electronics', 'Clothing', 'Home Appliances', 'Accessories'];
//       case 'On Sale':
//         return ['Furniture', 'Decor', 'Kitchenware', 'Gardening'];
//       case 'Kids':
//         return ['Toys', 'Books', 'Clothing', 'School Supplies'];
//       // Add more cases as needed
//       default:
//         return [];
//     }
//   }

// }

// class CategoryBtn extends StatelessWidget {
//   const CategoryBtn({
//     super.key,
//     required this.category,
//     this.svgSrc,
//     required this.isActive,
//     required this.press,
//   });

//   final String category;
//   final String? svgSrc;
//   final bool isActive;
//   final VoidCallback press;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: press,
//       borderRadius: const BorderRadius.all(Radius.circular(30)),
//       child: Container(
//         height: 36,
//         padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
//         decoration: BoxDecoration(
//           color: isActive ? primaryColor : Colors.transparent,
//           border: Border.all(
//               color: isActive
//                   ? Colors.transparent
//                   : Theme.of(context).dividerColor),
//           borderRadius: const BorderRadius.all(Radius.circular(30)),
//         ),
//         child: Row(
//           children: [
//             if (svgSrc != null)
//               SvgPicture.asset(
//                 svgSrc!,
//                 height: 20,
//                 colorFilter: ColorFilter.mode(
//                   isActive ? Colors.white : Theme.of(context).iconTheme.color!,
//                   BlendMode.srcIn,
//                 ),
//               ),
//             if (svgSrc != null) const SizedBox(width: defaultPadding / 2),
//             Text(
//               category,
//               style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.w500,
//                 color: isActive
//                     ? Colors.white
//                     : Theme.of(context).textTheme.bodyLarge!.color,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



  // List<String> _getSubCategories(String categoryName) {
  //   // Define sub-categories based on the selected category
  //   switch (categoryName) {
  //     case 'Free':
  //       return ['Groceries', 'Snacks', 'Foodstuffs', 'Student Combo'];
  //     case 'Discount':
  //       return ['Groceries', 'Snacks', 'Foodstuffs', 'Student Combo'];
  //     case 'On Sale':
  //       return ['Groceries', 'Snacks', 'Foodstuffs', 'Student Combo'];
  //     case 'Kids':
  //       return ['Groceries', 'Snacks', 'Foodstuffs', 'Student Combo'];
  //     // Add more cases as needed
  //     default:
  //       return [];
  //   }
  // }