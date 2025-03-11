import 'package:accessibility_workshop/presentation/widgets/home_search_header.dart';
import 'package:flutter/material.dart';

import 'widgets/balance_card.dart';
import 'widgets/transaction_activity_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: const SingleChildScrollView(
        child: Column(
          children: [
            HomeSearchHeader(),
            SizedBox(height: 20),
            BalanceCard(),
            SizedBox(height: 20),
            TransactionActivityList(),
          ],
        ),
      ),
    );
  }
}
