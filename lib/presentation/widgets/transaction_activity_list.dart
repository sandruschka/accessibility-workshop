import 'package:accessibility_workshop/data/transactions.dart';
import 'package:accessibility_workshop/presentation/widgets/transaction_tile.dart';
import 'package:flutter/material.dart';

import '../modals/transaction_modal.dart';

class TransactionActivityList extends StatelessWidget {
  const TransactionActivityList({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Text(
              "Recent activity",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            children: [
              const SizedBox(height: 8),
              for (final transaction in transactionList)
                TransactionTile(
                  title: transaction.name,
                  date: transaction.date,
                  amount: transaction.amount,
                  provider: transaction.provider,
                  type: transaction.type,
                  onTap: () => showTransactionModal(
                    context: context,
                    name: transaction.name,
                    date: transaction.date,
                    amount: transaction.amount,
                    provider: transaction.provider,
                    type: transaction.type,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
