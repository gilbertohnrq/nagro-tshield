// coverage:ignore-file
// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';

class ThemeColors {
  const ThemeColors._();

  //Primary
  static const Color kPrimary = Color(0xFF0065BD);
  static const Color kPrimary950 = Color(0xFF00529A);
  static const Color kPrimary900 = Color(0xFF00479E);
  static const Color kPrimary700 = Color(0xFF0056B5);
  static const Color kPrimary600 = Color(0xFF0E88E2);
  static const Color kPrimary500 = Color(0xFF1395EF);
  static const Color kPrimary400 = Color(0xFF3DA4F2);
  static const Color kPrimary300 = Color(0xFF61B4F3);
  static const Color kPrimary200 = Color(0xFF8ECAF7);
  static const Color kPrimary100 = Color(0xFFBADEFA);
  static const Color kPrimary50 = Color(0xFFE3F2FC);
  static const Color kPrimary200WithOpacity = Color(0x5A8ECAF7);

  static const Color kGreen = Color(0xFF0DB5B5);
  static const Color kNewBadge = Color(0xFF0AD1D1);
  static const Color kScaffoldColor = Color(0xFFF2F4F6);
  static const Color kOrange = Color(0xFFFF6624);

  //Grayscale
  static const Color kGray950 = Color(0xFFF4F4F4);
  static const Color kGray500 = Color(0xFFC6C6C6);
  static const Color kGray300 = Color(0xFFE9E9E9);
  static const Color kGray200 = Color(0xFFFAFAFA);
  static const Color kGray100 = Color(0xFF505050);
  static const Color kGray90 = Color(0xFF6E6E6E);
  static const Color kGray50 = Color(0xFFE4E4E4);
  static const Color kGray = Color(0xFFA9A9A9);
  static const Color kGrayEnabled = Color(0xFF9096A7);
  static const Color kGrayDisabled = Color(0xFFCBD0DE);

  //Bluescale
  static const Color kBlue750 = Color(0xFFC3E3FF);
  static const Color kBlue200 = Color(0xFF003D71);

  //Redscale
  static const Color kRed800 = Color(0xffF65A3C);

  //Secondary
  static const Color kAccent = Color(0xFFFFFFFF);
  static const Color kBackground = Color(0xFFF5F6F9);
  static const Color kBorder = Color(0xFFDCE1ED);
  static const Color kDivider = Color(0xFFB2BFC9);
  static const Color kCloseGray = Color(0xFF8B8B8B);

  //Text
  static const Color kTextBase = Color(0xFF263357);
  static const Color kTextLight = Color(0xFF576078);
  static const Color kTextDark = Color(0xFF012C49);
  static const Color kTextBlack = Color(0xFF1A1A1A);

  //Shimmer
  static Color kShimmerBase = Colors.grey.shade300;
  static Color kShimmerHighlight = Colors.grey.shade100;

  //Status
  static const kError = Color(0xffF40000);
  static const kDenied = Color(0xFFFC4E4E);
  static const kExpired = Color(0xFFFF6624);
  static const kNotIssued = Color(0xff3dcad0de);
  static const kNotIssuedIcon = Color(0xFFD9D9D9);

  //SnackBars
  static const kSuccess = Color(0xFF7CE3B7);
  static const kInfo = Color(0xFFDDF2F3);
  static const kWarning = Color(0xFFF8BD64);
  static const kAlertError = Color(0xFFF86464);
  static const kAlertErrorBg = Color(0xFFFBE6E6);
  static const kWarningBg = Color(0xFFFEF4E6);
  static const kInfoBg = Color(0xFFE0F2FD);
  static const kSuccessBg = Color(0xFFE3F2FC);
  static const kApproved = Color(0xFF12B18C);

  //Others
  static const kDark = Color(0xFF000000);
  static const kTransparent = Color.fromRGBO(0, 0, 0, 0);

  //Gradients
  static const LinearGradient kProposalApproved = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      Color(0xFF12B18C),
      Color(0xFF77EBCF),
    ],
    transform: GradientRotation(1.4726),
  );

  static const LinearGradient kCreditRequest = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: <Color>[
      Color(0xFF2261AA),
      Color(0xFF74B1F9),
    ],
    transform: GradientRotation(4.60767),
  );

  static const LinearGradient kInAnalysis = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: <Color>[
      Color(0xFFFFD18D),
      Color(0xFFE8A33D),
    ],
    transform: GradientRotation(4.60767),
  );

  static const LinearGradient kProposalDenied = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: <Color>[
      ThemeColors.kDenied,
      Color(0xFFEB7777),
    ],
    transform: GradientRotation(1.4726),
  );

  static const LinearGradient kProposalExpired = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: <Color>[
      Color(0xFFFF9E75),
      Color(0xFFFF6624),
    ],
    transform: GradientRotation(4.60767),
  );

  static const LinearGradient kApprovedNotification = kCreditRequest;

  static const LinearGradient kActiveContract = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: <Color>[
      Color(0xFF999DFF),
      Color(0xFF6A6EDB),
    ],
    transform: GradientRotation(4.60767),
  );

  static const LinearGradient kStockFarmingCotation = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 1.0],
    colors: [
      Color(0xFF0DB5B5),
      Color(0xFF45D7D7),
    ],
  );

  static const LinearGradient kBasePageGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF0065BD),
      Color(0xFF3AA3FF),
    ],
  );

  // ==== Auto-generated colors from the script replace_hardcoded_colors.dart ====
  static const Color kColorFFF40000 = Color(0xffF40000);
  static const Color kColorFFFC4E4E = Color(0xFFFC4E4E);
  static const Color kColorFFD9D9D9 = Color(0xFFD9D9D9);
  static const Color kColorFF7CE3B7 = Color(0xFF7CE3B7);
  static const Color kColorFFDDF2F3 = Color(0xFFDDF2F3);
  static const Color kColorFFF8BD64 = Color(0xFFF8BD64);
  static const Color kColorFFF86464 = Color(0xFFF86464);
  static const Color kColorFFFBE6E6 = Color(0xFFFBE6E6);
  static const Color kColorFFFEF4E6 = Color(0xFFFEF4E6);
  static const Color kColorFFE0F2FD = Color(0xFFE0F2FD);
  static const Color kColorFF12B18C = Color(0xFF12B18C);
  static const Color kColorFF000000 = Color(0xFF000000);
  static const Color kColorFF77EBCF = Color(0xFF77EBCF);
  static const Color kColorFF2261AA = Color(0xFF2261AA);
  static const Color kColorFF74B1F9 = Color(0xFF74B1F9);
  static const Color kColorFFFFD18D = Color(0xFFFFD18D);
  static const Color kColorFFE8A33D = Color(0xFFE8A33D);
  static const Color kColorFFEB7777 = Color(0xFFEB7777);
  static const Color kColorFFFF9E75 = Color(0xFFFF9E75);
  static const Color kColorFF999DFF = Color(0xFF999DFF);
  static const Color kColorFF6A6EDB = Color(0xFF6A6EDB);
  static const Color kColorFF45D7D7 = Color(0xFF45D7D7);
  static const Color kColorFF3AA3FF = Color(0xFF3AA3FF);
  static const Color kColorFF00BD90 = Color(0xFF00BD90);
  static const Color kColorFF263357 = Color(0xff263357);
  static const Color kColorFF576078 = Color(0xff576078);
}
