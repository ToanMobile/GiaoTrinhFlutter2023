enum Flavor {
  dev,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'L12 Dev';
      case Flavor.prod:
        return 'L12 Prod';
      default:
        return 'title';
    }
  }

}
