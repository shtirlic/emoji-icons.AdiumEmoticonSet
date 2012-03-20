require 'plist'

icons = Dir.glob "*.png"
icons_hash = {}


icons_hash.merge! ({'plus1.png' => {'Equivalents'=>[':+1:'], 'Name' => ':+1:' } } )
icons_hash.merge! ({'minus1.png' => {'Equivalents'=>[':-1:'], 'Name' => ':-1:' } } )

icons.each do |icon|
  file = icon
  next if file == 'plus1.png' || file == 'minus1.png'
  name = ':' + icon.gsub('.png','') + ':'
  icon_hash = { file => {'Equivalents'=>[name], 'Name' => name } }
  icons_hash.merge!(icon_hash)
end

plist = {'AdiumSetVersion' => 1, 'Emoticons' => icons_hash}
puts plist.to_plist
