enum TransactionType {
  reimbursement,
  payment,
}

class Transaction {
  const Transaction(
    this.name,
    this.date,
    this.provider,
    this.amount,
    this.type,
  );

  final String name;
  final DateTime date;
  final String provider;
  final double amount;
  final TransactionType type;
}

List<Transaction> transactionList = [
  Transaction('Caitlyn J.', DateTime(2025, 03, 12), 'Google Pay', 14.99, TransactionType.reimbursement),
  Transaction('John D.', DateTime(2025, 02, 23), 'Mastercard', 21.00, TransactionType.payment),
  Transaction('Bob D.', DateTime(2025, 02, 14), 'Bitcoin', 123.00, TransactionType.payment),
];
