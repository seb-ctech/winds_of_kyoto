#TODO: Make Phrases that sound harmonic and well timed (defined), has an harmonic progression.
# -------------------------------
# PHRASES
# --> repetition and variation of motifs, has a definite rhythm, punctuation and cadence, 4 bars.
# -------------------------------

#TODO: Refactor phrases to contain one main pattern that is out of a separate thread. 
# Things in threads should be declared before the main pattern

define :ph_bamboo_game do
  in_thread(name: :ph1_2) do
    2.times do
      mo_bamboo_decoration
    end
  end
  4.times do
    in_thread do
      mo_double_woosh
    end
    in_thread do
      mo_flute
    end
    in_thread do
      if one_in(4)
        in_random_word
      end
    end
    in_thread do
      if one_in(2)
        mo_training
      end
    end
    mo_drumbeats
  end
end
  
define :ph_demon_song do
  in_thread do
    4.times do
      mo_water_pranks
    end
  end
  in_thread do
    2.times do  
      mo_chimes
    end
    mo_evil_birds
  end
  in_thread do
    mo_creepy_flute
  end
  mo_ren_chants
  mo_beast_awakenes
end
  
define :ph_peaceful_atmo do |flute = false, chion = false|
  if flute
    in_thread do
      sleep 1 
      3.times do
        mo_flute_calm
      end
      mo_flute_calm
    end
  end
  if chion
    sleep 4
    in_thread do
      mo_chion
    end
  end
  sample s_wind, finish: 0.6, amp: 0.3
  sample s_stream, amp: 0.2
  sample s_birds
  sample s_bamboogmni, finish: 0.55
  if one_in(2)
    sleep 8
    in_group_hey
  end
end

define :ph_combat do
  in_thread do
    mo_strong_river
    if one_in(2)
      in_wind_sweep
    end
  end
  in_thread do
  end
  in_thread do
    2.times do
      if one_in(2)
        in_thread do
          mo_ren_chants
        end
        in_thread do
          mo_creepy_flute
        end
        mo_slasher
        mo_shouts
      else
        in_thread do
          mo_chion
        end
        in_thread do
          mo_flute
        end
        in_group_hey
        mo_katana_combat
        mo_shouts
      end
    end
  end
  4.times do
    mo_drumbeats true
  end
end

define :ph_ceremony do
  in_thread do
    mo_strong_river
    mo_water_pranks
  end
  in_thread do
    in_wind_sweep
  end
  in_thread do
    2.times do
      2.times do
        mo_chimes
      end
      mo_birds_turning
    end
  end
  in_thread do
    mo_chion
  end
  in_thread do
    mo_creepy_atmo
  end
  sleep 4
  wait = 4
  4.times do
    mo_creepy_flute
    mo_ren_chants
    sleep wait
    wait = wait - 1
  end
end