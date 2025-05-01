import 'package:flutter/material.dart';
import 'dart:async';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  bool isDropdownOpen = false;
  String selectedTimeframe = "Today";
  bool _showWithdrawModal = false;
  String _withdrawAmount = '';
  int _selectedAccount = 0;
  bool _isProcessing = false;
  bool _withdrawSuccess = false;

  final List<String> timeframes = [
    "Today", "This Week", "Last Week", "This Month", "Last Month", "This Year", "Last Year"
  ];

  final List<Map<String, dynamic>> _accounts = [
    {
      'id': 0,
      'bank': 'Chase Bank',
      'accountNumber': '****4567',
      'type': 'Checking',
      'icon': Icons.account_balance
    },
    {
      'id': 1,
      'bank': 'Bank of America',
      'accountNumber': '****1234',
      'type': 'Savings',
      'icon': Icons.account_balance_wallet
    }
  ];

  void _handleWithdraw() {
    if (_withdrawAmount.isEmpty) return;
    
    setState(() {
      _isProcessing = true;
    });
    
    // Simulate API call
    Timer(const Duration(seconds: 2), () {
      setState(() {
        _isProcessing = false;
        _withdrawSuccess = true;
      });
      
      // Close modal after success
      Timer(const Duration(milliseconds: 1500), () {
        setState(() {
          _showWithdrawModal = false;
          _withdrawAmount = '';
          _withdrawSuccess = false;
        });
      });
    });
  }

  void _handleMaxAmount() {
    setState(() {
      _withdrawAmount = '250.00';
    });
  }

  void _showWithdrawBottomSheet(BuildContext context) {
    setState(() {
      _showWithdrawModal = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,

        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    const Text("Wallet", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isDropdownOpen = !isDropdownOpen;
                        });
                      },
                      child: Row(
                        children: [
                          Text(selectedTimeframe, style: const TextStyle(fontSize: 16)),
                          const Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  ],),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const LinearGradient(
                        colors: [Colors.purple, Colors.pink],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Sales in April", style: TextStyle(color: Colors.white, fontSize: 16)),
                            Icon(Icons.cloud, color: Colors.white),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text("\$0.00", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.trending_up, color: Colors.white, size: 16),
                                SizedBox(width: 4),
                                Text("+2.5%", style: TextStyle(color: Colors.white, fontSize: 14)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Commission"),
                              SizedBox(height: 8),
                              Text("-\$0.00", style: TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Profit"),
                              SizedBox(height: 8),
                              Text("\$0.00", style: TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("\$0.00", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                            SizedBox(height: 4),
                            Text("Withdrawable Amount", style: TextStyle(color: Colors.white70, fontSize: 14)),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () => _showWithdrawBottomSheet(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          ),
                          child: const Text("Withdraw", style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (isDropdownOpen)
              Positioned(
                right: 16,
                top: 60,
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (var time in timeframes)
                          ListTile(
                            title: Text(time),
                            onTap: () {
                              setState(() {
                                selectedTimeframe = time;
                                isDropdownOpen = false;
                              });
                            },
                          ),
                      ],
                    )
                  ),
                ),
              ),
            if (_showWithdrawModal)
              _buildWithdrawModal(),
          ],
        ),
      ),
    );
  }

  Widget _buildWithdrawModal() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _showWithdrawModal = false;
        });
      },
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            onTap: () {}, // Prevents tap from closing the modal
            child: Container(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.85,
              ),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Withdraw Funds',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _showWithdrawModal = false;
                            });
                          },
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.close, color: Colors.black54, size: 20),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    
                    // Available Balance
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Available Balance', style: TextStyle(color: Colors.black54, fontSize: 14)),
                          SizedBox(height: 4),
                          Text('\$250.00', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // Withdrawal Amount
                    const Text(
                      'Withdrawal Amount',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 16),
                          const Text('\$', style: TextStyle(color: Colors.black54)),
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              style: const TextStyle(fontSize: 18),
                              decoration: const InputDecoration(
                                hintText: '0.00',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  _withdrawAmount = value;
                                });
                              },
                              controller: TextEditingController(text: _withdrawAmount),
                            ),
                          ),
                          TextButton(
                            onPressed: _handleMaxAmount,
                            child: const Text(
                              'MAX',
                              style: TextStyle(color: Colors.pinkAccent, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (_withdrawAmount.isEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          'Minimum withdrawal amount: \$10.00',
                          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                        ),
                      ),
                    const SizedBox(height: 16),
                    
                    // Select Bank Account
                    const Text(
                      'Select Bank Account',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 8),
                    
                    // Bank Account List
                    ..._accounts.map((account) => _buildBankAccountItem(account)),
                    
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add_circle, color: Colors.pinkAccent),
                      label: const Text(
                        'Add New Bank Account',
                        style: TextStyle(color: Colors.pinkAccent, fontWeight: FontWeight.w500),
                      ),
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    ),
                    const SizedBox(height: 16),
                    
                    // Fee Summary
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Withdrawal Fee', style: TextStyle(color: Colors.black54)),
                              Text('\$0.00', style: TextStyle(fontWeight: FontWeight.w500)),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('You\'ll Receive', style: TextStyle(color: Colors.black54)),
                              Text(
                                '\$${_withdrawAmount.isNotEmpty ? _withdrawAmount : '0.00'}',
                                style: const TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Confirm Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _withdrawAmount.isNotEmpty && !_isProcessing
                            ? _handleWithdraw
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _withdrawAmount.isNotEmpty && !_isProcessing
                              ? Colors.pinkAccent
                              : Colors.grey.shade400,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: _isProcessing
                            ? Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text('Processing...'),
                                ],
                              )
                            : _withdrawSuccess
                                ? Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Icon(Icons.check_circle, size: 16),
                                      SizedBox(width: 8),
                                      Text('Withdrawal Successful'),
                                    ],
                                  )
                                : const Text('Confirm Withdrawal'),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            _showWithdrawModal = false;
                          });
                        },
                        child: const Text('Cancel', style: TextStyle(color: Colors.black54)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBankAccountItem(Map<String, dynamic> account) {
    final bool isSelected = account['id'] == _selectedAccount;
    
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedAccount = account['id'];
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.pinkAccent : Colors.grey.shade300,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? Colors.pink.shade50 : Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(account['icon'], color: Colors.black54),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      account['bank'],
                      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                    Text(
                      '${account['accountNumber']} • ${account['type']}',
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ],
            ),
            if (isSelected)
              const Icon(Icons.check_circle, color: Colors.pinkAccent),
          ],
        ),
      ),
    );
  }
}