-- prints out a snapshot of the current deck for you and the opponent, as well as the opponent's hand
-- incredibly useful!

all_cards = {"Tiger - Right Claw","Tiger - Left Claw","Tiger - Horn","Tiger - Charge","Tiger - Stab","Tiger - Ice Bomb","Tiger - Bolt","Tiger - Lightning","Tiger - Sonic Move","Tiger - Roar","Tiger - Back Roll","Tiger - Jump","Gali - Scratch","Gali - Kick","Gali - Spin Cut","Gali - Evil Dance","Gali - Holy Ray","Gali - Thunder","Gali - Flame Wall","Gali - Evil Blow","Gali - Flame","Gali - Tactics","Gali - Deflect","Gali - Lie Down","Golem - Clutch","Golem - Brow Hit","Golem - Kick","Golem - Throw Away","Golem - Chop","Golem - W. Chop","Golem - Roller","Golem - Cyclone","Golem - Quake","Golem - Recharge","Golem - Defense","Golem - Protect","Suezo - Spit","Suezo - Teleport","Suezo - Tail Slap","Suezo - Bite","Suezo - Tongue","Suezo - Kiss","Suezo - Lick","Suezo - Eye Beam","Suezo - Scouting","Suezo - Provoke","Suezo - Yodel","Suezo - Side Roll","Pixie - Scratch","Pixie - Kick","Pixie - Charge","Pixie - Thunder","Pixie - Bolt","Pixie - Shotgun","Pixie - Lightning","Pixie - Kiss","Pixie - Enchant","Pixie - Recover","Pixie - Step","Pixie - Soar","Dino - Punch","Dino - Charge","Dino - Tail Slap","Dino - Bite","Dino - Throw Away","Dino - Knee Kick","Dino - Fire Dash","Dino - Dust Kick","Dino - Flame","Dino - Leap Kick","Dino - Endure","Dino - Jump Aside","Naga - Belly Blow","Naga - Stab","Naga - Pierce","Naga - Thwack","Naga - Whirl Blow","Naga - Poison Gas","Naga - Evil Shot","Naga - Life Steal","Naga - Evil Shots","Naga - Glare","Naga - Death Trap","Naga - Counter","Hare - Head Butt","Hare - Sobat","Hare - 1-2 Punch","Hare - Super Head","Hare - Windmill","Hare - Spin Fist","Hare - Charge","Hare - Rush Punch","Hare - Gas","Hare - Computing","Hare - Loud Voice","Hare - Footwork","Mocchi - Slap","Mocchi - Roll Attack","Mocchi - Thrust","Mocchi - Head Butt","Mocchi - Press","Mocchi - 1-2 Thrust","Mocchi - Licking","Mocchi - Petal Wind","Mocchi - Motch Ray","Mocchi - Round","Mocchi - Hide","Mocchi - Roll","Any - Dodge","Any - Will Power","Any - Grit","Breeder - Help","Breeder - Mango","Breeder - Wild Rush","Breeder - Cool Judge","Breeder - Hot Battle","Breeder - Excited","Breeder - Encourage","Breeder - Nice Fight","Breeder - Confusion","Any - Critical","Breeder - Last Trump","Any - Retreat","Any - Grand End","Any - Good Luck","Breeder - Fainted","Breeder - Twinkling","Breeder - Reborn","Phoenix - Beak","Phoenix - Claw","Phoenix - Fire Beam","Phoenix - Hurricane","Phoenix - Typhoon","Phoenix - Fire River","Phoenix - Flame Beam","Phoenix - Fire Wave","Phoenix - Mys. Power","Phoenix - Hide Head","Phoenix - Insight","Phoenix - Perceive","Jell - Pierce","Jell - Stab","Jell - Whip","Jell - Fly Swatter","Jell - Fist","Jell - Cannon","Jell - Beam Gun","Jell - Jell Copter","Jell - Riddler","Jell - Copy Cat","Jell - Sponge","Jell - Slip Away","Monol - Knock","Monol - Charge","Monol - Flattening","Monol - Tentacles","Monol - Spike Bite","Monol - Sound Wave","Monol - Screech","Monol - Beam","Monol - Formation","Monol - ShockBreath","Monol - Shield","Monol - Wall","Ghost - Toy Hammer","Ghost - Uppercut","Ghost - Charge","Ghost - Combination","Ghost - Hit Card","Ghost - Energy Shot","Ghost - Surprise","Ghost - Necromancy","Ghost - Dove Bomb","Ghost - Take Over","Ghost - Ghost Rush","Ghost - In the Hat","Henger - Punch","Henger - Kick","Henger - Yoyo","Henger - Fist Missile","Henger - Laser Sword","Henger - Final Blade","Henger - Laser","Henger - BurstCannon","Henger - Transform","Henger - DodgeProgram","Henger - True Vision","Henger - Hyperspeed","Mew - Punch","Mew - Head Butt","Mew - RushingPunch","Mew - Twiddling","Mew - HundredBlows","Mew - DivingPress","Mew - Miaow","Mew - Zap","Mew - Singing Cat","Mew - Doll","Mew - TolerantCat","Mew - Scaredy Cat","Plant - Slap","Plant - Jab","Plant - Seed Gun","Plant - Root Attack","Plant - Face Drill","Plant - ToxicNectar","Plant - ToxicPollen","Plant - Life Steal","Plant - Power of Sun","Plant - Rootone","Plant - Leaf Zero","Plant - Take the Hit","Worm - Tusk Slash","Worm - Tail Lash","Worm - Bite","Worm - Pierce","Worm - Pinch Throw","Worm - RollAssault","Worm - Worm Hole","Worm - Poison Gas","Worm - Cocoon","Worm - Emerge","Worm - Shell","Worm - Sidestep","Dragon - Tail Attack","Dragon - Bite","Dragon - Combination","Dragon - Wing Cutter","Dragon - SpinningClaw","Dragon - DragonPunch","Dragon - Trample","Dragon - DragonCombo","Dragon - Fire Breath","Dragon - Throw Away","Dragon - Iron Scales","Dragon - Fly Away","Durahan - Cut-in-Two","Durahan - Flash Slash","Durahan - MillionStabs","Durahan - V Slash","Durahan - Slash Combo","Durahan - DeathBringer","Durahan - Aerial Shot","Durahan - ThunderBolt","Durahan - Meditate","Durahan - SilentStance","Durahan - Shield","Durahan - Parry","Any - Jump In","Any - Last Man","Any - P.O.","Breeder - Busy Time","Breeder - Powder","Breeder - Nuts Oil","Breeder - Pride","Breeder - Awe","Breeder - Ensnare","Breeder - Lock Tight","Breeder - Bad Weather","Breeder - Arid Land","Zilla - Scratch","Zilla - BellyAttack","Zilla - Tail Lashes","Zilla - Body Press","Zilla - RollAssault","Zilla - Sneeze","Zilla - Bubbles","Zilla - Tidal Wave","Zilla - In Your Face","Zilla - Blowhole","Zilla - Nevermind","Zilla - Bounce","Any - Blow Away","Any - Concentrate","Any - Persistence","Breeder - Support","Breeder - Complicated","Breeder - Fake Cry","Breeder - Refresh","Breeder - Pray","Breeder - Spark","Breeder - Warp","Breeder - Long Battle","Breeder - Close Up"}

