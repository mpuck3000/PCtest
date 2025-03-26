using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }
#Add in Spatial Math, as will need to use ApplyYaw() that modifies the rotation around the Z axis.
using { /UnrealEngine.com/Temporary/SpatialMath}

#Tutorial https://romeroblueprints.blogspot.com/2023/08/uefn-verse-programming-props-rotator.html#:~:text=The%20RotateProp%20function%20gets%20the,degrees%20around%20the%20Z%20axis.

props_rotator := class(creative_device):

    #The TimeRot180 constant stores the time in seconds it takes a Prop to turn around (180 degrees).
    @editable TimeRot180 : float = 2.0

    # Function named RotateProp that recieves a creative_prop as a parameter and will keep this Prop rotating.
    # This function needs to be asynchronous, so we'll use the suspends specifier.


    # This may not work due to tags being old, or this guy isnt using tags
    @editable
    PropsToRotate : []creative_prop = array{}

    OnBegin<override>()<suspends>:void=
        
        Sleep(3.0)

        # for loop, loops through the editable PropsToRotate array and applies the spawn RotateProp function to each asset
        for (PropInstance : PropsToRotate):
            spawn{ RotateProp(PropInstance) }


    RotateProp(Prop : creative_prop)<suspends>:void=

        loop:
            #The RotateProp function gets the transform structure of the Prop to get access to the Prop's current location and rotation. 
            PropTransform := Prop.GetTransform()
            PropLocation  := PropTransform.Translation
            PropRotation  := PropTransform.Rotation

            # The ApplyYaw function is used to create a new rotation that modifies the current Prop rotation by 180 degrees around the Z axis.
            NewRotation := PropRotation.ApplyYaw(180.0)

            # Use the MoveTo function of the creative_prop class so that the Prop changes its rotation over the time that is stored in the TimeRot180 constant.
            Prop.MoveTo(PropLocation, NewRotation, TimeRot180)
            # When the Prop completes the rotation, the loop expression will execute the block of code again causing the Prop to continuously rotate.

    # How do I add to array







        
        
        
            