##################################################################################################################
#                                                                                                                #
# Program:......................files.rb                                                                         #
# Programmer:...................Harold Sy                                                                        #
# Description:..................this program allows me to review my knowledge of the ruby programming language   #
#                               similar to how I practice katas for my martial arts class.                       #
# Kata subject..................ruby programming language:                                                       #
# Programmed:...................11/16/2017                                                                       #
# Last modified:................05/20/2024                                                                       #
# Modification notes:...........* 12/22/2017 program now displays the question number for editing purposes as    #
#                                 typos and formatting issues were found during run time and the size of the     #
#                                 program had grown too large.                                                   #
#                               * 01/06/2018 program now displays the number of questions to go because at times #
#                                 the drills seem to go on forever.                                              #
#                               * 04/15/2018 program now performs rolling count of questions as the program runs #
#                                 to help with moving questions around or deleting redundant questions.          #
#                               * 04/16/2018 program now has headers that groups the questions in the program for#
#                                 easier editing of redundant questions and for grouping.                        #
#                               * 07/02/2018 program now checks the question count against the number of actual  #
#                                 questions during the beginning run of the program as some questions were not   #
#                                 being drilled because the question count did not match up.                     #
#                               * 07/22/2018 program now uses 'heredoc' to handle multiline strings.             #
#                                 unfortunately 'heredoc' has some bad alignment issues on the source code but it#
#                                 makes entering in questions and answers easier for fast upgrades. also I       #
#                                 decided to try and alphabetize the questions according to subject so that it   #
#                                 is easier to update.                                                           #
#                               * 08/21/2018 added header list for easy reference of drill content.              #
#                               * 08/21/2018 added the ability to save questions into a file so that the drill   #
#                                 could be continued later on without restarting. this ability is more useful    #
#                                 for the larger programs with more than 100 questions.                          #
#                               * 09/02/2018 added the ability to type in a program that the user can review and #
#                                 retype if there are any errors because most of the errors in the coding test   #
#                                 occur as typos                                                                 #
#                               * 09/05/2018 added the ability to save missed questions into a question file     #
#                                 for transfer into the daily drills                                             #
#                               * 05/04/2019 added the ability for the program to update the DRILLS file that I  #
#                                 use to keep track of how many times I drill the materials. It is a text file   #
#                                 that these two methods updates when 1.the drill is exited early or 2.when the  #
#                                 drill is completed.                                                            #
#                               * 08/20/2019 added more information onto the DRILLS marked as working and done.  #
#                                 now the lines contain the number of questions to go and the current date.      #
#                               * 09/24/2019 added the ability to enter a program and have the interpreter run   #
#                                 it to come up with the answers that the user has to compare and mark if they   #
#                                 are right or wrong.                                                            #
#                               * 02/18/2020 programming II type questions have a tendency to crash when an error#
#                                 occurs in the source code that was typed in. exception handling had to be added#
#                                 to prevent the program from crashing.                                          #
#                               * 02/16/2021 removed 1 redundant variable and 1 unused variable. also            # 
#                                 reformatted for upgrading to a new text file format and for refactoring to     #
#                                 python.                                                                        #
#                               * 02/26/2021 added some variations for coding type questions which now number    #
#                                 from I to IV.                                                                  #
#                               * 04/14/2022 modified some lines to handle the new inventory list formatting.    #
#                               * 05/17/2022 added lines to process marks on the ProLanIn.txt (Programming       #
#                                 Language Inventory text file) to show when num of quest are added and when     #
#                                 missed goes up or down or stays the same to help track my progress.            #
#                               * 06/30/2022 added lines to calculate a letter grade to the drill for easy       #
#                                 assessment of my progress.                                                     #
#                               * 07/09/2022 modified the type 4 questions to take a string for the answer and   #
#                                 compare it to the user's answer. This mod is only for programming languages    #
#                                 using this ruby version of the program. I was hoping in the future to refactor #
#                                 the program for python (write it in python).                                   #
#                               * 05/20/2024 changed DRILLS_TEXT_FILE so that the ruby dojo programs can access  #
#                                 the text file for updating the records so that I can include this in my        #
#                                 gitHub.                                                                        #
#                                                                                                                #
##################################################################################################################
##                    header list:                                                                              ##
#                                 accessing files                                                                #
#                                 atime method                                                                   #
#                                 close method                                                                   #
#                                 ctime method                                                                   #
#                                 delete method                                                                  #
#                                 directory? method                                                              #
#                                 each method                                                                    #
#                                 eof? method                                                                    #
#                                 executable? method                                                             #
#                                 exist? or exists? method                                                       #
#                                 file mode                                                                      #
#                                 file? method                                                                   #
#                                 ftype method                                                                   #
#                                 general files                                                                  #
#                                 getc method                                                                    #
#                                 mtime method                                                                   #
#                                 new file                                                                       #
#                                 open method                                                                    #
#                                 print method                                                                   #
#                                 puts method                                                                    #
#                                 read method                                                                    #
#                                 readline method                                                                #
#                                 readlines method                                                               #
#                                 rename method                                                                  #
#                                 rewind method                                                                  #
#                                 size method                                                                    #
#                                 writable? method                                                               #
#                                 write method                                                                   #
#                                 zero? method                                                                   #
#                                 << method                                                                      #
##################################################################################################################



##################################################################################################################
# global variables                                                                                               #
##################################################################################################################
TITLE=                'files'                                                  # title for header
MISSED_QUESTIONS_FILE='../00 Tools/01 missed_questions/missed_questions'       # file containing missed questions
DRILLS_TEXT_FILE=     '../text_files/ProLanInv.txt'                            # text file to record drills metrics
DRILL_NAME=           '22 files'                                               # name of this drill
SAVED_DRILL_FILE=     'questions_file'                                         # file containing continued drill information
LANDMARK=             "HAROLDS RUBY INVENTORY"                                 # text to search for to begin processing




##################################################################################################################
# programmer created methods                                                                                     #
##################################################################################################################




#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# pause output for the user to read <
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# notes: pauses the screen until return is entered                                                               #
#                                                                                                                #
# variables used:                                                                                                #
#    none                                                                                                        #
#                                                                                                                #
def pause_output                                                                                                 #
    wait=gets                                                                                                    #
end                                                                                                              #
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#




#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# print one line spacing            <
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# notes prints a single line                                                                                     #
#                                                                                                                #
# variables used:                                                                                                #
#    none                                                                                                        #
#                                                                                                                #  
def print_one_space                                                                                              #
    puts                                                                                                         #
end                                                                                                              #
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#    




#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# print two line spacing            <
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# notes prints two lines                                                                                         #
#                                                                                                                #
# variables used:                                                                                                #
#    none                                                                                                        # 
#                                                                                                                #   
def print_two_spaces                                                                                             #
  puts                                                                                                           #
  puts                                                                                                           #
end                                                                                                              #
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#




