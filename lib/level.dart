class Level {
  final int levelId;
  final List<Map<String, Object>> levelData;
  final bool levelWon;
  final List<int> levelReset;

  const Level({
    this.levelId,
    this.levelWon,
    this.levelReset,
    this.levelData,
  });
}
