import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:news_app/core/services/dependency_injection.dart';
import 'package:news_app/core/util/app_data_conversions.dart';
import 'package:news_app/features/domain/entities/response/news_response_entity.dart';



class NormalNewsTile extends StatefulWidget {
  final Article news;

  const NormalNewsTile({
    Key? key,
    required this.news,
  }) : super(key: key);

  @override
  _NormalNewsTileState createState() => _NormalNewsTileState();
}

class _NormalNewsTileState extends State<NormalNewsTile> {
  final dataConverter = injection<AppDataConversions>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270.w,
      height: 100.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.h),
        child: Stack(
          children: [
            SizedBox(
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
            Positioned(
                top: 10.h,
                child: Padding(
                  padding: EdgeInsets.only(left: 15.w, right: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 240.w,
                          child: Text(
                            widget.news.description != null
                                ? widget.news.description!
                                : "",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )),
                    ],
                  ),
                )),
            Positioned(
                top: 80.h,
                child: Padding(
                  padding: EdgeInsets.only(left: 15.w, right: 15.w),
                  child: SizedBox(
                    width: 240.w,
                    height: 20.h,
                    child: Row(
                      children: [
                        Text(
                          widget.news.author != null ? widget.news.author! : "",
                          style: TextStyle(color: Colors.white, fontSize: 8.sp),
                        ),
                        const Expanded(child: SizedBox()),
                        Text(
                          widget.news.publishedAt != null
                              ? dataConverter.convertNewsTileDate(date:widget.news.publishedAt!)
                              : "",
                          style: TextStyle(color: Colors.white, fontSize: 8.sp),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
