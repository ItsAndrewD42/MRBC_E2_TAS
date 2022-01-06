-- This was used to try to find specific deck combos for the mid/late game

-- There are five "arrangements" of decks that the script considers:
-- PERFECT - Turn 2 Combination is possible; opponent has no defense cards in their top 7 cards
-- GREAT - Turn 2 Combination is possible; opponent has defense cards in their top 7 cards
-- GOOD - Turn 3 Combination is possible, but not Turn 2; opponent has no defense cards in their top 11 cards, which is typically what an opponent will go through by your Turn 3
-- OKAY - Turn 3 Combination is possible, but not Turn 2; opponent has defense cards in their top 11 cards
-- BAD - any other deck; these are not logged

-- Good, Great, and Perfect decks are logged to the console
-- Okay decks are recorded in the output file, but not logged to the console
-- In general I would use the output file to examine scenarios more closely and determine the best deck arrangement
-- for example I may have looked for a Scratch/Bolt card in the Turn 2 cards so I could finish off a stronger monster,
-- or tried to ensure that an opponent had no usable cards in their top 7 cards.

-- there are a few parameters set below - minimum number of frames to fully search, a limit of when to stop, and the save_slot
-- in general I used slot 0 as my "script slot" to reduce confusion

require 'BinDecHex'

