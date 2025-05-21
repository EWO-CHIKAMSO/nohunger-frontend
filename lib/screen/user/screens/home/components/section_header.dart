import 'package:nohunger/utilities/constants.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onViewMore;
  final bool showViewMore;

  const SectionHeader({
    super.key,
    required this.title,
    this.onViewMore,
    this.showViewMore = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleSmall),
          if (showViewMore && onViewMore != null)
            TextButton(
              onPressed: onViewMore,
              child: Row(
                children: [
                  Text("See All", style: TextStyle(color: Colors.indigo, fontSize: 14)),
                  
                ],
              ),
            ),
        ],
      ),
    );
  }
}


// import 'package:client/utilities/constants.dart';
// import 'package:flutter/material.dart';

// class SectionHeader extends StatelessWidget {
//   final String title;
//   final VoidCallback onViewMore;

//   const SectionHeader({
//     super.key,
//     required this.title,
//     required this.onViewMore,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(title, style: Theme.of(context).textTheme.titleSmall),
//           TextButton(
//             onPressed: onViewMore,
//             child: Row(
//               children: [
//                 Text("View More", style: TextStyle(color: Colors.pink[300], fontSize: 14)),
//                 Icon(Icons.arrow_forward, size: 16, color: Colors.pink[300]),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
