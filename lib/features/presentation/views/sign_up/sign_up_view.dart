import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/services/dependency_injection.dart';
import 'package:news_app/core/util/app_colors.dart';
import 'package:news_app/core/util/enums.dart';
import 'package:news_app/core/util/navigation_routes.dart';
import 'package:news_app/features/domain/entities/request/sign_up_request_entity.dart';
import 'package:news_app/features/presentation/bloc/auth/auth_bloc.dart';
import 'package:news_app/features/presentation/bloc/auth/auth_event.dart';
import 'package:news_app/features/presentation/bloc/auth/auth_state.dart';
import 'package:news_app/features/presentation/bloc/base_bloc.dart';
import 'package:news_app/features/presentation/bloc/base_event.dart';
import 'package:news_app/features/presentation/bloc/base_state.dart';
import 'package:news_app/features/presentation/common/common_app_button.dart';
import 'package:news_app/features/presentation/common/common_app_text_field.dart';
import 'package:news_app/features/presentation/views/base_view.dart';



class SignUpView extends BaseView {
  const SignUpView({Key? key}) : super(key: key);

  //const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends BaseViewState<SignUpView> {
  var bloc = injection<AuthBloc>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorSecondary,
      body: BlocProvider<AuthBloc>(
        create: (_) => bloc,
        child: BlocListener<AuthBloc, BaseState<AuthState>>(
          bloc: bloc,
          listener: (_, state) {
            if (state is SignUpSuccessState) {
              Navigator.pushNamed(context, Routes.LOGIN_VIEW);
            }
          },
          child: Form(
            key: formKey,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  top: 60.h,
                  child: Text(
                    "NEWS",
                    style: TextStyle(
                        fontSize: 25.sp, color: AppColors.appColorWhite),
                  ),
                ),
                Positioned(
                  top: 110.h,
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: AppColors.appColorWhite,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Positioned(
                  top: 160.h,
                  child: SizedBox(
                    width: 240.w,
                    height: 80.h,
                    child: CommonAppTextField(
                      label: "First Name",
                      controller: _firstNameController,
                      hint: "Enter First Name",
                      validationType: ValidationType.NORMAL,
                    ),
                  ),
                ),
                Positioned(
                  top: 220.h,
                  child: SizedBox(
                    width: 240.w,
                    height: 80.h,
                    child: CommonAppTextField(
                      validationType: ValidationType.NORMAL,
                      label: "Last Name",
                      controller: _lastNameController,
                      hint: "Enter Last Name",
                    ),
                  ),
                ),
                Positioned(
                  top: 280.h,
                  child: SizedBox(
                    width: 240.w,
                    height: 80.h,
                    child: CommonAppTextField(
                      validationType: ValidationType.EMAIL,
                      label: "Email Address",
                      controller: _emailController,
                      hint: "Enter Email Address",
                    ),
                  ),
                ),
                Positioned(
                  top: 340.h,
                  child: SizedBox(
                    width: 240.w,
                    height: 80.h,
                    child: CommonAppTextField(
                      validationType: ValidationType.PW,
                      isObscure: true,
                      label: "Password",
                      controller: _passwordController,
                      hint: "Enter the Password",
                    ),
                  ),
                ),
                Positioned(
                  top: 420.h,
                  child: AppButton(
                    width: 240.w,
                    buttonColor: AppColors.appColorWhite,
                    textColor: AppColors.colorPrimary,
                    buttonType: ButtonType.SOLID,
                    buttonText: 'Sign Up',
                    onTapButton: () {
                      if (formKey.currentState!.validate()) {
                        bloc.add(SignUpEvent(
                            request: SignUpRequestEntity(
                                firstName: _firstNameController.text,
                                lastName: _lastNameController.text,
                                email: _emailController.text,
                                password: _passwordController.text)));
                      }
                    },
                  ),
                ),
                Positioned(
                  top: 550.h,
                  child: Text.rich(TextSpan(
                      text: "Do you have an account ?",
                      style: TextStyle(fontSize: 14.sp),
                      children: <InlineSpan>[
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, Routes.LOGIN_VIEW);
                            },
                          text: " Log In",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14.sp),
                        )
                      ])),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Base<BaseEvent, BaseState> getBloc() {
    return bloc;
  }
}
