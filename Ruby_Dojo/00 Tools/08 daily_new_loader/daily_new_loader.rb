##################################################################################################################
#                                                                                                                #
# Program:......................daily_new_loader.rb                                                              #
# Programmer:...................Harold Sy                                                                        #
# Description:..................this is a loader program for the ruby question maker. it is supposed to load the #
#                               newly created questions into the daily_new9 for drilling.                        #
# Kata subject..................ruby programming language:                                                       #
# Programmed:...................06/19/2019                                                                       #
# Last modified:................02/25/2021                                                                       #
# Modification notes:...........* drill programs were modified so these tools needed to have their file pathes   #
#                                 reset. also added some global varaibles for easier modifications               #
#                                                                                                                #
##################################################################################################################
DAILY_NEW='../../98 daily_new/daily_new.rb'
QUESTION_FILE='../07 question_maker/temp'
TEMP_FILE='temp'


##################################################################################################################
# main program                                                                                                   #
##################################################################################################################
puts 'this program loads new questions from the question maker program into the daily drill'
puts 'note that the daily new does not have to be empty to load new questions in it'
puts 'if this is what you want to do hit enter...'
w=gets.chomp



# open rubyDailyNew9.rb for reading
# open new_questions for reading
# open temp for writing
# read and save daily_new.rb until start of questions section is reached
# read another two lines and save into temp
file_rubyDailyNew9=File.open(DAILY_NEW,'r')
file_newQuestions=File.open(QUESTION_FILE,'r')
file_temp=File.open(TEMP_FILE,'w')
while !file_rubyDailyNew9.eof?
  line1=file_rubyDailyNew9.readline
  if line1.include?('# start of questions section')
    file_temp.print line1
    line1=file_rubyDailyNew9.readline
    file_temp.print line1
    break
  end
  file_temp.print line1
end


# once the start of the new questions section is reached
# read and save from the new_questions file then end when eof
while !file_newQuestions.eof?
  line2=file_newQuestions.readline
  file_temp.print line2
end
file_newQuestions.close


# continue reading the rest of daily_new.rb and save until eof
while !file_rubyDailyNew9.eof?
  line1=file_rubyDailyNew9.readline
  file_temp.print line1
end
file_rubyDailyNew9.close
file_temp.close



# open temp for reading
# open rubyDailyNew9.rb for writing
# transfer source code from temp to daily_new.rb
file_temp=File.open(TEMP_FILE,'r')
file_rubyDailyNew9=File.open(DAILY_NEW,'w')
while !file_temp.eof?
  line3=file_temp.readline
  file_rubyDailyNew9.print line3
end
file_temp.close
file_rubyDailyNew9.close



# clear out temp file
# clear out new_questions file
file_temp=File.open(TEMP_FILE,'w')
file_temp.close
file_newQuestions=File.open(QUESTION_FILE,'w')
file_newQuestions.close
puts 'questions loaded into ruby_daily_new.rb was successful'
puts 'file clean up was also performed successfully'
wait=gets.chomp

