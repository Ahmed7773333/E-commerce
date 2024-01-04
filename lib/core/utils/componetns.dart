import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/utils/app_colors.dart';

class Components {
  static Widget customTextField(
    context, {
    required String hint,
    bool? isPassword,
    bool? isShow,
    VoidCallback? onPressed,
    VoidCallback? onChange,
    VoidCallback? onSubmit,
    IconData? icon,
    required TextEditingController controller,
  }) {
    // final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: 398.w,
      height: 64.h,
      child: TextFormField(
        style: Theme.of(context).textTheme.bodyLarge,
        onChanged: onChange == null
            ? (value) {
                value = value;
              }
            : (value) {
                onChange();
              },
        onFieldSubmitted: onSubmit == null
            ? (value) {
                value = value;
              }
            : (value) {
                onSubmit();
              },
        controller: controller,
        obscureText: isPassword ?? false ? (isShow ?? false) : false,
        validator: (value) {
          if (value?.trim().isEmpty ?? false) {
            return 'Field can\'t be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(
            icon,
            size: 30.sp,
            color: AppColors.secondry,
          ),
          suffixIcon: isPassword ?? false
              ? InkWell(
                  onTap: onPressed,
                  child: Icon(
                    !(isShow ?? false)
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: AppColors.secondry,
                    size: 30.sp,
                  ),
                )
              : null,
        ),
      ),
    );
  }

  static Widget openContainers({Widget? closedWidget, Widget? openedWidget}) {
    return OpenContainer(
      closedElevation: 0,
      openElevation: 0,
      transitionDuration: const Duration(milliseconds: 500),
      closedColor: Colors.transparent,
      openColor: Colors.transparent,
      closedBuilder: (BuildContext context, void Function() action) {
        return closedWidget!;
      },
      openBuilder:
          (BuildContext context, void Function({Object? returnValue}) action) {
        return openedWidget!;
      },
    );
  }

  static Widget fillButton(context,
      {Color? color, String? text, VoidCallback? onPressed}) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: color,
        fixedSize: Size(110.w, 48.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
      ),
      child: Center(
        child: Text(
          text ?? '',
          maxLines: 1,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: color == Theme.of(context).colorScheme.secondary
                  ? Colors.white
                  : Theme.of(context).colorScheme.secondary,
              fontSize: 14.sp),
        ),
      ),
    );
  }
}
