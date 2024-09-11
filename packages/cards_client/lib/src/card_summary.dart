class CardSummary {
  String? id;
  String? localId;
  String? name;
  String? image;

  CardSummary({this.id, this.localId, this.name, this.image});

  CardSummary.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    localId = json['localId'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['localId'] = localId;
    data['name'] = name;
    data['image'] = image;
    return data;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "\nCardSummary{id: $id, localId: $localId, name: $name, image: $image}\n";
  }
}