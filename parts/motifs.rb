#TODO: Create interesting motifs with variable opts and good variations

# ---------------------------------------------
# MOTIFS
# --> Harmonized and Rhythmical, variation through randomnes! And some control over parameters.
# change must be subtle! If you change too much, it will sound to foreign and destroy the cohesion, means of harmonization!
# ---------------------------------------------

define :mo_beast_awakenes do
  with_fx :reverb do
    in_beast -8, 2
  end
end

define :mo_chion do 
  3.times do
    dur = rrand(0.01, 0.02)
    in_chion_part dur, rrand(0.2, 0.4)
    sleep dur * sample_duration(s_chion) * 1.05
  end
end

define :mo_flute_calm do |t|
  tonic = t
  with_fx :reverb do
    in_flute scale(tonic, :yu).choose, 3, 0.1
    sleep 0.5
    2.times do
      in_flute scale(tonic, :yu).tick, 0.1, rrand(0.05, 0.1)
      sleep 0.5
    end
  end
end
  
define :mo_double_woosh do
  2.times do
    in_random_woosh
    sleep [0.25, 0,5, 1].choose
  end
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
    if one_in(4)
      sample s_birds
    end
  end
  with_fx :echo do
    sample s_stream
  end
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
end

define :mo_katana_combat do
  sample s_katana, rate: 1.0
  sleep [0.125, 0.5, 1].choose
  sample s_katana, rate: 0.6
  sleep [0.125, 0.250].choose
  sample s_katana, rate: 1.4
  sleep [0.250, 0.075].choose
  sample s_katana, rate: 1.0
end

define :mo_strong_river do
  sample s_stream, amp: 0.5, rate: 2, release: 1
end

define :mo_summoning do
  in_ren_chore
  sleep 2
  in_ren_chore
  sleep [2, 3, 1.5].choose
  in_ren_chore
  sleep [0.5, 1, 2].tick
  in_ren_chore
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

define :mo_creepy_flute do
  with_fx :reverb, room: 0.9 do
    in_flute :a3, 2, 0.2
    sleep 1
    in_flute :g3, 0.5, 0.1
    sleep 1
    in_flute :f3, 0.25, 0.2
    sleep 1
    in_flute :fs3, 2, 0.2
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
    in_birds 432, -2
    sleep 2
    in_birds 65, -9
    sleep 2
    in_birds 675, -8
  end
end

define :mo_slasher do
  in_katana -8
  sleep 1 
  in_katana -6
  sleep 0.5
  in_katana -2
  sleep 0.3
  in_katana 0
  sleep 0.8
  in_katana -6
  sleep 0.3
end

define :mo_chimes do
  in_bamchimes
  sleep 2
  in_bamchimes
end

define :mo_shouts do
  in_ha_shout -2
  sleep 0.5
  in_beast 4, 2
  sleep 2
  in_beast 6, 1
  sleep 1
  in_ha_shout 0
  sleep 0.5
  in_ha_shout 2
end