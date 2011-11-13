def run( cmd )
  puts "-- \nAction: ruby #{cmd.split.last}"
  system cmd
end

def run_all_tests
  system( 'clear' )
  puts " --- RUNNING ALL TESTS ---\n\n"
  system( 'rake test' )
end

watch( '(.*)\.rb' )         { |match| run( "ruby -I.:lib:spec -rminitest/pride spec/%s_spec.rb" % match[1] ) }
watch( '^lib/(.*)\.rb' )    { |match| run( "ruby -I.:lib:spec -rminitest/pride spec/%s_spec.rb" % match[1] ) }
watch( '^spec/.*_spec.rb' ) { |match| run( "ruby -I.:lib:spec -rminitest/pride %s" % match[0] ) }

# Ctrl-\
Signal.trap('QUIT') { run_all_tests }

# Ctrl-C
Signal.trap('INT') { abort("\n") }
