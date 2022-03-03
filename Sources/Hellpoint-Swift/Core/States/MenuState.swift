import Raylib
import Seuwichi

class MenuState: State {
// ======================================================================================================== 

    var transitionTimer: Float = 0.3
    var playButton = PlayButton(buttonPosition: Vector2(x: 500, y:300))

// ======================================================================================================== 

    func update(deltaTime dt: Float) {
        playButton.onCollisionCheck()
        playButton.onPressCountdown(with: &transitionTimer, subtractedBy: dt)
    }

    func render() {
        playButton.render()
    }

    func onEnter() {
        print("Entered Menu State")
    }

    func onExit() {

    }
}