all_cards = {"Tiger - Right Claw","Tiger - Left Claw","Tiger - Horn","Tiger - Charge","Tiger - Stab","Tiger - Ice Bomb","Tiger - Bolt","Tiger - Lightning","Tiger - Sonic Move","Tiger - Roar","Tiger - Back Roll","Tiger - Jump","Gali - Scratch","Gali - Kick","Gali - Spin Cut","Gali - Evil Dance","Gali - Holy Ray","Gali - Thunder","Gali - Flame Wall","Gali - Evil Blow","Gali - Flame","Gali - Tactics","Gali - Deflect","Gali - Lie Down","Golem - Clutch","Golem - Brow Hit","Golem - Kick","Golem - Throw Away","Golem - Chop","Golem - W. Chop","Golem - Roller","Golem - Cyclone","Golem - Quake","Golem - Recharge","Golem - Defense","Golem - Protect","Suezo - Spit","Suezo - Teleport","Suezo - Tail Slap","Suezo - Bite","Suezo - Tongue","Suezo - Kiss","Suezo - Lick","Suezo - Eye Beam","Suezo - Scouting","Suezo - Provoke","Suezo - Yodel","Suezo - Side Roll","Pixie - Scratch","Pixie - Kick","Pixie - Charge","Pixie - Thunder","Pixie - Bolt","Pixie - Shotgun","Pixie - Lightning","Pixie - Kiss","Pixie - Enchant","Pixie - Recover","Pixie - Step","Pixie - Soar","Dino - Punch","Dino - Charge","Dino - Tail Slap","Dino - Bite","Dino - Throw Away","Dino - Knee Kick","Dino - Fire Dash","Dino - Dust Kick","Dino - Flame","Dino - Leap Kick","Dino - Endure","Dino - Jump Aside","Naga - Belly Blow","Naga - Stab","Naga - Pierce","Naga - Thwack","Naga - Whirl Blow","Naga - Poison Gas","Naga - Evil Shot","Naga - Life Steal","Naga - Evil Shots","Naga - Glare","Naga - Death Trap","Naga - Counter","Hare - Head Butt","Hare - Sobat","Hare - 1-2 Punch","Hare - Super Head","Hare - Windmill","Hare - Spin Fist","Hare - Charge","Hare - Rush Punch","Hare - Gas","Hare - Computing","Hare - Loud Voice","Hare - Footwork","Mocchi - Slap","Mocchi - Roll Attack","Mocchi - Thrust","Mocchi - Head Butt","Mocchi - Press","Mocchi - 1-2 Thrust","Mocchi - Licking","Mocchi - Petal Wind","Mocchi - Motch Ray","Mocchi - Round","Mocchi - Hide","Mocchi - Roll","Any - Dodge","Any - Will Power","Any - Grit","Breeder - Help","Breeder - Mango","Breeder - Wild Rush","Breeder - Cool Judge","Breeder - Hot Battle","Breeder - Excited","Breeder - Encourage","Breeder - Nice Fight","Breeder - Confusion","Any - Critical","Breeder - Last Trump","Any - Retreat","Any - Grand End","Any - Good Luck","Breeder - Fainted","Breeder - Twinkling","Breeder - Reborn","Phoenix - Beak","Phoenix - Claw","Phoenix - Fire Beam","Phoenix - Hurricane","Phoenix - Typhoon","Phoenix - Fire River","Phoenix - Flame Beam","Phoenix - Fire Wave","Phoenix - Mys. Power","Phoenix - Hide Head","Phoenix - Insight","Phoenix - Perceive","Jell - Pierce","Jell - Stab","Jell - Whip","Jell - Fly Swatter","Jell - Fist","Jell - Cannon","Jell - Beam Gun","Jell - Jell Copter","Jell - Riddler","Jell - Copy Cat","Jell - Sponge","Jell - Slip Away","Monol - Knock","Monol - Charge","Monol - Flattening","Monol - Tentacles","Monol - Spike Bite","Monol - Sound Wave","Monol - Screech","Monol - Beam","Monol - Formation","Monol - ShockBreath","Monol - Shield","Monol - Wall","Ghost - Toy Hammer","Ghost - Uppercut","Ghost - Charge","Ghost - Combination","Ghost - Hit Card","Ghost - Energy Shot","Ghost - Surprise","Ghost - Necromancy","Ghost - Dove Bomb","Ghost - Take Over","Ghost - Ghost Rush","Ghost - In the Hat","Henger - Punch","Henger - Kick","Henger - Yoyo","Henger - Fist Missile","Henger - Laser Sword","Henger - Final Blade","Henger - Laser","Henger - BurstCannon","Henger - Transform","Henger - DodgeProgram","Henger - True Vision","Henger - Hyperspeed","Mew - Punch","Mew - Head Butt","Mew - RushingPunch","Mew - Twiddling","Mew - HundredBlows","Mew - DivingPress","Mew - Miaow","Mew - Zap","Mew - Singing Cat","Mew - Doll","Mew - TolerantCat","Mew - Scaredy Cat","Plant - Slap","Plant - Jab","Plant - Seed Gun","Plant - Root Attack","Plant - Face Drill","Plant - ToxicNectar","Plant - ToxicPollen","Plant - Life Steal","Plant - Power of Sun","Plant - Rootone","Plant - Leaf Zero","Plant - Take the Hit","Worm - Tusk Slash","Worm - Tail Lash","Worm - Bite","Worm - Pierce","Worm - Pinch Throw","Worm - RollAssault","Worm - Worm Hole","Worm - Poison Gas","Worm - Cocoon","Worm - Emerge","Worm - Shell","Worm - Sidestep","Dragon - Tail Attack","Dragon - Bite","Dragon - Combination","Dragon - Wing Cutter","Dragon - SpinningClaw","Dragon - DragonPunch","Dragon - Trample","Dragon - DragonCombo","Dragon - Fire Breath","Dragon - Throw Away","Dragon - Iron Scales","Dragon - Fly Away","Durahan - Cut-in-Two","Durahan - Flash Slash","Durahan - MillionStabs","Durahan - V Slash","Durahan - Slash Combo","Durahan - DeathBringer","Durahan - Aerial Shot","Durahan - ThunderBolt","Durahan - Meditate","Durahan - SilentStance","Durahan - Shield","Durahan - Parry","Any - Jump In","Any - Last Man","Any - P.O.","Breeder - Busy Time","Breeder - Powder","Breeder - Nuts Oil","Breeder - Pride","Breeder - Awe","Breeder - Ensnare","Breeder - Lock Tight","Breeder - Bad Weather","Breeder - Arid Land","Zilla - Scratch","Zilla - BellyAttack","Zilla - Tail Lashes","Zilla - Body Press","Zilla - RollAssault","Zilla - Sneeze","Zilla - Bubbles","Zilla - Tidal Wave","Zilla - In Your Face","Zilla - Blowhole","Zilla - Nevermind","Zilla - Bounce","Any - Blow Away","Any - Concentrate","Any - Persistence","Breeder - Support","Breeder - Complicated","Breeder - Fake Cry","Breeder - Refresh","Breeder - Pray","Breeder - Spark","Breeder - Warp","Breeder - Long Battle","Breeder - Close Up"}


