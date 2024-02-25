class Transaction {
  String? profileName;
  String? date;
  String? amount;
  int? expenseType;

  Transaction({this.profileName, this.date, this.amount, this.expenseType});

  Transaction.fromJson(Map<String, dynamic> json) {
    profileName = json['profileName'];
    date = json['date'];
    amount = json['amount'];
    expenseType = json['expenseType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['profileName'] = profileName;
    data['date'] = date;
    data['amount'] = amount;
    data['expenseType'] = expenseType;
    return data;
  }
}
