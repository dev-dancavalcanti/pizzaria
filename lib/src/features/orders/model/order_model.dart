class Order {
  List<String>? flavor;
  String? date;
  int? price;
  String? pagament;
  String? adress;

  Order(
      {required this.flavor,
      required this.date,
      required this.pagament,
      required this.price,
      required this.adress});

  Order.fromJson(Map<String, dynamic> json) {
    flavor = json['flavor'].cast<String>();
    date = json['date'];
    price = json['price'];
    pagament = json['pagament'];
    adress = json['adress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['flavor'] = flavor;
    data['date'] = date;
    data['price'] = price;
    data['pagament'] = pagament;
    data['adress'] = adress;
    return data;
  }
}
