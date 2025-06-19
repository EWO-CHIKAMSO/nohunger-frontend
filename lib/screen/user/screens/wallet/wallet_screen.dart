import 'package:nohunger/screen/user/models/product_model.dart';
import 'package:nohunger/screen/user/screens/home/components/rewards_section.dart';
import 'package:nohunger/utilities/constants.dart';
import 'package:flutter/material.dart';

import 'components/wallet_balance_card.dart';
import 'components/wallet_history_card.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(236, 243, 242, 242),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: CustomScrollView(
            slivers: [

              SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    children: [
                      WalletBalanceCard(
                        balance: 384.90,
                        onTabChargeBalance: () {},
                        userName: "Robert Fox",
                        avatarUrl: "https://i.imgur.com/IXnwbLk.png",
                      ),
                      const SizedBox(height: 70), // Add space for the overlapping container
                    ],
                  ),
                ),
              ),
           
              SliverToBoxAdapter(child: SizedBox(height: 180,),),
                SliverToBoxAdapter(child: RewardsSection(),),
              SliverPadding(
                padding: const EdgeInsets.only(top:defaultPadding),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    "Wallet history",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                    padding: const EdgeInsets.only(top: defaultPadding +10),
                    child: WalletHistoryCard(
                      isReturn: index == 1,
                      date: "JUN 12, 2020",
                      amount: 129,
                      products: [
                        ProductModel(
                          image: productDemoImg1,
                          title: "Mountain Warehouse for Women",
                          brandName: "Lipsy london",
                          price: 540,
                          priceAfterDiscount: 420,
                          dicountpercent: 20,
                        ),
                        ProductModel(
                          image: productDemoImg4,
                          title: "Mountain Beta Warehouse",
                          brandName: "Lipsy london",
                          price: 800,
                        ),
                      ],
                    ),
                  ),
                  childCount: 4,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
