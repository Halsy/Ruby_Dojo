##################################################################################################################
#                                                                                                                #
# Program:......................check_for_dups.rb                                                                #
# Programmer:...................Harold Sy                                                                        #
# Description:..................this program checks for duplcate questions in the drills                         #
# Programmed:...................03/16/2021                                                                       #
# Last modified:................03/16/2021                                                                       #
# Modification notes:...........none                                                                             #
#                                                                                                                #
##################################################################################################################





#=========================================================#
# read without saving, returning after locating landmark  #
#=========================================================================================================#
#                                                                                                         #
#                                                                                                         #
def read_file_without_saving(file_read,landmark)                                                          #
  while !file_read.eof?                                                                                   #
    line=file_read.readline                                                                               #
    return line if line.include?(landmark)                                                                #
  end                                                                                                     #
end                                                                                                       #
#=========================================================================================================#




#=====================================================#
# main program :check if there is a duplcate question #
#=========================================================================================================#
# checks if a duplicate question exists                                                                   #
#                                                                                                         #
# print message to the user and get information                                                           #
#                                                                                                         #
puts "this program checks for duplicate questions in the drills. If this is what you"                     #
puts "want to do then hit enter to continue..."                                                           #                                                          
wait=gets.chomp                                                                                           #
puts                                                                                                      #
print "please enter the drill name with the extension (.rb) "                                             #
drill=gets.chomp                                                                                          #
print "please enter the folder for the drill "                                                            #
folder=gets.chomp                                                                                         #
puts "please wait while duplicates are checked..."                                                        #
#                                                                                                         #
# locate the beginning of the questions section                                                           #
#                                                                                                         #
file_read=File.open("../../#{folder}/#{drill}")                                                           #
file_write=File.open("holder.txt",'w')                                                                    #
line=read_file_without_saving(file_read,"start of questions section")                                     #
while !line.include?("end of questions section")                                                          #
  line=file_read.readline                                                                                 #
  if !line.include?("==========") && !line.include?("--------------")                                     #
    file_write<<line                                                                                      #
  end                                                                                                     #
end                                                                                                       #
file_read.close                                                                                           #
file_write.close                                                                                          #
#                                                                                                         #
# check for duplicates                                                                                    #                                 
#                                                                                                         #
current_question='rubber_ducky'                                                                           #
current_question_count=0                                                                                  #
duplicates=0                                                                                              #
while current_question!=''                                                                                #
#                                                                                                         #
# get current question                                                                                    #
#                                                                                                         #
    current_question=''                                                                                   #
    current_question_count+=1                                                                             #
    question_count=0                                                                                      #
    file_read=File.open("holder.txt",'r')                                                                 #
    while !file_read.eof?                                                                                 #
      line=file_read.readline                                                                             #
      question_count+=1      if line.include?("rolling_count+=1")                                         #
      break                  if question_count>current_question_count                                     #
      current_question<<line if question_count==current_question_count                                    #
    end                                                                                                   # 
    file_read.close                                                                                       #
    current_question.slice!(-1) # note: for some unknown reason there is an extra newline on the          #
                                #       question captured here so we must remove it!                      #
#                                                                                                         # 
# scrub the current question with a question                                                              #
#                                                                                                         #
    question_to_scrub='rubber_ducky'                                                                      #
    question_to_scrub_count=0                                                                             #
    while question_to_scrub!=''                                                                           #
      question_to_scrub=''                                                                                #
      question_to_scrub_count+=1                                                                          #
      question_count=0                                                                                    #
      file_read=File.open("holder.txt",'r')                                                               #
      while !file_read.eof?                                                                               #
        line=file_read.readline                                                                           #
        question_count+=1       if line.include?("rolling_count+=1")                                      #
        break                   if question_count>question_to_scrub_count                                 #
        question_to_scrub<<line if question_count==question_to_scrub_count                                #
      end                                                                                                 #
      file_read.close                                                                                     #
                                                                                                          #
      if question_to_scrub==current_question && question_to_scrub!=""                                     #
         if current_question_count!=question_to_scrub_count                                               #
         puts "question #{current_question_count} == question #{question_to_scrub_count}"                 #
         duplicates+=1                                                                                    #
         end                                                                                              #
      end                                                                                                 #
    end                                                                                                   #
end                                                                                                       # 
puts "duplicates found = #{duplicates}"                                                                   #
wait=gets.chomp                                                                                           #
#=========================================================================================================#