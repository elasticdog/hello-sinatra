def run( cmd )
  puts "-- \nAction: ruby #{cmd.split.last}"
  system cmd
end

watch( '(.*)\.rb' )         { |m| run( "ruby -I.:lib:spec -rminitest/pride spec/%s_spec.rb" % m[1] ) }
watch( '^lib/(.*)\.rb' )    { |m| run( "ruby -I.:lib:spec -rminitest/pride spec/%s_spec.rb" % m[1] ) }
watch( '^spec/.*_spec.rb' ) { |m| run( "ruby -I.:lib:spec -rminitest/pride %s" % m[0] ) }

# Ctrl-C
Signal.trap('INT') { abort("\n") }
