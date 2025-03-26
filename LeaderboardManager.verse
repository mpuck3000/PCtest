using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }

LeaderboardManager := class:

    _DebugUtil : DebugUtil = DebugUtil{}
    _PlayerService: PlayerService = PlayerService{}  # Ensure PlayerService is initialized
    _BillboardDevice: billboard_device = billboard_device{}  # Reference to the billboard device

    # # Function to update the leaderboard every 10 seconds
    # StartLeaderboardTimer(): void =
    #     loop:
    #         Sleep(10)  # Wait 10 seconds before updating
    #         UpdateLeaderboard()

    # ShowLeaderboard(): void =
    #     var PlayerStats = _PlayerService.GetAllPlayerStats()  # Retrieve all player stats from PlayerService
    #     if PlayerStats:
    #         var SortedPlayers = PlayerStats.to_array()  # Convert map to an array for sorting
    #         # Sort players by Score (Descending order)
    #         SortedPlayers.sort((a, b) => (b.value.Score ?? 0) - (a.value.Score ?? 0))

    #         # Build leaderboard text
    #         var leaderboardText = "===== Leaderboard =====\n"
    #         for (entry in SortedPlayers):
    #             var playerName = entry.key.to_string() ?? "Unknown Player"
    #             var score = entry.value.Score?.to_string() ?? "0"
    #             leaderboardText += playerName + " - Score: " + score + "\n"

    #         # Update the billboard device text
    #         _BillboardDevice.SetText(leaderboardText)
    #     else:
    #         _DebugUtil.Error("Failed to retrieve player stats")
    #         _BillboardDevice.SetText("Failed to load leaderboard")

    # # Function to update the leaderboard
    # UpdateLeaderboard(): void =
    #     ShowLeaderboard()






        




