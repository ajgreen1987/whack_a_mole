import 'flame_game.dart';
import 'dart:ui';
import '../views/view.dart';
import '../components/backyard_component.dart';
import '../components/fly_component.dart';
import '../components/house_fly_component.dart';
import '../components/drooler_fly_component.dart';
import '../components/agile_fly_component.dart';
import '../components/hungry_fly_component.dart';
import '../components/macho_fly_component.dart';
import '../views/home_view.dart';

class FlyGame extends FlameGame {
  Rect bgRect;
  Backyard bgSprite;
  View activeView = View.home;
  HomeView mainMenu;

  void spawnComponent() {
    if (activeView == View.home) {
      // Main Menu
      if (mainMenu == null) {
        mainMenu = HomeView(this);
        components.add(mainMenu);
      }
    } else {
      // Add to components
      if (bgSprite == null) {
        bgSprite = Backyard(this);
        components.add(bgSprite);
      }

      components.add(randomFly());
    }
  }

  Fly randomFly() {
    int randomFly = random.nextInt(4);
    double x = random.nextDouble() * (screenSize.width - tileSize);
    double y = random.nextDouble() * (screenSize.height - tileSize);

    switch (randomFly) {
      case 0:
        print("agile");
        return AgileFly(this, Rect.fromLTWH(x, y, tileSize, tileSize));
      case 1:
        print("drooler");
        return DroolerFly(this, Rect.fromLTWH(x, y, tileSize, tileSize));
      case 2:
        print("macho");
        return MachoFly(this, Rect.fromLTWH(x, y, tileSize, tileSize));
      case 3:
        print("hungry");
        return HungryFly(this, Rect.fromLTWH(x, y, tileSize, tileSize));
      default:
        print("house");
        return HouseFly(this, Rect.fromLTWH(x, y, tileSize, tileSize));
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
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
