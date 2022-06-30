import 'package:flutter/material.dart';

// defined the primaryColor of the app
Map<int, Color> _primaryColor = {
  50: const Color(0XFFED2E64).withOpacity(0.1),
  100: const Color(0XFFED2E64).withOpacity(0.2),
  200: const Color(0XFFED2E64).withOpacity(0.3),
  300: const Color(0XFFED2E64).withOpacity(0.4),
  400: const Color(0XFFED2E64).withOpacity(0.5),
  500: const Color(0XFFED2E64).withOpacity(0.6),
  600: const Color(0XFFED2E64).withOpacity(0.7),
  700: const Color(0XFFED2E64).withOpacity(0.8),
  800: const Color(0XFFED2E64).withOpacity(0.9),
  900: const Color(0XFFED2E64).withOpacity(1),
};

final MaterialColor kPrimaryColor = MaterialColor(0XFFED2E64, _primaryColor);

// defined the primaryLightColor of the app
Map<int, Color> _primaryLightColor = {
  50: const Color(0XFFED633F).withOpacity(0.1),
  100: const Color(0XFFED633F).withOpacity(0.2),
  200: const Color(0XFFED633F).withOpacity(0.3),
  300: const Color(0XFFED633F).withOpacity(0.4),
  400: const Color(0XFFED633F).withOpacity(0.5),
  500: const Color(0XFFED633F).withOpacity(0.6),
  600: const Color(0XFFED633F).withOpacity(0.7),
  700: const Color(0XFFED633F).withOpacity(0.8),
  800: const Color(0XFFED633F).withOpacity(0.9),
  900: const Color(0XFFED633F).withOpacity(1),
};

final MaterialColor kPrimaryLightColor =
    MaterialColor(0XFFED633F, _primaryLightColor);
