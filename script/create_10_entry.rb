for i in 1..10 do
  Entry.create({:name => "Entry<p></p>#{i}", :fonder_id => 1, :number => "entry#{i}"})
end
