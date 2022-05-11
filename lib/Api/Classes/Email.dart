class Email {
  final String remetente;
  final String destinatario;
  final String assunto;
  final String conteudo;

  Email({this.remetente, this.destinatario, this.assunto, this.conteudo});

  factory Email.fromJson(Map json) {
    return Email(
        remetente: json['remetente'],
        destinatario: json['destinatario'],
        assunto: json['assunto'],
        conteudo: json['conteudo']
    );
  }

  Map toMap() {
    var map = new Map();
    map["remetente"] = remetente;
    map["destinatario"] = destinatario;
    map["assunto"] = assunto;
    map["conteudo"] = conteudo;

    return map;
  }
}