#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# process multiple choice questions <
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# notes: processes questions that are multiple choice                                                            #
#                                                                                                                #
# variables used:                                                                                                #
#    answer ............... [passed] correct answer changed to correct letter                                    #
#    answers .............. [passed] multiline string list of multiple choice questions changed to array         #
#    random_question ...... [passed] current question number                                                     #
#    questions_to_go ...... [passed] count of how many questions to go                                           #
#    question_string ...... [passed] actual question                                                             #
#    result ............... [passed] (returned) number of missed questions                                       #
#    drill_status ......... [passed] (returned) checking for exit program status                                 #
#    answer_string ........ correct answer                                                                       #
#    answers_string ....... list of multiple choice questions as a string                                        #
#    valid_answers ........ list of valid letters for multiple choice answers                                    #
#    user answer .......... user provided answer                                                                 #
#    save_question ........ missed question as multiline string for saving                                       #
#    MISSED_QUESTIONS_FILE. global variable for missed questions file name                                       #
#                                                                                                                #   
#########################################                                                                        #
# multiple choice type question format  #                                                                        #
#########################################<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#  
#   rolling_count+=1                                                                                             #
#   if random_question==rolling_count                                                                            #
#..............................................................................                                  #
#     question_string=<<-STRING                                                                                  #
#     STRING                                                                                                     #
#     answer='yes'                                                                                               #
#     answers=<<-STRING                                                                                          #
#     STRING                                                                                                     #
#     result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
#   end                                                                                                          #
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#
#                                                                                                                #
#                                                                                                                #
#                                                                                                                #
# process multiple choice question:                                                                              #
#                                                                                                                #
def multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)          #
    answer_string=answer                                                                                         #
    answers_string=answers                                                                                       #
    answers=answers.split("\n")                                                                                  #
    answers.shuffle!                                                                                             #
    valid_answers=%w(a b c d x)                                                                                  #
#                                                                                                                #    
# print metrics                                                                                                  #
#                                                                                                                #
    puts "question number #{random_question}"                                                                    #
    puts "questions to go #{questions_to_go}"                                                                    #
    print_one_space()                                                                                            #
#                                                                                                                #
# print question                                                                                                 #
#                                                                                                                #
    puts question_string                                                                                         #
    print_one_space()                                                                                            #
#                                                                                                                #
# check for correct answer while printing out random questions                                                   #
#                                                                                                                #
    puts "  a.) #{answers[0]}"                                                                                   #
    answer='a' if answers[0]==answer                                                                             #
    puts "  b.) #{answers[1]}"                                                                                   #
    answer='b' if answers[1]==answer                                                                             #
    puts "  c.) #{answers[2]}"                                                                                   #
    answer='c' if answers[2]==answer                                                                             #
    puts "  d.) #{answers[3]}"                                                                                   #
    answer='d' if answers[3]==answer                                                                             #
    puts '  x.) exit'                                                                                            #
#                                                                                                                #
# get user answer                                                                                                #
#                                                                                                                #
    print_one_space                                                                                              #
    user_answer=gets.chomp                                                                                       #
#                                                                                                                #
# process user answer if 'x' was entered                                                                         #
#                                                                                                                #
    if user_answer=='x'                                                                                          #
      drill_status='exit'                                                                                        #
      return result,drill_status                                                                                 #
    end                                                                                                          #
#                                                                                                                #
# ask for a letter while answer is invalid                                                                       #
#                                                                                                                #
    while !valid_answers.include?(user_answer)                                                                   #
      puts 'please choose a letter'                                                                              #
      user_answer=gets.chomp                                                                                     #
    end                                                                                                          #
#                                                                                                                #    
# process answer if correct                                                                                      #
#                                                                                                                #
    if user_answer==answer                                                                                       #
      puts '#=> right'                                                                                           #
#                                                                                                                #    
# process answer if incorrect, saving missed question into questions file!                                       #
#                                                                                                                #
    else                                                                                                         #
      puts "#=> wrong, the answer is: #{answer}"                                                                 #
      result+=1 #<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#
      save_question=<<-QSTRING                                                                                   
rolling_count+=1                                                                                           
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
#{question_string} RSTRING
   answer="#{answer_string}"
   answers=<<-RSTRING
#{answers_string} RSTRING
   result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end
  
      QSTRING
      file=File.open(MISSED_QUESTIONS_FILE,'a')#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#
      file.print save_question                                                                                   #
      file.close                                                                                                 #
    end                                                                                                          #
    print_two_spaces()                                                                                           #
    return result,drill_status                                                                                   #
end                                                                                                              #
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#



  
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# process coding test type 1 questions <
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# notes: processes test type 1 question that compares string for string and must be exact to be correct also     #
#        can handle true or false questions.                                                                     #
#                                                                                                                #
# variables used:                                                                                                #
#    question_string ...... [passed] actual question                                                             #                                         
#    answer ............... [passed] correct answer                                                              #
#    random_question ...... [passed] current question number                                                     #
#    questions_to_go ...... [passed] count of how many questions to go                                           #
#    result ............... [passed] (returned) number of missed questions                                       # 
#    drill_status ......... [passed] (returned) checking for exit program status                                 #
#    line ................. user typed single line of text                                                       #
#    input_string ......... concatenated user typed lines                                                        #
#    status ............... answer to question status if it is right or wrong                                    #
#    save_question ........ missed question as multiline string for saving                                       #
#    MISSED_QUESTIONS_FILE. global variable for missed questions file name                                       #
#                                                                                                                #
#                                                                                                                #  
#######################################                                                                          #
# coding test type 1 question format  #                                                                          #
#####################################<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#
#   rolling_count+=1                                                                                             #
#   if random_question==rolling_count                                                                            #
#..............................................................................                                  #
#     question_string=<<-STRING                                                                                  #
#     STRING                                                                                                     #
#     answer=<<-STRING                                                                                           #
#     STRING                                                                                                     #
#     result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
#   end                                                                                                          #
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#
#                                                                                                                #
# processing coding test type questions that compare two strings for exactness                                   #
#                                                                                                                # 
def coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)                     #
                                                                                                                 #
    line=''                                                                                                      #
    input_string=''                                                                                              #
    status='right'                                                                                               #
    puts "question number #{random_question}"                                                                    #
    puts "questions to go #{questions_to_go}"                                                                    #
    print_one_space()                                                                                            #
    puts question_string                                                                                         #
    print_one_space()                                                                                            #
#                                                                                                                #
# get a line of text from the user until a newline is entered by iteself                                         #
#                                                                                                                #
    until line==".\n"                                                                                            #
      line=gets                                                                                                  #
#                                                                                                                #
# allow the re-entering of code when .. and a newline by itself is entered                                       #
#                                                                                                                #
      if line=="..\n"                                                                                            #
        print_two_spaces()                                                                                       #                                                                                                     #
        input_string=''                                                                                          #
        line=''                                                                                                  #
      end                                                                                                        #
#                                                                                                                #
# exit and save the program if an 'x' is entered in                                                              #
#                                                                                                                #
      break if line=="x\n"                                                                                       #
      input_string<<line if line!=".\n"                                                                          #
    end                                                                                                          #
    if line=="x\n"                                                                                               #
      drill_status='exit'                                                                                        #
      return result,drill_status                                                                                 #
    end                                                                                                          #
#                                                                                                                #
# if answer entered is incorrect then process and save question to questions file                                #
#                                                                                                                #
    if answer!=input_string                                                                                      #
      print_one_space()                                                                                          #
      puts '#=> wrong, the answer is:'                                                                           #
      print_one_space()                                                                                          #
      puts answer                                                                                                #
      status='wrong'                                                                                             #
      result+=1 #<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#
      save_question=<<-QSTRING
