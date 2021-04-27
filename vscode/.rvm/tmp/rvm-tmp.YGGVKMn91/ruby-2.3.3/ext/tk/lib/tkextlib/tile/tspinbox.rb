# frozen_string_literal: false
#
#  ttk::spinbox widget  (Tcl/Tk 8.6b1 or later)
#                               by Hidetoshi NAGAI (nagai@ai.kyutech.ac.jp)
#
require 'tk'
require 'tkextlib/tile.rb'

module Tk
  module Tile
    class TSpinbox < Tk::Tile::TEntry
    end
    Spinbox = TSpinbox
  end
end

class Tk::Tile::TSpinbox < Tk::Tile::TEntry
  include Tk::Tile::TileWidget

  if Tk::Tile::USE_TTK_NAMESPACE
    TkCommandNames = ['::ttk::spinbox'.freeze].freeze
  else
    TkCommandNames = ['::tspinbox'.freeze].freeze
  end
  WidgetClassName = 'TSpinbox'.freeze
  WidgetClassNames[WidgetClassName] ||= self

  class SpinCommand < TkValidateCommand
    class ValidateArgs < TkUtil::CallbackSubst
      KEY_TBL = [
        [ ?d, ?s, :direction ],
        [ ?s, ?e, :current ],
        [ ?W, ?w, :widget ],
        nil
      ]

      PROC_TBL = [
        [ ?s, TkComm.method(:string) ],
        [ ?w, TkComm.method(:window) ],

        [ ?e, proc{|val|
            #enc = Tk.encoding
            enc = ((Tk.encoding)? Tk.