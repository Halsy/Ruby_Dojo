##################################################################################################################
#                                                                                                                #
# Program:......................delete_question.rb                                                               #
# Programmer:...................Harold Sy                                                                        #
# Description:..................this program allows me to delete missed questions from the missed questions file #
#                               because it was missed due to typo not an actual error.                           #
# Kata subject..................ruby programming language:                                                       #
# Programmed:...................10/25/2019                                                                       #
# Last modified:................02/25/2021                                                                       #
# Modification notes:...........* drill programs were modified so these tools needed to have their file pathes   #
#                                 reset. also added some global varaibles for easier modifications               #
##################################################################################################################
# programmer created functions                                                                                   #
##################################################################################################################
FILE_NAME='../01 missed_questions/missed_questions'


         #=============================================================================================================#
         # print first message ========================================================================================#
         #=============================================================================================================#
            # print message to let the user know what this program does
def first_message()
  puts 'this program deletes the last question that was saved to the'
  puts 'missed question file. if this is what you want to do then hit'
  puts 'enter'
  wait=gets.chomp
end
         #=============================================================================================================#
         # check if the file is empty =================================================================================#
         #=============================================================================================================#
def check_if_file_is_empty()
  file_status=true
  # open file
  file_read=File.open(FILE_NAME,'r')
  # read file till the end and check if there are any questions
  while !file_read.eof?
    line=file_read.readline
    if line.include?('rolling_count+=1')
      file_status=false
      break
    end
  end
  # close open files
  file_read.close
  return file_status
end

         #=============================================================================================================#
         # delete last question captured ==============================================================================#
         #=============================================================================================================#
            # a method that deletes the last question captured by questions missed file
def delete_last_question_captured()
  captured_text=''
  # open file
  file_read=File.open(FILE_NAME,'r')
  # read and save all questions to memory
  while !file_read.eof?
    line=file_read.readline
    captured_text<<line
  end
  # close file
  file_read.close
  # find beginning of the question
  start_of_question=captured_text.rindex('rolling_count+=1')
  # delete last question
  captured_text.slice!(start_of_question..-1)
  # open file
  file_write=File.open(FILE_NAME,'w')
  # save to file
  file_write.puts captured_text
  # close file
  file_write.close
end
         #=============================================================================================================#
         # print last message =========================================================================================#
         #=============================================================================================================#
            # a method to print the last message
def last_message()
  puts 'question was successfully deleted'
end
         #=============================================================================================================#
         # prompt the user to erase another question ==================================================================#
         #=============================================================================================================#
            # a method to prompt the user to continue or close the program
def erase_another_question()
  print 'erase another question (y or n)'
  answer=gets.chomp
  return answer
end


#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# main program <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


         #=============================================================================================================#
         # print first message ========================================================================================#
         #=============================================================================================================#
            # call a method that prints the first message letting the user know what this program does
first_message()

erase='y'
while erase=='y'

         #=============================================================================================================#
         # check if the file is empty =================================================================================#
         #=============================================================================================================#
            # call a method that checks if the file is empty
  file_status=check_if_file_is_empty()

  if file_status==true # file is empty
    puts
    puts '*** file is empty ***'
    break
  end


         #=============================================================================================================#
         # delete the last question captured ==========================================================================#
         #=============================================================================================================#
            # call a method that deletes the last question captured by missed questions
  delete_last_question_captured()
         #=============================================================================================================#
         # print last message =========================================================================================#
         #=============================================================================================================#
            # call a method that prints the last message telling the user that the job was done
  last_message()
         #=============================================================================================================#
         # prompt the user to erase another question ==================================================================#
         #=============================================================================================================#
  erase=erase_another_question()
end

puts
puts '--- program exited ---'
wait=gets.chomp