rolling_count+=1
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
#{question_string} RSTRING
   answer=<<-RSTRING
#{answer} RSTRING
   result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end
  
      QSTRING
      save_question.gsub!("\#{","\\\#{")
      file=File.open(MISSED_QUESTIONS_FILE,'a')#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#
      file.print save_question                                                                                   #
      file.close                                                                                                 #
    end                                                                                                          #
#                                                                                                                #
# process if answer is correct                                                                                   #
#                                                                                                                #
    puts '#=> right'  if status=='right'                                                                         #
    print_two_spaces()                                                                                           #
    return result,drill_status                                                                                   #
end                                                                                                              #
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#



#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# process coding test type 2 questions  <
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# notes: processes test type II questions that compares string for string and must be exact to be correct and    #
#        can handle two correct answers.                                                                         #
#                                                                                                                #
# variables used:                                                                                                #
#    choices .............. [passed] different choices in a string                                               #
#    question_string ...... [passed] actual question                                                             #                                         
#    answer ............... [passed] correct answer                                                              #
#    random_question ...... [passed] current question number                                                     #
#    questions_to_go ...... [passed] count of how many questions to go                                           #
#    result ............... [passed] (returned) number of missed questions                                       # 
#    drill_status ......... [passed] (returned) checking for exit program status                                 #
#    delimit1 ............. first answer choice                                                                  #
#    delimit2 ............. second answer choice                                                                 #
#    line ................. user typed single line of text                                                       #
#    input_string ......... concatenated user typed lines                                                        #
#    status ............... answer to question status if it is right or wrong                                    #
#    save_question ........ missed question as multiline string for saving                                       #
#    MISSED_QUESTIONS_FILE. global variable for missed questions file name                                       #
#                                                                                                                #
#                                                                                                                #  
#######################################                                                                          #
# coding test type 2 question format  #                                                                          #
#####################################<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#
#   rolling_count+=1                                                                                             #
#   if random_question==rolling_count                                                                            #
#..............................................................................                                  #
#     choices=<<-STRING                                                                                          #
#     STRING                                                                                                     #  
#     question_string=<<-STRING                                                                                  #
#     STRING                                                                                                     #
#     answer=<<-STRING                                                                                           #
#     STRING                                                                                                     #
#     result,drill_status=coding_test2(question_string,answer,result,random_question,questions_to_go,drill_status,choices)
#   end                                                                                                          #
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#
#                                                                                                                #
# processing coding test type 2 questions that compare two strings for exactness and can take two correct        #
# answers                                                                                                        #
#                                                                                                                # 
def coding_test2(question_string,answer,result,random_question,questions_to_go,drill_status,choices)             #
                                                                                                                 #
  line=''                                                                                                        #
  input_string=''                                                                                                #
  status='right'                                                                                                 #
  puts "question number #{random_question}"                                                                      #
  puts "questions to go #{questions_to_go}"                                                                      #
  print_one_space()                                                                                              #
  delimit_string=choices.split("\n").shuffle.shift                                                               #
  delimit1,delimit2=delimit_string.split('').pop(2)                                                              #
  question_string.gsub!('delimit1',delimit1)                                                                     #
  question_string.gsub!('delimit2',delimit2)                                                                     # 
  puts question_string                                                                                           #
  print_one_space()                                                                                              #
#                                                                                                                #
# get a line of text from the user until a newline is entered by iteself                                         #
#                                                                                                                #
  until line==".\n"                                                                                              #
  line=gets                                                                                                      #
#                                                                                                                #
# allow the re-entering of code when .. and a newline by itself is entered                                       #
#                                                                                                                #
    if line=="..\n"                                                                                              #
      print_two_spaces()                                                                                         #                                                                                            
      input_string=''                                                                                            #
      line=''                                                                                                    #
    end                                                                                                          #
#                                                                                                                #
# exit and save the program if an 'x' is entered in                                                              #
#                                                                                                                #
    break if line=="x\n"                                                                                         #
    input_string<<line if line!=".\n"                                                                            #
  end                                                                                                            #
  if line=="x\n"                                                                                                 #
    drill_status='exit'                                                                                          #
    return result,drill_status                                                                                   #
  end                                                                                                            #
#                                                                                                                #
# if answer entered is incorrect then process and save question to questions file                                #
#                                                                                                                #
  answer.gsub!('delimit1',delimit1)                                                                              #
  answer.gsub!('delimit2',delimit2)                                                                              #
  if answer!=input_string                                                                                        #
    print_one_space()                                                                                            #
    puts '#=> wrong, the answer is:'                                                                             #
    print_one_space()                                                                                            #
    puts answer                                                                                                  #
    status='wrong'                                                                                               #
    result+=1 #<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#
save_question=<<-QSTRING
rolling_count+=1
if random_question==rolling_count
#..............................................................................
   choices=<<-RSTRING
#{choices} RSTRING  
   question_string=<<-RSTRING
#{question_string} RSTRING
   answer=<<-RSTRING
#{answer} RSTRING
   result,drill_status=coding_test2(question_string,answer,result,random_question,questions_to_go,drill_status,choices)
end

QSTRING
  save_question.gsub!("\#{","\\\#{")
    file=File.open(MISSED_QUESTIONS_FILE,'a')#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#
    file.print save_question                                                                                     #
    file.close                                                                                                   #
  end                                                                                                            #
#                                                                                                                #
# process if answer is correct                                                                                   #
#                                                                                                                #
  puts '#=> right'  if status=='right'                                                                           #
  print_two_spaces()                                                                                             #
  return result,drill_status                                                                                     #
end                                                                                                              #
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#



#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# process coding test type 3 questions   <
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# notes: processes test type III questions that compares string for string and must be exact to be correct. can  #
#        also handle multiple correct answers.                                                                   #
#                                                                                                                #
# variables used:                                                                                                #
#    question_string ...... [passed] actual question                                                             #                                         
#    answer ............... [passed] correct answer                                                              #
#    random_question ...... [passed] current question number                                                     #
#    questions_to_go ...... [passed] count of how many questions to go                                           #
#    result ............... [passed] (returned) number of missed questions                                       # 
#    drill_status ......... [passed] (returned) checking for exit program status                                 #
#    line ................. user typed single line of text                                                       #
#    input_string ......... concatenated user typed lines                                                        #
#    status ............... answer to question status if it is right or wrong                                    #
#    save_question ........ missed question as multiline string for saving                                       #
#    MISSED_QUESTIONS_FILE. global variable for missed questions file name                                       #
#                                                                                                                #
#                                                                                                                #  
########################################                                                                         #
# coding test type 3 question format   #                                                                         #
#####################################<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#
#   rolling_count+=1                                                                                             #
#   if random_question==rolling_count                                                                            #
#..............................................................................                                  #
#     question_string=<<-STRING                                                                                  #
#     STRING                                                                                                     #
#     answers=<<-STRING                                                                                          #
#     STRING                                                                                                     #
#     result,drill_status=coding_test3(question_string,answers,result,random_question,questions_to_go,drill_status)
#   end                                                                                                          #
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#
#                                                                                                                #
# processing coding test type 3 questions that compare two strings for exactness and can take multiple answers   #
#                                                                                                                # 
def coding_test3(question_string,answers,result,random_question,questions_to_go,drill_status)                    #
                                                                                                                 #
  line=''                                                                                                        #
  input_string=''                                                                                                #
  status='right'                                                                                                 #
  puts "question number #{random_question}"                                                                      #
  puts "questions to go #{questions_to_go}"                                                                      #
  print_one_space()                                                                                              #
  puts question_string                                                                                           #
  print_one_space()                                                                                              #
