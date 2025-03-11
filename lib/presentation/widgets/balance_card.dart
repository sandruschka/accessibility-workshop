import 'package:flutter/material.dart';

class BalanceCard extends StatefulWidget {
  const BalanceCard({super.key});

  @override
  State<BalanceCard> createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {
  bool seeAll = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(blurRadius: 10, spreadRadius: 1, color: Colors.grey.shade300, offset: const Offset(0, 10)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BalanceText(
                    trailingText: 'Today',
                    leadingText: 'You have',
                    amount: 1651,
                  ),
                  BalanceText(
                    leadingText: 'You spent',
                    trailingText: 'Since Nov 1st',
                    amount: 778,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text("Google Pay balance"),
              trailing: Text("\$208.90", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: seeAll ? null : 0,
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: Icon(Icons.account_balance_wallet),
                      title: Text("Visa card balance"),
                      trailing: Text("\$123.40", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    ListTile(
                      leading: Icon(Icons.account_balance_wallet),
                      title: Text("Master card balance"),
                      trailing: Text("\$102", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    ListTile(
                      leading: Icon(Icons.account_balance_wallet),
                      title: Text("Bitcoin balance"),
                      trailing: Text("\$2208.10", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  seeAll = !seeAll;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    seeAll ? 'See less' : 'See all',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(decoration: TextDecoration.underline),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BalanceText extends StatelessWidget {
  const BalanceText({
    super.key,
    required this.trailingText,
    required this.leadingText,
    required this.amount,
  });

  final String leadingText;
  final double amount;
  final String trailingText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          leadingText,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.secondary),
        ),
        Text(
          "€$amount",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          trailingText,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.secondary),
        ),
      ],
    );
  }
}
