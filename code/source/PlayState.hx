package;

import flixel.FlxG;
import helix.core.HelixSprite;
using helix.core.HelixSpriteFluentApi;
import helix.core.HelixState;
import helix.data.Config;

class PlayState extends HelixState
{
	private static inline var PADDING:Int = 10;
	private var storyName:String;

	public function new(storyName:String)
	{
		super();
		this.storyName = storyName;
	}

	override public function create():Void
	{
		super.create();

		new HelixSprite('assets/images/stories/${this.storyName}-large.png');
		FlxG.sound.play('assets/sounds/stories/${this.storyName}.ogg');

		var closeButton = new HelixSprite("assets/images/close.png");

		closeButton.move(FlxG.width - closeButton.width - PADDING, PADDING);

		closeButton.onClick(function() {
			FlxG.switchState(new MenuState());
		});
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
