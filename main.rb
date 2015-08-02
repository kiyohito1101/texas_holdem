require './game'

a = Game.new
while ((a.my_chips > 50) && (a.pc_chips > 50))
  a.pre_flop
  a.check_kye
  if (a.check == 'f')
    a.table_reset
    printf "Fold\n"
  elsif (a.pc_chips < 0)
    a.my_win
  else
    a.flop
    a.check_kye
    if (a.check == 'f')
      a.table_reset
      printf "Fold\n"
    elsif (a.pc_chips < 0)
      a.my_win
    else
      a.tern
      a.check_kye
      if (a.check == 'f')
        a.table_reset
        printf "Fold\n"
      elsif (a.pc_chips < 0)
        a.my_win
      else
        a.river
        a.check_kye
        if (a.check == 'f')
          a.table_reset
          printf "Fold\n"
        elsif (a.pc_chips < 0)
          a.my_win
        else
          a.showdown
          a.table_reset
        end
      end
    end
  end

end