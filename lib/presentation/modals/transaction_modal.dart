import 'package:accessibility_workshop/data/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<void> showTransactionModal({
  required BuildContext context,
  required String name,
  required DateTime date,
  required double amount,
  required String provider,
  required TransactionType type,
}) {
  return showModalBottomSheet(
    showDragHandle: true,
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 300,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                ListTile(
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
              ],
            ),
          ),
        ),
      );
    },
  );
}
