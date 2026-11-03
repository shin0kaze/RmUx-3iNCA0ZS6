# src/game_logic.nim
import raylib, raymath, rlgl

type
  Game* = object
    # Здесь будут ваши игровые объекты: игрок, враги, пули и т.д.
    playerPos: Vector2
    playerSpeed: float32
    # ... другие поля

# Создание начального состояния игры
proc initGame*(): Game =
  result = Game(
    playerPos: Vector2(x: 400, y: 300),
    playerSpeed: 200.0
  )

# Обновление состояния игры
proc update*(game: var Game, deltaTime: float32) =
  # Пример управления: движение игрока стрелками или WASD
  var move = Vector2(x: 0, y: 0)
  if isKeyDown(KeyboardKey.Left) or isKeyDown(KeyboardKey.A):
    move.x -= 1
  if isKeyDown(KeyboardKey.Right) or isKeyDown(KeyboardKey.D):
    move.x += 1
  if isKeyDown(KeyboardKey.Up) or isKeyDown(KeyboardKey.W):
    move.y -= 1
  if isKeyDown(KeyboardKey.Down) or isKeyDown(KeyboardKey.S):
    move.y += 1

  # Нормализация вектора для равномерной скорости по диагонали
  if move.x != 0 or move.y != 0:
    move = move.normalize()
  
  # Применяем движение с учетом deltaTime для независимости от FPS
  game.playerPos.x += move.x * game.playerSpeed * deltaTime
  game.playerPos.y += move.y * game.playerSpeed * deltaTime

# Отрисовка игры
proc draw*(game: Game) =
  # Рисуем игрока в виде круга
  drawCircle(game.playerPos, 20.0, Red)
  
  # Пример вывода текста
  drawText("Use WASD or Arrows to move", 10, 10, 20, DarkGray)