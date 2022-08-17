class CurrencyDto {
  CodeConversion? codeConversion;

  CurrencyDto({codeConversion});

  CurrencyDto.fromJson(Map<String, dynamic> json) {
    codeConversion = json[json.keys.first] != null
        ? CodeConversion.fromJson(json[json.keys.first])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (codeConversion != null) {
      data['codeConversion'] = codeConversion!.toJson();
    }
    return data;
  }
}

class CodeConversion {
  String? code;
  String? codein;
  String? name;
  String? high;
  String? low;
  String? varBid;
  String? pctChange;
  String? bid;
  String? ask;
  String? timestamp;
  String? createDate;

  CodeConversion(
      {code,
      codein,
      name,
      high,
      low,
      varBid,
      pctChange,
      bid,
      ask,
      timestamp,
      createDate});

  CodeConversion.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    codein = json['codein'];
    name = json['name'];
    high = json['high'];
    low = json['low'];
    varBid = json['varBid'];
    pctChange = json['pctChange'];
    bid = json['bid'];
    ask = json['ask'];
    timestamp = json['timestamp'];
    createDate = json['create_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['codein'] = codein;
    data['name'] = name;
    data['high'] = high;
    data['low'] = low;
    data['varBid'] = varBid;
    data['pctChange'] = pctChange;
    data['bid'] = bid;
    data['ask'] = ask;
    data['timestamp'] = timestamp;
    data['create_date'] = createDate;
    return data;
  }
}
