##################################################################################################################
#                                                                                                                #
# Program:......................count_editor.rb                                                                  #
# Programmer:...................Harold Sy                                                                        #
# Description:..................this program allows me to make changes to the drill count without having to open #
#                               up the source code for editing manually                                          #
# Kata subject..................ruby programming language:                                                       #
# Programmed:...................06/26/2019                                                                       #
# Last modified:................06/26/2019                                                                       #
# Modification notes:...........none...                                                                          #
#                                                                                                                #
##################################################################################################################
TEMP_FILE='temp'




##################################################################################################################
# programmer created functions                                                                                   #
##################################################################################################################



##################################################################################################################
# main program                                                                                                   #
##################################################################################################################
new_string=''
string1=<<-STRING
  questions=Array.new(
STRING
string1.slice!(-1)
string2=<<-STRING
){|index| index+1}
STRING

puts 'this program edits the drill count for a particular drill program'
puts 'when a warning occurs due to the numbers not matching up...'
puts
print 'what is the drill name that needs to be edited? '
drill=gets.chomp
folder=''
Dir.foreach('../../'){|file| folder<<file if file.include?(drill)} 


print 'what should the number of drill questions be? '
drill_number=gets.chomp

new_string<<string1<<drill_number<<string2

# open correct drill and grab line that needs editing
# open temp and put edited drill into temp
drill=drill+'.rb'
file_drill=File.open("../../#{folder}/#{drill}",'r')
file_temp=File.open(TEMP_FILE,'w')
while !file_drill.eof?
  line=file_drill.readline
  break if line.include?('questions=Array.new(')
  file_temp.print line
end

file_temp.print new_string
while !file_drill.eof?
  line=file_drill.readline
  file_temp.print line
end
file_drill.close
file_temp.close


# open drill for writing and open temp for reading
# edit actual drill
file_drill=File.open("../../#{folder}/#{drill}",'w')
file_temp=File.open(TEMP_FILE,'r')
while !file_temp.eof?
  line=file_temp.readline
  file_drill.print line
end
file_drill.close
file_temp.close


# clear out temp file
file_temp=File.open(TEMP_FILE,'w')
file_temp.close

puts
puts "successfully changed drill number for #{drill}..."
wait=gets.chomp
