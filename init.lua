textadept.editing.STRIP_TRAILING_SPACES = true

--emacs bindings
keys['cx'] = {
  cf = buffer.new,
  b  = ui.switch_buffer,
  cs = io.save_file,
  ck = io.close_buffer,
  o  = {ui.goto_view, 1, true}
}

keys.cs = ui.find.find_incremental
keys.ck = buffer.line_cut
keys.cy = buffer.paste
keys.ca = buffer.vc_home
keys.ce = buffer.line_end
keys.cd = buffer.clear

--working with splits
keys['ct'] = {
  h = {view.split, view},
  v = {view.split, view, true},
  u = {view.unsplit, view},
  n = {ui.goto_view, 1, true},
  p = {ui.goto_view, -1, true},
  j = {ui.goto_view, 1, true},
  k = {ui.goto_view, -1, true}
}


--autocomplete
keys['c\n'] = textadept.editing.autocomplete_word
keys.cl = textadept.adeptsense.complete

--snippets
snippets['file'] = '%<buffer.filename>'
snippets['path'] = "%<(buffer.filename or ''):match('^.+[/\\]')>"

-- view
--sequence matters!!! a maps to option and then m maps to command key
keys.amright = {view.goto_buffer, view, 1, true}
keys.amleft  = {view.goto_buffer, view, -1, true}

-- select
keys.asleft, keys.asright = buffer.word_left_extend, buffer.word_right_extend
keys.cA = buffer.vc_home_extend
keys.cE = buffer.line_end_extend

-- movement
keys.aright, keys.aleft   = buffer.word_right, buffer.word_left

require 'folding_commands'

events.connect(events.INITIALIZED, function()
  textredux = require 'textredux.hijack'
end)
