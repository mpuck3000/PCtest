
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

GameManager := class(creative_device):
    

    _PlayerRepository : PlayerRepository = PlayerRepository{} # linked to PlayerRepository
    _DebugUtil : DebugUtil = DebugUtil{}
    _leaderboard : LeaderboardManager = LeaderboardManager{}

    # Editable properties for manipulating stats
    @editable IncrementMoneyStatButton : button_device = button_device{}
    @editable DecrementStatButton : button_device = button_device{}
    @editable SetStatButton : button_device = button_device{}
    @editable ShowStatsButton : button_device = button_device{}
    @editable CreatureKillFiendLvl1 : creature_manager_device = creature_manager_device{}
    @editable Leaderboard :billboard_device = billboard_device{}

    OnBegin<override>()<suspends>:void=
        _DebugUtil.Log("@PowerPuck3000_FN_Debug")
        # Get all players and intialise them
        AllPlayers:[]player = GetPlayspace().GetPlayers()
        for(Player:AllPlayers):
            _PlayerRepository.InitializePlayer(Player)

        # Do I need code to run on player Spawning using player Spawners
        # Also what about Players who spawn mid game, do they get initialised or added to leaderboard.

        # Button and other events subscribe, switch these out later.
        IncrementMoneyStatButton.InteractedWithEvent.Subscribe(IncrementMoneyStat)
        DecrementStatButton.InteractedWithEvent.Subscribe(DecrementStat)
        SetStatButton.InteractedWithEvent.Subscribe(SetStat)
        ShowStatsButton.InteractedWithEvent.Subscribe(ShowStats)
        CreatureKillFiendLvl1.MatchingCreatureTypeEliminatedEvent.Subscribe(IncrementScoreStatFiendLvl1) 
        # CreatureKillFiendLvl2.MatchingCreatureTypeEliminatedEvent.Subscribe(IncrementScoreStatFiendLvl2)
        # CreatureKillFiendLvl3.MatchingCreatureTypeEliminatedEvent.Subscribe(IncrementScoreStatFiendLvl3)
    
        # functions to manipulate stats, triggered by subscribed events
    IncrementMoneyStat(Agent:agent):void=
        _PlayerRepository.SaveDataAsInt(Agent, stat.Money, manipulationType.Increment, 10)

    DecrementStat(Agent:agent):void=
        _PlayerRepository.SaveDataAsInt(Agent, stat.Money, manipulationType.Decrement, 5)

    SetStat(Agent:agent):void=
        _PlayerRepository.SaveDataAsInt(Agent, stat.Money, manipulationType.Set, 934)

    # Score related Functions
    IncrementScoreStatFiendLvl1(Agent:agent):void=
        _PlayerRepository.SaveDataAsInt(Agent, stat.Score, manipulationType.Increment, 1)
        _PlayerRepository.SaveDataAsInt(Agent, stat.Kills, manipulationType.Increment, 1)

    IncrementScoreStatFiendLvl2(Agent:agent):void=
        _PlayerRepository.SaveDataAsInt(Agent, stat.Score, manipulationType.Increment, 2)
        _PlayerRepository.SaveDataAsInt(Agent, stat.Kills, manipulationType.Increment, 1)

    IncrementScoreStatFiendLvl3(Agent:agent):void=
        _PlayerRepository.SaveDataAsInt(Agent, stat.Score, manipulationType.Increment, 3)
        _PlayerRepository.SaveDataAsInt(Agent, stat.Kills, manipulationType.Increment, 1)


    ShowStats(Agent:agent):void=
        # _PlayerRepository.GetDataAsInt(Agent, stat.Money) --- use this to show stat to player via billboard, UI or something - figure this out <-----------
        # This code only gets int values
        # rough example of using this would be updating billboard leaderboard every second to show all players scores, in order.
        _DebugUtil.Log("Money: {_PlayerRepository.GetDataAsInt(Agent, stat.Money)}") # Console logs to debugUtil
        _DebugUtil.Log("Score: {_PlayerRepository.GetDataAsInt(Agent, stat.Score)}")
        _DebugUtil.Log("kills: {_PlayerRepository.GetDataAsInt(Agent, stat.Kills)}")







    # GPT Add Leaderboard -----------------------------------------------------------

    #Function to call ShowLeaderboard from LeaderboardManager
    # ShowLeaderboard(): void =
    #     _LeaderboardManager.ShowLeaderboard()




