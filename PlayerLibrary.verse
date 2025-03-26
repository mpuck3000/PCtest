using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/UI }

# An enum is a special data type used to define a set of named constant values. Enums help make code more readable and maintainable by using descriptive names instead of raw numbers or strings.


# Define a weak map to store player stats, mapping a player to their stats table
var PlayerStatsMap:weak_map(player, player_stats_table) = map{}

# Define an enum for different player stats. these are inside the stat object
# This is called an 'enumeration definition' in Verse.
stat := enum: # stat is an enumerator.
    Example
    Money
    Kills
    Score
    PlayerLevel
    PlayerXP
    ScoreMultiplier

# Define an enum for different manipulation types
manipulationType := enum:
    Increment
    Decrement
    Set

# Function to convert a stat enum to a string representation
statTypeToString(Stat: stat)<computes>:string=
    case(Stat):
        stat.Example => "Example"
        stat.Money => "Money"
        stat.Kills => "Kills"
        stat.Score => "Score"
        stat.PlayerLevel => "PlayerLevel"
        stat.PlayerXP => "PlayerXP"
        stat.ScoreMultiplier => "ScoreMultiplier"
        
# Function to convert a manipulation type enum to a string representation
manipulationTypeToString(Stat: manipulationType)<computes>:string=
    case(Stat):
        manipulationType.Increment => "Increment"
        manipulationType.Decrement => "Decrement"
        manipulationType.Set => "Set"