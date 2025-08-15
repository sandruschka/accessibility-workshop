import 'package:accessibility_workshop/data/transactions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    super.key,
    required this.title,
    required this.date,
    required this.amount,
    required this.provider,
    required this.type,
    this.onTap,
  });

  final String title;
  final DateTime date;
  final double amount;
  final String provider;
  final TransactionType type;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final listTile = ListTile(
      // onTap: onTap,
      title: Text(title),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.all(Radius.circular(8))),
      subtitle: Text("${DateFormat.yMMMd().format(date).toString()} • $provider"),
      trailing: Text(
        "${type == TransactionType.payment ? '-' : '+'}€ $amount",
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: type == TransactionType.payment
              ? Theme.of(context).colorScheme.error
              : Theme.of(context).colorScheme.primary,
        ),
      ),
    );

    // TODO Remove Semantics
    return Semantics.fromProperties(
      properties: SemanticsProperties(button: onTap != null),
      child: onTap != null ? GestureDetector(onTap: onTap, child: listTile) : listTile,
    );
  }
}
