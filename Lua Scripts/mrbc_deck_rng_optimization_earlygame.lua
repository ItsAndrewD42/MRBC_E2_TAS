-- This was used to try to find specific deck combos for the early game.
-- it ended up making more sense to make a specific script for Daniel's fight,

-- This is flexible enough for you to define the requirements for different scenarios
-- I used it to try to be able to use Spin Fist/Bite on each turn, but
-- I also used this for the first Tesca fight to get a Critical Petal Wind combo

-- the output is a bit messy but it's sufficient to figure out if a deck will work for the beginning of a battle or not

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

min = 500

rng = 2165888

function rand ()
  rng = ((((rng * 129749)%(2^32))*(8505))%(2^32)) + 0x3039
  -- keep only last 32 bits of rng

  -- probably should change to using the bit library from BizHawk, which should be the line below; but I don't have time to test it right now
  --return bit.band(bit.rshift(rng, 0x10), 0x7fff)

  return BinDecHex.BMAnd(BinDecHex.BShRight(BinDecHex.Dec2Hex(tostring(rng)), 0x10),"7fff");
end

defense_cards = {11,12,23,24,35,36,48,59,60,71,72,84,96,106,107,108,109,138,139,140,151,152,163,164,176,186,187,188,199,200,211,212,223,224,235,236,247,248,249,271,272}

player_deck_start = 0x119880 -- signed 2-byte
opponent_deck_start = 0x119ad2 -- signed 2-byte

-- load save state to seed RNG
savestate.loadslot(save_slot)

rng = mainmemory.read_u32_le( 0x083260 )
frame_counter = -1

file = io.open("MRBC_deck_optimization_early" .. os.time() .. ".csv","w")
io.output(file)
io.write("frame_counter,requirements_met,requirements_failed,player-15,oppo-7\n")

-- Bite/Spin Fist with a Bolt also in the last hand.
-- slots defines the start and end of the deck slots where any of the cards with the listed ids should occur
-- in the second example, you can see that you can require multiple IDs in the same slots
reqset1 = {
  { slots = {s=6,e=10}, ids = {64,90} }, -- bite/spin fist
  { slots = {s=11,e=15}, ids = {64,90} }, -- bite/spin fist
  { slots = {s=16,e=20}, ids = {64,90} }, -- bite/spin fist
  { slots = {s=16,e=20}, ids = {53} } -- bolt
}

-- Petal Wind + Critical Turn 2
reqset1 = {
  { slots = {s=6,e=10}, ids = {104} }, -- petal wind
  { slots = {s=6,e=10}, ids = {121} } -- critical
}

finished = false

while (not finished) or frame_counter < min do

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

  reqsmet = 0
  reqsfailed = 0
  for i=1, table.getn(reqset1) do
    req = reqset1[i]
    reqmet = false
    for j=req["slots"]["s"], req["slots"]["e"] do
      if table.contains(req["ids"], play_deck[j]) then
        reqmet = true
        break
      end
    end
    if reqmet then
      reqsmet = reqsmet + 1
    else
      reqsfailed = reqsfailed + 1
    end
  end

  io.write(frame_counter .. "," .. reqsmet .. "," .. reqsfailed .. "," .. p15 .. "," .. op7 .. "\n")

  if reqsmet == 2 then
    console.writeline(frame_counter .. " - Met all requirements!!")
    finished = true
  end
  -- advance RNG twice, to simulate a frame moving forward
  rand()
  rand()
end

io.flush()
io.close()
