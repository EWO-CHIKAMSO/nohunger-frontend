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
        SizedBox(
          height: 100, // Fixed height for the category row
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(
                  demoCategories.length,
                  (index) => Padding(
                    padding: EdgeInsets.only(
                      left: defaultPadding ,
                      right: defaultPadding ,
                    ),
                    child: Column(
                      children: [
                        // Circular category container
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(16),
                                      ),
                                    ),
                                    builder: (context) => CategoryBottomSheet(
                                      categoryName: demoCategories[index].title,
                                      subCategories: demoCategories[index].subCategories ?? [],
                                    ),
                                  );
                                },
                                child: ClipOval(
                                  child: Image.asset(
                                    demoCategories[index].image!,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) => 
                                      const Icon(Icons.fastfood, color: Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                            if (demoCategories[index].subCategories != null && demoCategories[index].subCategories!.isNotEmpty)
                              Container(
                                width: 16,
                                height: 16,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                ),
                                child: const Icon(
                                  Icons.local_fire_department,
                                  color: Colors.white,
                                  size: 10,
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        // Category name
                        SizedBox(
                          width: 64,
                          child: Text(
                            demoCategories[index].title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black87,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}