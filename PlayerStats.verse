# Define a class for storing player stats
player_stats_table := class<final><persistable>:
    Example: int = 0
    Money: int = 0
    Kills: int = 0
    Eliminations: int = 0
    Score: int = 0                      # ADDED SCORE HERE
    PlayerLevel: int = 0                # ADDED LEVEL HERE
    PlayerXP: int = 0                   # ADDED XP HERE
    ScoreMultiplier: int = 0
    # PlayerRank: int = 0
    # PlayerRankXP: int = 0


# Define a constructor function to create a new player_stats_table from an existing one
MakePlayerStatsTable<constructor>(OldTable:player_stats_table)<transacts> := player_stats_table:
    Example := OldTable.Example
    Money := OldTable.Money
    Kills := OldTable.Kills
    Eliminations := OldTable.Eliminations
    Score := OldTable.Score             # ADDED SCORE HERE
    PlayerLevel := OldTable.PlayerLevel # ADDED LEVEL HERE
    PlayerXP := OldTable.PlayerXP       # ADDED XP HERE
    ScoreMultiplier := OldTable.ScoreMultiplier
    # PlayerRank := OldTable.PlayerRank 
    # PlayerRankXP := OldTable.PlayerRankXP





