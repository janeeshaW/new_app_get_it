import 'package:flutter/material.dart';
import 'package:news_app/features/domain/entities/response/login_response_entity.dart';
import 'package:news_app/features/domain/entities/response/news_response_entity.dart';
import 'package:news_app/features/presentation/views/args/search_view_args.dart';
import 'package:news_app/features/presentation/views/dashboard/dashboard_view.dart';
import 'package:news_app/features/presentation/views/login/login_view.dart';
import 'package:news_app/features/presentation/views/pages/my_home_page.dart';
import 'package:news_app/features/presentation/views/search_view/search_view.dart';
import 'package:news_app/features/presentation/views/see_all_latest_news_view/see_all_latest_news_view.dart';
import 'package:news_app/features/presentation/views/sign_up/sign_up_view.dart';
import 'package:news_app/features/presentation/views/single_post_view/single_post_view.dart';
import 'package:news_app/features/presentation/views/splash_view/splash_view.dart';
import 'package:page_transition/page_transition.dart';



class Routes {
  static const String HOME_VIEW = "HOME_VIEW";
  static const String DASHBOARD_VIEW = "DASHBOARD_VIEW";
  static const String SEE_ALL_LATEST_POSTS_VIEW = "SEE_ALL_LATEST_POSTS_VIEW";
  static const String SINGLE_POST_VIEW = "SINGLE_POST_VIEW";
  static const String SPLASH_VIEW = "SPLASH_VIEW";
  static const String LOGIN_VIEW = "LOGIN_VIEW";
  static const String SIGN_UP_VIEW = "SIGN_UP_VIEW";
  static const String SEARCH_VIEW = "SEARCH_VIEW";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.HOME_VIEW:
        return PageTransition(
            child: const MyHomePage(), type: PageTransitionType.fade);
      case Routes.DASHBOARD_VIEW:
        return PageTransition(
            child: DashboardView(
              login: settings.arguments as LoginResponseEntity,
            ),
            type: PageTransitionType.fade);
      case Routes.SEE_ALL_LATEST_POSTS_VIEW:
        return PageTransition(
            child: SeeAllLatestNewsPage(
              news: settings.arguments as NewsResponse,
            ),
            type: PageTransitionType.fade);
      case Routes.SINGLE_POST_VIEW:
        return PageTransition(
            child: SinglePostViewPage(
              news: settings.arguments as Article,
            ),
            type: PageTransitionType.fade);
      case Routes.SPLASH_VIEW:
        return PageTransition(
            child: const SplashView(), type: PageTransitionType.fade);
      case Routes.LOGIN_VIEW:
        return PageTransition(
            child: const LoginView(), type: PageTransitionType.fade);
      case Routes.SIGN_UP_VIEW:
        return PageTransition(
            child: const SignUpView(), type: PageTransitionType.fade);
      case Routes.SEARCH_VIEW:
        return PageTransition(
            child: SearchView(
              args: settings.arguments as SearchViewArgs,
            ),
            type: PageTransitionType.fade);

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("Invalid Route"),
            ),
          ),
        );
    }
  }
}
