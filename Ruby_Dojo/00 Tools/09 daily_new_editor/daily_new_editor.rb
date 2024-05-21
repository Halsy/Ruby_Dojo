##################################################################################################################
#                                                                                                                #
# Program:......................daily_new_editor.rb                                                              #
# Programmer:...................Harold sy                                                                        #
# Description:..................this program is a modified drill editor made to work with the daily_new. The     #
#                               daily_new has a slightly different format so this program had to be created to   #
#                               compensate for that.                                                             #
# Kata subject..................ruby programming language:                                                       #
# Programmed:...................10/10/2019                                                                       #
# Last modified:................10/10/2019                                                                       #
# Modification notes:...........none                                                                             #
#                                                                                                                #
##################################################################################################################
PATH='../../'


##################################################################################################################
#                                   programmer created functions                                                 #                                                     
##################################################################################################################




#=================================#
# open_drill_and_capture_question #
#================================================================================================================#
# captures a question from the drill that needs editing                                                          #
#                                                                                                                #
def open_drill_and_capture_question(drill,question_num,folder)                                                   #
  count=0                                                                                                        #
  captured_string=''                                                                                             #
#                                                                                                                #  
# open the file for reading then read file until question number is found                                        #
#                                                                                                                #
  file_name=File.open("#{PATH}#{folder}/#{drill}",'r')                                                           #
  while !file_name.eof?                                                                                          #
    line=file_name.readline                                                                                      #
    count+=1 if line.include?('#>>')                                                                             #
    break if count==question_num                                                                                 #
  end                                                                                                            #
#                                                                                                                #
# when question is found save it into a string until start of next question                                      #
# then stop                                                                                                      #
#                                                                                                                #
  while !file_name.eof?                                                                                          #
    captured_string<<line                                                                                        #
    line=file_name.readline                                                                                      #
    break if line.include?('#>>')                                                                                #
    break if line.include?('#----------------------------')                                                      #
  end                                                                                                            #
  file_name.close                                                                                                #
  return captured_string                                                                                         #
end                                                                                                              #
#================================================================================================================#




#============================#
# multiple_choice_break_down #
#===============================================================================================================#
# breaks the multiple choice question into its basic parts: question, answer, and answers                       #
#                                                                                                               #
def multiple_choice_break_down()                                                                                #
  file_temp=File.open('temp','r')                                                                               #
  drill_string=''                                                                                               #
  header_string=''                                                                                              #
  question=''                                                                                                   #
  answers=''                                                                                                    #
#                                                                                                               #
# read and capture the drill string                                                                             #
#                                                                                                               #
  while !file_temp.eof?                                                                                         #
    line=file_temp.readline                                                                                     #
    drill_string<<line                                                                                          #
    break if line.include?('#>>')                                                                               #
  end                                                                                                           #
#                                                                                                               #
# read and capture the header_string                                                                            #
#                                                                                                               #                         
  (1..3).each do |c|                                                                                            #
    line=file_temp.readline                                                                                     #
    header_string<<line                                                                                         #
  end                                                                                                           #
  header_string<<"\n"                                                                                           #
#                                                                                                               #                                  
# read and capture the question                                                                                 #
#                                                                                                               #              
  while !file_temp.eof?                                                                                         #
    line=file_temp.readline                                                                                     #                           
    break if line.include?('<<-STRING')                                                                         #
  end                                                                                                           #
  while !file_temp.eof?                                                                                         #              
    line=file_temp.readline                                                                                     #
    break if line.include?('STRING')                                                                            #
    question<<line                                                                                              #
  end                                                                                                           #
#                                                                                                               # 
# read and capture the answer                                                                                   #
#                                                                                                               #
  line=file_temp.readline                                                                                       #
  line.lstrip!.slice!(0,7)                                                                                      #
  answer=line                                                                                                   #
  line=file_temp.readline                                                                                       #
#                                                                                                               #  
# read and capture 3 answers                                                                                    #
#                                                                                                               #
  line=file_temp.readline                                                                                       #
  while !file_temp.eof?                                                                                         #
    line=file_temp.readline                                                                                     #
    break if line.include?('STRING')                                                                            #
    answers<<line                                                                                               #
  end                                                                                                           #
  file_temp.close                                                                                               #
  return question,answer,answers,drill_string,header_string                                                     #
end                                                                                                             #
#===============================================================================================================#




#=========================#
# coding_test1_break_down #
#===============================================================================================================#
# breaks the coding test 1 question into its basic parts: question and answer                                   #
#                                                                                                               #
def coding_test1_break_down()                                                                                   #
  file_temp=File.open('temp','r')                                                                               #
#                                                                                                               #
  drill_string=''                                                                                               #
  header_string=''                                                                                              #
  question=''                                                                                                   #
  answer=''                                                                                                     #
#                                                                                                               #
# read and capture the drill string                                                                             #
#                                                                                                               #
  while !file_temp.eof?                                                                                         #
    line=file_temp.readline                                                                                     #
    drill_string<<line                                                                                          #
    break if line.include?('#>>')                                                                               #
  end                                                                                                           #
#                                                                                                               #  
# read and capture the header_string                                                                            #
#                                                                                                               #                   
  (1..3).each do |c|                                                                                            #
    line=file_temp.readline                                                                                     #
    header_string<<line                                                                                         #
  end                                                                                                           #
  header_string<<"\n"                                                                                           #
