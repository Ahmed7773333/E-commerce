// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/api/api_manager.dart';
import 'package:shop_app/core/utils/app_animations.dart';
import 'package:shop_app/core/utils/componetns.dart';
import 'package:shop_app/features/Auth/data/datasources/auth_remote_ds_impl.dart';
import 'package:shop_app/features/Auth/data/repositories/auth_repo_impl.dart';
import 'package:shop_app/features/Auth/domain/usecases/sign_in_usecase.dart';
import 'package:shop_app/features/Auth/domain/usecases/sign_up_usecase.dart';
import 'package:shop_app/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:shop_app/features/Auth/presentation/pages/sign_up.dart';
import 'package:shop_app/features/Home%20Layout/data/datasources/local/hive_helper/crud_helper.dart';
import 'package:shop_app/features/Home%20Layout/data/datasources/local/user_db.dart';
import 'package:shop_app/features/Home%20Layout/presentation/pages/home_layout.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var passwordController = TextEditingController();

  var userNameController = TextEditingController();
  var keyy = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(
        SignInUseCase(AuthRepoImpl(AuthRemoteDSImpl(ApiManager()))),
        SignUpUseCase(AuthRepoImpl(AuthRemoteDSImpl(ApiManager()))),
      ),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Error"),
                content: Text(state.l.message),
              ),
            );
            debugPrint(state.l.message);
          } else if (state is AuthSuccess) {
            CrudHelper.add(UserDb(
                state.userEntity.user?.name ?? '',
                '',
                state.userEntity.user?.email ?? '',
                '',
                [],
                [],
                state.userEntity.token ?? ''));
            Navigator.pop(context);
            Navigator.pushReplacement(
                context, RightRouting(const HomeLayout()));

            debugPrint(state.userEntity.user?.name);
          } else if (state is AuthLoading) {
            showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                title: Center(child: CircularProgressIndicator()),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            );
          }
        },
        builder: (context, state) {
          AuthBloc bloc = AuthBloc.get(context);
          return Scaffold(
            backgroundColor: AppColors.secondry,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Form(
                key: keyy,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 91.h),
                      Center(
                        child: Image.asset(
                          AppImages.whiteroute,
                          width: 237.w,
                          height: 71.10.h,
                        ),
                      ),
                      SizedBox(height: 86.9.h),
                      Text(
                        AppStrings.welcome,
                        style: AppStyles.welcomeSytle,
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        AppStrings.please,
                        style: AppStyles.smallStyle,
                      ),
                      SizedBox(height: 40.h),
                      Text(
                        AppStrings.userName,
                        style: AppStyles.whiteLableStyle,
                      ),
                      SizedBox(height: 24.h),
                      Components.customTextField(context,
                          hint: AppStrings.userNameHint,
                          controller: userNameController),
                      SizedBox(height: 32.h),
                      Text(
                        AppStrings.password,
                        style: AppStyles.whiteLableStyle,
                      ),
                      SizedBox(height: 24.h),
                      Components.customTextField(
                        context,
                        hint: AppStrings.passwordHint,
                        controller: passwordController,
                        isPassword: true,
                        isShow: false,
                        onPressed: () {},
                      ),
                      SizedBox(height: 16.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            AppStrings.forgetPassword,
                            style: AppStyles.whiteLableStyle,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      ElevatedButton(
                        onPressed: () {
                          if (keyy.currentState?.validate() ?? false) {
                            bloc.add(SignInEvent(userNameController.text.trim(),
                                passwordController.text.trim()));
                            debugPrint('success');
                          } else {
                            debugPrint('error');
                          }
                        },
                        child: Text(
                          AppStrings.login,
                          style: AppStyles.buttonTextStyle,
                        ),
                      ),
                      SizedBox(height: 32.h),
                      Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context, RightRouting(SignUpPage(bloc)));
                          },
                          child: Text(
                            AppStrings.haveAccount,
                            style: AppStyles.whiteLableStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
