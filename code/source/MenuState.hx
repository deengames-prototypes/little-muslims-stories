package;

import helix.core.HelixSprite;
import helix.core.HelixState;
import helix.data.Config;

class MenuState extends HelixState
{
    override public function create():Void
    {
        var stories:Array<String> = cast(Config.get("stories"));
        for (story in stories) {
            trace(story);
        }
    }
}