#                                                                                                                #
# get a line of text from the user until a newline is entered by iteself                                         #
#                                                                                                                #
  until line==".\n"                                                                                              #
    line=gets                                                                                                    #
#                                                                                                                #
# allow the re-entering of code when .. and a newline by itself is entered                                       #
#                                                                                                                #
    if line=="..\n"                                                                                              #
      print_two_spaces()                                                                                         #                                                                                    
      input_string=''                                                                                            #
      line=''                                                                                                    #
    end                                                                                                          #
#                                                                                                                #
# exit and save the program if an 'x' is entered in                                                              #
#                                                                                                                #
    break if line=="x\n"                                                                                         #
    input_string<<line if line!=".\n"                                                                            #
  end                                                                                                            #
  if line=="x\n"                                                                                                 #
    drill_status='exit'                                                                                          #
    return result,drill_status                                                                                   #
  end                                                                                                            #
#                                                                                                                #
# if answer entered is incorrect then process and save question to questions file                                #
#                                                                                                                #
  answers=answers.split("\n")                                                                                    #
  if !answers.include?(input_string.chomp)                                                                       #
    print_one_space()                                                                                            #
    puts '#=> wrong, the answer could be any of these:'                                                          #
    print_one_space()                                                                                            #
    answers=answers.join("\n")                                                                                   #
    puts answers                                                                                                 #
    status='wrong'                                                                                               #
    result+=1 #<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#
save_question=<<-QSTRING
rolling_count+=1
if random_question==rolling_count
#..............................................................................
question_string=<<-RSTRING
#{question_string} RSTRING
answers=<<-RSTRING
#{answers} RSTRING
result,drill_status=coding_test3(question_string,answers,result,random_question,questions_to_go,drill_status)
end

QSTRING
    save_question.gsub!("\#{","\\\#{")
    file=File.open(MISSED_QUESTIONS_FILE,'a')#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#
    file.print save_question                                                                                     #
    file.close                                                                                                   #
  end                                                                                                            #
#                                                                                                                #
# process if answer is correct                                                                                   #
#                                                                                                                #
  puts '#=> right'  if status=='right'                                                                           #
  print_two_spaces()                                                                                             #
  return result,drill_status                                                                                     #
end                                                                                                              #
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#




#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# process coding test type 4  questions <
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# notes: This method has been modified for python so that only the answers are compared. Originally it was       #
#        supposed to allow the program to be run using eval() and the computer was supposed to compare both      #
#        outputs with each other but it seems that the only way for this to work for ruby was to save the        #
#        answers as a string into a file and them pull them both out for comparison. In this modified version    #
#        the python program that creates the answer is saved as a string and the answer is saved as a string and #
#        then the two answers are compared to each other for evaluation.                                         #
#                                                                                                                #
# variables used:                                                                                                #
#    question_string ...... [passed] actual question                                                             #
#    random_question ...... [passed] current question number                                                     #
#    questions_to_go ...... [passed] count of how many questions to go                                           #
#    ruby_string .......... [passed] actual source code for the ruby program                                     #
#    answer_string ........ [passed] actual output of the source code for comparison                             #
#    drill_status ......... [passed] (returned)                                                                  #
#    result ............... [passed] (returned) total number of missed questions                                 #
#    line ................. single line entered in by user                                                       #
#    input_string ......... concatenation of the lines that the user enters in                                   #
#    status ............... answer to question status if it is right or wrong                                    #
#    save_question ........ missed question as multiline string for saving                                       #
#    file ................. used to open a file for appending                                                    #
#    MISSED_QUESTIONS_FILE. global variable for missed questions file name                                       #
#                                                                                                                #
########################################                                                                         #
# coding test type 4 question format   #                                                                         #
########################################<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#
#   rolling_count+=1                                                                                             #
#   if random_question==rolling_count                                                                            #
#..............................................................................                                  #
#     question_string=<<-STRING                                                                                  #
#     STRING                                                                                                     #
#     python_string=<<-STRING                                                                                    #
#     STRING                                                                                                     #
#     answer_string=<<-STRING                                                                                    #
#     STRING                                                                                                     #
#     result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
#   end                                                                                                          #
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#
#                                                                                                                #
# process coding test 4 type questions                                                                           #
#                                                                                                                # 
def coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)  #
                                                                                                                 #  
  line=''                                                                                                        #
  input_string=''                                                                                                #
  status='right'                                                                                                 #
  puts '######################################################################'                                  # 
  puts '# Use IDE to enter in programs and get the answer. Then copy and     #'                                  #
  puts '# paste answer for the program to compare them to see if it is       #'                                  #
  puts '# correct.                                                           #'                                  #
  puts '######################################################################'                                  #
  puts                                                                                                           #
  puts "question number #{random_question}"                                                                      #
  puts "questions to go #{questions_to_go}"                                                                      #
  puts                                                                                                           #
  puts question_string                                                                                           #
  puts                                                                                                           # 
  puts '###############################'                                                                         #
  puts '#   ENTER YOUR ANSWER HERE    #'                                                                         #
  puts '###############################'                                                                         #
  puts                                                                                                           #
#                                                                                                                #
# get a line of input from the user until a newline is entered by itself                                         #
#                                                                                                                #
  begin                                                                                                          #
    until line==".\n"                                                                                            # 
      line=gets                                                                                                  #
      if line=="..\n"                                                                                            #
        print_two_spaces()                                                                                       #
        input_string=''                                                                                          #
        line=''                                                                                                  #
      end                                                                                                        #
      break if line=="x\n"                                                                                       #
      input_string<<line if line!=".\n"                                                                          #
    end                                                                                                          #
    if line=="x\n"                                                                                               #
      drill_status='exit'                                                                                        #
      return result,drill_status                                                                                 #
    end                                                                                                          #
  end                                                                                                            #
                                                                                                                 #
  if answer_string==input_string                                                                                 #
    puts 'right'                                                                                                 #
  else                                                                                                           #
    puts 'wrong, the answer did not match'                                                                       # 
    puts 'here is the program that produced the answer:'                                                         #
    puts                                                                                                         #
    puts ruby_string                                                                                             #
    status='wrong'                                                                                               #
  end                                                                                                            #
#                                                                                                                #
# if the answer is not correct then process and save the missed question in the questions file                   #
#                                                                                                                #
  if status!='right'                                                                                             #
    print_one_space()                                                                                            #
    result+=1     #<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#
    save_question=<<-QSTRING
    rolling_count+=1
    if random_question==rolling_count
    #..............................................................................
    question_string=<<-RSTRING
    #{question_string} RSTRING
    ruby_string=<<-RSTRING
    #{ruby_string} RSTRING
    answer_string=<<-RSTRING
    #{answer_string} RSTRING
    result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
    end
    QSTRING
    save_question.gsub!("\#{","\\\#{")
    file=File.open(MISSED_QUESTIONS_FILE,'a')#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#
    file.print save_question                                                                                      #
    file.close                                                                                                    #
  end                                                                                                             #
  print_two_spaces()                                                                                              #
  return result,drill_status                                                                                      #
