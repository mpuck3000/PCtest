using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }

PlayerService := class<concrete>():
    
    _DebugUtil : DebugUtil = DebugUtil{}
    
    # Method to initialize a single player if they are not already initialized. 
    # Note every player who plays the game will have their own player_stats_table, THEY DONT SHARE THE SAME ONE - GOOD TO KNOW
    InitializePlayer(Player:player):void=
        if:
            not PlayerStatsMap[Player]
            set PlayerStatsMap[Player] = player_stats_table{}
        
    # Method to reset a player's progress
    ResetPlayerProgress(Player:player):void=
        if:
            PlayerStatsMap[Player]
            set PlayerStatsMap[Player] = player_stats_table{}
        then:
            InitializePlayer(Player)
        
    # Method to get a player's stats
    GetPlayerStats(Agent:agent)<decides><transacts>:player_stats_table=
        var PlayerStats:player_stats_table = player_stats_table{}
        if:
            Player := player[Agent]
            Player.IsActive[]
            PlayerStatsTable := PlayerStatsMap[Player]
            set PlayerStats = MakePlayerStatsTable(PlayerStatsTable)
        PlayerStats
        
    # Method to increment a player's stat
    IncrementStat(Agent:agent, Stat:stat_type, IntAmount:int):void=
        if:
            Player := player[Agent]
            PlayerStatsTable := PlayerStatsMap[Player]

            if(Stat.Id() = StatType.Example.Id() and Player.IsActive[]):        # Increment Example
                ExampleStat := PlayerStatsTable.Example
                set PlayerStatsMap[Player] = player_stats_table:
                    MakePlayerStatsTable<constructor>(PlayerStatsTable)
                    Example := PlayerStatsTable.Example + IntAmount

            else if(Stat.Id() = StatType.Money.Id() and Player.IsActive[]):     # Increment Money
                MoneyStat := PlayerStatsTable.Money
                set PlayerStatsMap[Player] = player_stats_table:
                    MakePlayerStatsTable<constructor>(PlayerStatsTable)
                    Money := PlayerStatsTable.Money + IntAmount

            else if(Stat.Id() = StatType.Kills.Id() and Player.IsActive[]):     # Increment Kills
                KillsStat := PlayerStatsTable.Kills
                set PlayerStatsMap[Player] = player_stats_table:
                    MakePlayerStatsTable<constructor>(PlayerStatsTable)
                    Kills := PlayerStatsTable.Kills + IntAmount

            else if(Stat.Id() = StatType.Eliminations.Id() and Player.IsActive[]):     # Increment Eliminations
                EliminationsStat := PlayerStatsTable.Eliminations
                set PlayerStatsMap[Player] = player_stats_table:
                    MakePlayerStatsTable<constructor>(PlayerStatsTable)
                    Eliminations := PlayerStatsTable.Eliminations + IntAmount

            else if(Stat.Id() = StatType.Score.Id() and Player.IsActive[]):     # Increment Score
                ScoreStat := PlayerStatsTable.Score
                set PlayerStatsMap[Player] = player_stats_table:
                    MakePlayerStatsTable<constructor>(PlayerStatsTable)
                    Score := PlayerStatsTable.Score + IntAmount

                    # Add Leaderboard update here - fires when score is updated -----------------------------------------------------***__*_*_*_*_*__**_*__**_*_*_
                    # UpdateLeaderboard()

            else if(Stat.Id() = StatType.PlayerLevel.Id() and Player.IsActive[]):     # Increment PlayerLevel
                PlayerLevelStat := PlayerStatsTable.PlayerLevel
                set PlayerStatsMap[Player] = player_stats_table:
                    MakePlayerStatsTable<constructor>(PlayerStatsTable)
                    PlayerLevel := PlayerStatsTable.PlayerLevel + IntAmount

            else if(Stat.Id() = StatType.PlayerXP.Id() and Player.IsActive[]):     # Increment PlayerXP
                PlayerXPStat := PlayerStatsTable.PlayerXP
                set PlayerStatsMap[Player] = player_stats_table:
                    MakePlayerStatsTable<constructor>(PlayerStatsTable)
                    PlayerXP := PlayerStatsTable.PlayerXP + IntAmount
        then:
            if(Stat.Id() = StatType.Example.Id()):                              # Console Log Example
                _DebugUtil.Log("Example incremented by {IntAmount}")
            else if(Stat.Id() = StatType.Money.Id()):                           # Console Log Money
                _DebugUtil.Log("Money incremented by {IntAmount}")
            else if(Stat.Id() = StatType.Kills.Id()):                           # Console Log Kills
                _DebugUtil.Log("Kills incremented by {IntAmount}")
            else if(Stat.Id() = StatType.Eliminations.Id()):                     # Console Log Eliminations
                _DebugUtil.Log("Eliminations incremented by {IntAmount}")
            else if(Stat.Id() = StatType.Score.Id()):                           # Console Log Score
                _DebugUtil.Log("Score incremented by {IntAmount}")
            else if(Stat.Id() = StatType.PlayerLevel.Id()):                     # Console Log PlayerLevel
                _DebugUtil.Log("PlayerLevel incremented by {IntAmount}")
            else if(Stat.Id() = StatType.PlayerXP.Id()):                        # Console Log PlayerXP
                _DebugUtil.Log("PlayerXP incremented by {IntAmount}")
            else if(Stat.Id() = StatType.ScoreMultiplier.Id()):                        # # Console Log Error - can NOT decrement ScoreMultiplier
                _DebugUtil.Log("UH OH, ScoreMultiplier can NOT be incremented at the moment, go change code if needed")
            else:
                _DebugUtil.Error("Invalid Stat Type")                   # Console Log Error
        else:
            _DebugUtil.Error("Player Stats Table not found")            # Console Log Error


        
    # Method to decrement a player's stat
    DecrementStat(Agent:agent, Stat:stat_type, IntAmount:int):void=
        if:
            Player := player[Agent]
            PlayerStatsTable := PlayerStatsMap[Player]
            if(Stat.Id() = StatType.Example.Id() and Player.IsActive[]):        # Decrement Example
                ExampleStat := PlayerStatsTable.Example
                set PlayerStatsMap[Player] = player_stats_table:
                    MakePlayerStatsTable<constructor>(PlayerStatsTable)
                    Example := PlayerStatsTable.Example - IntAmount

            else if(Stat.Id() = StatType.Money.Id() and Player.IsActive[]):     # Decrement Money
                MoneyStat := PlayerStatsTable.Money
                set PlayerStatsMap[Player] = player_stats_table:
                    MakePlayerStatsTable<constructor>(PlayerStatsTable)
                    Money := PlayerStatsTable.Money - IntAmount

            else if(Stat.Id() = StatType.Score.Id() and Player.IsActive[]):     # Decrement Score
                ScoreStat := PlayerStatsTable.Score
                set PlayerStatsMap[Player] = player_stats_table:
                    MakePlayerStatsTable<constructor>(PlayerStatsTable)
                    Score := PlayerStatsTable.Score - IntAmount
        then:
            if(Stat.Id() = StatType.Example.Id()):                              # Console Log Example
                _DebugUtil.Log("Example decremented by {IntAmount}")
            else if(Stat.Id() = StatType.Money.Id()):                           # Console Log Money
                _DebugUtil.Log("Money decremented by {IntAmount}")
            else if(Stat.Id() = StatType.Kills.Id()):                           # Console Log Kills
                _DebugUtil.Log("UH OH, Kills can NOT be decremented at the moment, go change code if needed")
            else if(Stat.Id() = StatType.Eliminations.Id()):                     # Console Log Eliminations
                _DebugUtil.Log("UH OH, Eliminations can NOT be decremented at the moment, go change code if needed")
            else if(Stat.Id() = StatType.Score.Id()):                           # Console Log Score
                _DebugUtil.Log("Score decremented by {IntAmount}")  
            else if(Stat.Id() = StatType.PlayerLevel.Id()):                     # Console Log Error - can NOT decrement PlayerLevel
                _DebugUtil.Log("UH OH, PlayerLevel can NOT be decremented at the moment, go change code if needed")
            else if(Stat.Id() = StatType.PlayerXP.Id()):                        # Console Log Error - can NOT decrement PlayerXP
                _DebugUtil.Log("UH OH, PlayerXP can NOT be decremented at the moment, go change code if needed") 
            else if(Stat.Id() = StatType.ScoreMultiplier.Id()):                        # Console Log Error - can NOT decrement ScoreMultiplier
                _DebugUtil.Log("UH OH, ScoreMultiplier can NOT be decremented at the moment, go change code if needed") 
            else:
                _DebugUtil.Error("Invalid Stat Type")                   # Console Log Error
        else:
            _DebugUtil.Error("Player Stats Table not found")            # Console Log Error
        
    # Method to set a player's stat
    SetStat(Agent:agent, Stat:stat_type, IntAmount:int):void=
        if:
            Player := player[Agent]
            PlayerStatsTable := PlayerStatsMap[Player]
            if(Stat.Id() = StatType.Example.Id() and Player.IsActive[]):        # Set Example
                ExampleStat := PlayerStatsTable.Example
                set PlayerStatsMap[Player] = player_stats_table:
                    MakePlayerStatsTable<constructor>(PlayerStatsTable)
                    Example := IntAmount        # NOTE - Doesnt ref PlayerStatsTable.Example because we are setting a new value

            else if(Stat.Id() = StatType.ScoreMultiplier.Id() and Player.IsActive[]):   # Set ScoreMultiplier
                ScoreMultiplierStat := PlayerStatsTable.ScoreMultiplier
                set PlayerStatsMap[Player] = player_stats_table:
                    MakePlayerStatsTable<constructor>(PlayerStatsTable)
                    ScoreMultiplier := IntAmount        
                                                                                  
        then:
            if(Stat.Id() = StatType.Example.Id()):
                _DebugUtil.Log("Example set to {IntAmount}")
            else if(Stat.Id() = StatType.Money.Id()):                           # Console Log Error - can NOT set Money   
                _DebugUtil.Log("Action cannot be performed: Money cannot be set.")
            else if(Stat.Id() = StatType.Kills.Id()):                           # Console Log Error - can NOT set Kills
                _DebugUtil.Log("Action cannot be performed: Kills cannot be set.")
            else if(Stat.Id() = StatType.Eliminations.Id()):                    # Console Log Error - can NOT set Eliminations
                _DebugUtil.Log("Action cannot be performed: Eliminations cannot be set.")
            else if(Stat.Id() = StatType.Score.Id()):                           # Console Log Error - can NOT set Score
                _DebugUtil.Log("Action cannot be performed: Score cannot be set.")
            else if(Stat.Id() = StatType.PlayerLevel.Id()):                     # Console Log Error - can NOT set PlayerLevel
                _DebugUtil.Log("Action cannot be performed: PlayerLevel cannot be set.")
            else if(Stat.Id() = StatType.PlayerXP.Id()):                        # Console Log Error - can NOT set PlayerXP
                _DebugUtil.Log("Action cannot be performed: PlayerXP cannot be set.")
            else if(Stat.Id() = StatType.ScoreMultiplier.Id()):               # Console Log ScoreMultiplier
                _DebugUtil.Log("ScoreMultiplier set to {IntAmount}")
            else:
                _DebugUtil.Error("Invalid Stat Type")
        else:
            _DebugUtil.Error("Player Stats Table not found")



    # I CHANGED SCORE TO INTAMOUNT SO I COULD USE SCORE AS A PLAYER STAT


    # GPT Leaderboard ------------------------------------------------------------------------*_*_*_*_*_*_*__*____--------<< GPT

    # GetAllPlayerStats() <computes><transacts>: map<player, player_stats_table> =
    #     return PlayerStatsMap