#                                                                                                               #
# read and capture the question                                                                                 #
#                                                                                                               #
  while !file_temp.eof?                                                                                         #
    line=file_temp.readline                                                                                     #
    break if line.include?('<<-STRING')                                                                         #
  end                                                                                                           #
  while !file_temp.eof?                                                                                         #
    line=file_temp.readline                                                                                     #
    break if line.include?('STRING')                                                                            #
    question<<line                                                                                              #
  end                                                                                                           #
  line=file_temp.readline                                                                                       #
#                                                                                                               #  
# read and capture the answer                                                                                   #
#                                                                                                               #
  while !file_temp.eof?                                                                                         #
    line=file_temp.readline                                                                                     #
    break if line.include?('STRING')                                                                            #
    answer<<line                                                                                                #
  end                                                                                                           #
  file_temp.close                                                                                               #
  return question,answer,drill_string,header_string                                                             #
end                                                                                                             #
#===============================================================================================================#




#=========================#
# coding_test2_break_down #
#===============================================================================================================#
# breaks the coding test 2 question into its basic parts: question and answer                                   #
#                                                                                                               #
def coding_test2_break_down()                                                                                   #
  file_temp=File.open('temp','r')                                                                               #
  drill_string=''                                                                                               #
  header_string=''                                                                                              #
  question=''                                                                                                   #
  answer=''                                                                                                     #
  choices=''                                                                                                    #
#                                                                                                               #
# read and capture the drill string                                                                             #
#                                                                                                               #
  while !file_temp.eof?                                                                                         #
    line=file_temp.readline                                                                                     #
    drill_string<<line                                                                                          #
    break if line.include?('#>>')                                                                               #
  end                                                                                                           #
#                                                                                                               #
# read and capture the header_string                                                                            #
#                                                                                                               #
  (1..3).each do |c|                                                                                            #
    line=file_temp.readline                                                                                     #
    header_string<<line                                                                                         #
  end                                                                                                           #
  header_string<<"\n"                                                                                           #
#                                                                                                               #
# read and capture the choices                                                                                  #
#                                                                                                               #
  while !file_temp.eof?                                                                                         #
    line=file_temp.readline                                                                                     #
    break if line.include?('<-RSTRING')                                                                         #
  end                                                                                                           #
  while !file_temp.eof?                                                                                         #
    line=file_temp.readline                                                                                     #
    break if line.include?('RSTRING')                                                                           #
    choices<<line                                                                                               #
  end                                                                                                           #
#                                                                                                               #
# read and capture the question                                                                                 #
#                                                                                                               #
  while !file_temp.eof?                                                                                         #
    line=file_temp.readline                                                                                     #
    break if line.include?('<-RSTRING')                                                                         #               
  end                                                                                                           #
  while !file_temp.eof?                                                                                         #
    line=file_temp.readline                                                                                     #
    break if line.include?('RSTRING')                                                                           #
    question<<line                                                                                              #
  end                                                                                                           #
  line=file_temp.readline                                                                                       #
#                                                                                                               #  
# read and capture the answer                                                                                   #
#                                                                                                               #
  while !file_temp.eof?                                                                                         #
    line=file_temp.readline                                                                                     #
    break if line.include?('STRING')                                                                            #
    answer<<line                                                                                                #
  end                                                                                                           #
  file_temp.close                                                                                               #
  return question,answer,drill_string,header_string,choices                                                     #
end                                                                                                             #
#===============================================================================================================#




#=========================#
# coding_test3_break_down #
#===============================================================================================================#
# breaks the coding test 3 question into its basic parts: question and answer                                   #
#                                                                                                               #
def coding_test3_break_down()                                                                                   #
  file_temp=File.open('temp','r')                                                                               #
  drill_string=''                                                                                               #
  header_string=''                                                                                              #
  question=''                                                                                                   #
  answers=''                                                                                                    #
#                                                                                                               #
# read and capture the drill string                                                                             #
#                                                                                                               #
  while !file_temp.eof?                                                                                         #
    line=file_temp.readline                                                                                     #
    drill_string<<line                                                                                          #
    break if line.include?('#>>')                                                                               #
  end                                                                                                           #
#                                                                                                               #
# read and capture the header_string                                                                            #
#                                                                                                               #
  (1..3).each do |c|                                                                                            #
    line=file_temp.readline                                                                                     #
    header_string<<line                                                                                         #
  end                                                                                                           #
  header_string<<"\n"                                                                                           #
#                                                                                                               #
# read and capture the question                                                                                 #
#                                                                                                               #
  while !file_temp.eof?                                                                                         #
    line=file_temp.readline                                                                                     #
    break if line.include?('<-STRING')                                                                          #               
  end                                                                                                           #
  while !file_temp.eof?                                                                                         #
    line=file_temp.readline                                                                                     #
    break if line.include?('STRING')                                                                            #
    question<<line                                                                                              #
  end                                                                                                           #
#                                                                                                               #  
# read and capture the answers                                                                                  #
#                                                                                                               #
  while !file_temp.eof?                                                                                         #
    line=file_temp.readline                                                                                     #
    break if line.include?('<-STRING')                                                                          #
  end                                                                                                           #
  while !file_temp.eof?                                                                                         #
    line=file_temp.readline                                                                                     #
    break if line.include?('STRING')                                                                            #
    answers<<line                                                                                               #
  end                                                                                                           #
  file_temp.close                                                                                               #
  return question,answers,drill_string,header_string                                                            #
end                                                                                                             #
#===============================================================================================================#




#=========================#
# coding_test4_break_down #
#===============================================================================================================#
# breaks the coding test 4 question into its basic parts: question and answer                                   #
#                                                                                                               #
def coding_test4_break_down()                                                                                   #
  file_temp=File.open('temp','r')                                                                               #