end                                                                                                               #
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#    




#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# shuffle the questions thoroughly  <
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# notes: shuffle the questions 100 times                                                                         #
#                                                                                                                #
# variables used:                                                                                                #
#    questions ............... [passed] array of numbers representing questions                                  #
#                                                                                                                #
def shuffle_questions(questions)                                                                                 #
  100.times{questions.shuffle!}                                                                                  #
  questions                                                                                                      #
end                                                                                                              #
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#



  
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# print out the results to the kata <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# notes: print the metrics for the drill also called a kata                                                      #
#                                                                                                                #
# variables used:                                                                                                #
#    result ............... [passed] number of missed questions                                                  #
#    number_of_questions ...[passed] total number of questions                                                   # 
#                                                                                                                #
def kata_results(result,number_of_questions)                                                                     #
  puts "you got #{result} wrong out of #{number_of_questions}"                                                   #
  if result==0                                                                                                   #
    puts 'perfect kata!'                                                                                         #
  end                                                                                                            #
end                                                                                                              #
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#
  



#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# print heading of the kata's subject <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# notes: print the heading with the kata or drills title                                                         #  
#                                                                                                                #
# variables used:                                                                                                #
#    TITLE ............... global variable for header                                                            #
#                                                                                                                #
def print_heading                                                                                                #
  #.................................................................................                             #
  puts "=============================> #{TITLE} <=================================="                             #
  puts                                                                                                           #
  puts                                                                                                           #
end                                                                                                              #
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#




#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# early exit of the drill           <
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# note: this is a method to process the unfinished and early exit of the drill. it saves to a file so that       #
#       the drill could be continued at a later time.                                                            #
#                                                                                                                #
# variables used:                                                                                                #
#    random_question ...... [passed] current question number                                                     #
#    number_of_questions .. [passed] total number of questions                                                   #
#    questions_to_go ...... [passed] total number of questions to go                                             #
#    result ............... [passed] total number of missed questions                                            #
#    empty ................ [passed] (returned) variable to check if there are more questions to drill           #
#    questions ............ [passed] (returned) actual questions number                                          #
#    new_text ............. variable holding the entire text                                                     #
#    line ................. an individual line read from the drill text file                                     #
#    file_name ............ used to read the drill text file                                                     #
#    time ................. variable that holds the current time                                                 #
#    date ................. variable that holds the current date                                                 #
#    start_index .......... starting index of the drill name                                                     #
#    DRILLS_TEXT_FILE ..... global variable for the drills text file                                             #
#    DRILL_NAME ........... global variable for the drills name                                                  #
#    LANDMARK ............. text to search for to begin processing                                               #
#                                                                                                                #
# process early exit and save data                                                                               #                 
#                                                                                                                # 
def early_drill_exit(questions,random_question,number_of_questions,questions_to_go,result,empty)                 #
#                                                                                                                #   
# prepare questions array to save to questions file                                                              #
#                                                                                                                #
  questions.unshift(random_question)                                                                             #
  questions<<number_of_questions                                                                                 #
  questions<<questions_to_go                                                                                     #
  questions<<result                                                                                              #
#                                                                                                                #
# set empty to true to exit main loop                                                                            #
#                                                                                                                #
  empty=true                                                                                                     #
#                                                                                                                #
# open DRILL file and mark as being worked                                                                       #
#                                                                                                                #
  new_text=''                                                                                                    #
  file_name=File.open(DRILLS_TEXT_FILE,'r')                                                                      #
  while !file_name.eof?                                                                                          #
    line=file_name.readline                                                                                      #
    if line.include?(LANDMARK)                                                                                   #
      while !line.include?(DRILL_NAME)                                                                           #
        new_text<<line                                                                                           #
        line=file_name.readline                                                                                  #
      end                                                                                                        #
      start_index=line.index(DRILL_NAME)                                                                         #
      line[start_index+102]='@'                                                                                  #
      line[start_index+114..start_index+116]=questions_to_go.to_s.rjust(3,'0')                                   #
      time=Time.now                                                                                              #
      date=time.strftime("%m|%d|%Y")                                                                             #
      line[start_index+127..start_index+136]=date                                                                #
      line[start_index+142..start_index+151]="----------"                                                        #
    end                                                                                                          #
    new_text<<line                                                                                               #
  end                                                                                                            #
  file_name.close                                                                                                #
#                                                                                                                #
# save the new data to DRILL file                                                                                #
#                                                                                                                #
  file_name=File.open(DRILLS_TEXT_FILE,'w')                                                                      # 
  file_name.puts new_text                                                                                        #                                                                                         
  file_name.close                                                                                                #                                                                                                
  return questions,empty                                                                                         #                                                                                        
end                                                                                                              #
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#




#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# update questions file             <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# notes: deletes the contents of the questions_file when the drills have been completed                          # 
#                                                                                                                #
# variables used:                                                                                                #
#    file ................. used to open a file for writing                                                      #
#    questions ............                                                                                      #
#    SAVED_DRILL_FILE                                                                                            #
#                                                                                                                #
def update_questions_file(questions)                                                                             #
  file=File.open(SAVED_DRILL_FILE,'w')                                                                           #
  file.puts questions                                                                                            #
  file.close                                                                                                     #
end                                                                                                              #
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#  




