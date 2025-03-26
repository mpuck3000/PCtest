# Define an abstract class for stat types
stat_type := class<computes><abstract>:
    Id() <transacts>:int

# Define a module to hold the specific stat types
StatType := module:

    example_stat<public> := class<computes>(stat_type):
        Id<override>()<transacts>:int = 1                       # this takes Id of type int from the stat_type abstarct class and then <overide> it with 1 --- 1 is its int value fro reference
    money_stat<public> := class<computes>(stat_type):
        Id<override>()<transacts>:int = 2
    kills_stat<public> := class<computes>(stat_type):
        Id<override>()<transacts>:int = 3
    eliminations_stat<public> := class<computes>(stat_type):
        Id<override>()<transacts>:int = 4
    score_stat<public> := class<computes>(stat_type):          # ADDED SCORE HERE - Noticing this is different from tutorial, maybe he updated later
        Id<override>()<transacts>:int = 5
    playerlevel_stat<public> := class<computes>(stat_type):    # ADDED playerlevel HERE 
        Id<override>()<transacts>:int = 6
    playerxp_stat<public> := class<computes>(stat_type):       # ADDED playerxp HERE
        Id<override>()<transacts>:int = 7
    ScoreMultiplier_stat<public> := class<computes>(stat_type):          # ADDED SCORE MULTIPLIER HERE
        Id<override>()<transacts>:int = 8

    Example<public>:example_stat = example_stat{} #
    Money<public>:money_stat = money_stat{}
    Kills<public>:kills_stat = kills_stat{}
    Eliminations<public>:eliminations_stat = eliminations_stat{}
    Score<public>:score_stat = score_stat{}                     # ADDED SCORE HERE
    PlayerLevel<public>:playerlevel_stat = playerlevel_stat{}   # ADDED LEVEL HERE
    PlayerXP<public>:playerxp_stat = playerxp_stat{}            # ADDED XP HERE
    ScoreMultiplier<public>:ScoreMultiplier_stat = ScoreMultiplier_stat{}           # ADDED SCORE MULTIPLIER HERE
    