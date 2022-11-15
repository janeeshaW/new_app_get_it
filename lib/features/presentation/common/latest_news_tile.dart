import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/domain/entities/response/news_response_entity.dart';



class LatestNewsTile extends StatefulWidget {
  const LatestNewsTile({Key? key, required this.news}) : super(key: key);
  final Article news;

  @override
  _LatestNewsTileState createState() => _LatestNewsTileState();
}

class _LatestNewsTileState extends State<LatestNewsTile> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.h),
      child: SizedBox(
        width: 230.w,
        height: 180.h,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.h),
              child: SizedBox(
                width: 230.w,
                height: 180.h,
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
                top: 60.h,
                child: Padding(
                  padding: EdgeInsets.only(left: 15.w, right: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.news.author != null
                            ? "by ${widget.news.author!}"
                            : "",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      SizedBox(
                          width: 200.w,
                          child: Text(
                            widget.news.content != null
                                ? widget.news.content!
                                : "",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          )),
                    ],
                  ),
                )),
            Positioned(
                top: 150.h,
                child: Padding(
                  padding: EdgeInsets.only(left: 15.w, right: 15.w),
                  child: Column(
                    children: [
                      SizedBox(
                          width: 200.w,
                          child: Text(
                            widget.news.description != null
                                ? widget.news.description!
                                : "",
                            style:
                                TextStyle(color: Colors.white, fontSize: 8.sp),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
