class DataModel {
  String? text;
  bool? found;
  int? number;
  String? type;
  String? date;

  DataModel({
    this.text,
    this.found,
    this.number,
    this.type,
    this.date,
  });

  DataModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    found = json['found'];
    number = json['number'];
    type = json['type'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['found'] = found;
    data['number'] = number;
    data['type'] = type;
    data['date'] = date;
    return data;
  }
}
