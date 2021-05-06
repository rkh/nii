require 'nii'

case ARGV.size
when 1
  locale     = ENV['LANG'] || ENV['LC_CTYPE'] || 'en-US'
  message_id = ARGV.first
when 2
  locale, message_id = ARGV
else
  $stderr.puts "Usage:   #$0 [LOCALE] MESSAGE_ID", "Example: #$0 test"
  exit 1
end


messages = Nii::Lookup::Memory.new do
  namespace :example

  language :en do
    add :test,    "This is a test message."
    add :example, "example message"
  end

  language :de do
    add :test,    "Dies ist eine Test-Nachricht."
    add :example, "Beispielnachricht"
  end
end


context = Nii::Context.new(locale, lookup: messages, namespace: :example)
message = context.render message_id, default: nil

puts <<-EOS
[input]
locale:  #{locale}
message: #{message_id}

[output]
locale:  #{context.locale}
message: #{message&.inspect || "not found"}
EOS
