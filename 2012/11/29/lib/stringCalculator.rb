class StringCalculator
  def add(string)
    string == "" ? 0 : (string[0,2] == "//" ? string[4,string.length-4].gsub(string[2,1], ",") : string).gsub("\n",",").split(',').map(&:to_i).inject{|sum,value| sum + value}
  end
end
