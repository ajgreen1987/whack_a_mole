import '../components/fly.dart';
import 'flame_game.dart';

class FlyGame extends FlameGame {
  void spawnComponent() {
    double x = random.nextDouble() * (screenSize.width - tileSize);
    double y = random.nextDouble() * (screenSize.height - tileSize);
    components.add(Fly(this, x, y));
  }
}
