import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/services/dependency_injection.dart';
import 'package:news_app/core/util/app_colors.dart';
import 'package:news_app/core/util/app_images.dart';
import 'package:news_app/core/util/enums.dart';
import 'package:news_app/core/util/navigation_routes.dart';
import 'package:news_app/features/domain/entities/response/login_response_entity.dart';
import 'package:news_app/features/presentation/bloc/auth/auth_bloc.dart';
import 'package:news_app/features/presentation/bloc/auth/auth_event.dart';
import 'package:news_app/features/presentation/bloc/auth/auth_state.dart';
import 'package:news_app/features/presentation/bloc/base_bloc.dart';
import 'package:news_app/features/presentation/bloc/base_event.dart';
import 'package:news_app/features/presentation/bloc/base_state.dart';
import 'package:news_app/features/presentation/common/common_app_button.dart';
import 'package:news_app/features/presentation/views/base_view.dart';

/// *** Created By Isuru B. Ranapana *** ///
/// ***     Eyepax IT Consulting     *** ///
/// ***   on 10/25/2022 => 10:12 AM  *** ///

class ProfileView extends BaseView {
  final ScrollController controller;
  final LoginResponseEntity loginResponse;

  const ProfileView({
    required this.controller,
    required this.loginResponse,
  });

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends BaseViewState<ProfileView> {
  var bloc = injection<AuthBloc>();

  @override
  Widget buildView(BuildContext context) {
    return BlocProvider<AuthBloc>(
        create: (_) => bloc,
        child: BlocListener<AuthBloc, BaseState<AuthState>>(
          bloc: bloc,
          listener: (_, state) {
            if (state is GetLoggedOutSuccessState) {
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.LOGIN_VIEW, (route) => false);
            }
          },
          child: Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: ListView(
              controller: widget.controller,
              children: [
                SizedBox(
                  height: 50.h,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.w),
                  child: Image.asset(
                    AppImages.profileImage,
                    width: 100.w,
                    height: 100.w,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "${widget.loginResponse.firstName!} ${widget.loginResponse.lastName!}  ",
                  style:
                      TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 18.h,
                ),
                Text(
                  widget.loginResponse.email!,
                  style: TextStyle(
                    fontSize: 18.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 60.h,
                ),
                AppButton(
                  buttonColor: AppColors.colorPrimary,
                  buttonType: ButtonType.SOLID,
                  buttonText: 'Log Out',
                  onTapButton: () {
                    bloc.add(GetLoggedOutEvent());
                  },
                ),
              ],
            ),
          ),
        ));
  }

  @override
  Base<BaseEvent, BaseState> getBloc() {
    return bloc;
  }
}
