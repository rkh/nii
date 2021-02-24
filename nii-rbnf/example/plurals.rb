require 'bundler/setup'
require 'nii/rbnf'

source = "%digits-ordinal: -x: −→→; 0: =#,##0=$(ordinal,one{st}two{nd}few{rd}other{th})$;"

en = Nii::RBNF.load(source) do |type, number|
  case number
  when 1 then 'one'
  when 2 then type == 'ordinal' ? 'two' : 'other'
  when 3 then type == 'ordinal' ? 'few' : 'other'
  else 'other'
  end
end

1.upto(5) { |i| puts en.format(i, 'digits-ordinal') }

