class DataModel {
  Status? status;
  Data? data;

  DataModel({this.status, this.data});

  DataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (status != null) {
      data['status'] = status!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Status {
  String? timestamp;
  num? errorCode;
  num? elapsed;
  num? creditCount;

  Status({this.timestamp, this.errorCode, this.elapsed, this.creditCount});

  Status.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    errorCode = json['error_code'];
    elapsed = json['elapsed'];
    creditCount = json['credit_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timestamp'] = timestamp;
    data['error_code'] = errorCode;
    data['elapsed'] = elapsed;
    data['credit_count'] = creditCount;
    return data;
  }
}

class Data {
  ADA? aDA;
  ATOM? aTOM;
  BCH? bCH;
  BNB? bNB;
  BTC? bTC;

  Data({this.aDA, this.aTOM, this.bCH, this.bNB, this.bTC});

  Data.fromJson(Map<String, dynamic> json) {
    aDA = json['ADA'] != null ? ADA.fromJson(json['ADA']) : null;
    aTOM = json['ATOM'] != null ? ATOM.fromJson(json['ATOM']) : null;
    bCH = json['BCH'] != null ? BCH.fromJson(json['BCH']) : null;
    bNB = json['BNB'] != null ? BNB.fromJson(json['BNB']) : null;
    bTC = json['BTC'] != null ? BTC.fromJson(json['BTC']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (aDA != null) {
      data['ADA'] = aDA!.toJson();
    }
    if (aTOM != null) {
      data['ATOM'] = aTOM!.toJson();
    }
    if (bCH != null) {
      data['BCH'] = bCH!.toJson();
    }
    if (bNB != null) {
      data['BNB'] = bNB!.toJson();
    }
    if (bTC != null) {
      data['BTC'] = bTC!.toJson();
    }
    return data;
  }
}

class ADA {
  num? id;
  String? name;
  String? symbol;
  String? slug;
  String? dateAdded;
  num? cmcRank;
  String? lastUpdated;
  Quote? quote;

  ADA(
      {this.id,
      this.name,
      this.symbol,
      this.slug,
      this.dateAdded,
      this.cmcRank,
      this.lastUpdated,
      this.quote});

  ADA.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    slug = json['slug'];
    dateAdded = json['date_added'];
    cmcRank = json['cmc_rank'];
    lastUpdated = json['last_updated'];
    quote = json['quote'] != null ? Quote.fromJson(json['quote']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['symbol'] = symbol;
    data['slug'] = slug;
    data['date_added'] = dateAdded;
    data['cmc_rank'] = cmcRank;
    data['last_updated'] = lastUpdated;
    if (quote != null) {
      data['quote'] = quote!.toJson();
    }
    return data;
  }
}

class Quote {
  USD? uSD;

  Quote({this.uSD});

  Quote.fromJson(Map<String, dynamic> json) {
    uSD = json['USD'] != null ? USD.fromJson(json['USD']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (uSD != null) {
      data['USD'] = uSD!.toJson();
    }
    return data;
  }
}

class USD {
  num? price;
  num? volume24h;
  num? volumeChange24h;
  num? percentChange1h;
  num? percentChange24h;
  num? percentChange7d;
  num? percentChange30d;
  num? percentChange60d;
  num? percentChange90d;
  num? marketCap;
  num? marketCapDominance;
  num? fullyDilutedMarketCap;
  String? lastUpdated;

  USD(
      {this.price,
      this.volume24h,
      this.volumeChange24h,
      this.percentChange1h,
      this.percentChange24h,
      this.percentChange7d,
      this.percentChange30d,
      this.percentChange60d,
      this.percentChange90d,
      this.marketCap,
      this.marketCapDominance,
      this.fullyDilutedMarketCap,
      this.lastUpdated});

