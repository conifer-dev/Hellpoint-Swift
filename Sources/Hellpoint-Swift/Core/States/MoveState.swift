import Raylib
import Seuwichi

struct MoveState: State {
    func update() {
        Logic.player.update(deltaTime: Engine.deltaTime)

        if Logic.player.velocity.x == 0 {
            Logic.stateManager.changeState(id: "idle")
        }
    }

    func render() {
        Logic.player.render()
    }

    func onEnter() {
        print("Entered Move State")
    }

    func onExit() {

    }
}