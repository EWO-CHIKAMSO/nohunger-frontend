import 'package:flutter/material.dart';
import 'package:nohunger/utilities/constants.dart';

class RewardsSection extends StatefulWidget {
  const RewardsSection({super.key});

  @override
  State<RewardsSection> createState() => _RewardsSectionState();
}

class _RewardsSectionState extends State<RewardsSection> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final int _numPages = 3; // Number of reward items to show
  
  @override
  void initState() {
    super.initState();
    // Auto scroll every 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      _autoScroll();
    });
  }

  void _autoScroll() {
    if (!mounted) return;
    
    _currentPage++;
    if (_currentPage >= _numPages) {
      _currentPage = 0;
    }
    
    _pageController.animateToPage(
      _currentPage,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    
    // Schedule next scroll
    Future.delayed(const Duration(seconds: 3), () {
      _autoScroll();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              // Handle rewards tap
            },
            child: SizedBox(
              height: 80,
              child: PageView.builder(
                controller: _pageController,
                itemCount: _numPages,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFFFE7E7),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/icons/reward_icon.png',
                              width: 24,
                              height: 24,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                        const SizedBox(width: defaultPadding),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'You have no points in your balance yet',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Click to check your rewards',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.chevron_right,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}