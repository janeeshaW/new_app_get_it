import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/services/dependency_injection.dart';
import 'package:news_app/core/util/app_colors.dart';
import 'package:news_app/features/domain/entities/response/news_response_entity.dart';
import 'package:readmore/readmore.dart';

import '../../../core/util/app_data_conversions.dart';


class DescriptionNewsTile extends StatefulWidget {
  const DescriptionNewsTile({Key? key, required this.news}) : super(key: key);
  final Article news;

  @override
  _DescriptionNewsTileState createState() => _DescriptionNewsTileState();
}

class _DescriptionNewsTileState extends State<DescriptionNewsTile> {
  final dataConverter = injection<AppDataConversions>();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.h),
      child: SizedBox(
        width: 270.w,
        // height: 300.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.h),
              child: SizedBox(
                width: 270.w,
                height: 100.h,
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
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.w, right: 5.w),
              child: Text(
                widget.news.publishedAt != null
                    ? dataConverter.convertNewsTileDate(
                        date: widget.news.publishedAt!)
                    : "",
                style: TextStyle(fontSize: 8.sp),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.w, right: 5.w),
              child: SizedBox(
                  width: 240.w,
                  height: 30.h,
                  child: Text(
                    widget.news.description != null
                        ? widget.news.description!
                        : "",
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  )),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.w, right: 5.w),
              child: SizedBox(
                  width: 240.w,
                  // height: 70.h,
                  child: ReadMoreText(
                    widget.news.content != null ? widget.news.content! : "",
                    trimLines: 4,
                    colorClickableText: AppColors.colorSecondary,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: '...Read More',
                    trimExpandedText: ' Read Less',
                    style: const TextStyle(color: Colors.black),
                  )),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.w, right: 5.w),
              child: Text(
                widget.news.author != null
                    ? "Published by ${widget.news.author!}"
                    : "",
                style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
      ),
    );
  }
}
