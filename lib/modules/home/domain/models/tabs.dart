import 'package:flutter/widgets.dart';
import 'package:hightable_mobile_v2/modules/home/views/widgets/events.dart';
import 'package:hightable_mobile_v2/modules/home/views/widgets/people.dart';
import 'package:hightable_mobile_v2/modules/home/views/widgets/places.dart';
import 'package:hightable_mobile_v2/modules/home/views/widgets/reviews.dart';
import 'package:hightable_mobile_v2/utils/assets.dart';

class SingleTab {
  final String title;
  final String image;
  final Widget widget;

  const SingleTab({
    required this.title,
    required this.widget,
    required this.image,
  });
}

class Tabs {
  static List<SingleTab> loadTabs() {
    const items = <SingleTab>[
      SingleTab(
        title: "Reviews",
        image: ImageAssets.reviewsHomeTabImage,
        widget: Reviews(),
      ),
      SingleTab(
        title: "Places",
        image: ImageAssets.placesHomeTabImage,
        widget: Places(),
      ),
      SingleTab(
        title: "Events",
        image: ImageAssets.eventsHomeTabImage,
        widget: Events(),
      ),
      SingleTab(
        title: "People",
        image: ImageAssets.peopleHomeTabImage,
        widget: People(),
      ),
    ];
    return items;
  }
}
