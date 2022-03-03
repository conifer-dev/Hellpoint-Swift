import Raylib

protocol UIButton {

    associatedtype buttonState

    var buttonTexture: Texture2D { get set }
    var onPressButtonTexture: Texture2D? { get set }
    var buttonWidth: Int32 { get set }
    var buttonHeight: Int32 { get set }
    var buttonPosition: Vector2 { get set }
    var buttonBounds: Rectangle { get set }
    var buttonState: buttonState { get set }
    var isButtonPressed: Bool { get set }

    mutating func onPress()

    mutating func render()
}