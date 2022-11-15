import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/util/app_colors.dart';
import 'package:news_app/core/util/navigation_routes.dart';
import 'package:news_app/features/domain/entities/common/category_entity.dart';
import 'package:news_app/features/presentation/bloc/base_bloc.dart';
import 'package:news_app/features/presentation/bloc/base_event.dart';
import 'package:news_app/features/presentation/bloc/base_state.dart';
import 'package:news_app/features/presentation/bloc/home/home_bloc.dart';
import 'package:news_app/features/presentation/common/common_app_button.dart';
import 'package:news_app/features/presentation/common/normal_news_tile.dart';
import 'package:news_app/features/presentation/views/args/search_view_args.dart';
import 'package:news_app/features/presentation/views/base_view.dart';

import '../../../../core/services/dependency_injection.dart';

/// *** Created By Isuru B. Ranapana *** ///
/// ***     Eyepax IT Consulting     *** ///
/// ***   on 10/25/2022 => 10:28 AM  *** ///


class SearchView extends BaseView {
  final SearchViewArgs args;

  const SearchView({
    required this.args,
  });

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends BaseViewState<SearchView> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    searchController.text = widget.args.searchedText;
    super.initState();
  }

  var bloc = injection<HomeBloc>();
  List<CategoryEntity> categories = [
    const CategoryEntity(name: "Health", id: 1),
    const CategoryEntity(name: "Technology", id: 2),
    const CategoryEntity(name: "Art", id: 3),
    const CategoryEntity(name: "Finance", id: 4),
    const CategoryEntity(name: "Politics", id: 5)
  ];

  int selectedBtnIndex = 1;

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w),
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            SizedBox(
              height: 30.h,
              child: Row(
                children: [
                  SizedBox(
                    width: 200.w,
                    child: TextField(
                      enabled: false,
                      textInputAction: TextInputAction.done,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      controller: searchController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                            color: AppColors.colorSecondary,
                          ),
                        ),
                        filled: true,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.w,
                    width: 25.w,
                    // decoration: BoxDecoration(
                    //     color: AppColors.colorPrimary,
                    //     borderRadius: BorderRadius.circular(14.w)),
                    child: InkResponse(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: AppColors.appGrayColor,
                        size: 15.w,
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Container(
                    height: 25.w,
                    width: 25.w,
                    decoration: BoxDecoration(
                        color: AppColors.colorPrimary,
                        borderRadius: BorderRadius.circular(14.w)),
                    child: Icon(
                      Icons.notifications_outlined,
                      size: 20.w,
                      color: AppColors.appColorWhite,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 230.w,
              height: 30.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) => Container(
                  width: 65.w,
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 5.h),
                  child: AppButton(
                      buttonColor: selectedBtnIndex == categories[index].id
                          ? AppColors.colorPrimary
                          : AppColors.appColorWhite,
                      textColor: selectedBtnIndex == categories[index].id
                          ? AppColors.appColorWhite
                          : AppColors.appColorBlack,
                      isTextPadding: false,
                      isTextBold: false,
                      fontSize: 8.sp,
                      width: 40.w,
                      buttonText: categories[index].name,
                      onTapButton: () {
                        setState(() {
                          selectedBtnIndex = categories[index].id;
                        });
                      }),
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            // Container(
            //   width: 230.w,
            //   height: 30.h,
            //   child: Text("About ${widget.args.news.articles} results for ${widget.args.searchedText}"),
            // ),
            SizedBox(
              // width: 230.w,
              height: 110.h * widget.args.news.articles.length,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.args.news.articles.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.SINGLE_POST_VIEW,
                        arguments: widget.args.news.articles[index]);
                  },
                  child: Container(
                    width: 65.w,
                    padding:
                    EdgeInsets.symmetric(horizontal: 2.w, vertical: 5.h),
                    child:
                    NormalNewsTile(news: widget.args.news.articles[index]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Base<BaseEvent, BaseState> getBloc() {
    return bloc;
  }
}
