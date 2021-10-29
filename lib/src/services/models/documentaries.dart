class DocumentariesModel {
  String? link;
  String? image;

  DocumentariesModel({this.link, this.image});

  DocumentariesModel.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['link'] = this.link;
    data['image'] = this.image;
    return data;
  }
}
