#TODO: Create dramaturgy, so it sounds complete
# --------------------------------
# SECTIONS
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
  2.times do
    ph_bamboo_game
  end
  in_ghongh
end
  
define :se_passage_to_night do
  
  ph_ceremony
  sleep 1
  in_ren_trance 1
  sleep 3
  in_ren_trance 3
  sleep 5
  in_ren_trance 6
  sleep 5
  in_ghongh 0.8

end
  
define :se_demonic_ritual do
  mo_beast_awakenes 0, 1.5
  2.times do
    ph_demon_song
  end
  sleep 2
  2.times do
    ph_combat
  end
  mo_beast_awakenes -4
end
  
define :se_passage_to_morning do
  in_group_hey
  sleep 1
  in_ghongh
  sleep 1
  2.times do
    ph_bamboo_game #somehow changed
  end
end
  
define :se_back_to_peace do
  ph_peaceful_atmo true, false
  mo_chion
  sleep 2
  mo_beast_awakenes 5, 0.6
  ph_peaceful_atmo
  in_ghongh
end