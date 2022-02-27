import Raylib
import Seuwichi

struct IdleState: State {
    func update() {
        Logic.player.update(deltaTime: Engine.deltaTime)

        if Logic.player.velocity.x == 1 || Logic.player.velocity.x == -1 {
            Logic.stateManager.changeState(id: "move")
        }
    }

    func render() {
        Logic.player.render()
    }

    func onEnter() {
        print("Entered IdleState")
    }

    func onExit() {

    }
}