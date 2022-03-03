import Raylib
import Seuwichi

class PlayButton: UIButton {

    enum buttonState {
        case released
        case pressed
    }

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

}