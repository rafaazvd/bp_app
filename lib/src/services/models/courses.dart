class CoursesModel {
  String? link;
  String? image;

  CoursesModel({this.link, this.image});

  CoursesModel.fromJson(Map<String, dynamic> json) {
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
