import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_images.dart';

Widget routeLogo() {
  return Image.asset(
    AppImages.blueroute,
    height: 26.h,
    width: 70.w,
    fit: BoxFit.fill,
  );
}
