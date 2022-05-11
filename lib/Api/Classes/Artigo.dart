import 'dart:ui';

class Artigo {
  int idRegistro;
  int idCorRegistro;
  String tituloArtigo;
  String descricaoArtigo;
  String dataInclusao;
  String dataPublicacaoArtigo;
  String url;
  String pdCor;

  Artigo(
      {this.idRegistro,
        this.idCorRegistro,
        this.tituloArtigo,
        this.descricaoArtigo,
        this.dataInclusao,
        this.dataPublicacaoArtigo,
        this.url,
        this.pdCor});

  Artigo.fromJson(Map<String, dynamic> json) {
    idRegistro = json['id_registro'];
    idCorRegistro = json['id_cor_registro'];
    tituloArtigo = json['titulo_artigo'];
    descricaoArtigo = json['descricao_artigo'];
    dataInclusao = json['data_inclusao'];
    dataPublicacaoArtigo = json['data_publicacao_artigo'];
    url = json['url'];
    pdCor = json['pd_cor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_registro'] = this.idRegistro;
    data['id_cor_registro'] = this.idCorRegistro;
    data['titulo_artigo'] = this.tituloArtigo;
    data['descricao_artigo'] = this.descricaoArtigo;
    data['data_inclusao'] = this.dataInclusao;
    data['data_publicacao_artigo'] = this.dataPublicacaoArtigo;
    data['url'] = this.url;
    data['pd_cor'] = this.pdCor;
    return data;
  }
}