  USD.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    volume24h = json['volume_24h'];
    volumeChange24h = json['volume_change_24h'];
    percentChange1h = json['percent_change_1h'];
    percentChange24h = json['percent_change_24h'];
    percentChange7d = json['percent_change_7d'];
    percentChange30d = json['percent_change_30d'];
    percentChange60d = json['percent_change_60d'];
    percentChange90d = json['percent_change_90d'];
    marketCap = json['market_cap'];
    marketCapDominance = json['market_cap_dominance'];
    fullyDilutedMarketCap = json['fully_diluted_market_cap'];
    lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    data['volume_24h'] = volume24h;
    data['volume_change_24h'] = volumeChange24h;
    data['percent_change_1h'] = percentChange1h;
    data['percent_change_24h'] = percentChange24h;
    data['percent_change_7d'] = percentChange7d;
    data['percent_change_30d'] = percentChange30d;
    data['percent_change_60d'] = percentChange60d;
    data['percent_change_90d'] = percentChange90d;
    data['market_cap'] = marketCap;
    data['market_cap_dominance'] = marketCapDominance;
    data['fully_diluted_market_cap'] = fullyDilutedMarketCap;
    data['last_updated'] = lastUpdated;
    return data;
  }
}

class ATOM {
  num? id;
  String? name;
  String? symbol;
  String? slug;
  String? dateAdded;
  num? cmcRank;
  String? lastUpdated;
  Quote? quote;

  ATOM(
      {this.id,
      this.name,
      this.symbol,
      this.slug,
      this.dateAdded,
      this.cmcRank,
      this.lastUpdated,
      this.quote});

  ATOM.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    slug = json['slug'];
    dateAdded = json['date_added'];
    cmcRank = json['cmc_rank'];
    lastUpdated = json['last_updated'];
    quote = json['quote'] != null ? Quote.fromJson(json['quote']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['symbol'] = symbol;
    data['slug'] = slug;
    data['date_added'] = dateAdded;
    data['cmc_rank'] = cmcRank;
    data['last_updated'] = lastUpdated;
    if (quote != null) {
      data['quote'] = quote!.toJson();
    }
    return data;
  }
}

class BCH {
  num? id;
  String? name;
  String? symbol;
  String? slug;
  String? dateAdded;
  num? cmcRank;
  String? lastUpdated;
  Quote? quote;

  BCH(
      {this.id,
        this.name,
        this.symbol,
        this.slug,
        this.dateAdded,
        this.cmcRank,
        this.lastUpdated,
        this.quote});

  BCH.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    slug = json['slug'];
    dateAdded = json['date_added'];
    cmcRank = json['cmc_rank'];
    lastUpdated = json['last_updated'];
    quote = json['quote'] != null ? Quote.fromJson(json['quote']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['symbol'] = symbol;
    data['slug'] = slug;
    data['date_added'] = dateAdded;
    data['cmc_rank'] = cmcRank;
    data['last_updated'] = lastUpdated;
    if (quote != null) {
      data['quote'] = quote!.toJson();
    }
    return data;
  }
}

class BNB {
  num? id;
  String? name;
  String? symbol;
  String? slug;
  String? dateAdded;
  num? cmcRank;
  String? lastUpdated;
  Quote? quote;

  BNB(
      {this.id,
        this.name,
        this.symbol,
        this.slug,
        this.dateAdded,
        this.cmcRank,
        this.lastUpdated,
        this.quote});

  BNB.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    slug = json['slug'];
    dateAdded = json['date_added'];
    cmcRank = json['cmc_rank'];
    lastUpdated = json['last_updated'];
    quote = json['quote'] != null ? Quote.fromJson(json['quote']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['symbol'] = symbol;
    data['slug'] = slug;
    data['date_added'] = dateAdded;
    data['cmc_rank'] = cmcRank;
    data['last_updated'] = lastUpdated;
    if (quote != null) {
      data['quote'] = quote!.toJson();
    }
    return data;
  }
}

class BTC {
  num? id;
  String? name;
  String? symbol;
  String? slug;
  String? dateAdded;
  num? cmcRank;
  String? lastUpdated;
  Quote? quote;

  BTC(
      {this.id,
      this.name,
      this.symbol,
      this.slug,
      this.dateAdded,
      this.cmcRank,
      this.lastUpdated,
      this.quote});

  BTC.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    slug = json['slug'];
    dateAdded = json['date_added'];
    cmcRank = json['cmc_rank'];
    lastUpdated = json['last_updated'];
    quote = json['quote'] != null ? Quote.fromJson(json['quote']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['symbol'] = symbol;
    data['slug'] = slug;
    data['date_added'] = dateAdded;
    data['cmc_rank'] = cmcRank;
    data['last_updated'] = lastUpdated;
    if (quote != null) {
      data['quote'] = quote!.toJson();
    }
    return data;
  }
}
