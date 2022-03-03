import Raylib
import Seuwichi
import Foundation

class PlayButton: UIButton {

    enum buttonState {
        case released
        case pressed
    }
// ======================================================================================================== 

    lazy var buttonTexture: Texture2D = Resources.manager.loadedResourcesDatabase["playButton"]!
    lazy var onPressButtonTexture: Texture2D? = Resources.manager.loadedResourcesDatabase["playButtonOnPress"]!
    lazy var buttonWidth: Int32 = buttonTexture.width
    lazy var buttonHeight: Int32 = buttonTexture.height
    var buttonPosition: Vector2
    lazy var buttonBounds: Rectangle = Rectangle(x: self.buttonPosition.x, y: self.buttonPosition.y, width: Float(self.buttonWidth), height: Float(self.buttonHeight))
    var buttonState: buttonState = .released
    var isButtonPressed: Bool = false

    init(buttonPosition: Vector2) {
        self.buttonPosition = buttonPosition
    }

// ======================================================================================================== 

    func onPress() {
        self.buttonState = .pressed
        self.isButtonPressed = true
    }

    func render() {
        if self.buttonState == .released {
            Raylib.drawTexture(self.buttonTexture, Int32(self.buttonPosition.x), Int32(self.buttonPosition.y), .white)
        } else {
            Raylib.drawTexture(self.onPressButtonTexture!, Int32(self.buttonPosition.x), Int32(self.buttonPosition.y), .white)
        }
    }

    func onPressLogic() {
        Logic.stateManager.changeState(id: "idle")
        Logic.hasGameStarted = true
    }

    func checkCollision() {
        let mousePoint = Raylib.getMousePosition()

        if Raylib.checkCollisionPointRec(mousePoint, self.buttonBounds) {
            if Raylib.isMouseButtonDown(.left) {
                self.onPress()
            } else {
                self.buttonState = .released
            }
        }
    }
}

// ======================================================================================================== 

extension PlayButton {
    func onPressCountdown(with timeInterval: inout Float, deltaTime dt: Float) {
        timeInterval -= dt

        if timeInterval <= 0.0 {
            timeInterval = 0
            self.isButtonPressed = false
            self.onPressLogic()
        }
    }    
}