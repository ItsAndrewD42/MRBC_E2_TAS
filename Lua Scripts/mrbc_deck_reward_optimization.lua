-- used to manipulate RNG to find best set of rewards
-- there are two main "modes" to using this

-- in the first mode, desired_skills would be filled but desired_monsters and forbidden_monsters would be empty. this would be for battles with only skill card rewards or where you don't care about the monsters.

-- this uses the skill IDs. Starting at 1, they can be found using the all_cards table below, or from the CSV file I'm going to include.

-- the second mode is using the desired/forbidden monster lists. These use the monster IDs of the different monsters, shown below.

-- 0 - Tiger     9 - Hare Hound   18 - Bazula         27 - Worm           36 - Soboros
-- 1 - Gali     10 - Big Blue     19 - GentleMocchi   28 - Dragon         37 - Black Henger
-- 2 - Golem    11 - Melon Suezo  20 - Phoenix        29 - Durahan        38 - Mum Mew
-- 3 - Suezo    12 - Allure       21 - Jell           30 - Zilla          39 - Usaba
-- 4 - Pixie    13 - Anki         22 - Monol          31 - Magna          40 - Corone
-- 5 - Dino     14 - Fairy Hare   23 - Ghost          32 - Night Flyer    41 - Stone Dragon
-- 6 - Naga     15 - Angel        24 - Henger         33 - Shell Dino     42 - Vesuvius
-- 7 - Hare     16 - Suezo Mask   25 - Mew            34 - KnightMochi    43 - Gray Wolf
-- 8 - Mocchi   17 - Horn         26 - Plant          35 - Purple Jell    44 - Moo



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

limit = 500

-- which frame to start on (-1). -1 is default and means "start on frame 0 relative to the save state"
frame_counter = -1

desired_monsters = {}
forbidden_monsters = {}
desired_skills = {}

-- post-Miller: Tail Attack, Bite, Combination
desired_skills = {225, 226, 227}

-- post-Daniel: Side Roll, Lick, Kiss, Tongue
desired_skills = {48, 43, 42, 41}

-- post-Alice: Roll, Motch Ray, Licking, Slap
desired_skills = {108, 105, 103, 97}

-- post-A rank tourney, #1
-- dragon and its skills for Combination
-- forbidden: monsters I have
desired_skills = {225, 226, 227}
desired_monsters = {28}
forbidden_monsters = {3,4,5,7,8}

-- post Tourney 2
desired_monsters = {}
forbidden_monsters = {3,4,5,7,8,28,2}
desired_skills = {225, 226} -- need 2 of 226, 1 of 225

-- Pabs's skill card reward
desired_monsters = {}
forbidden_monsters = {}
desired_skills = {226} -- need 1 of 226

-- post Tourney 3
desired_monsters = {}
forbidden_monsters = {3,4,5,7,8, 28,2, 0,30}
desired_skills = {}

-- post Tourney 4
forbidden_monsters = {3,4,5,7,8, 28,2, 0,30, 22,29}

-- post T5
forbidden_monsters = {3,4,5,7,8, 28,2, 0,30, 22,29, 25,1}

-- post T6
forbidden_monsters = {3,4,5,7,8, 28,2, 0,30, 22,29, 25,1, 27,6}

-- post T7
forbidden_monsters = {3,4,5,7,8, 28,2, 0,30, 22,29, 25,1, 27,6, 24,26}

-- set parameters above as needed

rng = 2165888

function rand ()
  rng = ((((rng * 129749)%(2^32))*(8505))%(2^32)) + 0x3039
  -- keep only last 32 bits of rng

  -- probably should change to using the bit library from BizHawk, which should be the line below; but I don't have time to test it right now
  --return bit.band(bit.rshift(rng, 0x10), 0x7fff)

  return BinDecHex.BMAnd(BinDecHex.BShRight(BinDecHex.Dec2Hex(tostring(rng)), 0x10),"7fff");
end

skill_reward_addr = 0x0fccc0
monster_reward_addr = 0x0fccbd

-- load save state to seed RNG
savestate.loadslot(save_slot)

-- can comment out this line to use initial RNG seed instead. IDK why you'd want to, though.
rng = mainmemory.read_u32_le( 0x083260 )


if frame_counter > 0 then
  for i=0, frame_counter do
    rand()
    rand()
  end
end

file = io.open("MRBC_reward_optimization_" .. os.time() .. ".csv","w")
io.output(file)


io.write("frame_counter,")
if table.getn(desired_monsters) > 0 or table.getn(forbidden_monsters) > 0 then
  io.write("m1,m2,")
end
for i=1, table.getn(desired_skills) do
  io.write(desired_skills[i] .. ",")
end
io.write("sum,all_rewards\n")

bestsum = 0

for loopCounter=1, limit do

  frame_counter = frame_counter + 1
  -- load save state
  savestate.loadslot(save_slot)

  -- set RNG
  mainmemory.write_u32_le( 0x083260, rng)

  -- then advance frame
  emu.frameadvance();

  found_monsters = true
  outwriteline = ""

  -- first, if there are any monster rewards required, check monster rewards
  if table.getn(desired_monsters) > 0 or table.getn(forbidden_monsters) > 0 then
    monster1 = mainmemory.read_s8( monster_reward_addr)
    monster2 = mainmemory.read_s8( monster_reward_addr + 1 )
    monsters = {}
    for m=1, table.getn(desired_monsters) do
      monsters[m] = false
      mf = (monster1 == desired_monsters[m]) or (monster2 == desired_monsters[m])
      if mf then monsters[m] = true end
    end
    for m=1, table.getn(desired_monsters) do
      if (not monsters[m]) then found_monsters = false end
    end

    monsters = {}
    for m=1, table.getn(forbidden_monsters) do
      monsters[m] = false
      mf = (monster1 == forbidden_monsters[m]) or (monster2 == forbidden_monsters[m])
      if mf then monsters[m] = true end
    end
    for m=1, table.getn(forbidden_monsters) do
      if monsters[m] then found_monsters = false end
    end

    if monster1 == monster2 then found_monsters = false end

    if found_monsters then
      outwriteline = (frame_counter .. "," .. monster1 .. "," .. monster2 .. ",")
    end
  else
    outwriteline = (frame_counter .. ",")
  end

  if found_monsters then

    if table.getn(desired_skills) == 0 then
      console.writeline("Found monsters at fc=" .. frame_counter)
      break
    end

    rewardstr = ""

    reward_qty = {}
    for i=1, table.getn(desired_skills) do
      reward_qty[i] = 0
    end


    for i=1, 50 do
      rew = mainmemory.read_s16_le( skill_reward_addr + (i-1)*2)

      if table.contains(desired_skills, rew) then
        for j=1, table.getn(desired_skills) do
          if desired_skills[j] == rew then
            reward_qty[j] = reward_qty[j] + 1
            if reward_qty[j] > 3 then
              reward_qty[j] = 3
            end
          end
        end
      end
      if rew > 0 then
        rewardstr = rewardstr .. all_cards[rew] .. "/"
      end
    end


    sum = 0
    for i=1, table.getn(reward_qty) do
      sum = sum + reward_qty[i]
      outwriteline = outwriteline .. reward_qty[i] .. ","
    end


    if sum > bestsum then
      bestsum = sum
      console.writeline("New best sum = " .. sum .. " at fc=" .. frame_counter)
      --break
    end

    if sum == bestsum then
      io.write(outwriteline .. sum .. "," .. rewardstr .. "\n")
    end
  end
  -- advance RNG twice, to simulate a frame moving forward
  rand()
  rand()
end

io.flush()
io.close()
