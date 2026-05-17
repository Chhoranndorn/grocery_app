class BannerModel {
  bool? status;
  List<BannerItem>? data;

  BannerModel({this.status, this.data});

  BannerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];

    if (json['data'] != null) {
      data = <BannerItem>[];

      json['data'].forEach((v) {
        data!.add(BannerItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    return {'status': status, 'data': data?.map((v) => v.toJson()).toList()};
  }
}

class BannerItem {
  int? id;
  String? image;

  BannerItem({this.id, this.image});

  BannerItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'image': image};
  }
}
