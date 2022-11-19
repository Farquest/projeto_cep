import 'dart:convert';

class ResultCep {
  String cep;
  String logradouro;
  String bairro;
  String localidade;
  String uf;
  String ddd;

  ResultCep({
    required this.cep,
    required this.logradouro,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.ddd,
  });

  factory ResultCep.fromJson(String str) => ResultCep.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResultCep.fromMap(Map<String, dynamic> json) => ResultCep(
        cep: json["cep"],
        logradouro: json["logradouro"],
        bairro: json["bairro"],
        localidade: json["localidade"],
        uf: json["uf"],
        ddd: json["ddd"],
      );

  Map<String, dynamic> toMap() => {
        "cep": cep,
        "logradouro": logradouro,
        "bairro": bairro,
        "localidade": localidade,
        "uf": uf,
        "ddd": ddd,
      };
}
