// coverage:ignore-file

const String mainRegionKey = 'mainRegions';
const String expireInKey = 'expireIn';
const String refreshTokenKey = 'refreshToken';
const String tokenJWTKey = 'tokenJWT';
const String taxIdKey = 'taxId';
const String passwordKey = 'password';
const String isActiveAutoLoginKey = 'isActiveAutoLogin';
const String userId = 'userId';
const String surnameProfile = 'surnameProfile';
const String phoneProfile = 'phoneProfile';
const String emailProfile = 'emailProfile';
const String nameProfile = 'nameProfile';
const String preApprovedValueProfile = 'preApprovedValueProfile';
const String statusProposal = 'statusProposal';
const cameraPermissionKey = 'camera';
const locationPermissionKey = 'location';
const notificationPermissionKey = 'notification';

const String isInterestedToKnowAboutCredit = 'isInterestedToKnowAboutCredit';

const String isInterestedToKnowAboutScoreCredit =
    'isInterestedToKnowAboutScoreCredit';
const String isInterestedToKnowAboutConsortium =
    'isInterestedToKnowAboutConsortium';
const String isInterestedToKnowAboutInsuranceCredit =
    'isInterestedToKnowAboutInsuranceCredit';

const String sessionHash = 'sessionHash';

const String notificationChannelId = 'lembretes_notifications_x';
const String notificationChannelName = 'Lembretes';
const String notificationChannelDescription = 'Este canal é para lembretes!';

const otpCodeExpireTime = 120;

const commoditiesNoData = 'Sem dados';

const Map<String, String> stateCodes = {
  'UF do órgão expedidor': 'UF do órgão expedidor',
  'Acre': 'AC',
  'Alagoas': 'AL',
  'Amapá': 'AP',
  'Amazonas': 'AM',
  'Bahia': 'BA',
  'Ceará': 'CE',
  'Distrito Federal': 'DF',
  'Espírito Santo': 'ES',
  'Goiás': 'GO',
  'Maranhão': 'MA',
  'Mato Grosso': 'MT',
  'Mato Grosso do Sul': 'MS',
  'Minas Gerais': 'MG',
  'Pará': 'PA',
  'Paraíba': 'PB',
  'Paraná': 'PR',
  'Pernambuco': 'PE',
  'Piauí': 'PI',
  'Rio de Janeiro': 'RJ',
  'Rio Grande do Norte': 'RN',
  'Rio Grande do Sul': 'RS',
  'Rondônia': 'RO',
  'Roraima': 'RR',
  'Santa Catarina': 'SC',
  'São Paulo': 'SP',
  'Sergipe': 'SE',
  'Tocantins': 'TO'
};

final stateCodesList = stateCodes.values.toList();

//Remote config
const commoditiesTagRemoteConfig = 'enable_commodities';
const newFeaturesTag = 'new_features';
const upgraderCollectionName = 'upgrader';
const featureFlagCollectionName = 'featureFlag';
const externalResourcesByVideo = 'externalResources';
const homePresentationExternalVideo = 'home_presentation';
const urlVideo = 'urlVideo';
const homeBanner = 'home-banner';
//Durations
const kTransitionDuration = Duration(milliseconds: 300);
const kSlideInterval = Duration(seconds: 12);
const kAnimateToPageDuration = Duration(milliseconds: 500);
//Feature flag
const kSafe = 'safe';

//Whatsapp number
const bankSlipSupportWhatsappNumber = '34992184603';
const preApprovedSupportWhatsappNumber = '34999386920';
