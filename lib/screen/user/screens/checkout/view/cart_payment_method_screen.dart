import 'package:nohunger/components/naira_svg_icon.dart';
import 'package:nohunger/route/route_constants.dart';
import 'package:nohunger/screen/user/screens/checkout/components/cart_custom_button.dart';
import 'package:flutter/material.dart';

class CartPaymentMethodScreen extends StatefulWidget {
  const CartPaymentMethodScreen({super.key});

  @override
  State<CartPaymentMethodScreen> createState() =>
      _CartPaymentMethodScreenState();
}

class _CartPaymentMethodScreenState extends State<CartPaymentMethodScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabs = ['Pay with card', 'Pay with cash', 'Use credit'];
  bool _useCreditEnabled = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Payment method'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              // Custom Tab Bar
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _tabs.asMap().entries.map((entry) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: _buildTab(entry.key),
                      );
                    }).toList(),
                  ),
                ),
              ),

              // Tab Views
              Expanded(
                child: _tabController.index == 0
                    ? _buildPayWithCardView()
                    : _tabController.index == 1
                        ? _buildPayWithCashView()
                        : _buildUseCreditView(),
              ),
            ],
          ),
          // Confirm Button
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: CartCustomButton(
              onPressed: () {
                Navigator.pushNamed(context, cartFinalOrderScreenRoute);
              },
              buttonText: 'Confirm',
              backgroundColor: const Color(0xFF6C5CE7), // Default purple color
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(int index) {
    bool isSelected = _tabController.index == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _tabController.index = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF6C5CE7) : Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected ? Colors.transparent : Colors.grey.shade200,
          ),
        ),
        child: Row(
          children: [
            Icon(
              index == 0
                  ? Icons.credit_card
                  : (index == 1
                      ? Icons.payments
                      : Icons.account_balance_wallet),
              color: isSelected ? Colors.white : Colors.black,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              _tabs[index],
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPayWithCardView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 80),
      child: Column(
        children: [
          _buildAddNewCardButton(),
          const SizedBox(height: 16),
          _buildCreditCard(color: const Color(0xFF6C5CE7)),
          const SizedBox(height: 16),
          _buildCreditCard(color: const Color(0xFFFF7675)),
          const SizedBox(height: 16),
          _buildCreditCard(color: const Color(0xFFFAB1A0)),
        ],
      ),
    );
  }

  Widget _buildAmountWithNaira(
      {required String amount, TextStyle? style, Color? iconColor}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        NairaSvgIcon(color: iconColor ?? style?.color),
        const SizedBox(width: 2),
        Text(amount, style: style),
      ],
    );
  }

  Widget _buildPayWithCashView() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/illustrations/PayWithCash_lightTheme.png',
            height: 200,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 24),
          const Text(
            'Pay with cash',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
                height: 1.5,
              ),
              children: [
                const TextSpan(text: 'a noHunger refundable '),
                WidgetSpan(
                  child: _buildAmountWithNaira(
                    amount: '24.00',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                const TextSpan(
                  text:
                      ' will be charged to use cash on delivery, if you want to save this amount please switch to Pay with Card.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUseCreditView() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.credit_card),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'Use Credit for this purchase',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Switch(
                      value: _useCreditEnabled,
                      onChanged: (value) {
                        setState(() {
                          _useCreditEnabled = value;
                        });
                      },
                      activeColor: const Color(0xFF6C5CE7),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Available Balance:',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                      ),
                    ),
                    _buildAmountWithNaira(
                      amount: '1000',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
              height:
                  16), // Add some spacing between the container and the expanded content
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/illustrations/server_error.png'),
                  height: 200,
                ),
                const SizedBox(height: 24),
                const Text(
                  'Credit is not enough',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      height: 1.5,
                    ),
                    children: [
                      const TextSpan(
                        text:
                            'Your noHunger credit are not sufficient to pay for the order, please select an additional payment method to cover the balance of ',
                      ),
                      WidgetSpan(
                        child: _buildAmountWithNaira(
                          amount: '500',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddNewCardButton() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: const Icon(Icons.add_card_outlined),
        title: const Text(
          'Add new card',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        onTap: () {},
      ),
    );
  }

  Widget _buildCreditCard({required Color color}) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/logo/logo.png',
            height: 40,
            color: Colors.white,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '1253 5432 3521 3090',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Exp date',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 12,
                        ),
                      ),
                      const Text(
                        '09/24',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
