import 'package:flame/sprite.dart';
import '../components/fly_component.dart';
import '../game/fly_game.dart';

class MachoFly extends Fly {
  MachoFly(FlyGame game, [baseRect, bgColor]) : super(game, baseRect, bgColor) {
    flyingSprite = List<Sprite>();
    flyingSprite.add(Sprite('flies/macho-fly-1.png'));
    flyingSprite.add(Sprite('flies/macho-fly-2.png'));
    deadSprite = Sprite('flies/macho-fly-dead.png');
  }
}