#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# update DRILLS file                <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# notes: when the drill has been completed the drills text file is filled out                                    #
#                                                                                                                #
# variables used:                                                                                                #
#    rolling_count ............ [passed] in this case this represents the total number of questions              # 
#    result ................... [passed] total number of missed questions                                        #
#    new_text ................. holds the edited new text to be saved to the file                                #
#    file_name ................ variable holding the file that was opened for reading                            #
#    line ..................... variable holding a line read from the text file                                  #
#    start_index .............. starting index of the drill name                                                 #
#    time ..................... variable holding the current time                                                #
#    date ..................... variable holding the current date                                                #
#    noq ...................... variable for number of questions read from ProLanInv.txt                         #
#    m ........................ variable for missed number of questions read from ProLanInv.txt                  #
#    percentage ............... variable for grade percentage                                                    #
#    grade .................... variable that assigns a letter grade from percentage                             #
#    DRILLS_TEXT_FILE ......... [global] variable for the drills text file                                       #
#    DRILL_NAME ............... [global] variable for the drill name                                             #
#    LANDMARK ................. [global] variable for text to search for to begin processing                     # 
#                                                                                                                #
def update_drills_file(rolling_count,result)                                                                     #
#                                                                                                                #     
# open file and update number of questions, how many times drilled, how many missed:                             #
#                                                                                                                #
  new_text=''                                                                                                    #
  file_name=File.open(DRILLS_TEXT_FILE,'r')                                                                      #
  while !file_name.eof?                                                                                          #
    line=file_name.readline                                                                                      #
    if line.include?(LANDMARK)                                                                                   #
      while !line.include?(DRILL_NAME)                                                                           #  
        new_text<<line                                                                                           #
        line=file_name.readline                                                                                  #
      end                                                                                                        #
      start_index=line.index(DRILL_NAME)                                                                         #
      # num of quest                                                                                             #
      noq=(line[start_index+24..start_index+26]).to_i                                                            #
      line[start_index+24..start_index+26]=rolling_count.to_s.rjust(3,'0')                                       #
      if noq==rolling_count                                                                                      #
        line[start_index+29]='-'                                                                                 #
      elsif noq<rolling_count                                                                                    #
        line[start_index+29]='>'                                                                                 #
      elsif noq>rolling_count                                                                                    #
        line[start_index+29]='<'                                                                                 #
      end                                                                                                        #
      # times drilled                                                                                            #
      line[start_index+42..start_index+44]=(line[start_index+42..start_index+44].to_i+1).to_s.rjust(3,'0')       #
      # missed                                                                                                   #
      percentage=(((rolling_count-result)/(rolling_count+0.0))*100).round                                        #
      if percentage>=90                                                                                          #
        grade='A'                                                                                                #
      elsif percentage>=80                                                                                       #
        grade='B'                                                                                                #
      elsif percentage>=70                                                                                       #
        grade='C'                                                                                                #
      elsif percentage>=60                                                                                       #
        grade='D'                                                                                                #
      else                                                                                                       #
        grade='F'                                                                                                #
      end                                                                                                        #
      m=(line[start_index+55..start_index+57]).to_i                                                              #                                                              
      line[start_index+55..start_index+57]=result.to_s.rjust(3,'0')                                              #
      if m==result                                                                                               #
        line[start_index+60]='-'                                                                                 #
      elsif m<result                                                                                             #
        line[start_index+60]='>'                                                                                 #
      elsif m>result                                                                                             #
        line[start_index+60]='<'                                                                                 #
      end                                                                                                        #
      line[start_index+61]=grade                                                                                 #                                                                  
      # lowest missed                                                                                            # 
      line[start_index+67..start_index+69]=result.to_s.rjust(3,'0') if (line[start_index+67..start_index+69].to_i)>result
      # greatest misssed                                                                                         #
      line[start_index+85..start_index+87]=result.to_s.rjust(3,'0') if (line[start_index+85..start_index+87].to_i)<result
      # working                                                                                                  #
      line[start_index+102]='-'                                                                                  #
      # quest to go                                                                                              #
      line[start_index+114..start_index+116]=0.to_s.rjust(3,'0')                                                 #
      # last touched                                                                                             #
      line[start_index+127..start_index+136]="----------"                                                        #
      time=Time.new                                                                                              #
      date=time.strftime("%m|%d|%Y")                                                                             #
      # completed                                                                                                #
      line[start_index+142..start_index+151]=date                                                                #
    end                                                                                                          #
    new_text<<line                                                                                               #
  end                                                                                                            #
  file_name.close                                                                                                #
#                                                                                                                #
# save the new data to file                                                                                      #
#                                                                                                                #
  file_name=File.open(DRILLS_TEXT_FILE,'w')                                                                      #                                     
  file_name.puts new_text                                                                                        #                                                                                       
  file_name.close                                                                                                #                                                                                                
end                                                                                                              #
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<# 




#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# main program <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# notes: main driver of this program                                                                             #
#                                                                                                                #
# variables used:                                                                                                #
#    file_status .......... holds the status of true or false if the file is empty                               #
#    file ................. to open file for reading                                                             #
#    string ............... holds the entire contents of the file                                                #
#    questions ............ holds all the question numbers                                                       #
#    result ............... total number of missed questions                                                     #
#    questions_to_go ...... holds how many more numbers to go                                                    #
#    drill_status ......... checks if the drill is to exit early                                                 #
#    empty ................ checks if questions is empty                                                         #
#    rolling_count ........ a running count of the questions                                                     #
#    random question ...... a randomly chosen question                                                           #
#    SAVED_DRILL_FILE ..... global variable holding the name of the saved drill file for later use               #
#                                                                                                                #
# check if questions_file has data, if so then load it                                                           #
#                                                                                                                #
file_status=File.zero?(SAVED_DRILL_FILE)                                                                         #  
#                                                                                                                #
# question file has data then process                                                                            #
#                                                                                                                #
if file_status==false                                                                                            #
  file=File.open(SAVED_DRILL_FILE,'r')                                                                           #
  string=file.read                                                                                               #
  file.close                                                                                                     #
  questions=string.split("\n")                                                                                   #
  questions.each_with_index{|item,index| questions[index]=item.to_i}                                             #
  result=questions.pop                                                                                           #
  questions_to_go=questions.pop                                                                                  #
  number_of_questions=questions.pop                                                                              #
#                                                                                                                #
# question file has no data then start new drill                                                                 #
#                                                                                                                #
else                                                                                                             #
  result=0                                                                                                       #
  questions=Array.new(50){|index| index+1}                                                                       #
  number_of_questions=questions.count                                                                            #
  questions_to_go=number_of_questions+1                                                                          #
  questions=shuffle_questions(questions)                                                                         #
#                                                                                                                #
# set first question to zero                                                                                     #
#                                                                                                                #
  questions.unshift(0)                                                                                           #
end                                                                                                              #
                                                                                                                 #
                                                                                                                 #
drill_status=' '                                                                                                 #
empty=questions.empty?                                                                                           #
                                                                                                                 #
#                                                                                                                #
# loop while more questions to drill                                                                             #
#                                                                                                                #
while empty==false                                                                                               # 
  rolling_count=0                                                                                                #
  random_question=questions.shift                                                                                #
#                                                                                                                #
# if random_question number is zero then dont print the header                                                   #
#                                                                                                                #
  print_heading() if random_question!=0                                                                          #
                                                                                                                 #
#-----------------------------------------------------------------------------------------------------------------
# start of questions section -------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------

  #=====================================================================================================================
  # accessing files ====================================================================================================
  #=====================================================================================================================
  rolling_count+=1
'1'
  if random_question==rolling_count
    #..............................................................................
    question_string=<<-STRING
your program is in a folder. inside that same folder is supposed to be a file
called 'same_folder'. write code that checks if the 'same_folder' file exists.

use variable.......................does_exist
    STRING
    answer=<<-STRING
does_exist=File.exists?('same_folder')
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'2'
  if random_question==rolling_count
    #..............................................................................
    question_string=<<-STRING
your program is in a folder. inside that same folder is supposed to be another
folder called 'red'. inside of red is supposed to be a file called 'in_folder'.
write code that checks if 'in_folder' exists.

use variable.......................does_exist
    STRING
    answer=<<-STRING
does_exist=File.exists?('red/in_folder')
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'3'
  if random_question==rolling_count
    #..............................................................................
    question_string=<<-STRING
your program is in a folder. right outside of that folder is supposed to be a
file called 'out_folder'. write code that checks if 'out_folder' exists.

use variable.......................does_exist
    STRING
    answer=<<-STRING
does_exist=File.exists?('../out_folder')
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'4'
  if random_question==rolling_count
    #..............................................................................
    question_string=<<-STRING
your program is in a folder. right outside of that folder is supposed to be a
folder called 'purple'. inside of 'purple' is supposed to be a file called
'deep_folder'. write code that checks if 'deep_folder' exists.

use variable.......................does_exist
    STRING
    answer=<<-STRING
does_exist=File.exists?('../purple/deep_folder')
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # atime method =======================================================================================================
  #=====================================================================================================================
  rolling_count+=1
