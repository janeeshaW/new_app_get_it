import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/util/app_colors.dart';
import 'package:news_app/features/presentation/bloc/base_bloc.dart';
import 'package:news_app/features/presentation/bloc/base_event.dart';
import 'package:news_app/features/presentation/bloc/base_state.dart';
import 'package:news_app/features/presentation/common/custom_animation_indicator.dart';


abstract class BaseView extends StatefulWidget {
  const BaseView({Key? key}) : super(key: key);
}

abstract class BaseViewState<Page extends BaseView> extends State<Page> {
  Base<BaseEvent, BaseState> getBloc();

  Widget buildView(BuildContext context);

  logout() async {}

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<Base>(
      create: (_) => getBloc(),
      child: BlocListener<Base, BaseState>(
        listener: (context, state) {
          if (state is APILoadingState) {
            loadingIndicatorShow();
          } else if (state is APIFailureState) {
            openAlertBox(state.errorResponseModel.responseError!,
                state.errorResponseModel.responseCode!);
            loadingIndicatorHide();
          } else {
            loadingIndicatorHide();
          }
        },
        child: Container(
          margin: EdgeInsets.only(bottom: Platform.isIOS ? 5 : 0),
          child: buildView(context),
        ),
      ),
    );
  }

  loadingIndicatorShow() async {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.chasingDots
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.white
      ..backgroundColor = AppColors.colorPrimary
      ..indicatorColor = Colors.white
      ..textColor = Colors.white
      ..maskColor = Colors.black.withOpacity(0.2)
      ..userInteractions = true
      ..dismissOnTap = false
      ..textStyle =
          const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)
      ..customAnimation = CustomAnimation();
    await EasyLoading.show(
      status: 'Wait a moment...',
      maskType: EasyLoadingMaskType.custom,
    );
  }

  loadingIndicatorHide() async {
    await EasyLoading.dismiss();
  }

  openAlertBox(String message, String title) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: const EdgeInsets.only(top: 10.0),
            content: SizedBox(
              width: 300.w,
              height: 200.h,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 10.h,
                    child: SizedBox(
                      width: 300.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(fontSize: 24.0),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          const Divider(
                            color: Colors.grey,
                            height: 4.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 30.0, right: 30.0, top: 10),
                            child: Text(
                              message,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 150,
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                        child: const Text(
                          "OK",
                          style: TextStyle(color: AppColors.colorPrimary),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
