// coverage:ignore-file
enum Uf {
  AC,
  AL,
  AP,
  AM,
  BA,
  CE,
  DF,
  ES,
  GO,
  MA,
  MT,
  MS,
  MG,
  PA,
  PB,
  PR,
  PE,
  PI,
  RJ,
  RN,
  RS,
  RO,
  RR,
  SC,
  SP,
  SE,
  TO,
}

extension UfExtension on Uf {
  String get name {
    switch (this) {
      case Uf.AC:
        return 'AC';
      case Uf.AL:
        return 'AL';
      case Uf.AP:
        return 'AP';
      case Uf.AM:
        return 'AM';
      case Uf.BA:
        return 'BA';
      case Uf.CE:
        return 'CE';
      case Uf.DF:
        return 'DF';
      case Uf.ES:
        return 'ES';
      case Uf.GO:
        return 'GO';
      case Uf.MA:
        return 'MA';
      case Uf.MT:
        return 'MT';
      case Uf.MS:
        return 'MS';
      case Uf.MG:
        return 'MG';
      case Uf.PA:
        return 'PA';
      case Uf.PB:
        return 'PB';
      case Uf.PR:
        return 'PR';
      case Uf.PE:
        return 'PE';
      case Uf.PI:
        return 'PI';
      case Uf.RJ:
        return 'RJ';
      case Uf.RN:
        return 'RN';
      case Uf.RS:
        return 'RS';
      case Uf.RO:
        return 'RO';
      case Uf.RR:
        return 'RR';
      case Uf.SC:
        return 'SC';
      case Uf.SP:
        return 'SP';
      case Uf.SE:
        return 'SE';
      case Uf.TO:
        return 'TO';
    }
  }
}

String ufToString(Uf uf) {
  switch (uf) {
    case Uf.AC:
      return 'Acre';
    case Uf.AL:
      return 'Alagoas';
    case Uf.AP:
      return 'Amapá';
    case Uf.AM:
      return 'Amazonas';
    case Uf.BA:
      return 'Bahia';
    case Uf.CE:
      return 'Ceará';
    case Uf.DF:
      return 'Distrito Federal';
    case Uf.ES:
      return 'Espírito Santo';
    case Uf.GO:
      return 'Goiás';
    case Uf.MA:
      return 'Maranhão';
    case Uf.MT:
      return 'Mato Grosso';
    case Uf.MS:
      return 'Mato Grosso do Sul';
    case Uf.MG:
      return 'Minas Gerais';
    case Uf.PA:
      return 'Pará';
    case Uf.PB:
      return 'Paraíba';
    case Uf.PR:
      return 'Paraná';
    case Uf.PE:
      return 'Pernambuco';
    case Uf.PI:
      return 'Piauí';
    case Uf.RJ:
      return 'Rio de Janeiro';
    case Uf.RN:
      return 'Rio Grande do Norte';
    case Uf.RS:
      return 'Rio Grande do Sul';
    case Uf.RO:
      return 'Rondônia';
    case Uf.RR:
      return 'Roraima';
    case Uf.SC:
      return 'Santa Catarina';
    case Uf.SP:
      return 'São Paulo';
    case Uf.SE:
      return 'Sergipe';
    case Uf.TO:
      return 'Tocantins';
  }
}

const stringToUf = {
  'acre': Uf.AC,
  'alagoas': Uf.AL,
  'amapá': Uf.AP,
  'amazonas': Uf.AM,
  'bahia': Uf.BA,
  'ceará': Uf.CE,
  'distrito federal': Uf.DF,
  'espírito santo': Uf.ES,
  'goiás': Uf.GO,
  'maranhão': Uf.MA,
  'mato grosso': Uf.MT,
  'mato grosso do sul': Uf.MS,
  'minas gerais': Uf.MG,
  'pará': Uf.PA,
  'paraíba': Uf.PB,
  'paraná': Uf.PR,
  'pernambuco': Uf.PE,
  'piauí': Uf.PI,
  'rio de janeiro': Uf.RJ,
  'rio grande do norte': Uf.RN,
  'rio grande do sul': Uf.RS,
  'rondônia': Uf.RO,
  'roraima': Uf.RR,
  'santa catarina': Uf.SC,
  'são paulo': Uf.SP,
  'sergipe': Uf.SE,
  'tocantins': Uf.TO
};

const stringAbbreviationToUf = {
  'ac': Uf.AC,
  'al': Uf.AL,
  'ap': Uf.AP,
  'am': Uf.AM,
  'ba': Uf.BA,
  'ce': Uf.CE,
  'df': Uf.DF,
  'es': Uf.ES,
  'go': Uf.GO,
  'ma': Uf.MA,
  'mt': Uf.MT,
  'ms': Uf.MS,
  'mg': Uf.MG,
  'pa': Uf.PA,
  'pb': Uf.PB,
  'pr': Uf.PR,
  'pe': Uf.PE,
  'pi': Uf.PI,
  'rj': Uf.RJ,
  'rn': Uf.RN,
  'rs': Uf.RS,
  'ro': Uf.RO,
  'rr': Uf.RR,
  'sc': Uf.SC,
  'sp': Uf.SP,
  'se': Uf.SE,
  'to': Uf.TO
};
