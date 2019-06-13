import 'package:flame/sprite.dart';
import '../components/fly_component.dart';
import '../game/fly_game.dart';

class DroolerFly extends Fly {
  DroolerFly(FlyGame game, [baseRect, bgColor]) : super(game, baseRect, bgColor) {
    flyingSprite = List<Sprite>();
    flyingSprite.add(Sprite('flies/drooler-fly-1.png'));
    flyingSprite.add(Sprite('flies/drooler-fly-2.png'));
    deadSprite = Sprite('flies/drooler-fly-dead.png');
  }
}