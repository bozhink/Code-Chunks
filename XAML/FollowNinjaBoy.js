function FollowNinjaBoy1(sender, eventArgs) {
var actor = Game.CurrentScene.GetActor("Ninja Boy 1");
if (actor)
{
  var actorLeftEdge = actor.GetValue("X");
  var actorRightEdge = actorLeftEdge + actor.GetValue("Width");
  var viewportX = Game.CurrentScene.GetValue("X");
  var viewportWidth = Game.CurrentScene.GetValue("ViewportWidth");
  var leftMargin = viewportWidth / 4;
  var rightMargin = viewportWidth / 3;

  // Move the viewport left if the actor is too far to the left:
  if (actorLeftEdge - viewportX < leftMargin)
     Game.CurrentScene.SetValue("X", actorLeftEdge - leftMargin);
  // Move the viewport right if the actor is too far to the right:
  else if (actorRightEdge - viewportX > viewportWidth - rightMargin)
     Game.CurrentScene.SetValue("X", actorRightEdge - (viewportWidth - rightMargin));
}
}




function ChangeToMainScene(sender, eventArgs){
  Game.ChangeScene("Main");
}

function Sound1(sender, eventArgs){
  Game.PlayAudio("/GameCreator/Actors/Sound/Controls/CelestaUp.mp3");
}

