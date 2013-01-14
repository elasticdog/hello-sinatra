notification :off

guard :shell do

  watch(/^spec\/(.+\.rb)$/) do |file|
    system "clear"
    puts "Running spec: #{file[1]}"
    system "bundle exec rake test TEST=#{file[0]}"
  end

  watch(/^lib\/(.+)\.rb$/) do |file|
    testfile = "test/unit/#{file[1]}_spec.rb"
    system "clear"
    if File.exists?(specfile)
      puts "Running unit spec for #{file[1]}"
      system "bundle exec rake test TEST=#{specfile}"
    else
      puts "No unit spec for #{file[1]}. Consider creating one?"
    end
  end

  watch(/^(views|public|assets)\/.*$/) do
    system "clear"
    puts "Running all specs"
    system "bundle exec rake test"
  end

  watch(/^\w+\.(rb|ru)$/) do
    system "clear"
    puts "Running all specs"
    system "bundle exec rake test"
  end

end