'5'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
We have an existing file and we want to know the file access time, write
code to do this and print out the result using puts.

given:
existing file:.......................saved_game
use variable:........................access_time
    STRING
    answer=<<-STRING
access_time=File.atime('saved_game')
puts access_time
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # close method =======================================================================================================
  #=====================================================================================================================

  rolling_count+=1
'6'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
write code to close a file that has been opened

given:.................file_name=File.open('text_file.txt','w')
    STRING
    answer=<<-STRING
file_name.close
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end
  #=====================================================================================================================
  # ctime method =======================================================================================================
  #=====================================================================================================================
  rolling_count+=1
'7'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
We have an existing file and we want to know the file create time, write
code to do this and print out the result using puts.

given:
existing file:.......................saved_game
use variables:.......................create_time
    STRING
    answer=<<-STRING
create_time=File.ctime('saved_game')
puts create_time
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # delete method ======================================================================================================
  #=====================================================================================================================
  rolling_count+=1
'8'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
We have an existing file but we want to delete it. write code to do this.

given:
existing file:.......................saved_game
    STRING
    answer=<<-STRING
File.delete('saved_game')
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # directory? method ==================================================================================================
  #=====================================================================================================================
  rolling_count+=1
'9'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
We have an existing file but we want to check if it is a directory, write code
to do this and print out the result using puts.

given:
existing file:.......................saved_game
use variable:........................status
    STRING
    answer=<<-STRING
status=File.directory?('saved_game')
puts status
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # each method ========================================================================================================
  #=====================================================================================================================

  rolling_count+=1
'10'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
We have an existing file and we want to read the file using the each method.
write code to do this using the inline method. use print to print out the
lines. dont forget to close the file!

given:
existing file:.......................saved_game
file variable:.......................file_name
use variable:........................line
use print to print the lines
    STRING
    answer=<<-STRING
file_name=File.open('saved_game','r')
file_name.each{|line| print line}
file_name.close
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #======================================================================================================================
  # eof? method =========================================================================================================
  #======================================================================================================================

  rolling_count+=1
'11'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
what method do we use to check for end of file?
    STRING
    answer='eof? method'
    answers=<<-STRING
eof? method
nil method
0 method
end line method
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # executable? method =================================================================================================
  #=====================================================================================================================
  rolling_count+=1
'12'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
We have an existing file but we want to check if it is executable, write code
to do this and print out the result using puts.

given:
existing file:.......................saved_game
use variable:........................status
    STRING
    answer=<<-STRING
status=File.executable?('saved_game')
puts status
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # exist? or exists? method ===========================================================================================
  #=====================================================================================================================
  rolling_count+=1
'13'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
We have an existing file but we want to check if it really exists, write code
to do this and print out the result using puts. make sure to use an (s) at the
end of your method to match the answer.

given:
existing file:.......................saved_game
use variable:........................status
    STRING
    answer=<<-STRING
status=File.exists?('saved_game')
puts status
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'14'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
we think we have an existing file and want to make sure that it really exists,
which method is correct: 'exist?' or 'exists?'?
    STRING
    answer='both are correct'
    answers=<<-STRING
both are correct
exist?
exists?
zero?
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # file mode ==========================================================================================================
  #=====================================================================================================================

  rolling_count+=1
'15'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
what mode do we use to open a file for reading?
    STRING
    answer="'r'"
    answers=<<-STRING
'r'
'w'
'w+'
'a'
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'16'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
what mode do we use to open a file for reading and writing?
    STRING
    answer="'r+'"
    answers=<<-STRING
'r+'
'r'
'w'
'a+'
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'17'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
what mode do we use to open a file for writing?
    STRING
    answer="'w'"
    answers=<<-STRING
'w'
'w+'
'a'
'r'
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'18'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
what mode do we use to open a file for writing and reading?
    STRING
    answer="'w+'"
    answers=<<-STRING
'w+'
'a'
'a+'
'r'
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'19'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
what mode do we use to open a file for appending?
    STRING
    answer="'a'"
    answers=<<-STRING
'a'
'r'
'w'
'w+'
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'20'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
what mode do we use to open a file for appending and reading?
    STRING
    answer="'a+'"
    answers=<<-STRING
'a+'
'a'
'w'
'r'
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # file? method =======================================================================================================
  #=====================================================================================================================
  rolling_count+=1
'21'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
We have an existing file but we want to check if it really is a file, write
code to do this and print out the result using puts.

given:
existing file:.......................saved_game
use variable:........................status
    STRING
    answer=<<-STRING
status=File.file?('saved_game')
puts status
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # ftype method =======================================================================================================
  #=====================================================================================================================
  rolling_count+=1
'22'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
We have an existing file and we want to know the file type, write code to do
this and print out the result using puts.

given:
existing file:.......................saved_game
use variable:........................file_type
    STRING
    answer=<<-STRING
file_type=File.ftype('saved_game')
puts file_type
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

#=====================================================================================================================
# general files ======================================================================================================
#=====================================================================================================================
rolling_count+=1
'23'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
when reading file, is the position saved in memory (true or false)
STRING
answer=<<-STRING
true
STRING
  result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end  

  #=====================================================================================================================
  # getc method ========================================================================================================
  #=====================================================================================================================
  rolling_count+=1
'24'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
We have an existing file and we want to read it a letter at a time and print
out that letter. (use puts to print) (note that this program will just print
one letter). make sure to close the file at the end.

given:
existing file:.......................saved_game
file variable:.......................file_name
use variable:........................character
    STRING
    answer=<<-STRING
file_name=File.open('saved_game','r')
character=file_name.getc
puts character
file_name.close
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'25'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
what do we use to read a file a character at a time?:
    STRING
    answer='getc'
    answers=<<-STRING
getc
read
getf
line
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # mtime method =======================================================================================================
  #=====================================================================================================================
  rolling_count+=1
'26'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
We have an existing file and we want to know the file modify time, write
code to do this and print out the result using puts.

given:
existing file:.......................saved_game
use variable:........................modify_time
    STRING
    answer=<<-STRING
modify_time=File.mtime('saved_game')
puts modify_time
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # new file ===========================================================================================================
  #=====================================================================================================================

  rolling_count+=1
'27'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
write code to create a new file

file name:....................text_file.txt
variable:.....................file_name
note:.........................use single quotes
    STRING
    answer=<<-STRING
file_name=File.open('text_file.txt','w')
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'28'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
create a new file called text_file by using the new method.
    STRING
    answer=<<-STRING
File.new('text_file','w')
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # open method ========================================================================================================
  #=====================================================================================================================

  rolling_count+=1
'29'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
write code to open a file for writing and reading

file name:....................text_file.txt
variable:.....................file_name
note:.........................use single quotes
    STRING
    answer=<<-STRING
file_name=File.open('text_file.txt','w+')
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'30'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
write code to open a file for appending

file name:....................text_file.txt
variable:.....................file_name
note:.........................use single quotes
    STRING
    answer=<<-STRING
file_name=File.open('text_file.txt','a')
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #======================================================================================================================
  # print method ========================================================================================================
  #======================================================================================================================
  rolling_count+=1
'31'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
when saving an array to file, which method will save the data on the same line
as an array?
    STRING
    answer='print'
    answers=<<-STRING
