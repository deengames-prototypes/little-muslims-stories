package;

import flixel.FlxG;
import helix.core.HelixSprite;
using helix.core.HelixSpriteFluentApi;
import helix.core.HelixState;
import helix.data.Config;
import openfl.Assets;

class MenuState extends HelixState
{
    private static inline var STORIES_PER_ROW:Int = 2;
    private static inline var STORIES_PER_COLUMN:Int = 3;
    private static inline var PADDING:Int = 10;

    override public function create():Void
    {
        super.create();
        var stories:Array<String> = cast(Config.get("stories"));
        var storyNumber = 0;

        for (storyName in stories) {
            // assumption: story name is a slug
            var button:HelixSprite;
            var storyImageName = 'assets/images/stories/${storyName}-small.png';
            if (Assets.exists(storyImageName)) {
                button = new HelixSprite(storyImageName);
            } else {
                trace('Warning: missing story cover ${storyImageName}');
                button = new HelixSprite('assets/images/stories/story-generic.jpg');
            }
            
            var xIntVal:Int = storyNumber % STORIES_PER_ROW;
            var yIntVal:Int = Std.int(storyNumber / STORIES_PER_ROW);
            button.x = (xIntVal) * (button.width + PADDING) + (PADDING * (xIntVal + 1));
            button.y = (yIntVal * button.height) + (PADDING * (yIntVal + 1));

            button.onClick(function() {
                FlxG.switchState(new PlayState(storyName));
            });

            storyNumber++;
        }
    }
}