import 'package:unico_check/unico_check.dart';

class UnicoCheckService {
  late UnicoCheckBuilder _unicoCheck;
  late UnicoCheckCameraOpener _opener;

  final _theme = UnicoTheme(
    colorSilhouetteSuccess: "#12B18C",
    colorSilhouetteError: "#F40000",
    colorSilhouetteNeutral: "#576078",
    colorBackground: "#F2F4F6",
    colorBackgroundButtonPopupError: "#FBE6E6",
    colorTextButtonPopupError: "#F40000",
    colorTextPopupError: "#F40000",
    colorBoxMessage: "#E0F2FD",
    colorTextMessage: "#263357",
    colorBackgroundPopupError: "#FBE6E6",
    colorBackgroundTakePictureButton: "#0065BD",
    colorIconTakePictureButton: "#FFFFFF",
    colorBackgroundBottomDocument: "#F5F6F9",
    colorTextBottomDocument: "#263357",
    colorProgressBar: "#0065BD",
    colorCancelButtonIcon: "#263357",
  );

  final _config = UnicoConfig(
    getBundleIdentifier: "com.nagro.Nagro",
    getHostKey: "r001-3fcdb414-7f68-4136-97a4-1c2abd67c7fe",
  );

  void init(UnicoListener listener) {
    initUnicoCamera(listener);
    configUnicoCamera();
  }

  void initUnicoCamera(UnicoListener listener) {
    _unicoCheck = UnicoCheck(
      listener: listener,
      unicoConfigIos: _config,
      unicoConfigAndroid: _config,
    );
    configUnicoCamera();
  }

  void configUnicoCamera() {
    _unicoCheck
        .setTheme(unicoTheme: _theme)
        .setTimeoutSession(timeoutSession: 55)
        .setEnvironment(unicoEnvironment: UnicoEnvironment.PROD);
  }

  void setCameraSmart() {
    _opener = _unicoCheck
        .setAutoCapture(autoCapture: true)
        .setSmartFrame(smartFrame: true)
        .build();
  }

  void setCameraNormal() {
    _opener = _unicoCheck
        .setAutoCapture(autoCapture: false)
        .setSmartFrame(smartFrame: false)
        .build();
  }

  void setCameraSmartWithButton() {
    _opener = _unicoCheck
        .setAutoCapture(autoCapture: true)
        .setSmartFrame(smartFrame: true)
        .build();
  }

  void openCameraSelfie(UnicoSelfie listener) {
    setCameraSmart();
    _opener.openCameraSelfie(listener: listener);
  }

  void openCameraNormal(UnicoSelfie listener) {
    setCameraNormal();
    _opener.openCameraSelfie(listener: listener);
  }

  void openCameraSmartWithButton(UnicoSelfie listener) {
    setCameraSmartWithButton();
    _opener.openCameraSelfie(listener: listener);
  }

  void openCameraDocument({
    required DocumentType documentType,
    required UnicoDocument listener,
  }) {
    _unicoCheck.build().openCameraDocument(
          documentType: documentType,
          listener: listener,
        );
  }
}
