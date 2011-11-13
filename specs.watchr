def run( cmd )
  puts "-- \nAction: ruby #{cmd.split.last}"
  system cmd
end

watch( '(.*)\.rb' )         { |match| run( "ruby -I.:lib:spec -rminitest/pride spec/%s_spec.rb" % match[1] ) }
watch( '^lib/(.*)\.rb' )    { |match| run( "ruby -I.:lib:spec -rminitest/pride spec/%s_spec.rb" % match[1] ) }
watch( '^spec/.*_spec.rb' ) { |match| run( "ruby -I.:lib:spec -rminitest/pride %s" % match[0] ) }

# Ctrl-C
Signal.trap('INT') { abort("\n") }
