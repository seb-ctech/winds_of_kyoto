#TODO: Create dramaturgy, so it sounds complete
# --------------------------------
# PASSAGES
# --> how phrases are organized in independent and finished musical ideas. Like scenes in a movie
# period (antecedent and consequent) or sentence (four phrases developing to one cadence)
# --------------------------------

define :se_peaceful_temple do
    ph_peaceful_atmo 
    sleep 8
    ph_peaceful_atmo true, true
    sleep 8
    ph_peaceful_atmo false, true
  end
  
  define :se_picking_up_the_pace do
    in_ghongh
    sleep 1
    mo_panshout
    sleep 2
    4.times do
      ph_bamboo_game
      sleep
    end
    in_ghongh
  end
  
  define :se_passage_to_night do
    2.times do 
      ph_ceremony
      sleep 10
    end
    sleep 1
    in_ren_trance 3
    sleep 5
    in_ren_trance 6
  end
  
  define :se_demonic_ritual do
    mo_beast_awakenes
    sleep 10
    2.times do
      ph_demon_song
      sleep 20
    end
    2.times do
      ph_combat
      sleep 20
    end
  end
  
  define :se_passage_to_morning do
    mo_beast_awakenes #backwards or higher pitch
    in_group_hey
    2.times do
      ph_bamboo_game #somehow changed
    end
  end
  
  define :se_back_to_peace do
    ph_peaceful_atmo true, false
    mo_beast_awakenes #low and differetent
    mo_chion
    ph_peaceful_atmo
    in_ghongh
  end