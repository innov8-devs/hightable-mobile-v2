import 'dart:io';

import 'package:flutter/cupertino.dart';

class AppNavigators {
  static Future<T?> routeReplace<T>(BuildContext context, [Widget? route]) {
    return Navigator.of(context).pushReplacement(
      Platform.isIOS
          ? CupertinoPageRoute(
              builder: (_) {
                return route!;
              },
            )
          : PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return route!;
              },
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(0.0, 1.0);
                const end = Offset.zero;
                const curve = Curves.easeOut;
                final tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));
                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            ),
    );
  }

  static Future<T?> routeReplacefade<T>(BuildContext context, [Widget? route]) {
    return Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return route!;
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            // position: animation.drive(tween),
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  static Future<T?> routeForEver<T>(BuildContext context, [Widget? route]) {
    return Navigator.pushAndRemoveUntil(
      context,
      Platform.isIOS
          ? CupertinoPageRoute(
              builder: (_) {
                return route!;
              },
            )
          : PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return route!;
              },
            ),
      (route) => false,
    );
  }

  static Future<T?> route<T>(BuildContext context, [Widget? route]) {
    return Navigator.of(context).push(
      Platform.isIOS
          ? CupertinoPageRoute(
              builder: (_) {
                return route!;
              },
            )
          : PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return route!;
              },
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(0.0, 1.0);
                const end = Offset.zero;
                const curve = Curves.easeInOut;
                final tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));
                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            ),
    );
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }
}
