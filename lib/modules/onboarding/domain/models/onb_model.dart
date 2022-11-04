import 'package:hightable_mobile_v2/utils/assets.dart';

class Onboarding {
  final String title;
  final String subtitle;
  final String image;

  const Onboarding({
    required this.title,
    required this.subtitle,
    required this.image,
  });
}

class Onboardings {
  static List<Onboarding> loadOnboarding() {
    const items = <Onboarding>[
      Onboarding(
        title: 'Discover',
        subtitle:
            'Discover the best restaurants, bars, lounges and events that Lagos has to offer',
        image: ImageAssets.onb1,
      ),
      Onboarding(
        title: 'Connect',
        subtitle:
            'Connect with like minded people, network and expand your social circle',
        image: ImageAssets.onb1,
      ),
      Onboarding(
        title: 'Review',
        subtitle: 'Share your experiences and opinions about local businesses.',
        image: ImageAssets.onb1,
      ),
      Onboarding(
        title: 'Reserve',
        subtitle:
            'Reserve tables at your favourite restaurants as well as the hottest clubs and lounges.',
        image: ImageAssets.onb1,
      ),
    ];
    return items;
  }
}