function table.contains(table, element)
  for _, value in pairs(table) do
    if value == element then
      return true
    end
  end
  return false
end


save_slot = 0
limit = 1000
min = 500

rng = 1

rng = 2165888

function rand ()
  rng = ((((rng * 129749)%(2^32))*(8505))%(2^32)) + 0x3039
  -- keep only last 32 bits of rng

  -- probably should change to using the bit library from BizHawk, which should be the line below; but I don't have time to test it right now
  --return bit.band(bit.rshift(rng, 0x10), 0x7fff)

  return BinDecHex.BMAnd(BinDecHex.BShRight(BinDecHex.Dec2Hex(tostring(rng)), 0x10),"7fff");
end

-- let's first test it out by finding the decks for the next 5 frame starts?

defense_cards = {11,12,23,24,35,36,48,59,60,71,72,84,96,106,107,108,109,111,123,138,139,140,151,152,163,164,176,186,187,188,199,200,211,212,223,224,235,236,247,248,249,271,272}

player_deck_start = 0x119880 -- signed 2-byte
opponent_deck_start = 0x119ad2 -- signed 2-byte

-- load save state to seed RNG
savestate.loadslot(save_slot)

rng = mainmemory.read_u32_le( 0x083260 )
frame_counter = -1

file = io.open("MRBC_deck_optimization_dragon_" .. os.time() .. ".csv","w") -- switch to a and comment out header line for future additions
io.output(file)
io.write("type,frame_counter,p15,op7\n")

-- the dragon logic is more complex

-- I am fine with having ONE of 225, 226, or 227 in the first 5 cards.
-- And then I need to have the OTHER TWO in the next 5 cards
-- so perhaps we can look at cards 6-10 first. If they contain all three cards, we're good.
-- otherwise, if they contain 2/3 cards, we can look specifically for the third in the first five.

found_any = false
last_found = 0

