// ignore_for_file: public_member_api_docs, sort_constructors_first
class Order {
  String? adress;
  List<String>? flavor;
  String? date;
  double? amount;
  Historic? history;

  Order(
      {required this.adress,
      required this.flavor,
      required this.date,
      required this.amount,
      required this.history});

  Order.fromJson(Map<String, dynamic> json) {
    flavor = json['flavor'].cast<String>();
    date = json['date'];
    amount = json['price'];
    adress = json['adress'];
    history = json['history'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['flavor'] = flavor;
    data['date'] = date;
    data['price'] = amount;
    data['adress'] = adress;
    data['history'] = history;
    return data;
  }
}

class Historic {
  Map<String, dynamic>? history;

  Historic({
    required this.history,
  });

  Historic.fromJson(Map<String, dynamic> json) {
    history = json["history"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['history'] = history;
    return data;
  }
}
