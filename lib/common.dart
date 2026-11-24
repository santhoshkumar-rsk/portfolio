import 'package:flutter/material.dart';

final GlobalKey homeKey = GlobalKey();
final GlobalKey aboutKey = GlobalKey();
final GlobalKey skillsKey = GlobalKey();
final GlobalKey experienceKey = GlobalKey();
final GlobalKey projectsKey = GlobalKey();
final GlobalKey educationKey = GlobalKey();
final GlobalKey contactKey = GlobalKey();

final ScrollController scrollController = ScrollController();

void scrollToKey(GlobalKey key) {
  final context = key.currentContext;
  if (context != null) {
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOutCubic,
    );
  }
}
