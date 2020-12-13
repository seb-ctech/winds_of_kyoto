# -------------------------------
# PHRASES
# --> repetition and variation of motifs, has a definite rhythm, punctuation and cadence, 4 bars.
# -------------------------------

define :ph_bamboo_game do
  in_thread do
    2.times do
      mo_bamboo_decoration
    end
  end
  4.times do
    in_thread do
      mo_flute
    end
    in_thread do
      if one_in(3)
        in_random_word
      else 
        mo_training
      end
      mo_double_woosh
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
  mo_calm_atmo
  if one_in(2)
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
    3.times do
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
    in_thread do
      mo_creepy_flute
    end
    mo_ren_chants
    sleep wait
    wait = wait - 1
  end
end