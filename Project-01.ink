/*
    Project 01
    
    Requirements (for 15 base points)
    - Create an interactive fiction story with at least 8 knots 
    - Create at least one major choice that the player can make
    - Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] Include more than eight passages
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!

*/
VAR money = 100
VAR tickets_for_ride = 0
VAR time = -1 
VAR ticket_to_enter = 0
VAR keychain = 0
VAR mug = 0
VAR magnet = 0



Happy Amusement Park
+[Enter Story?] -> beginning
+[Don't Enter Story?] 

== beginning ==
You've arrived at an amusement. You look up and see various rollercoasters filling your vision. Back in front of you is the ticket booth.
+ [Go to Ticket Booth] -> ticket_booth

== ticket_booth ==
Receptionist: Hi welcome to Happy Amusement park where you can play to your hearts content. Here at the Ticket booth you can buy your entry ticket and your tickets for rides.

+ {not entry_ticket_bought}[Buy Entry Ticket] -> entry_ticket
+ [Buy Ride Tickets] -> ride_tickets
+ {ticket_to_enter == 1} [Enter Amusement Park] -> amusement_park

== entry_ticket ==
An entry ticket is $25.

+ [Buy] -> entry_ticket_bought
+ [Leave] -> leave

== entry_ticket_bought ==
~ ticket_to_enter = ticket_to_enter +1
~ money = money -25
You've sucessfully bought an entry ticket.

+ [Buy tickets for rides.] -> ride_tickets

== ride_tickets ==
The amusement park has a total of 11 attractions. The amusement park closes at 8PM. It is now 11AM. 
Each ticket is $5
How many tickets would you like to buy?

+ {money > 5} [1] -> buy1
+ {money > 5} [5] -> buy5

== buy1 ==
~ tickets_for_ride = tickets_for_ride +1
~ money = money -5
You've bought 1 Ticket

+ [Buy more] -> ticket_booth
+ [No more] -> ticket_booth

== buy5 ==
~ tickets_for_ride = tickets_for_ride +5
~ money = money -25
You've bought 5 Tickets

+ [Buy more] -> ticket_booth
+ [No more] -> ticket_booth

== amusement_park ==
There is a map to your left

+ [Take Map] -> map

== map ==
From the map you can see all of the 11 attractions. Starting from your most left there is a Carasoul, Roller Coaster, Bumper Cars, Death Drop, Haunted House, Dark Ride, Ferris Wheel, Tilt a Whirl, The Scrambler, Log Ride, Water Slide, and a souvenir shop to the right of you.

It is {advance_time() }.
You have {tickets_for_ride} tickets.

{time < 8: Where would you like to go?}
{time == 8: PSA: It is now 8PM and the Amusement Park is closing. Please leave the park. Thank you!}

+ {time < 8} {tickets_for_ride > 0} [Carasoul] -> carasoul
+ {time < 8} {tickets_for_ride > 0} [Roller Coaster] -> roller_coaster
+ {time < 8} {tickets_for_ride > 0} [Bumper Cars] -> bumper_cars
+ {time < 8} {tickets_for_ride > 0} [Death Drop] -> death_drop
+ {time < 8} {tickets_for_ride > 0} [Haunted House] -> haunted_house
+ {time < 8} {tickets_for_ride > 0} [Dark Ride] -> dark_ride
+ {time < 8} {tickets_for_ride > 0} [Ferris Wheel] -> ferris_wheel
+ {time < 8} {tickets_for_ride > 0} [Tilt a Whirl] -> tilt_a_whirl
+ {time < 8} {tickets_for_ride > 0} [The Scrambler] -> scrambler
+ {time < 8} {tickets_for_ride > 0} [Log Ride] -> log_ride
+ {time < 8} {tickets_for_ride > 0} [Souvenir Shop] -> souvenir_shop
+ {time == 8} [Leave Park] -> leave_park
+ {tickets_for_ride == 0} [Buy more tickets?] -> ticket_booth

== carasoul ==
~ tickets_for_ride = tickets_for_ride -1
You give the ticketer a ticket and get in line.
Some time passes and it is now your turn.

+ [Get on] -> play_carasoul

== play_carasoul ==
You pick the a horse with huge eyelashes to get onto. After going for 4-5 rounds you decide to get off and go to your next destination.

+ [Next Attraction] -> map

== roller_coaster ==
~ tickets_for_ride = tickets_for_ride -1
You give the ticketer a ticket and get in line.
Some time passes and it is now your turn.

+ [Get on] -> play_rollercoaster
== play_rollercoaster ==
You take the seatbelt from your bottom right and connect it to your bottom left. After making sure your seatbelt is on tight, you grab the bar above your head and also pull it down to secure yourself.

The operator does rounds to make sure all safety equipments are working properly.
After making sure nothing is wrong the operator goes into the room and starts the roller coaster.

The coaster goes woosh and shoots off like a bullet into the horizon. It does several loops, then drops from the top. You hear people screaming from all sides of you. Finally after doing the last loop, the coaster reaches the end. 
You get off from the ride and exit.

+ [Next Attraction] -> map

== bumper_cars ==
~ tickets_for_ride = tickets_for_ride -1
You give the ticketer a ticket and get in line.
Some time passes and it is now your turn.

+ [Get on] -> play_bumper
== play_bumper ==
You choose a red bumper car to get into. After everyone else has chosen and got onto their cars, the operator flips a switch and the music starts play.

You see a father and daughter in one car, and you decide to go bump them. The father glares at you like you're ruining their fun, so you decide to find other targets to play with.

After some time the music ends, and the operator guides everyone to the exit.

+ [Next Attraction] -> map

== death_drop ==
~ tickets_for_ride = tickets_for_ride -1
You give the ticketer a ticket and get in line.
Some time passes and it is now your turn.

+ [Get on] -> play_drop
== play_drop ==
You get onto the seat with the other players. The operator comes buy to secure all the security seatbelt.

Operator: Make sure you don't bite your tongue when the ride drops down.

The operator reminds you of some safety tips then starts the machine.

The ride slowly moves upwards to the point where you can see the entire park. The ride stays up their for a little while, suddenly out of no where the ride drops. 

The person to your right started crying and calling out for mommy. While the person to your left looks like nothing affected him.
After several more rounds of going up and down, the ride finally ends and you exit this attraction.

+ [Next Attraction] -> map

== haunted_house ==
~ tickets_for_ride = tickets_for_ride -1
You give the ticketer a ticket and get in line.
Some time passes and it is now your turn.

+ [Go in] -> play_haunted
== play_haunted
Before you stands a door painted in black. When you were in line, you heard other people screaming.
You take a deep breath and open the door.

It's almost completely pitch black, but you're still able to navigate due to the  atmospheric lighting.

You pass through a bedroom, where the npc was hiding under the bed. It did grab your leg but you expected it.

Next you enter a red room filled with all types of dolls, pretty ones and broken ones. One of them moves which startles you in turn. You quickly walk out of this room and enter the next one.

It's unfortunatly a bathroom room, you already expect something to pop out of the mirror, so this one didn't scare you.

Finally you enter a tunnel, it's completely pitch black this time, but there's still the wall in which you can lean onto as you walk.

But from behind you, you hear something. You turn to look and see a monster that's being flashed with red light. You can see some of the slime and slick covering this NPC's body as it crawls towards you. As you register the fact that the NPC was coming towards you, you speed up. 

As you continued down the tunnel you can see the shape of the door at the end.

With a boost you finally exit the Haunted House.

+ [Next Attraction] -> map

== dark_ride ==
~ tickets_for_ride = tickets_for_ride -1
You give the ticketer a ticket and get in line.
Some time passes and it is now your turn.

+ [Get on] -> play_ride
== play_ride ==
You get onto the ride, and put on your seatbelt. The operator starts the ride.

You go through a story about Little Red Riding Hood, and you find it interesting about how the characters move, and the art involved.

You get off the ride impressed with the almost perfect recreation of the fairytale.

+ [Next Attraction] -> map

== ferris_wheel ==
~ tickets_for_ride = tickets_for_ride -1
You give the ticketer a ticket and get in line.
Some time passes and it is now your turn.

+ [Get on] -> play_ferris
== play_ferris ==
You get onto one of the carriages on the Ferris Wheel. You see other people enter carriages below you as you slowly ascend upwards.

When the carriage you're in reaches the very top, you decide to take a selfie with the entire amusement park behind you. 

After you're done taking the selfie, you admire the view as you slowly descend.

When you reach the bottom, the operator opens the door for you, and you step put and exit the attraction.

+ [Next Attraction] -> map

== tilt_a_whirl ==
~ tickets_for_ride = tickets_for_ride -1
You give the ticketer a ticket and get in line.
Some time passes and it is now your turn.

+ [Get on] -> play_tilt
== play_tilt ==
You get onto the device, and sit down. The safety bar descends and secures you to the seat. After everyone is settled, the ride starts.

The ride you're in tilts and whirls around several time, but from the corner of your vision, you see other people spinning even faster.

After the ride ends you exit the attraction.

+ [Next Attraction] -> map

== scrambler ==
~ tickets_for_ride = tickets_for_ride -1
You give the ticketer a ticket and get in line.
Some time passes and it is now your turn.

+ [Get on] -> play_scrambler
== play_scrambler
You get onto one of the seats available. There is a stranger next to you but neither of you talks so it's a bit awkward. But no worries, because the attraction Operator starts the ride soon after. 

In just a short amount of time, you've been tossed around and crashed into the side of your seat as the attraction spins.

After getting off, you apologize to the stranger next to you and leave the attraction.

+ [Next Attraction] -> map

== log_ride ==
~ tickets_for_ride = tickets_for_ride -1
You give the ticketer a ticket and get in line.
Some time passes and it is now your turn.

+ [Get on] -> play_log
== play_log ==
You get onto the log with several other people, because you can't get on alone. After everyone is in, the Operator walks around and gives everyone a waterproof jacket, including you. After everyone on your log wears the jacket, your log slowly moves forward.

Further into the ride you enjoy the slow pace, but still remember that there's still a big drop near the end.

Reaching towards the end you see the drop downwards infront of you. Preparing youself, you and others hold on tightly for dear life as the log goes down the almost 90% angled slope.

After finishing that drop, your log comes to a slow stop and everyone gets off.

You noticed that your socks are wet while you exit, which annoys you.

+ [Next Attraction] -> map

== souvenir_shop ==
You enter the souvenir shop. You see some keychains, mugs, and magnets.

Would you like to buy any?
You have ${money}.
You have {keychain}keychains, {mug}mugs, and {magnet}magnets.

{money < 10: You do not have enought money to buy any souvenirs.|}

+ [Leave shop] -> map
+ {money > 15}[Buy Keychain] -> buy_keychain
+ {money > 20}[Buy Mug] -> buy_mug
+ {money > 10}[Buy Magnet] -> buy_magnet

== buy_keychain ==
~ money = money -15
+ [Bought] ->souvenir_shop
== buy_mug ==
~ money = money -20
+ [Bought] -> souvenir_shop
== buy_magnet ==
~ money = money -10
+ [Bought] -> souvenir_shop

== leave ==
You think the ticket is too expensive so you leave.
-> END

== leave_park ==
It's now 8PM, and you leave the park. You decide to come back the next day if it's open.
-> END
== function advance_time ==

    ~ time = time + 1
    
    {
        - time > 8:
            ~ time = 0
    }    
    
    {    
        - time == 0:
            ~ return "12PM"
        
        - time == 1:
            ~ return "1PM"
        
        - time == 2:
            ~ return "2PM"
        
        - time == 3:
            ~ return "3PM"
        
        - time == 4:
            ~ return "4PM"
        
        - time == 5:
            ~ return "5PM"
     
        - time == 6:
            ~ return "6PM"
        
        - time == 7:
            ~ return "7PM"
            
        - time == 8:
            ~ return "8PM"
    
    }
    
    
        
    ~ return time
    