#                                                                                                               #
  drill_string=''                                                                                               #
  header_string=''                                                                                              #
  question=''                                                                                                   #
  answer=''                                                                                                     #
#                                                                                                               #
# read and capture the drill string                                                                             #
#                                                                                                               #
  while !file_temp.eof?                                                                                         #
    line=file_temp.readline                                                                                     #
    drill_string<<line                                                                                          #
    break if line.include?('#>>')                                                                               #
  end                                                                                                           #
#                                                                                                               #  
# read and capture the header_string                                                                            #
#                                                                                                               #                   
  (1..3).each do |c|                                                                                            #
    line=file_temp.readline                                                                                     #
    header_string<<line                                                                                         #
  end                                                                                                           #
  header_string<<"\n"                                                                                           #
#                                                                                                               #
# read and capture the question                                                                                 #
#                                                                                                               #
  while !file_temp.eof?                                                                                         #
    line=file_temp.readline                                                                                     #
    break if line.include?('<<-STRING')                                                                         #
  end                                                                                                           #
  while !file_temp.eof?                                                                                         #
    line=file_temp.readline                                                                                     #
    break if line.include?('STRING')                                                                            #
    question<<line                                                                                              #
  end                                                                                                           #
  line=file_temp.readline                                                                                       #
#                                                                                                               #  
# read and capture the answer                                                                                   #
#                                                                                                               #
  while !file_temp.eof?                                                                                         #
    line=file_temp.readline                                                                                     #
    break if line.include?('STRING')                                                                            #
    answer<<line                                                                                                #
  end                                                                                                           #
  file_temp.close                                                                                               #
  return question,answer,drill_string,header_string                                                             #
end                                                                                                             #
#===============================================================================================================#





#=======================#
# drill_and_header_edit #
#===============================================================================================================#
# edits drill or header                                                                                         #
#                                                                                                               #
def drill_and_header_edit(drill_string,header_string)                                                           #
  new_drill_string="\n"+'#>>'                                                                                   #
  header_ends='#'+'='*117+"\n"                                                                                  #
#                                                                                                               #
# get new drill string                                                                                          #
#                                                                                                               #
  puts                                                                                                          #
  puts '#=====================================#'                                                                #
  puts '# this is the old drill string:       #'                                                                #
  puts '# do you want to edit it? (y or n)?   #'                                                                #
  puts '#=====================================#'                                                                #
  puts "#{drill_string}"                                                                                        #
  puts                                                                                                          #
  print '(y or n)? '                                                                                            #
  reply=gets.chomp                                                                                              #
  if reply=='y'                                                                                                 #
    puts '#===================================#'                                                                #
    puts '# enter the new drill string:       #'                                                                #
    puts '#===================================#'                                                                #
    puts                                                                                                        #
    new_drill_string<<gets                                                                                      #
  else                                                                                                          #
    new_drill_string=drill_string                                                                               #
  end                                                                                                           #
#                                                                                                               #
# get new header string                                                                                         #
#                                                                                                               #
  puts                                                                                                          #
  puts '#=====================================#'                                                                #
  puts '# this is the old header string:      #'                                                                #
  puts '# do you want to edit it? (y or n)?   #'                                                                #
  puts '#=====================================#'                                                                #
  puts "#{header_string}"                                                                                       #
  puts                                                                                                          #
  print '(y or n)? '                                                                                            #
  reply=gets.chomp                                                                                              #
  if reply=='y'                                                                                                 #
    puts '#===================================#'                                                                #
    puts '# enter the new header string:      #'                                                                #
    puts '#===================================#'                                                                #
    puts                                                                                                        #
    header=gets.chomp                                                                                           #
    new_header_string=header_ends+'# '+"#{header} ".ljust(116,'=')+"\n"+header_ends+"\n"                        #
  else                                                                                                          #
    new_header_string=header_string                                                                             #
  end                                                                                                           #
  return new_drill_string,new_header_string                                                                     #
end                                                                                                             #
#===============================================================================================================#




#======================#
# multiple_choice_edit #
#===============================================================================================================#
# enables the editing of multiple choice questions                                                              #
#                                                                                                               #
def multiple_choice_edit(question,answer,answers)                                                               #
  new_question=''                                                                                               #
  new_answer=''                                                                                                 #
  new_answers=''                                                                                                #
#                                                                                                               #
# get new question                                                                                              #
#                                                                                                               #
  puts '#=====================================#'                                                                #
  puts '# this is the old question:           #'                                                                #
  puts '# do you want to edit it? (y or n)?   #'                                                                #
  puts '#=====================================#'                                                                #
  puts "#{question}"                                                                                            #
  puts                                                                                                          #
  print '(y or n)? '                                                                                            #
  reply=gets.chomp                                                                                              #
  if reply=='y'                                                                                                 #
    puts '#================================================================#'                                   #
    puts '# enter the new question then end with (.) on a line by itself   #'                                   #
    puts '# or (..) to redo the typing in case of typos:                   #'                                   #
    puts '#================================================================#'                                   #
    puts                                                                                                        #
    puts '(new question?)'                                                                                      #
    line=gets                                                                                                   #
    while line!=".\n"                                                                                           #
      if line=="..\n"                                                                                           #
        line=''                                                                                                 #
        new_question=''                                                                                         #
      end                                                                                                       #
      new_question<<line                                                                                        #
      line=gets                                                                                                 #
    end                                                                                                         #
  else                                                                                                          #
    new_question=question                                                                                       #
  end                                                                                                           #
