class OrderHistory {
  Map<String, dynamic>? order;
  Map<String, dynamic>? history;

  OrderHistory({
    required this.order,
    required this.history,
  });

  OrderHistory.fromJson(Map<String, dynamic> json) {
    order = json['order'];
    history = json["history"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order'] = order;
    data['history'] = history;
    return data;
  }
}

class Order {
  String? name;
  String? phoneNumber;
  String? adress;
  String? date;
  List<String>? flavor;
  double? price;
  String? pagament;

  Order(
      {required this.flavor,
      required this.date,
      required this.pagament,
      required this.price,
      required this.adress,
      required this.name,
      required this.phoneNumber});

  Order.fromJson(Map<String, dynamic> json) {
    flavor = json['flavor'].cast<String>();
    date = json['date'];
    price = json['price'];
    pagament = json['pagament'];
    adress = json['adress'];
    name = json['name'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['flavor'] = flavor;
    data['date'] = date;
    data['price'] = price;
    data['pagament'] = pagament;
    data['adress'] = adress;
    data['name'] = name;
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}
