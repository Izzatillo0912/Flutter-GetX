
class ModelCurrency {
  String? title;
  String? code;
  String? cbPrice;
  String? nbuBuyPrice;
  String? nbuCellPrice;
  String? date;

  ModelCurrency({
    this.title,
    this.code,
    this.cbPrice,
    this.nbuBuyPrice,
    this.nbuCellPrice,
    this.date
  });

  ModelCurrency.fromJson(Map<String, dynamic> json) {
    title = json['title'] ?? "No data";
    code = json['code'] ?? "No data";
    cbPrice = json['cb_price'] ?? "No data";
    nbuBuyPrice = json['nbu_buy_price'] ?? "No data";
    nbuCellPrice = json['nbu_cell_price'] ?? "No data";
    date = json['date'] ?? "No data";
  }
}