#                                                                                                               #
# get new answer                                                                                                #
#                                                                                                               #
  puts '#====================================#'                                                                 #
  puts '# this is the old answer:            #'                                                                 #
  puts '# do you want to edit it (y or n)?   #'                                                                 #
  puts '#====================================#'                                                                 #
  puts "#{answer}"                                                                                              #
  puts                                                                                                          #
  print '(y or n)? '                                                                                            #
  reply=gets.chomp                                                                                              #
  if reply=='y'                                                                                                 #
    puts '#========================#'                                                                           #
    puts '# enter the new answer:  #'                                                                           #
    puts '#========================#'                                                                           #
    puts                                                                                                        #
    puts '(new answer?)'                                                                                        #
    line=gets.chomp                                                                                             #
    new_answer<<line                                                                                            #
    if new_answer.include?("'")                                                                                 #
      new_answer.insert(0,'"')                                                                                  #
      new_answer.insert(-1,'"')                                                                                 #
    else                                                                                                        #
      new_answer.insert(0,"'")                                                                                  #
      new_answer.insert(-1,"'")                                                                                 #
    end                                                                                                         #
  else                                                                                                          #
    new_answer=answer                                                                                           #
    puts "answer is: #{answer}"                                                                                 #
  end                                                                                                           #
#                                                                                                               #
# get new answers                                                                                               #
#                                                                                                               #
  puts '#====================================#'                                                                 #
  puts '# this is the old answers:           #'                                                                 #
  puts '# do you want to edit it (y or n)?   #'                                                                 #
  puts '#====================================#'                                                                 #
  puts answers                                                                                                  #
  puts                                                                                                          #
  print '(y or n)? '                                                                                            #
  reply=gets.chomp                                                                                              #
  if reply=='y'                                                                                                 #
    puts '#===============================================================#'                                    #
    puts '# enter the new answers then end with (.) on a line by itself   #'                                    #
    puts '# or (..) to redo the typing in case of typos:                  #'                                    #
    puts '#===============================================================#'                                    #
    line=gets                                                                                                   #
    while line!=".\n"                                                                                           #
      if line=="..\n"                                                                                           #
        line=''                                                                                                 #
        new_answers=''                                                                                          #
      end                                                                                                       #
      new_answers<<line                                                                                         #
      line=gets                                                                                                 #
    end                                                                                                         #
  else new_answers=answers                                                                                      #
  end                                                                                                           #
  return new_question,new_answer,new_answers                                                                    #
end                                                                                                             #
#===============================================================================================================#




#===================#
# coding_test1_edit #
#===============================================================================================================#
# enables the editing of coding 1 test questions                                                                #
#                                                                                                               #
def coding_test1_edit(question,answer)                                                                          #
  new_question=''                                                                                               #
  new_answer=''                                                                                                 #
#                                                                                                               #
# get new question                                                                                              #
#                                                                                                               #
  puts '#=====================================#'                                                                #
  puts '# this is the old question:           #'                                                                #
  puts '# do you want to edit it? (y or n)?   #'                                                                #
  puts '#=====================================#'                                                                #
  puts "#{question}"                                                                                            # 
  puts                                                                                                          #
  print '(y or n)? '                                                                                            #
  reply=gets.chomp                                                                                              #
  if reply=='y'                                                                                                 #
    puts '#================================================================#'                                   #
    puts '# enter the new question then end with (.) on a line by itself   #'                                   #
    puts '# or (..) to redo the typing in case of typos:                   #'                                   #
    puts '#================================================================#'                                   #
    puts                                                                                                        #
    puts '(new question?)'                                                                                      #
    line=gets                                                                                                   #
    while line!=".\n"                                                                                           #
      if line=="..\n"                                                                                           #
        line=''                                                                                                 #
        new_question=''                                                                                         #
      end                                                                                                       #
      new_question<<line                                                                                        #
      line=gets                                                                                                 #
    end                                                                                                         #
  else                                                                                                          # 
    new_question=question                                                                                       #
  end                                                                                                           #
#                                                                                                               #  
# get new answer                                                                                                #
#                                                                                                               #
  puts '#====================================#'                                                                 #
  puts '# this is the old answer:            #'                                                                 #
  puts '# do you want to edit it (y or n)?   #'                                                                 #
  puts '#====================================#'                                                                 #
  puts "#{answer}"                                                                                              #
  puts                                                                                                          #
  print '(y or n)? '                                                                                            #
  reply=gets.chomp                                                                                              #
  if reply=='y'                                                                                                 #
    puts '#================================================================#'                                   #
    puts '# enter the new answer then end with (.) on a line by itself     #'                                   #
    puts '# or (..) to redo the typing in case of typos:                   #'                                   #
    puts '#================================================================#'                                   #
    puts                                                                                                        #
    puts '(new answer?)'                                                                                        #
    line=gets                                                                                                   #
    while line!=".\n"                                                                                           #
      if line=="..\n"                                                                                           #
        line=''                                                                                                 #
        new_answer=''                                                                                           #
      end                                                                                                       #
      new_answer<<line                                                                                          #
      line=gets                                                                                                 #
    end                                                                                                         #
  else                                                                                                          #
    new_answer=answer                                                                                           #
  end                                                                                                           #
  return new_question,new_answer                                                                                #
end                                                                                                             #
#===============================================================================================================#




#===================#
# coding_test2_edit #
#===============================================================================================================#
# enables the editing of coding test 2 questions                                                                #
#                                                                                                               #
def coding_test2_edit(question,answer,choices)                                                                  #
  new_question=''                                                                                               #
  new_answer=''                                                                                                 #
  new_choices=''                                                                                                #
#                                                                                                               #
# get new choices                                                                                               #
#                                                                                                               #
  puts '#=====================================#'                                                                #   
  puts '# these are the old choices:          #'                                                                #
  puts '# do you want to edit it? (y or n)?   #'                                                                #
  puts '#=====================================#'                                                                #
  puts "#{choices}"                                                                                             #
  puts                                                                                                          #
  print '(y or n)? '                                                                                            #
  reply=gets.chomp                                                                                              #
  if reply=='y'                                                                                                 #
    puts '#================================================================#'                                   # 
    puts '# enter the new choices then end with (.) on a line by itself    #'                                   #
    puts '# or (..) to redo the typing in case of typos:                   #'                                   #
    puts '#================================================================#'                                   #
    puts                                                                                                        #
    puts '(new choices?)'                                                                                       #   
    line=gets                                                                                                   #
    while line!=".\n"                                                                                           #
      if line=="..\n"                                                                                           #
        line=''                                                                                                 #
        new_choices=''                                                                                          #
      end                                                                                                       #
      new_choices<<line                                                                                         #
      line=gets                                                                                                 #
    end                                                                                                         #
  else                                                                                                          #
    new_choices=choices                                                                                         #
  end                                                                                                           #      
#                                                                                                               #
# get new question                                                                                              #
#                                                                                                               #
  puts '#=====================================#'                                                                #
  puts '# this is the old question:           #'                                                                #
  puts '# do you want to edit it? (y or n)?   #'                                                                #
  puts '#=====================================#'                                                                #
  puts "#{question}"                                                                                            #
  puts                                                                                                          #
  print '(y or n)? '                                                                                            #
  reply=gets.chomp                                                                                              #
  if reply=='y'                                                                                                 #
    puts '#================================================================#'                                   #
    puts '# enter the new question then end with (.) on a line by itself   #'                                   #
    puts '# or (..) to redo the typing in case of typos:                   #'                                   #
    puts '#================================================================#'                                   #
    puts                                                                                                        #
    puts '(new question?)'                                                                                      #
    line=gets                                                                                                   #
    while line!=".\n"                                                                                           #
      if line=="..\n"                                                                                           #
        line=''                                                                                                 #
        new_question=''                                                                                         #
      end                                                                                                       #
      new_question<<line                                                                                        #
      line=gets                                                                                                 #
    end                                                                                                         #
  else                                                                                                          #
    new_question=question                                                                                       #
  end                                                                                                           #
#                                                                                                               #
# get new answer                                                                                                #
#                                                                                                               #
  puts '#====================================#'                                                                 #
  puts '# this is the old answer:            #'                                                                 #
  puts '# do you want to edit it (y or n)?   #'                                                                 #
  puts '#====================================#'                                                                 #
  puts "#{answer}"                                                                                              #
  puts                                                                                                          #
  print '(y or n)? '                                                                                            #
  reply=gets.chomp                                                                                              #
  if reply=='y'                                                                                                 #
    puts '#================================================================#'                                   #
    puts '# enter the new answer then end with (.) on a line by itself     #'                                   #
    puts '# or (..) to redo the typing in case of typos:                   #'                                   #
    puts '#================================================================#'                                   #
    puts                                                                                                        #
    puts '(new answer?)'                                                                                        #
    line=gets                                                                                                   #
    while line!=".\n"                                                                                           #
      if line=="..\n"                                                                                           #
        line=''                                                                                                 #
        new_answer=''                                                                                           #
      end                                                                                                       #
      new_answer<<line                                                                                          #
      line=gets                                                                                                 #
    end                                                                                                         #
  else                                                                                                          #
    new_answer=answer                                                                                           #
  end                                                                                                           #
  return new_question,new_answer,new_choices                                                                    #
end                                                                                                             #
#===============================================================================================================#




#===================#
# coding_test3_edit #
#===============================================================================================================#
# enables the editing of coding 3 test questions                                                                #
#                                                                                                               #
def coding_test3_edit(question,answers)                                                                         #
  new_question=''                                                                                               #
  new_answers=''                                                                                                #
#                                                                                                               #
# get new question                                                                                              #
#                                                                                                               #
  puts '#=====================================#'                                                                #
  puts '# this is the old question:           #'                                                                #
  puts '# do you want to edit it? (y or n)?   #'                                                                #
  puts '#=====================================#'                                                                #
  puts "#{question}"                                                                                            # 
  puts                                                                                                          #
  print '(y or n)? '                                                                                            #
  reply=gets.chomp                                                                                              #
  if reply=='y'                                                                                                 #
    puts '#================================================================#'                                   #
    puts '# enter the new question then end with (.) on a line by itself   #'                                   #
    puts '# or (..) to redo the typing in case of typos:                   #'                                   #
    puts '#================================================================#'                                   #
    puts                                                                                                        #
    puts '(new question?)'                                                                                      #
    line=gets                                                                                                   #
    while line!=".\n"                                                                                           #
      if line=="..\n"                                                                                           #
        line=''                                                                                                 #
        new_question=''                                                                                         #
      end                                                                                                       #
      new_question<<line                                                                                        #
      line=gets                                                                                                 #
    end                                                                                                         #
  else                                                                                                          # 
    new_question=question                                                                                       #
  end                                                                                                           #
#                                                                                                               #  
# get new answers                                                                                               #
#                                                                                                               #
  puts '#====================================#'                                                                 #
  puts '# these are the old answers:         #'                                                                 #
  puts '# do you want to edit it (y or n)?   #'                                                                 #
  puts '#====================================#'                                                                 #
  puts "#{answers}"                                                                                             #
  puts                                                                                                          #
  print '(y or n)? '                                                                                            #
  reply=gets.chomp                                                                                              #
  if reply=='y'                                                                                                 #
    puts '#================================================================#'                                   #
    puts '# enter the new answers then end with (.) on a line by itself    #'                                   #
    puts '# or (..) to redo the typing in case of typos:                   #'                                   #
    puts '#================================================================#'                                   #
    puts                                                                                                        #
    puts '(new answers?)'                                                                                       #
    line=gets                                                                                                   #
    while line!=".\n"                                                                                           #
      if line=="..\n"                                                                                           #
        line=''                                                                                                 #
        new_answers=''                                                                                          #
      end                                                                                                       #
      new_answers<<line                                                                                         #
      line=gets                                                                                                 #
    end                                                                                                         #
  else                                                                                                          #
    new_answers=answers                                                                                         #
  end                                                                                                           #
  return new_question,new_answers                                                                               #
end                                                                                                             #
#===============================================================================================================#




#===================#
# coding_test4_edit #
#===============================================================================================================#
# enables the editing of coding 4 test questions                                                                #
#                                                                                                               #
def coding_test4_edit(question,answer)                                                                          #
  new_question=''                                                                                               #
  new_answer=''                                                                                                 #
#                                                                                                               #
# get new question                                                                                              #
#                                                                                                               #
  puts '#=====================================#'                                                                #
  puts '# this is the old question:           #'                                                                #
  puts '# do you want to edit it? (y or n)?   #'                                                                #
  puts '#=====================================#'                                                                #
  puts "#{question}"                                                                                            # 
  puts                                                                                                          #
  print '(y or n)? '                                                                                            #
  reply=gets.chomp                                                                                              #
  if reply=='y'                                                                                                 #
    puts '#================================================================#'                                   #
    puts '# enter the new question then end with (.) on a line by itself   #'                                   #
    puts '# or (..) to redo the typing in case of typos:                   #'                                   #
    puts '#================================================================#'                                   #
    puts                                                                                                        #
    puts '(new question?)'                                                                                      #
    line=gets                                                                                                   #
    while line!=".\n"                                                                                           #
      if line=="..\n"                                                                                           #
        line=''                                                                                                 #
        new_question=''                                                                                         #
      end                                                                                                       #
      new_question<<line                                                                                        #
      line=gets                                                                                                 #
    end                                                                                                         #
  else                                                                                                          # 
    new_question=question                                                                                       #
  end                                                                                                           #
#                                                                                                               #  
# get new answers                                                                                               #
#                                                                                                               #
  puts '#====================================#'                                                                 #
  puts '# these are the old answers:         #'                                                                 #
  puts '# do you want to edit it (y or n)?   #'                                                                 #
  puts '#====================================#'                                                                 #
  puts "#{answer}"                                                                                              #
  puts                                                                                                          #
  print '(y or n)? '                                                                                            #
  reply=gets.chomp                                                                                              #
  if reply=='y'                                                                                                 #
    puts '#================================================================#'                                   #
    puts '# enter the new answer  then end with (.) on a line by itself    #'                                   #
    puts '# or (..) to redo the typing in case of typos:                   #'                                   #
    puts '#================================================================#'                                   #
    puts                                                                                                        #
    puts '(new answer?)'                                                                                        #
    line=gets                                                                                                   #
    while line!=".\n"                                                                                           #
      if line=="..\n"                                                                                           #
        line=''                                                                                                 #
        new_answer=''                                                                                           #
      end                                                                                                       #
      new_answer<<line                                                                                          #
      line=gets                                                                                                 #
    end                                                                                                         #
  else                                                                                                          #
    new_answer=answer                                                                                           #
  end                                                                                                           #
  return new_question,new_answer                                                                                #
end                                                                                                             #
#===============================================================================================================#




