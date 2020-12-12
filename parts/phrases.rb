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
        2.times do
          mo_double_woosh
        end
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
    if one_in(2)
      in_thread do
        2.times do
          mo_creepy_flute
          sleep 2
        end
      end
    end
    in_thread do
      2.times do
        sleep 4
        mo_evil_birds
        sleep 2
      end
    end
    in_thread do
      2.times do
        mo_water_pranks
        sleep 2
      end
    end
    # --- Foreground
    in_thread do
      4.times do
        mo_chimes
        sleep 4
      end
    end
    in_thread do
      4.times do
        in_ren_chore 
        sleep 4
      end
    end
    2.times do
      mo_beast_awakenes
      sleep 8
    end
  end
  
  define :ph_peaceful_atmo do |flute = false, chion = false|
    if flute
      in_thread do
        sleep 1 
        3.times do
          mo_flute_calm :c4
          sleep 4
        end
        mo_flute_calm :g4
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
      sleep 10
      in_group_hey
    end
  end
  
  define :ph_combat do
    # --- Background
    in_thread do
      mo_strong_river
      if one_in(2)
        in_wind_sweep
      else
        sample s_wind, finish: 0.2, release: 2
      end
    end
    in_thread do
      2.times do
        mo_drumbeats
      end
    end
    in_thread do
      4.times do
        if one_in(2)
          in_group_hey
          sleep 4
        else 
          mo_shouts
          sleep 4
        end
      end
    end
    in_thread do
      4.times do
        if one_in(3)
          mo_slasher
        end
      end
    end
    4.times do
      if one_in(2)
        mo_katana_combat
      else 
        mo_double_woosh
      end
      sleep 1
    end
  end
  
  define :ph_ceremony do
    in_thread do
      mo_strong_river
    end
    in_thread do
      if one_in(3)
        in_wind_sweep
      end
    end
    in_thread do
      mo_chion
    end
    in_thread do
      in_ren_chore
    end
    mo_creepy_atmo
    sleep 10
  end