using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }

PlayerRepository<public> := class<unique><concrete>():

    # IntializePlayer
    # SaveDataAsInt
    # GetDataAsInt

    # GameManagr uses this class to manipulate player stats
    # gets functions from PlayerService and DebugUtil --------
    _PlayerService: PlayerService = PlayerService{} # Uses PlayerSevice
    _DebugUtil : DebugUtil = DebugUtil{} # Uses DebugUtil

    InitializePlayer(Player:player):void=
        _PlayerService.InitializePlayer(Player)

    # Method to save data for a given agent
    # Agent: agent → A parameter named Agent, which is of type agent. for reference to understand this code//
    # void means no return value
    # Creates a map (key-value pairs) called StatActions
    # Maps different Stat values to StatType values.
    # The map syntax uses => to assign values.
    SaveDataAsInt(Agent: agent, Stat: stat, Manipulation: manipulationType, Amount: int): void =
        StatActions := map{
            stat.Example => StatType.Example
            stat.Money => StatType.Money
            stat.Kills => StatType.Kills
            stat.Score => StatType.Score
            stat.PlayerLevel => StatType.PlayerLevel
            stat.PlayerXP => StatType.PlayerXP
            stat.ScoreMultiplier => StatType.ScoreMultiplier
        }
    
        # This is a map - a key-value data structure that maps different manipulation types to different functions. 
        # links to PlayerService where different manipulation types are defined
        ManipulationActions := map{
            manipulationType.Increment => _PlayerService.IncrementStat,
            manipulationType.Decrement => _PlayerService.DecrementStat,
            manipulationType.Set => _PlayerService.SetStat
        }
    
        # Perform the appropriate action based on the stat and manipulation type
        if (StatKey := StatActions[Stat], ManipulationAction := ManipulationActions[Manipulation]):
            ManipulationAction(Agent, StatKey, Amount)
        else:
            _DebugUtil.Error("Manipulation Type not found: {manipulationTypeToString(Manipulation)}")

    # Method to get data for a given agent as an int
    GetDataAsInt(Agent: agent, Stat: stat)<transacts>: int =
        if (GetStats := _PlayerService.GetPlayerStats[Agent]):
            StatKey := statTypeToString(Stat)
            if (StatKey = "Example"):
                Amount := GetStats.Example
                return Amount
            else if (StatKey = "Money"):
                Amount := GetStats.Money
                return Amount
            else if (StatKey = "Kills"):
                Amount := GetStats.Kills
                return Amount
            else if (StatKey = "Score"):
                Amount := GetStats.Score
                return Amount
            else if (StatKey = "PlayerLevel"):
                Amount := GetStats.PlayerLevel
                return Amount
            else if (StatKey = "PlayerXP"):
                Amount := GetStats.PlayerXP
                return Amount
            else if (StatKey = "ScoreMultiplier"):
                Amount := GetStats.ScoreMultiplier
                return Amount
            
            else:
                return -1
        else:
            return -2

    <# above code be done using swutch case statement as well, below is the code for that>
    
    GetDataAsInt(Agent: agent, Stat: stat)<transacts>: int =
    if (GetStats := _PlayerService.GetPlayerStats[Agent]):
        StatKey := statTypeToString(Stat)
        switch (StatKey):
            case "Example":
                return GetStats.Example
            case "Money":
                return GetStats.Money
            case "Kills":
                return GetStats.Kills
            case "Score":
                return GetStats.Score
            case "PlayerLevel":
                return GetStats.PlayerLevel
            case "PlayerXP":
                return GetStats.PlayerXP
            case "ScoreMultiplier":
                return GetStats.ScoreMultiplier
            default:
                _DebugUtil.Error("Stat type not found: {StatKey}")
                return -1
    else:
        _DebugUtil.Error("Player stats not found for agent: {Agent}")
        return -2

        #>