all_cards[-1] = "NIL"
player_deck_start = 0x119880 -- signed 2-byte
opponent_deck_start = 0x119ad2 -- signed 2-byte
opponent_hand_start = 0x119c08 -- signed 2 byte

file = io.open("MRBC_deck_readout_"..os.time()..".txt","w") -- switch to a and comment out header line for future additions
io.output(file)


play_deck_readable = {}
oppo_deck_readable = {}
for i=1, 50 do
  pcard = mainmemory.read_s16_le( player_deck_start + (i-1)*2)
  ocard = mainmemory.read_s16_le( opponent_deck_start + (i-1)*2)

  play_deck_readable[i] = all_cards[pcard] .. " (" .. pcard .. ")"
  oppo_deck_readable[i] = all_cards[ocard] .. " (" .. ocard .. ")"
end

--io.write("Person,Slot,Card\n")
io.write("Player                                      Opponent\n")
io.write("-----------------------------------------   -----------------------------------------\n")

pstr = "                                            "
for k=1, 5 do
  hand_card = mainmemory.read_s16_le( opponent_hand_start + (k-1)*2)
  if hand_card == -1 then break end
  io.write(pstr .. "Hand " .. k .. " - " .. all_cards[hand_card] .. "\n")
end
io.write("\n")

for j=1, 50 do
  -- pad strings out for player to 30 characters with spaces
  ps = play_deck_readable[j]
  for i=string.len(play_deck_readable[j]), 30 do
    ps = ps .. " "
  end
  js = j
  if j < 10 then
    js = " " .. js
  end
  io.write("Player - " .. js .. ", " .. ps)
  io.write("Opponent - " .. js .. ", " .. oppo_deck_readable[j] .. "\n")
  if j%5 == 0 then
    io.write("\n")
  end
end

io.flush()
io.close()
