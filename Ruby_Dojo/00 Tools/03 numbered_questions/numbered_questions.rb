#================================================================================================================================================#
# program name ............................ numbered_questions.rb .............................................................................. #
# programmer .............................. Harold Sy .......................................................................................... #
# date created ............................ 06/15/2022 ......................................................................................... #
# program discription ..................... This program was created to add numbers to the questions in the drills ............................. #
# last modified ........................... 06/15/2022 ......................................................................................... #
# modification notes ...................... None ............................................................................................... #
#================================================================================================================================================#

#================================================================================================================================================#
# programmer created methods section: ===========================================================================================================#
#================================================================================================================================================#


#===========================================================================#
# print program purpose ====================================================#
#===========================================================================#
'prints the purpose of the program for the user'

def print_program_purpose()
    puts 'This program numbers the questions in the drill programs. If this is what'
    puts 'you want to do then hit any key to continue.'
end


#================================================================================================================================================#
# main program section: =========================================================================================================================#
#================================================================================================================================================#
PATH='../../'

# print purpose of the program
print_program_purpose()
wait=gets.chomp()

# get file name to be numbered
puts
puts 'What is the file name to be numbered?'
file_name=gets.chomp()

# locate the file name in the directory and set as folder
folder=''
drill=file_name 
drill=drill+'.rb' if drill[-3..-1]!='.rb'                                                                                                      
Dir.foreach(PATH){|file| folder<<file if file.include?(file_name)}                                                   

# open file for reading and open another file for writing
reading_file=File.open("../../#{folder}/#{drill}",'r')
writing_file=File.open("questions_file.rb",'w')

# read and save file until (start of questions section) is found
while !reading_file.eof?
    line=reading_file.readline
    writing_file.puts line
    if line.include?('start of questions section')
        break
    end
end

# read and save question count until (end of questions section) is found
question_count=0
while !reading_file.eof?
    line=reading_file.readline
    if line.include?('rolling_count+=1')
        question_count+=1
        writing_file.puts line
        writing_file.puts "'#{question_count.to_s}'"
        line=reading_file.readline
        if line.include?('if random_question==rolling_count')
            writing_file.puts line
        end
    else
        writing_file.puts line
    end 
end

# close files
reading_file.close
writing_file.close

# copy new drill file to original then delete
reading_file=File.open("questions_file.rb",'r')
writing_file=File.open("../../#{folder}/#{drill}",'w')
while !reading_file.eof?
    line=reading_file.readline
    writing_file.puts line
end
reading_file.close
writing_file.close
writing_file=File.open("questions_file.rb",'w')
writing_file.close