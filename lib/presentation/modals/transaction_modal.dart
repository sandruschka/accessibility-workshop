import 'package:accessibility_workshop/data/transactions.dart';
import 'package:accessibility_workshop/presentation/widgets/transaction_tile.dart';
import 'package:flutter/material.dart';

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
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: TransactionTile(title: name, date: date, amount: amount, provider: provider, type: type),
      );
    },
  );
}
