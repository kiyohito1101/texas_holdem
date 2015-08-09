require './game'

a = Game.new

while ((a.my_chips > 50) && (a.pc_chips > 50))
  print "\e[2J\e[f"
  a.pre_flop
  a.check_kye
  if (a.check == 'f')
    a.table_reset
    a.my_fold
  elsif (a.pc_chips < 0)
    a.my_win
  else
    print "\e[2J\e[f"
    a.flop
    a.check_kye
    if (a.check == 'f')
      a.table_reset
      a.my_fold
    elsif (a.pc_chips < 0)
      a.my_win
    else
      print "\e[2J\e[f"
      a.tern
      a.check_kye
      if (a.check == 'f')
        a.table_reset
        a.my_fold
      elsif (a.pc_chips < 0)
        a.my_win
      else
        print "\e[2J\e[f"
        a.river
        a.check_kye
        if (a.check == 'f')
          a.table_reset
          a.my_fold
        elsif (a.pc_chips < 0)
          a.my_win
        else
          print "\e[2J\e[f"
          a.showdown
          a.table_reset
          a.clear
        end
      end
    end
  end
end

if a.my_chips > a.pc_chips
  print "win!"
  gets.chomp
  print "\e[2J\e[f"
else
  print "lose..."
  gets.chomp
  print "\e[2J\e[f"
end
