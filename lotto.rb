# Lottoklasse
class Lottogenerator
  def initialize shoes
    @shoes = shoes
    draw
  end
  def generate_lotto_numbers
    lotto = Array.new(6)
    # 6 aus 49
    lotto.map! {|l| 
      # Stichwort Mathematik, Stochastik > ungeordnet, ohne zurücklegen
      begin
        randLottoInt = ((rand * 49) + 1).to_i
      end while lotto.include?(randLottoInt)
      l = randLottoInt
    }
    # Zusatzzahl
    lotto.push(((rand * 9) + 1).to_i)
  end
  def draw
      # Überschrift
      @shoes.para "Lottozahlengenerator"
      # Zahlen generieren
      lr = generate_lotto_numbers
      # Ausgabe
      @shoes.flow do
        6.times { |t| @shoes.para lr[t].to_s }
        @shoes.para "Zusatzzahl: " + lr[6].to_s
      end
      # Button
      @shoes.button "Lottozahlen generieren" do
        @shoes.clear
        draw
      end
  end
end
# GUI
Shoes.app :title => "Lottogenerator", :height => 120, :width => 250 do
  Lottogenerator.new(self)
end