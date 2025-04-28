import 'package:nohunger/route/screen_export.dart';
import 'package:nohunger/screen/user/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryBottomSheet extends StatelessWidget {
  final String categoryName;
  final List<CategoryModel> subCategories;

  const CategoryBottomSheet({
    super.key,
    required this.categoryName,
    required this.subCategories,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                categoryName,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Flexible(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 3, // Adjusted for horizontal layout
              ),
              itemCount: subCategories.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    subDiscoverScreenRoute,
                    arguments: subCategories[index].title,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: SizedBox(
                            height: 40, // Reduced size of the image container
                            width: 40, // Reduced size of the image container
                            child: subCategories[index].image != null
                                ? Image.asset(
                                    subCategories[index].image!,
                                    fit: BoxFit.cover,
                                  )
                                : subCategories[index].svgSrc != null
                                    ? SvgPicture.asset(
                                        subCategories[index].svgSrc!,
                                        fit: BoxFit.cover,
                                      )
                                    : const Icon(Icons.category),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            subCategories[index].title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis, // Clips long text with '...'
                            maxLines: 1, // Ensures text stays on one line
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, viewAllProductScreenRoute);
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.pink[300]!),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'View all Stocks',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.pink[300],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: Colors.pink[300],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// import 'package:client/route/screen_export.dart';
// import 'package:client/screen/user/models/category_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class CategoryBottomSheet extends StatelessWidget {
//   final String categoryName;
//   final List<CategoryModel> subCategories;

//   const CategoryBottomSheet({
//     super.key,
//     required this.categoryName,
//     required this.subCategories,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(24),
//       decoration: BoxDecoration(
//         color: Theme.of(context).scaffoldBackgroundColor,
//         borderRadius: const BorderRadius.vertical(
//           top: Radius.circular(16),
//         ),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 categoryName,
//                 style: Theme.of(context).textTheme.headlineMedium?.copyWith(
//                       fontWeight: FontWeight.w600,
//                     ),
//               ),
//               IconButton(
//                 icon: const Icon(Icons.close),
//                 onPressed: () => Navigator.of(context).pop(),
//               ),
//             ],
//           ),
//           const SizedBox(height: 24),
//           Flexible(
//             child: GridView.builder(
//               shrinkWrap: true,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 16,
//                 mainAxisSpacing: 16,
//                 childAspectRatio: 3, // Adjusted for horizontal layout
//               ),
//               itemCount: subCategories.length,
//               itemBuilder: (context, index) => GestureDetector(
//                 onTap: () {
//                   Navigator.pushNamed(
//                     context,
//                     subDiscoverScreenRoute,
//                     arguments: subCategories[index].title,
//                   );
//                 },
//                 child: Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey[300]!),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: Row(
//                       children: [
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(8),
//                           child: Container(
//                             height: 40, // Reduced size of the image container
//                             width: 40, // Reduced size of the image container
//                             child: subCategories[index].image != null
//                                 ? Image.asset(
//                                     subCategories[index].image!,
//                                     fit: BoxFit.cover,
//                                   )
//                                 : subCategories[index].svgSrc != null
//                                     ? SvgPicture.asset(
//                                         subCategories[index].svgSrc!,
//                                         fit: BoxFit.cover,
//                                       )
//                                     : const Icon(Icons.category),
//                           ),
//                         ),
//                         const SizedBox(width: 8),
//                         Expanded(
//                           child: Text(
//                             subCategories[index].title,
//                             style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 24),
//           SizedBox(
//             width: double.infinity,
//             child: TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//                 Navigator.pushNamed(context, viewAllProductScreenRoute);
//               },
//               style: TextButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(vertical: 16),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   side: BorderSide(color: Colors.pink[300]!),
//                 ),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'View all Stocks',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.pink[300],
//                     ),
//                   ),
//                   const SizedBox(width: 8),
//                   Icon(
//                     Icons.arrow_forward,
//                     size: 20,
//                     color: Colors.pink[300],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }