##################################################################################################################
#                                                                                                                #
# Program:......................daily_old_loader.rb                                                              #
# Programmer:...................Harold Sy                                                                        #
# Description:..................this is a loader program for the ruby missed questions file, it loads all        #
#                               missed questions into the dailyold drill for practice                            #
# Kata subject..................ruby programming language:                                                       #
# Programmed:...................06/19/2019                                                                       #
# Last modified:................02/25/2021                                                                       #
# Modification notes:...........* drill programs were modified so these tools needed to have their file pathes   #
#                                 reset. also added some global varaibles for easier modifications               #
#                                                                                                                #
##################################################################################################################
##                    header list:                                                                              ##
##################################################################################################################
# programmer created functions                                                                                   #
##################################################################################################################
DAILY_OLD_FILE=       '../../99 daily_old/daily_old.rb'           # daily old drill program
MISSED_QUESTIONS_FILE='../01 missed_questions/missed_questions'   # file containing missed questions 
TEMP_FILE=            'temp'                                      # temporary text file holder
LAND_MARK=            '# start of questions section'              # text to search for before processing

##################################################################################################################
# main program                                                                                                   #
##################################################################################################################
puts 'this program loads questions from the missed questions file into the daily old'
puts 'if this is what you want to do then hit enter...'
w=gets.chomp


# open rubyDailyOld9.rb for reading
# open missed_questions for reading
# open temp for writing
# read and save rubyDailyOld9.rb until start of questions section is reached
# read another two lines and save into temp
file_rubyDailyOld9=File.open(DAILY_OLD_FILE,'r')
file_missedQuestions=File.open(MISSED_QUESTIONS_FILE,'r')
file_temp=File.open(TEMP_FILE,'w')
while !file_rubyDailyOld9.eof?
  line1=file_rubyDailyOld9.readline
  if line1.include?(LAND_MARK)
    file_temp.print line1
    line1=file_rubyDailyOld9.readline
    file_temp.print line1
    break
  end
  file_temp.print line1
end


# once the start of the new questions section is reached
# read and save from the missed_questions file then end when eof
while !file_missedQuestions.eof?
  line2=file_missedQuestions.readline
  file_temp.print line2
end
file_missedQuestions.close


# continue reading the rest of rubyDailyOld9.rb and save until eof
while !file_rubyDailyOld9.eof?
  line1=file_rubyDailyOld9.readline
  file_temp.print line1
end
file_rubyDailyOld9.close
file_temp.close


# open temp for reading
# open rubyDailyOld9.rb for writing
# transfer source code from temp to rubyDailyOld9.rb
file_temp=File.open(TEMP_FILE,'r')
file_rubyDailyOld9=File.open(DAILY_OLD_FILE,'w')
while !file_temp.eof?
  line3=file_temp.readline
  file_rubyDailyOld9.print line3
end
file_temp.close
file_rubyDailyOld9.close



# clear out temp file
# clear out missed_questions file
file_temp=File.open(TEMP_FILE,'w')
file_temp.close
file_missedQuestions=File.open(MISSED_QUESTIONS_FILE,'w')
file_missedQuestions.close
puts "questions loaded into daily old was successful"
puts "file clean up was also performed successfully"
wait=gets.chomp