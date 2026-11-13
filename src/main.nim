# src/main.nim
import raylib
import game_logic

const
  ScreenWidth = 800
  ScreenHeight = 600
  TargetFPS = 60

#region Main

proc main() =
  # 1. Инициализация окна
  setConfigFlags(flags(WindowResizable, VsyncHint))
  initWindow(ScreenWidth, ScreenHeight, "My Naylib Game")
  defer:
    closeWindow()

  setTargetFPS(TargetFPS)

  # 2. Инициализация игры
  var game = initGame()

  # 3. Главный игровой цикл
  while not windowShouldClose():
    # Обновление логики
    let deltaTime = getFrameTime()
    game.update(deltaTime)

    # Отрисовка кадра
    # Шаблон drawing: автоматически вызывает beginDrawing() и endDrawing()
    # и гарантирует, что они будут вызваны парно, даже при ошибке[reference:1]
    drawing:
      clearBackground(RayWhite)
      game.draw()

#endregion

# Запускаем игру
when isMainModule:
  main()

