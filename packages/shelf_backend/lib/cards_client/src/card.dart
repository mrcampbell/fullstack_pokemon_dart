class Card {
  String? category;
  String? id;
  String? illustrator;
  String? image;
  String? localId;
  String? name;
  String? rarity;
  Set? set;
  Variants? variants;
  List<int>? dexId;
  int? hp;
  List<String>? types;
  String? evolveFrom;
  String? description;
  String? stage;
  List<Attacks>? attacks;
  List<Weaknesses>? weaknesses;
  int? retreat;
  String? regulationMark;
  Legal? legal;
  String? updated;

  Card(
      {this.category,
      this.id,
      this.illustrator,
      this.image,
      this.localId,
      this.name,
      this.rarity,
      this.set,
      this.variants,
      this.dexId,
      this.hp,
      this.types,
      this.evolveFrom,
      this.description,
      this.stage,
      this.attacks,
      this.weaknesses,
      this.retreat,
      this.regulationMark,
      this.legal,
      this.updated});

    @override
  String toString() {
    // TODO: implement toString
    return this.toJson().toString();
  }

  Card.fromJson(Map<String, dynamic> json) {
    if (json['type'] == 'https://tcgdex.dev/errors/not-found') {
      throw Exception("Card with ID not found");
    }

   if (!json.containsKey('category')) {
      throw Exception("Card with ID not found");
   }

    category = json['category'];
    id = json['id'];
    illustrator = json['illustrator'];
    image = json['image'];
    localId = json['localId'];
    name = json['name'];
    rarity = json['rarity'];
    set = json['set'] != null ? Set.fromJson(json['set']) : null;
    variants = json['variants'] != null
        ? Variants.fromJson(json['variants'])
        : null;
    dexId = json['dexId'].cast<int>();
    hp = json['hp'];
    types = json['types'].cast<String>();
    evolveFrom = json['evolveFrom'];
    description = json['description'];
    stage = json['stage'];
    if (json['attacks'] != null) {
      attacks = <Attacks>[];
      json['attacks'].forEach((v) {
        attacks!.add(Attacks.fromJson(v));
      });
    }
    if (json['weaknesses'] != null) {
      weaknesses = <Weaknesses>[];
      json['weaknesses'].forEach((v) {
        weaknesses!.add(Weaknesses.fromJson(v));
      });
    }
    retreat = json['retreat'];
    regulationMark = json['regulationMark'];
    legal = json['legal'] != null ? Legal.fromJson(json['legal']) : null;
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;
    data['id'] = id;
    data['illustrator'] = illustrator;
    data['image'] = image;
    data['localId'] = localId;
    data['name'] = name;
    data['rarity'] = rarity;
    if (set != null) {
      data['set'] = set!.toJson();
    }
    if (variants != null) {
      data['variants'] = variants!.toJson();
    }
    data['dexId'] = dexId;
    data['hp'] = hp;
    data['types'] = types;
    data['evolveFrom'] = evolveFrom;
    data['description'] = description;
    data['stage'] = stage;
    if (attacks != null) {
      data['attacks'] = attacks!.map((v) => v.toJson()).toList();
    }
    if (weaknesses != null) {
      data['weaknesses'] = weaknesses!.map((v) => v.toJson()).toList();
    }
    data['retreat'] = retreat;
    data['regulationMark'] = regulationMark;
    if (legal != null) {
      data['legal'] = legal!.toJson();
    }
    data['updated'] = updated;
    return data;
  }
}

class Set {
  CardCount? cardCount;
  String? id;
  String? logo;
  String? name;
  String? symbol;

  Set({this.cardCount, this.id, this.logo, this.name, this.symbol});

  Set.fromJson(Map<String, dynamic> json) {
    cardCount = json['cardCount'] != null
        ? CardCount.fromJson(json['cardCount'])
        : null;
    id = json['id'];
    logo = json['logo'];
    name = json['name'];
    symbol = json['symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cardCount != null) {
      data['cardCount'] = cardCount!.toJson();
    }
    data['id'] = id;
    data['logo'] = logo;
    data['name'] = name;
    data['symbol'] = symbol;
    return data;
  }
}

class CardCount {
  int? official;
  int? total;

  CardCount({this.official, this.total});

  CardCount.fromJson(Map<String, dynamic> json) {
    official = json['official'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['official'] = official;
    data['total'] = total;
    return data;
  }
}

class Variants {
  bool? firstEdition;
  bool? holo;
  bool? normal;
  bool? reverse;
  bool? wPromo;

  Variants(
      {this.firstEdition, this.holo, this.normal, this.reverse, this.wPromo});

  Variants.fromJson(Map<String, dynamic> json) {
    firstEdition = json['firstEdition'];
    holo = json['holo'];
    normal = json['normal'];
    reverse = json['reverse'];
    wPromo = json['wPromo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstEdition'] = firstEdition;
    data['holo'] = holo;
    data['normal'] = normal;
    data['reverse'] = reverse;
    data['wPromo'] = wPromo;
    return data;
  }
}

class Attacks {
  List<String>? cost;
  String? name;
  String? effect;
  int? damage;

  Attacks({this.cost, this.name, this.effect, this.damage});

  Attacks.fromJson(Map<String, dynamic> json) {
    cost = json['cost'].cast<String>();
    name = json['name'];
    effect = json['effect'];
    damage = json['damage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cost'] = cost;
    data['name'] = name;
    data['effect'] = effect;
    data['damage'] = damage;
    return data;
  }
}

class Weaknesses {
  String? type;
  String? value;

  Weaknesses({this.type, this.value});

  Weaknesses.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['value'] = value;
    return data;
  }
}

class Legal {
  bool? standard;
  bool? expanded;

  Legal({this.standard, this.expanded});

  Legal.fromJson(Map<String, dynamic> json) {
    standard = json['standard'];
    expanded = json['expanded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['standard'] = standard;
    data['expanded'] = expanded;
    return data;
  }
}
