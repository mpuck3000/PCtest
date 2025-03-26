using { /Fortnite.com/Devices }
using { /Verse.org/Random }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/SpatialMath }
using { /Verse.org/Simulation/Tags }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level

rotate_on := class(tag) {}

light_tag2 := class(tag) {}

WeaponSpawnFunctions := class(creative_device):

    #Editables
    # @editable Barrier1:barrier_device = barrier_device{}
    # @editable Timer: timer_device = timer_device{}

    # sets of four items for each weapon platform
    @editable Weapon1_1: item_placer_device = item_placer_device{}
    @editable Weapon1_2: item_placer_device = item_placer_device{}
    @editable Weapon1_3: item_placer_device = item_placer_device{}
    @editable Weapon1_4: item_placer_device = item_placer_device{}

    @editable Weapon3: item_spawner_device = item_spawner_device{}


    OnBegin<override>()<suspends>:void=
        
        #Tags Light - turns lights off after 5 seconds from game starting
        TagGenerator := FindCreativeObjectsWithTag(light_tag{})

        Sleep(5.0)

        for(Element:TagGenerator, LightDevice:=customizable_light_device[Element]):
            LightDevice.TurnOff()


        #Tags RotateObj - turns rotateOn Tags on after 1 second from game starting
        RotatingObjects := FindCreativeObjectsWithTag(rotate_on{})

        Sleep(1.0)

            for (Obj : RotatingObjects):
                if (Prop := creative_prop[Obj]):
                    spawn:
                        SmoothRotateProp(Prop)




        # Timer.SuccessEvent.Subscribe(DropBarrier)
        # RandomWeaponLocations()
        # spawn:
        #     SmoothRotateProp(RotateGun1)

    # RotateProp(Prop : creative_prop)<suspends> : void=
    #     Speed:= 0.10

    #     loop:
    #         Transform := Prop.GetTransform()
    #         Position := Transform.Translation
    #         Rotation := Transform.Rotation
    #         var NewRotation : rotation = Rotation.ApplyYaw(Speed)
    #         if (Prop.TeleportTo[Position, NewRotation]) { }
    #         Sleep(0.01)
            
    #         # Prop.TeleportTo[Position:vector3, Rotation:rotation]





                                    #Make code to teleport prop to postion <----------------------
    # TeleportProp1(Prop : creative_prop)<suspends> : void =

    #     loop:
    #         Transform := Prop.GetTransform()
    #         Position := Transform.Translation
    #         Rotation := Transform.Rotation
    #         var NewPosition : position = Position.ApplyYaw(Speed)
    #         if (Prop.TeleportTo[NewPosition, NewRotation]) { }
    #         Sleep(0.01)

    SmoothRotateProp<private>(Prop : creative_prop)<suspends> : void=
        Transform := Prop.GetTransform()
        Position := Transform.Translation
        Rotation := Transform.Rotation
        NewRotation := Rotation.ApplyYaw(180.0)
        MoveResult := Prop.MoveTo(Position, NewRotation, 2.0)
        #it suspends for 3
        if (MoveResult = move_to_result.DestinationReached): # listens Move function for Move to result and only repeats when reached
            SmoothRotateProp(Prop)

        

    # DropBarrier(Player:?agent):void=
    #     Barrier1.Disable()

    # RandomWeaponLocations()<suspends>:void=
    #     var RandomGun:int = GetRandomInt(1,4)
    #     case (RandomGun):
    #         1 => 
    #             Weapon1_1.Enable
    #             Weapon1_2.Disable
    #             Weapon1_3.Disable
    #             Weapon1_4.Disable
    #             Print("weapon at 1")
    #         2 => 
    #             Weapon1_2.Enable
    #             Weapon1_3.Disable
    #             Weapon1_4.Disable
    #             Weapon1_1.Disable
    #             Print("weapon at 1")
    #         3 => 
    #             Weapon1_3.Enable
    #             Weapon1_4.Disable
    #             Weapon1_1.Disable
    #             Weapon1_2.Disable
    #             Print("weapon at 3")
    #         4 =>
    #             Weapon1_4.Enable
    #             Weapon1_1.Disable
    #             Weapon1_2.Disable
    #             Weapon1_3.Disable
    #             Print("weapon at 4")
    #         _ => 


        # Foo(x : int) : int =
        #     case (x):
        #         100 => return 200
        #         _ => return 100
