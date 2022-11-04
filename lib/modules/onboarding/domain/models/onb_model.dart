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
            'Discover the best restaurants, bars, lounges and events near you.',
        image: ImageAssets.onb1,
      ),
      Onboarding(
        title: 'Reserve',
        subtitle:
            'Reserve tables or spaces at your favourite restaurants, clubs and lounges.',
        image: ImageAssets.onb2,
      ),
      Onboarding(
        title: 'Review',
        subtitle: 'Share your experiences and opinions about any business.',
        image: ImageAssets.onb3,
      ),
      Onboarding(
        title: 'Reserve',
        subtitle:
            'Connect with like minded people, network and expand social circle.',
        image: ImageAssets.onb4,
      ),
    ];
    return items;
  }
}
