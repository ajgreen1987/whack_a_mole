import 'package:flame/sprite.dart';
import '../components/fly_component.dart';
import '../game/fly_game.dart';

class AgileFly extends Fly {
  AgileFly(FlyGame game, [baseRect, bgColor]) : super(game, baseRect, bgColor) {
    flyingSprite = List<Sprite>();
    flyingSprite.add(Sprite('flies/agile-fly-1.png'));
    flyingSprite.add(Sprite('flies/agile-fly-2.png'));
    deadSprite = Sprite('flies/agile-fly-dead.png');
  }
}