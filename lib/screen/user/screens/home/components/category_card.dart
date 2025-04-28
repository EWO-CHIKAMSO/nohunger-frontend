import 'package:nohunger/screen/user/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  final VoidCallback press;

  const CategoryCard({
    super.key,
    required this.category,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: 80,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(8)),
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  padding: const EdgeInsets.all(6.0),
                  child: _buildImage(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: Text(
                category.title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    if (category.image != null) {
      return Image.asset(
        category.image!,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return _buildPlaceholder();
        },
      );
    } else if (category.svgSrc != null) {
      return SvgPicture.asset(
        category.svgSrc!,
        fit: BoxFit.cover,
      );
    } else {
      return _buildPlaceholder();
    }
  }

  Widget _buildPlaceholder() {
    return Container(
      color: Colors.grey[200],
      child: const Icon(Icons.category, size: 30),
    );
  }
}







// import 'package:client/screen/user/models/category_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';


// class CategoryCard extends StatelessWidget {
//   final CategoryModel category;
//   final VoidCallback press;

//   const CategoryCard({
//     super.key,
//     required this.category,
//     required this.press,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: press,
//       child: Container(
//         width: 90, // Reduced from 120
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey[300]!),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
//               child: category.image != null
//                   ? Image.network(
//                       category.image!,
//                       height: 70, // Reduced from 100
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                     )
//                   : category.svgSrc != null
//                       ? SvgPicture.asset(
//                           category.svgSrc!,
//                           height: 70, // Reduced from 100
//                           width: double.infinity,
//                         )
//                       : Container(
//                           height: 70, // Reduced from 100
//                           width: double.infinity,
//                           color: Colors.grey[200],
//                           child: const Icon(Icons.image, size: 20),
//                         ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(6.0), // Reduced from 8.0
//               child: Text(
//                 category.title,
//                 style: const TextStyle(
//                   fontSize: 12, // Reduced from 14
//                   fontWeight: FontWeight.w500,
//                 ),
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }