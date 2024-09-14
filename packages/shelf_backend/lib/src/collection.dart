class Collection {
  String id;
  String name;
  List<String> cardIDs;

  Collection({required this.id, required this.name, required this.cardIDs});

  Collection.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        cardIDs = json['cardIDs'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['cardIDs'] = cardIDs;
    return data;
  }
}