import 'package:accessibility_workshop/data/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../modals/transaction_modal.dart';

class TransactionActivityList extends StatelessWidget {
  const TransactionActivityList({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
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
                TransactionCard(
                  name: transaction.name,
                  date: transaction.date,
                  provider: transaction.provider,
                  amount: transaction.amount,
                  type: transaction.type,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.name,
    required this.date,
    required this.provider,
    required this.amount,
    required this.type,
  });

  final String name;
  final DateTime date;
  final String provider;
  final double amount;
  final TransactionType type;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showTransactionModal(
        context: context,
        name: name,
        date: date,
        amount: amount,
        provider: provider,
        type: type,
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: ListTile(
          title: Text(name),
          subtitle: Text("${DateFormat.yMMMd().format(date).toString()} • $provider"),
          trailing: Text(
            "${type == TransactionType.payment ? '-' : '+'}€ $amount",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: type == TransactionType.payment
                    ? Theme.of(context).colorScheme.error
                    : Theme.of(context).colorScheme.primary),
          ),
        ),
      ),
    );
  }
}
