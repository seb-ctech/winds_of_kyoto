# ---------------------------------------------
# MOTIFS
# --> Harmonized and Rhythmical, variation through randomnes! And some control over parameters.
# change must be subtle! If you change too much, it will sound to foreign and destroy the cohesion, means of harmonization!
# ---------------------------------------------

define :mo_calm_atmo do
  sample s_wind, finish: 0.4, amp: 0.3, release: 1
  sample s_stream, amp: 0.2, finish: 0.8, release: 1
  sample s_birds, finish: 0.6, release: 1
  sample s_bamboogmni, finish: 0.4, release: 1
  sleep 20
end

define :mo_beast_awakenes do |pitch = 0, amp = 1|
  with_fx :reverb do
    in_beast -8 + pitch, 2, amp
    pause = 8 - abs(pitch)
    if pause < 0
      sleep 1
    else
      sleep pause
    end
  end
end

define :mo_chion do 
  2.times do
    dur = 0.01
    in_chion_part dur, rrand(0.2, 0.4)
    sleep dur * sample_duration(s_chion) * 1.05
  end
end

define :mo_flute_calm do 
  with_fx :reverb, room: 0.8 do
    root = rrand_i(0, get_notes_amount / 2.0)
    in_play_flute_in_scale root, 3, 0.4
    sleep 1.5
    in_play_flute_in_scale root + [-1, 1].choose, 0.2, 0.2
    sleep 0.2
    in_play_flute_in_scale root + 3, 0.2, 0.2
    sleep 0.2
  end
  sleep 2
end

define :mo_flute do
  with_fx :reverb, room: 0.8 do
    root = rrand_i(0, get_notes_amount / 2.0)
    in_play_flute_in_scale root, 1, 0.2
    sleep 1
    dur = [0.5, 0.75].choose
    in_play_flute_in_scale root + [2, 4].choose, dur, 0.1
    sleep dur
    2.times do
      dur = [0.25, 0.5, 0.75].tick
      in_play_flute_in_scale root + [0, 1, 3].choose, dur, 0.1
      sleep dur * 2
    end
    sleep 1
  end
end

define :mo_creepy_flute do |r = 0|
  if r == 0
    root = rrand_i(0, get_notes_amount / 2.0)
  else 
    root = r
  end
  with_fx :reverb, room: 0.9 do
    in_play_flute_in_scale root, 2, 0.2
    sleep 1
    2.times do
      dur = [0.25, 0.5, 0.75, 1].choose
      in_play_flute_in_scale root + [-1, 1, 2].choose, dur, 0.1
      sleep dur
    end
    in_play_flute_in_scale root + 1, 2, 0.1
  end
  sleep 2
end
  
define :mo_double_woosh do
  2.times do
    in_random_woosh
    sleep [0.5, 1].choose
  end
  sleep 1
end

define :mo_training do
  in_ha_shout -2
  sleep 1
  in_ha_shout -1
  sleep [0.5, 1].tick
  in_ha_shout rrand_i(-3, 3)
  if one_in(3)
    sleep [1, 0.5].choose
    in_group_hey
  end
end

define :mo_panshout do
  with_fx :reverb, room: rrand(0, 1) do
    shout = sample s_kshout, pan: -1, pan_slide: 1
    sleep 0.2
    control shout, pan: 1
  end
end

define :mo_creepy_atmo do
  with_fx :reverb, room: 0.7 do
    sample s_wind
    if one_in(2)
      sample s_birds, finish: 0.2, release: 1
    end
  end
  with_fx :echo do
    sample s_stream, finish: 0.6, release: 2
  end
  sleep 16
end

define :mo_water_pranks do
  in_water_flow 1, 10
  sleep 1
  in_water_flow 1, 15
  sleep 0.5
  in_water_flow 1, 3
  sleep 1
  in_water_flow -1, 5
  sleep 2
  in_water_flow -1, 2
  sleep 1
end

define :mo_katana_combat do
  sample s_katana, rate: 1.0
  sleep [0.125, 0.5, 1].choose
  sample s_katana, rate: 0.6
  sleep [0.125, 0.250].choose
  sample s_katana, rate: 1.4
  sleep [0.250, 0.075].choose
  sample s_katana, rate: 1.0
  sleep 1
end

define :mo_strong_river do
  s = sample s_stream, amp: 0.0, rate: 2, release: 1, finish: 0.4
  control s, amp: 1.2, amp_slide: 6
  sleep 12
end

define :mo_summoning do
  in_ren_chore
  sleep 2
  in_ren_chore
  sleep [2, 3, 1.5].choose
  in_ren_chore
  sleep [0.5, 1, 2].tick
  in_ren_chore
  sleep 2
end

define :mo_drumbeats do |intense=false|
  4.times do
    in_short_drum
    in_thread do
      sleep [0.5, 0.2].choose
      if one_in(2)
        if intense
          in_woosh -3
        end
      else
        if intense
          in_woosh -3
        end
        sleep 0.2
        in_woosh -3
      end
    end
    sleep 1
  end
end

define :mo_ren_chants do
  2.times do
    in_ren_chore 0, rrand(0.1, 0.3)
    if one_in(2)
      in_ren_chore -2, rrand(0.1, 0.3)
      if one_in(3)
        in_ren_chore 2, rrand(0.1, 0.3)
      end
    end
    sleep 2
  end
end

define :mo_bamboo_decoration do
  len = 0.3
  st = rrand(0, 1 - len);
  bamboo = sample choose([s_bamboogmni, s_bamboochimes]), start: st, finish: st + len, pan: 0, pan_slide: 0.2, attack: 2, release: 3
  sleep 2
  control bamboo, pan: [-1, -0.6, -0.2].tick
  sleep 2
  control bamboo, pan: [1, 0.6, 0.2].tick
end

define :mo_evil_birds do
  with_fx :echo do
    if one_in(2)
      in_birds 432, -2
    else 
      in_birds rrand_i(120, 300), rrand_i(-2, 2)
    end
    sleep 2
    in_birds 65, -9
    sleep 2
    in_birds rrand_i(300, 675), rrand_i(-8, -3)
    sleep 2
  end
end

define :mo_birds_turning do
  in_birds 260, 0
  sleep 1
  in_birds 230, 1
  sleep [0.5, 1].choose
  in_birds 120, [-3, 2].choose
  sleep 1
  in_birds 678, [3, -5].choose
  sleep 1
  in_birds 59, -6
  sleep 2
  in_birds 89, -8
  sleep 2
end

define :mo_slasher do
  in_katana -8
  sleep [1,2].choose
  in_katana [-6, -2].choose
  sleep 0.5
  in_katana -6
  sleep 1
end

define :mo_chimes do
  in_bamchimes
  sleep 2
  in_bamchimes
  sleep 2
end

define :mo_shouts do
  in_ha_shout -2
  sleep 0.5
  in_beast [3,6].choose, 1
  sleep 1
  in_ha_shout 0
  sleep 0.5
  if one_in(2)
    in_beast [4,8].choose, rrand_i(1, 3)
  else
    in_ha_shout -1
  end
  sleep 0.5
end