
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
# first addf the library for tages
using { /Verse.org/Simulation/Tags }
using { /UnrealEngine.com/Temporary/Diagnostics }

#old tag way is depricated, this is the new way
#Tutorial https://dev.epicgames.com/community/learning/tutorials/oL9G/fortnite-find-creative-objects-with-tag-in-verse-code-now-returns-a-generator

light_tag := class(tag){}


Tagger := class(creative_device):

    OnBegin<override>()<suspends>:void=

        TagGenerator:=FindCreativeObjectsWithTag(light_tag{})

        Sleep(5.0) #This sleep is for testing purposes

        # its failable so needs to be in a for loop
        for(Element:TagGenerator, LightDevice:=customizable_light_device[Element]):
            LightDevice.TurnOff()

            # add VerseTagMarkup to assets that need tag
            # then edit to add light_tag