#==========================#
# reformat_multiple_choice #
#===============================================================================================================#
# takes the new data for the edited multiple choice question and creates a program that can be run by           #
# the drills program to replace the original question                                                           #
#                                                                                                               #
def reformat_multiple_choice(new_question,new_answer,new_answers,drill_string,header_string) #==================#
  q_part1=<<-STRING1                                                                                            
  rolling_count+=1                                                                                              
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
  STRING1
  q_part2=<<-STRING1
    STRING
    answer=
  STRING1
  q_part3=<<-STRING1
    answers=<<-STRING
  STRING1
  q_part4=<<-STRING1
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end
  STRING1
  multiple_choice_question='' #=================================================================================#
  multiple_choice_question<<drill_string+header_string+q_part1<<new_question                                    #                   
  multiple_choice_question<<q_part2.chomp<<new_answer.chomp+"\n"<<q_part3                                       #
  new_answer.slice!(0)                                                                                          #
  new_answer.slice!(/'/)                                                                                        #
  new_answer.slice!("\n")                                                                                       #
  multiple_choice_question<<new_answer+"\n"<<new_answers<<q_part4+"\n"                                          #
  return multiple_choice_question                                                                               #
end                                                                                                             #
#===============================================================================================================#




#=======================#
# reformat_coding_test1 #
#===============================================================================================================#
# takes the new data for the edited coding test question and creates a program that can be run by               #
# the drills program to replace the original question                                                           #
#                                                                                                               #
def reformat_coding_test1(new_question,new_answer,drill_string,header_string) #=================================#
  q_part1=<<-STRING1
  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
  STRING1
  q_part2=<<-STRING1
    STRING
    answer=<<-STRING
  STRING1
  q_part3=<<-STRING1
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end
  STRING1
  coding_question='' #==========================================================================================#
  coding_question<<drill_string+header_string+q_part1<<new_question<<q_part2<<new_answer<<q_part3+"\n"          #
  coding_question.gsub!("\#{","\\\#{")                                                                          #
  return coding_question                                                                                        #
end                                                                                                             #
#===============================================================================================================#




#=======================#
# reformat_coding_test2 #
#===============================================================================================================#
# takes the new data for the edited coding testII question and creates a program that can be run by             #
# the drills program to replace the original question                                                           #
#                                                                                                               #
def reformat_coding_test2(new_question,new_answer,drill_string,header_string,choices) #=========================#
  q_part1=<<-STRING1
  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
  STRING1
  q_part2=<<-STRING1
    choices=<<-RSTRING
  STRING1
  q_part3=<<-STRING1
    RSTRING
  STRING1
  q_part4=<<-STRING1
    question_string=<<-RSTRING
    STRING1
  q_part5=<<-STRING1
  RSTRING
  STRING1
  q_part6=<<-STRING1
    answer=<<-RSTRING
  STRING1
  q_part7=<<-STRING1
  RSTRING
  result,drill_status=coding_test2(question_string,answer,result,random_question,questions_to_go,drill_status,choices)
  end
  STRING1
  coding_question='' #==========================================================================================#
  coding_question<<drill_string+header_string+q_part1<<q_part2<<choices<<q_part3<<q_part4<<new_question<<q_part5#
  coding_question<<q_part6<<new_answer<<q_part7+"\n"                                                            #
  coding_question.gsub!("\#{","\\\#{")                                                                          #
  return coding_question                                                                                        #
end                                                                                                             #
#===============================================================================================================#




#=======================#
# reformat_coding_test3 #
#===============================================================================================================#
# takes the new data for the edited coding test question and creates a program that can be run by               #
# the drills program to replace the original question                                                           #
#                                                                                                               #
def reformat_coding_test3(new_question,new_answers,drill_string,header_string) #================================#
  q_part1=<<-STRING1
  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
  STRING1
  q_part2=<<-STRING1
    STRING
    answers=<<-STRING
  STRING1
  q_part3=<<-STRING1
    STRING
    result,drill_status=coding_test3(question_string,answers,result,random_question,questions_to_go,drill_status)
end
  STRING1
  coding_question='' #==========================================================================================#
  coding_question<<drill_string+header_string+q_part1<<new_question<<q_part2<<new_answers<<q_part3+"\n"         #
  coding_question.gsub!("\#{","\\\#{")                                                                          #
  return coding_question                                                                                        #
end                                                                                                             #
#===============================================================================================================#




#=======================#
# reformat_coding_test4 #
#===============================================================================================================#
# takes the new data for the edited coding test question and creates a program that can be run by               #
# the drills program to replace the original question                                                           #
#                                                                                                               #
def reformat_coding_test4(new_question,new_answer,drill_string,header_string) #=================================#
  q_part1=<<-STRING1
  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
  STRING1
  q_part2=<<-STRING1
    STRING
    program_string=<<-STRING
  STRING1
  q_part3=<<-STRING1
    STRING
    result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,program_string)
end
  STRING1
  coding_question='' #==========================================================================================#
  coding_question<<drill_string+header_string+q_part1<<new_question<<q_part2<<new_answer<<q_part3+"\n"          #
  coding_question.gsub!("\#{","\\\#{")                                                                          #
  return coding_question                                                                                        #
end                                                                                                             #
#===============================================================================================================#




#==============================#
# setup_temp_with_edited_drill #
#===============================================================================================================#
# sets up a temporary file with the new edited drill before editing the actual drill                            #
#                                                                                                               #
def setup_temp_with_edited_drill(question_num,new_question_format,drill,folder)                                 #
  count=0                                                                                                       #
#                                                                                                               #  
# open temp file for writing                                                                                    #
#                                                                                                               #
  file_temp=File.open('temp','w')                                                                               #
#                                                                                                               #  
# open drill for reading                                                                                        #
#                                                                                                               #
  file_drill=File.open("#{PATH}#{folder}/#{drill}",'r')                                                         #
#                                                                                                               #  
# read file and write to temp until question is reached.                                                        #
#                                                                                                               #   
  while !file_drill.eof?                                                                                        #
    line=file_drill.readline                                                                                    #
    count+=1 if line.include?('#>>')                                                                            #
    break if count==question_num                                                                                #
    file_temp<<line                                                                                             #
  end                                                                                                           #
#                                                                                                               #  
# read till end of question                                                                                     #
#                                                                                                               #
  while !file_drill.eof?                                                                                        #
    line=file_drill.readline                                                                                    #
    break if line.include?('#>>')                                                                               #
    break if line.include?('#----------------------------')                                                     #
  end                                                                                                           #
#                                                                                                               #  
# write new question to temp from memory                                                                        #
#                                                                                                               #
  file_temp.print new_question_format                                                                           #
  file_temp<<line                                                                                               #
#                                                                                                               #  
# write the rest of the drill to temp                                                                           #
#                                                                                                               #
  while !file_drill.eof?                                                                                        #
    line=file_drill.readline                                                                                    #
    file_temp<<line                                                                                             #
  end                                                                                                           #
#                                                                                                               #   
# close files                                                                                                   #
#                                                                                                               #                        
  file_temp.close                                                                                               #
  file_drill.close                                                                                              #
end                                                                                                             #
#===============================================================================================================#




#==================#
# over_write_drill #
#===============================================================================================================#
# writes over the orginal drill with the new edited question                                                    #
#                                                                                                               #
def over_write_drill(folder,drill)                                                                              #
#                                                                                                               #  
# open drill for writing                                                                                        #
#                                                                                                               #
  file_drill=File.open("#{PATH}#{folder}/#{drill}",'w')                                                         #
