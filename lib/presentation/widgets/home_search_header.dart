import 'package:accessibility_workshop/data/transactions.dart';
import 'package:flutter/material.dart';

import '../modals/transaction_modal.dart';

class HomeSearchHeader extends StatelessWidget {
  const HomeSearchHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
      ),
      child: Stack(
        children: [
          Image.asset(fit: BoxFit.cover, 'assets/header.jpg'),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onSubmitted: (value) {
                          final transaction = _findTransaction(value);
                          if (transaction == null) {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: 300,
                                  color: Theme.of(context).cardColor,
                                  child: const Center(child: Text('No result found')),
                                );
                              },
                            );
                          } else {
                            showTransactionModal(
                              context: context,
                              name: transaction.name,
                              date: transaction.date,
                              amount: transaction.amount,
                              provider: transaction.provider,
                              type: transaction.type,
                            );
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Search for a transaction by name',
                          prefixIcon: const Icon(Icons.search),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Stay on top of your money", style: Theme.of(context).textTheme.headlineSmall),
                    Text("See how you're doing", style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Transaction? _findTransaction(String value) {
  for (final transaction in transactionList) {
    if (transaction.name.toLowerCase().contains(value.toLowerCase())) return transaction;
  }
  return null;
}