puts
print
printf
write
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'32'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
write code to open a file for writing, then save an array into the file
using print. remember that this will save the data on a single line and
in this case as an array.

given:array=["name","race","class", 12,3,8,14,26,4,10,6]
use:................file_name
file:...............saved_file
    STRING
    answer=<<-STRING
file_name=File.open('saved_file','w')
file_name.print array
file_name.close
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #======================================================================================================================
  # puts method =========================================================================================================
  #======================================================================================================================

  rolling_count+=1
'33'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
what are two methods we can use to write files to disk?
    STRING
    answer='puts and print'
    answers=<<-STRING
puts and print
save and archive
printf and write
write_file and save_file
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'34'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
when saving an array to file, which method will save the data on individual
lines?
    STRING
    answer='puts'
    answers=<<-STRING
puts
print
printf
write
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'35'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
write code to open a file for writing, then save an array into the file
using puts. remember that this will save the data on individual lines.

given:array=["name","race","class", 12,3,8,14,26,4,10,6]
use:................file_name
file:...............saved_file
    STRING
    answer=<<-STRING
file_name=File.open('saved_file','w')
file_name.puts array
file_name.close
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # read method ========================================================================================================
  #=====================================================================================================================

  rolling_count+=1
'36'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
what does the read method do?
    STRING
    answer='grabs all the contents of the file'
    answers=<<-STRING
grabs all the contents of the file
reads a single line
reads item by item
reads lines delimited by a new line
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # readline method ====================================================================================================
  #=====================================================================================================================
  rolling_count+=1
'37'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
what does the readline method do?
    STRING
    answer='reads a single line'
    answers=<<-STRING
grabs all the contents of the file
reads a single line
reads item by item
reads lines delimited by a new line
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'38'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
write code to open a file for reading only. read and print out what is in the
file using readline. do not forget to check for end of file, then close the
file. use puts to print.

file name:..............text_file.txt
variable:...............file_name
variable:...............line
    STRING
    answer=<<-STRING
file_name=File.open('text_file.txt','r')
while !file_name.eof?
  line=file_name.readline
  puts line
end
file_name.close
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # readlines method ===================================================================================================
  #=====================================================================================================================
  rolling_count+=1
'39'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
what does the readlines method do?
    STRING
    answer='reads all of the lines in the file'
    answers=<<-STRING
grabs all the contents of the file
reads a single line
reads item by item
reads all of the lines in the file
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # rename method ======================================================================================================
  #=====================================================================================================================

  rolling_count+=1
'40'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
We have an existing file but we want to rename it. write code to do this.

given:
existing file:.......................new_game_file
use this:............................saved_game
    STRING
    answer=<<-STRING
File.rename('new_game_file','saved_game')
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # rewind method ======================================================================================================
  #=====================================================================================================================

  rolling_count+=1
'41'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
when we write to a file, without closing the file, how do we read that file?
    STRING
    answer='first use rewind method'
    answers=<<-STRING
first use rewind method
read method
readline method
readlines method
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'42'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
given the following program, write code to set the file pointer to the
beginning so that the file can be read:

file_name=File.open('new_file','w+')
file_name.puts line
    STRING
    answer="file_name.rewind\n"
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # size method ========================================================================================================
  #=====================================================================================================================
  rolling_count+=1
'43'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
We have an existing file and we want to check its size, write code to do
this and print out the result using puts.

given:
existing file:.......................saved_game
use variable:........................file_size
    STRING
    answer=<<-STRING
file_size=File.size('saved_game')
puts file_size
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'44'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-RSTRING
when checking the size of a file using the 'size' method, what is returned?
    RSTRING
    answer='the size of the file itself'
    answers=<<-RSTRING
the size of the file itself
number of items in the file
number of lines in the file
the size of the characters
    RSTRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # writable? method ===================================================================================================
  #=====================================================================================================================
  rolling_count+=1
'45'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
We have an existing file but we want to check if it is writable, write
code to do this and print out the result using puts.

given:
existing file:.......................saved_game
use variable:........................status
    STRING
    answer=<<-STRING
status=File.writable?('saved_game')
puts status
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


#=====================================================================================================================
# write method =======================================================================================================
#=====================================================================================================================

rolling_count+=1
'46'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
what is another way to write to file but not using puts, print or <<?
STRING
  answer='by using the write method'
  answers=<<-STRING
by using the write method
by using the save method
by using the archive method
by using the burn method
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  

rolling_count+=1
'47'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
we have an open file for writing, write code to write to the file but do not
use puts, print, or << and dont forget to close the file.

file_name=File.open('text_file','w')

use................................file_name
save...............................line
STRING
answer=<<-STRING
file_name.write line
file_name.close
STRING
  result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end  

  #=====================================================================================================================
  # zero? method =======================================================================================================
  #=====================================================================================================================
  rolling_count+=1
'48'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
We have an existing file and we want to check if it is empty, write code
to do this and print out the result using puts.

given:
existing file:.......................saved_game
use variable:........................empty_file
    STRING
    answer=<<-STRING
empty_file=File.zero?('saved_game')
puts empty_file
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end
  
#=====================================================================================================================
# << method ==========================================================================================================
#=====================================================================================================================

rolling_count+=1
'49'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
what other method can we use to write to a file without using puts, print or
write?
STRING
  answer='by using the << method'
  answers=<<-STRING
by using the << method
by using the archive method
by using the save method
by using the burn method
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  

rolling_count+=1
'50'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
we have an open file for writing, write code to write to the file but do not
use puts, print, or write and dont forget to close the file.

file_name=File.open('text_file','w')

use................................file_name
save...............................line
STRING
answer=<<-STRING
file_name<< line
file_name.close
STRING
  result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end  

#-----------------------------------------------------------------------------------------------------------------
# end of questions section ---------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------
                                                                                                                 #
#                                                                                                                #
# count the total questions and check if it matches number of questions when first question is number zero       #
#                                                                                                                #
  if random_question==0                                                                                          #
    if rolling_count!=number_of_questions                                                                        #
      puts "warning, check number of questions! should be:#{rolling_count}"                                      #
      pause_output()                                                                                             #
    end                                                                                                          #
  end                                                                                                            #
#                                                                                                                #
# save to drill another time if drill_status=='exit'                                                             #
#                                                                                                                #
  if drill_status=='exit'                                                                                        #
    questions,empty=early_drill_exit(questions,random_question,number_of_questions,questions_to_go,result,empty) #
  else                                                                                                           #
#                                                                                                                #
# decrement questions to go and check if no more questions to drill                                              #
#                                                                                                                #
    questions_to_go-=1                                                                                           #
    empty=questions.empty?                                                                                       #
  end                                                                                                            #
end                                                                                                              #
#                                                                                                                #
# delete the contents of questions file when drill is completed                                                  #
#                                                                                                                #
update_questions_file(questions)                                                                                 #
#                                                                                                                #
# fill out drills text file if drill has been completed                                                          #
#                                                                                                                #
if questions.empty?                                                                                              #
  update_drills_file(rolling_count,result)                                                                       #
end                                                                                                              #
#                                                                                                                #
# print the metrics for the drill also called a kata                                                             #
#                                                                                                                #
kata_results(result,number_of_questions)                                                                         #
pause_output()                                                                                                   #
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#

