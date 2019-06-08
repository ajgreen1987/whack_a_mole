import '../components/fly_component.dart';
import 'flame_game.dart';

class FlyGame extends FlameGame {
  void spawnComponent() {
    double x = random.nextDouble() * (screenSize.width - tileSize);
    double y = random.nextDouble() * (screenSize.height - tileSize);
    components.add(Fly(this, x, y));
  }

  void update(double t) {
    // This could be whatever logic we want. Time based, or similar.
    if (components.length < 1) {
      spawnComponent();
    }
    super.update(t);
  }
}
