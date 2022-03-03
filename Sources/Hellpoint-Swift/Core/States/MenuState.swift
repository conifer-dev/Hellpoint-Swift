import Raylib
import Seuwichi

class MenuState: State {
    var timer: Float = 0.5
    var playButton = PlayButton(buttonPosition: Vector2(x: 500, y:300))

    func update(deltaTime dt: Float) {
        let mousePoint = Raylib.getMousePosition()
        playButton.buttonState = .released

        if Raylib.checkCollisionPointRec(mousePoint, playButton.buttonBounds) {
            if Raylib.isMouseButtonDown(.left) {
                playButton.onPress()
            }
        }

        if playButton.isButtonPressed {
            timer -= dt
        }

       if timer <= 0.0 {
            timer = 0
            playButton.isButtonPressed = false
           playButton.onPressLogic()
        }
        print(timer)
    }

    func render() {
        playButton.render()
    }

    func onEnter() {
        print("Entered Menu State")
    }

    func onExit() {
        timer = 0.5
    }
}
