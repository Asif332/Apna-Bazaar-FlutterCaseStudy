class HomeListItem {
  List<HomeItems>? items;

  HomeListItem({this.items});

  HomeListItem.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <HomeItems>[];
      json['items'].forEach((v) {
        items!.add(HomeItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HomeItems {
  String? id;
  String? titleText;
  String? detailedText;
  String? buttonTitleText;
  String? imageName;

  HomeItems(
      {this.id,
        this.titleText,
        this.detailedText,
        this.buttonTitleText,
        this.imageName});

  HomeItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titleText = json['titleText'];
    detailedText = json['detailedText'];
    buttonTitleText = json['buttonTitleText'];
    imageName = json['imageName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['titleText'] = titleText;
    data['detailedText'] = detailedText;
    data['buttonTitleText'] = buttonTitleText;
    data['imageName'] = imageName;
    return data;
  }
}