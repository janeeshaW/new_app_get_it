import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/services/dependency_injection.dart';
import 'package:news_app/core/util/app_colors.dart';
import 'package:news_app/core/util/navigation_routes.dart';
import 'package:news_app/features/presentation/bloc/auth/auth_bloc.dart';
import 'package:news_app/features/presentation/bloc/auth/auth_event.dart';
import 'package:news_app/features/presentation/bloc/auth/auth_state.dart';
import 'package:news_app/features/presentation/bloc/base_bloc.dart';
import 'package:news_app/features/presentation/bloc/base_event.dart';
import 'package:news_app/features/presentation/bloc/base_state.dart';
import 'package:news_app/features/presentation/views/base_view.dart';




class SplashView extends BaseView {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends BaseViewState<SplashView> {
  var bloc = injection<AuthBloc>();

  @override
  void initState() {
    bloc.add(GetLoggedUserEvent());
    super.initState();
  }

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorPrimary,
      body: BlocProvider<AuthBloc>(
        create: (_) => bloc,
        child: BlocListener<AuthBloc, BaseState<AuthState>>(
          bloc: bloc,
          listener: (_, state) {
            if (state is GetLoggedUserSuccessState) {
              if (state.responseEntity.success == 'success') {
                Navigator.pushNamed(context, Routes.DASHBOARD_VIEW,
                    arguments: state.responseEntity);
              }
            } else {
              Navigator.pushNamed(context, Routes.LOGIN_VIEW);
            }
          },
          child: Center(
            child: Text(
              "NEWS",
              style: TextStyle(fontSize: 25.sp, color: AppColors.appColorWhite),
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
