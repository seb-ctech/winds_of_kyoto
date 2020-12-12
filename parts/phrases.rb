#TODO: Make Phrases that sound harmonic and well timed (defined), has an harmonic progression.
# -------------------------------
# PHRASES
# --> repetition and variation of motifs, has a definite rhythm, punctuation and cadence, 4 bars.
# -------------------------------

define :ph_bamboo_game do
    # --- Background
    in_thread(name: :ph1_1) do
      4.times do
        mo_drumbeats
      end
    end
    in_thread(name: :ph1_2) do
      2.times do
        mo_bamboo_decoration
        sleep 2
      end
    end
    in_thread(name: :ph1_3) do
      if one_in(2)
        in_random_word
      end
    end
    # --- Foreground
    in_thread(name: :ph1_4) do
      if one_in(3)
        mo_training
      end
    end
    in_thread(name: :ph1_5) do
      4.times do
        mo_double_woosh
        sleep 0.5
      end
    end
  end
  
  define :ph_demon_song do
    # --- Background
    in_thread do
      2.times do
        mo_beast_awakenes
        sleep 8
      end
    end
    in_thread do
      4.times do
        mo_creepy_flute
        sleep 2
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
  end
  
  define :ph_peaceful_atmo do |flute = false, chion = false|
    # --- Background
    in_thread do
      sample s_wind, finish: 0.6, amp: 0.3
      sample s_stream, amp: 0.2
      sample s_birds
      sample s_bamboogmni, finish: 0.55
    end
    # --- Foreground
    if flute
      sleep 4
      in_thread do
        sleep 1 
        mo_flute_calm :c4
        sleep 4
        mo_flute_calm :c4
      end
    end
    if chion
      sleep 8
      in_thread do
        mo_chion
      end
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
    # --- Foreground
    in_thread do
      4.times do
        if one_in(2)
          mo_katana_combat
        else 
          mo_double_woosh
        end
        sleep 2
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
  end
  
  define :ph_ceremony do
    # --- Background
    in_thread do
      mo_creepy_atmo
    end
    in_thread do
      mo_strong_river
    end
    in_thread do
      if one_in(3)
        in_wind_sweep
      end
    end
    # --- Foreground
    in_thread do
      mo_chion
    end
    in_thread do
      in_ren_chore
    end
  end