for loopCounter=1, limit do
  if found_any and loopCounter > min and  (loopCounter - last_found) > 200 then
    break
  end

  found225 = 0
  found226 = 0
  found227 = 0

  frame_counter = frame_counter + 1
  -- load save state
  savestate.loadslot(save_slot)

  -- set RNG
  mainmemory.write_u32_le( 0x083260, rng)

  -- then advance frame
  emu.frameadvance();

  deckstr = ""

  op7 = ""
  p15 = ""
  play_deck = {}
  oppo_deck = {}

  for i=1, 50 do
    pcard = mainmemory.read_s16_le( player_deck_start + (i-1)*2)
    ocard = mainmemory.read_s16_le( opponent_deck_start + (i-1)*2)

    play_deck[i] = pcard
    oppo_deck[i] = ocard

    deckstr = deckstr .. pcard .. "-"

    if i < 8 then op7 = op7 .. all_cards[ocard] .. "/" end
    if i < 16 then p15 = p15 .. all_cards[pcard] .. "/" end
  end

  greatdeck = false
  gooddeck = false

  for j=6, 10 do
    if play_deck[j] == 225 then found225 = j end
    if play_deck[j] == 226 then found226 = j end
    if play_deck[j] == 227 then found227 = j end
  end

  search_target = 0

  -- had to modify the elseifs below because they would need to be cards 6-9, not 6-10,
  -- if we save one from the first hand
  if not (found225 == 0) and not (found226 == 0) and not (found227 == 0) then
    greatdeck = true
  elseif found225 > 0 and found225 < 10 and found226 > 0 and found226 < 10 then
    search_target = 227
  elseif found225 > 0 and found225 < 10 and found227 > 0 and found227 < 10 then
    search_target = 226
  elseif found226 > 0 and found226 < 10 and found227 > 0 and found227 < 10 then
    search_target = 225
  end

  if not (search_target == 0) then
    for j=1, 5 do
      if play_deck[j] == search_target then
        greatdeck = true
        break
      end
    end
  end

  if not greatdeck then
    -- look for a "good deck". a good deck has all three cards obtainable in three turns.
    turn1draw = {}
    for j=1, 5 do -- turn 1
      if play_deck[j] == 225 and not table.contains(turn1draw,225) then table.insert(turn1draw, 225) end
      if play_deck[j] == 226 and not table.contains(turn1draw,226) then table.insert(turn1draw, 226) end
      if play_deck[j] == 227 and not table.contains(turn1draw,227) then table.insert(turn1draw, 227) end
    end

    turn2draw = {}
    for j=6, 10-(table.getn(turn1draw)) do
      if play_deck[j] == 225 then
        if not (table.contains(turn1draw, 225)) and not table.contains(turn2draw,225) then
          table.insert(turn2draw, 225)
        end
      elseif play_deck[j] == 226 then
        if not (table.contains(turn1draw, 226)) and not table.contains(turn2draw,226) then
          table.insert(turn2draw, 226)
        end
      elseif play_deck[j] == 227 then
        if not (table.contains(turn1draw, 227)) and not table.contains(turn2draw,227) then
          table.insert(turn2draw, 227)
        end
      end
    end

    turn3draw = {}
    for j=(11-table.getn(turn1draw)), (15-table.getn(turn1draw)-table.getn(turn2draw)) do
      if play_deck[j] == 225 then
        if not (table.contains(turn1draw, 225)) and not (table.contains(turn2draw, 225)) and not table.contains(turn3draw,225) then
          table.insert(turn3draw, 225)
        end
      elseif play_deck[j] == 226 then
        if not (table.contains(turn1draw, 226)) and not (table.contains(turn2draw, 226)) and not table.contains(turn3draw,226) then
          table.insert(turn3draw, 226)
        end
      elseif play_deck[j] == 227 then
        if not (table.contains(turn1draw, 227)) and not (table.contains(turn2draw, 227)) and not table.contains(turn3draw,227) then
          table.insert(turn3draw, 227)
        end
      end
    end

    gooddeck = ((table.getn(turn1draw) + table.getn(turn2draw) + table.getn(turn3draw)) == 3)
  end

  if greatdeck then
    -- check first 7 opponent cards for defense cards
    perfectdeck = true
    for k=1, 7 do
      if table.contains(defense_cards, oppo_deck[k]) then
        perfectdeck = false
        break
      end
    end
    if perfectdeck then
      io.write("perfect,")
      console.write("!!PERFECT!! ")
      found_any = true
      last_found = loopCounter
    else
      io.write("great,")
      console.write("!GREAT! ")
    end
    io.write(frame_counter .. "," .. p15 .. "," .. op7 .. "\n")

    console.writeline("deck found @ fc=" .. frame_counter)
  elseif gooddeck then
    actuallygood = true
    for k=1, 11 do
      if table.contains(defense_cards, oppo_deck[k]) then
        actuallygood = false
        break
      end
    end
    if actuallygood then
      io.write("good," .. frame_counter .. "," .. p15 .. "," .. op7 .. "\n")
      console.writeline("good deck found @ fc=" .. frame_counter)
    else
      io.write("okay," .. frame_counter .. "," .. p15 .. "," .. op7 .. "\n")
    end
  end

  -- advance RNG twice, to simulate a frame moving forward
  rand()
  rand()
end

io.flush()
io.close()
