import '../components/house_fly_component.dart';
import '../components/backyard_component.dart';
import 'flame_game.dart';
import 'dart:ui';

class FlyGame extends FlameGame {
  Rect bgRect;
  Backyard bgSprite;

  void spawnComponent() {
    // Add to components
    if (bgSprite == null) {
      bgSprite = Backyard(this);
      components.add(bgSprite);
    }

    double x = random.nextDouble() * (screenSize.width - tileSize);
    double y = random.nextDouble() * (screenSize.height - tileSize);
    components.add(HouseFly(this, Rect.fromLTWH(x, y, tileSize, tileSize)));
  }

  void update(double t) {
    // This could be whatever logic we want. Time based, or similar.
    // Changing from 1 to 2 to handle the background being added...Perhaps separate background?
    if (components.length < 2) {
      spawnComponent();
    }
    super.update(t);
  }
}