#                                                                                                               #  
# open temp for reading                                                                                         #
#                                                                                                               #
  file_temp=File.open('temp','r')                                                                               #
#                                                                                                               #
# read temp file and save to drill                                                                              #
#                                                                                                               #
  while !file_temp.eof?                                                                                         #
    line=file_temp.readline                                                                                     #
    file_drill<<line                                                                                            #
  end                                                                                                           #
#                                                                                                               #
# close files                                                                                                   #
#                                                                                                               #
  file_drill.close                                                                                              #
  file_temp.close                                                                                               #
end                                                                                                             #
#===============================================================================================================#




#==================#
# over_write_drill #
#===============================================================================================================#
# clears out the temp file                                                                                      #
#                                                                                                               #
def clear_temp_file()                                                                                           #
#                                                                                                               #  
# open temp file for writing                                                                                    #
#                                                                                                               #
  file_temp=File.open('temp','w')                                                                               #
#                                                                                                               #  
# close temp file                                                                                               #
#                                                                                                               #
  file_temp.close                                                                                               #
end                                                                                                             #
#===============================================================================================================#




##################################################################################################################
# main program                                                                                                   #
##################################################################################################################
puts 'this program is for editing the daily new drills not the regular drills.'                                  #
puts 'please use the drill editor for that.'                                                                     #
puts                                                                                                             #
#                                                                                                                #
# what file needs to be opened up for editing?                                                                   #
#                                                                                                                #
drill='daily_new.rb'                                                                                             #
#                                                                                                                #
# what is the question number that has the error?                                                                #
#                                                                                                                #                                                                                                               
print 'which question number to be edited in the daily_new? '                                                    #
question_num=gets.to_i                                                                                           #
#                                                                                                                #
# get folder to open                                                                                             #
#                                                                                                                #
folder='98 daily_new'                                                                                            #
#                                                                                                                #                                                                                                               
# capture the question                                                                                           #
#                                                                                                                #
captured_string=open_drill_and_capture_question(drill,question_num,folder)                                       # 
#                                                                                                                #
# save captured string to file                                                                                   #
#                                                                                                                #
file_temp=File.open('temp','w')                                                                                  #
file_temp.print captured_string                                                                                  #
file_temp.close                                                                                                  #
#                                                                                                                #
# read string and find out what kind of question it is                                                           #
# break down to get the individual parts (questions,answers,drill_string,and header_string)                      #
#                                                                                                                #
if captured_string.include?('multiple_choice')                                                                   #
  question,answer,answers,drill_string,header_string=multiple_choice_break_down()                                #
elsif captured_string.include?('coding_test1')                                                                   #
  question,answer,drill_string,header_string=coding_test1_break_down()                                           #
elsif captured_string.include?('coding_test2')                                                                   #
  question,answer,drill_string,header_string,choices=coding_test2_break_down()                                   #
elsif captured_string.include?('coding_test3')                                                                   #
  question,answers,drill_string,header_string=coding_test3_break_down()                                          #
elsif captured_string.include?('coding_test4')                                                                   #
  question,answer,drill_string,header_string=coding_test4_break_down()                                           # 
end                                                                                                              #
#                                                                                                                #
# check if drill_string or header_string needs editing                                                           #
# then edit if necessary                                                                                         #
#                                                                                                                #
drill_string,header_string=drill_and_header_edit(drill_string,header_string)                                     #
#                                                                                                                #
# read string and find out what kind of question it is                                                           #
# send break down for editing                                                                                    #
#                                                                                                                #
if captured_string.include?('multiple_choice')                                                                   #
  new_question,new_answer,new_answers=multiple_choice_edit(question,answer,answers)                              #
elsif captured_string.include?('coding_test1')                                                                   #
  new_question,new_answer=coding_test1_edit(question,answer)                                                     #
elsif captured_string.include?('coding_test2')                                                                   #
  new_question,new_answer,new_choices=coding_test2_edit(question,answer,choices)                                 #
elsif captured_string.include?('coding_test3')                                                                   #
  new_question,new_answers=coding_test3_edit(question,answers)                                                   #
elsif captured_string.include?('coding_test4')                                                                   #
  new_question,new_answer=coding_test4_edit(question,answer)                                                     # 
end                                                                                                              #
#                                                                                                                #
# reformat the break down into a new question and hold in memory                                                 #
#                                                                                                                #
if captured_string.include?('multiple_choice')                                                                   #
  new_question_format=reformat_multiple_choice(new_question,new_answer,new_answers,drill_string,header_string)   #
elsif captured_string.include?('coding_test1')                                                                   #
  new_question_format=reformat_coding_test1(new_question,new_answer,drill_string,header_string)                  #
elsif captured_string.include?('coding_test2')                                                                   #
  new_question_format=reformat_coding_test2(new_question,new_answer,drill_string,header_string,new_choices)      #
elsif captured_string.include?('coding_test3')                                                                   #
  new_question_format=reformat_coding_test3(new_question,new_answers,drill_string,header_string)                 #
elsif captured_string.include?('coding_test4')                                                                   #
  new_question_format=reformat_coding_test4(new_question,new_answer,drill_string,header_string)                  #
end                                                                                                              #
#                                                                                                                #
setup_temp_with_edited_drill(question_num,new_question_format,drill,folder)                                      #
over_write_drill(folder,drill)                                                                                   #
clear_temp_file()                                                                                                # 
#================================================================================================================#
