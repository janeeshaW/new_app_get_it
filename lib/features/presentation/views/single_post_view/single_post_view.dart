import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/services/dependency_injection.dart';
import 'package:news_app/core/util/app_colors.dart';
import 'package:news_app/features/domain/entities/response/news_response_entity.dart';
import 'package:news_app/features/presentation/bloc/base_bloc.dart';
import 'package:news_app/features/presentation/bloc/base_event.dart';
import 'package:news_app/features/presentation/bloc/base_state.dart';
import 'package:news_app/features/presentation/bloc/home/home_bloc.dart';
import 'package:news_app/features/presentation/common/opacity_tile.dart';
import 'package:news_app/features/presentation/views/base_view.dart';




class SinglePostViewPage extends BaseView {
  const SinglePostViewPage({
    required this.news,
  });

  final Article news;

  @override
  State<SinglePostViewPage> createState() => _SinglePostViewPageState();
}

class _SinglePostViewPageState extends BaseViewState<SinglePostViewPage> {
  var bloc = injection<HomeBloc>();

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: SizedBox(
              height: 300.h,
              width: 288.w,
              child: widget.news.urlToImage != null
                  ? Image.network(
                widget.news.urlToImage!,
                fit: BoxFit.cover,
              )
                  : Image.network(
                'https://scx2.b-cdn.net/gfx/news/2022/elon-musk-has-clashed.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 350.h,
              width: 288.w,
              decoration: BoxDecoration(
                  color: AppColors.appColorWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.h),
                    topRight: Radius.circular(25.h),
                  )),
              child: Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: Container(
                  margin: EdgeInsets.only(top: 50.h),
                  child: SingleChildScrollView(
                    child: Text(
                      widget.news.content != null ? widget.news.content! : "",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              top: 190.h,
              child: SizedBox(
                  width: 280.w,
                  child: OpacityTile(
                    news: widget.news,
                  ))),
          Positioned(
              top: 30.h,
              left: 15.w,
              child: InkResponse(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 20.w,
                  height: 20.w,
                  decoration: BoxDecoration(
                      color: AppColors.appGrayColor,
                      borderRadius: BorderRadius.circular(4.h)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 15.h,
                      color: AppColors.appColorBlack,
                    ),
                  ),
                ),
              )),
          Positioned(
            bottom: 30.h,
            right: 10.w,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: AppColors.colorPrimary,
              child: const Icon(
                Icons.favorite_outline_rounded,
                color: AppColors.appColorWhite,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Base<BaseEvent, BaseState> getBloc() {
    return bloc;
  }
}
