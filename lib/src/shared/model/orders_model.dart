class Order {
  List<String>? flavor;
  String? date;
  String? price;
  bool? app;

  Order(
      {required this.flavor,
      required this.date,
      required this.app,
      required this.price});

  Order.fromJson(Map<String, dynamic> json) {
    flavor = json['flavor'].cast<String>();
    date = json['date'];
    price = json['price'];
    app = json['app'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['flavor'] = flavor;
    data['date'] = date;
    data['price'] = price;
    data['app'] = app;
    return data;
  }
}
