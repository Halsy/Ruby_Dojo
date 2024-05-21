##################################################################################################################
#                                                                                                                #
# Program:......................strings.rb                                                                       #
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
#                                capitalize and capitalize! methods                                              #
#                                chars method                                                                    #
#                                chr method                                                                      #
#                                clear method                                                                    #
#                                count method                                                                    #
#                                delete and delete! methods                                                      #
#                                downcase and downcase! methods                                                  #
#                                each_byte method                                                                #
#                                each_char method                                                                #
#                                each_line method                                                                #
#                                empty? method                                                                   #
#                                encoding method                                                                 #
#                                end_with? method                                                                #
#                                eql? method                                                                     #
#                                equal? method                                                                   #
#                                eval method                                                                     #
#                                force_encoding method                                                           #
#                                freeze method method                                                            #
#                                frozen? method                                                                  #
#                                general strings                                                                 #
#                                gsub and gsub! methods                                                          #
#                                include? method                                                                 #
#                                index method                                                                    #
#                                insert method                                                                   #
#                                join method                                                                     #
#                                ljust method                                                                    #
#                                lstrip and lstrip! methods                                                      #
#                                ord method                                                                      #
#                                regexp method                                                                   #
#                                reverse and reverse! methods                                                    #
#                                rjust method                                                                    #
#                                rstrip and rstrip! methods                                                      #
#                                slice and slice! methods                                                        #
#                                split method                                                                    #
#                                start_with? method                                                              #
#                                strip and strip! methods                                                        #
#                                sub and sub! methods                                                            #
#                                to_i method                                                                     #
#                                to_s method                                                                     #
#                                to_sym method                                                                   #
#                                upcase and upcase! methods                                                      #
#                                [] method                                                                       #
#                                << method                                                                       #
#                                <<- (heredoc) method                                                            #
##################################################################################################################



##################################################################################################################
# global variables                                                                                               #
##################################################################################################################
TITLE=                'strings'                                                # title for header
MISSED_QUESTIONS_FILE='../00 Tools/01 missed_questions/missed_questions'       # file containing missed questions
DRILLS_TEXT_FILE=     '../text_files/ProLanInv.txt'                            # text file to record drills metrics
DRILL_NAME=           '08 strings'                                             # name of this drill
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
  questions=Array.new(165){|index| index+1}                                                                      #
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

  #==================================================================================================================
  # capitalize and capitalize! methods ==============================================================================
  #==================================================================================================================
  rolling_count+=1
'1'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'capitalize' method used for?
    STRING
    answer='to create a new string with the first letter capitalized'
    answers=<<-STRING
to create a new string with the first letter capitalized
to create a new string with all of the first letters capitalized
to create a new string with everything in a string uppercase
to create a new string with all caps
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'2'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to capitalize the first letter of a string while creating a new
string.

given....................string1='important'
variable.................new_string
    STRING
    answer=<<-STRING
new_string=string1.capitalize
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'3'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to capitalize the first letter of a string while modifying the
original string.

given....................string1='important'
    STRING
    answer=<<-STRING
string1.capitalize!
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #==================================================================================================================
  # chars method ====================================================================================================
  #==================================================================================================================

  rolling_count+=1
'4'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'chars' method used for?
    STRING
    answer='to convert a string into an array of characters'
    answers=<<-STRING
to convert a string into an array of characters
to convert an array of strings into a string
to convert an array of integers into a string
to convert a string into an array of integers
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'5'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to convert a string into an array of characters but do not use the
split method or the each_char method.

given....................string1='ruby-guides'
variable.................array
#=>......................['r','u','b','y','-','g','u','i','d','e','s']
    STRING
    answer=<<-STRING
array=string1.chars
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #==================================================================================================================
  # chr method ======================================================================================================
  #==================================================================================================================

  rolling_count+=1
'6'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-RSTRING
when using the 'chr' method in strings what does it do?

    RSTRING
    answer='returns a character from ASCII'
    answers=<<-RSTRING
returns a character from ASCII
returns the character length in bytes
returns the size of the character
returns the hexadecimal value of the character
    RSTRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'7'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-RSTRING
write code to return a character from ASCII.

given.....................ascii='104'
variable..................character

    RSTRING
    answer=<<-RSTRING
character=ascii.chr
    RSTRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #==================================================================================================================
  # clear method ====================================================================================================
  #==================================================================================================================

  rolling_count+=1
'8'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
how do we remove the contents of a string?
    STRING
    answer='by using the clear method'
    answers=<<-STRING
by using the clear method
by using the empty method
by using the zero method
by using the remove method
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'9'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to remove the contents of a string

given........................string='abcdefghijklmnopqrstuvwxyz'
    STRING
    answer=<<-STRING
string.clear
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #==================================================================================================================
  # count method ====================================================================================================
  #==================================================================================================================

  rolling_count+=1
'10'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when working with strings, what is the 'count' method used for?
    STRING
    answer='to count the occurrence of certain characters'
    answers=<<-STRING
to count the occurrence of certain characters
to return the size of the string
to count the bytes of a string
to return the length of a certain string
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'11'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to count the occurrence of the letter 'a' in a string.

given....................string1='aaab'
variable.................string_pattern
    STRING
    answer=<<-STRING
string_pattern=string1.count('a')
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'12'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to count the total occurrence of the letters 't' and 'a' in a
string.

given....................string1="this is a test is this a test?"
variable.................string_pattern
    STRING
    answer=<<-STRING
string_pattern=string1.count('ta')
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'13'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
given the following program, what value is returned?

string1='abctataatatat'
char_count=string1.count('ta')
puts char_count
    STRING
    answer='11'
    answers=<<-STRING
11
2
5
10
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  #==================================================================================================================
  # delete and delete! method =======================================================================================
  #==================================================================================================================

  rolling_count+=1
'14'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-RSTRING
when using the 'delete' or 'delete!' method on strings what should we know?

    RSTRING
    answer='items are deleted globally'
    answers=<<-RSTRING
items are deleted globally
only one literal item will be deleted
only one literal item will be deleted globally
everything will be deleted
    RSTRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'15'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-RSTRING
when using the 'delete' method on strings what will be returned?

example: string='word'
         new_string=string.delete('o')
         puts new_string  

    RSTRING
    answer='a copy of the modified string'
    answers=<<-RSTRING
a copy of the modified string
the original string
only the items being deleted
nil
    RSTRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'16'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-RSTRING
write code using the 'delete' method on strings to delete the following
while creating a new string

given.....................string='abcdefghijklmnopqrstuvwxyz'
use variables.............new_string
delete....................'aeiou'
    RSTRING
    answer=<<-RSTRING
new_string=string.delete('aeiou')
    RSTRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'17'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-RSTRING
write code using the 'delete!' method on strings to delete the following
while modifying an existing string

given.....................string='abcdefghijklmnopqrstuvwxyz'
delete....................'aeiou'
    RSTRING
    answer=<<-RSTRING
string.delete!('aeiou')
    RSTRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'18'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-RSTRING
write code using the 'delete' method on strings to delete letters j through s
while creating a new string

given.....................string='abcdefghijklmnopqrstuvwxyz'
use variables.............new_string

    RSTRING
    answer=<<-RSTRING
new_string=string.delete('j-s')
    RSTRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'19'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-RSTRING
write code using the 'delete' method on strings to delete letters j through s
while creating a new string

given.....................string='abcdefghijklmnopqrstuvwxyz'
variable..................new_string

    RSTRING
    answer=<<-RSTRING
new_string=string.delete('j-s')
    RSTRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'20'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
When using the delete or delete! method with strings, what are the different
ways that we can delete items?
    STRING
    answer="('a'),('ab'),('a-i'),('a-is-z')"
    answers=<<-STRING
('a'),('ab'),('a-i'),('a-is-z')
('a'),('ab'),('a-i')
('a'),('ab'),('a-i'),('a..i,s..z')
('a'),('ab'),('a-i'),(/a/)
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'21'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
When using the delete or delete! method with strings, what does the ('ab')
delete in the string see example:

example..................string='abdeaabfedrghobbaa'
                         string.delete!('ab')
    STRING
    answer="all the letters a and b, globally from the string"
    answers=<<-STRING
all the letters a and b, globally from the string
the string pattern 'ab', globally
one occurrence of the string pattern 'ab'
one letter 'a' and one letter 'b'
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'22'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code using delete to create a new string while deleting the following:

given........................string='abcdefghijklmnopqrstuvwxyz'
use variable.................new_string
delete.......................letters d to i then letters l to u
    STRING
    answer=<<-STRING
new_string=string.delete('d-il-u')
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'23'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code using delete! to modify an existing string, removing the following:

given........................string='abcdefghijklmnopqrstuvwxyz'
delete.......................letters a to d then letters h to m
    STRING
    answer=<<-STRING
string.delete!('a-dh-m')
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'24'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the delete or delete! methods on a string what does it delete?
    STRING
    answer='it deletes individual characters globally'
    answers=<<-STRING
it deletes individual characters globally
it deletes a string pattern
it deletes a string pattern globally
it deletes individual characters, once
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'25'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
how do we delete individual characters from a string?
    STRING
    answer='by using the delete or delete! methods'
    answers=<<-STRING
by using the delete or delete! methods
by using the slice or slice! methods
by using the take or drop methods
by using the remove or clear methods
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  #==================================================================================================================
  # downcase and downcase! methods ==================================================================================
  #==================================================================================================================

  rolling_count+=1
'26'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'downcase' method used for?
    STRING
    answer='to create a new string with all lowercase letters'
    answers=<<-STRING
to create a new string with all lowercase letters
to create a new string with the first letter in lowercase
to create a new string with the first letter of every word lowercase
to create a new string with certain part of a string lowercase
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'27'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'downcase!' method used for?
    STRING
    answer='to modify an existing string to all lowercase letters'
    answers=<<-STRING
to modify an existing string to all lowercase letters
to modify an existing string to downcase the first letter in the string
to modify an existing string to downcase the first letter of every word
to modify an existing string to make a certain part of a string lowercase
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'28'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to compare two strings but make sure to make both lowercase first
and do not use the eql? method.

given....................string1='The cat in the Hat'
given....................string2='the cat in the hat'
variable.................equal
    STRING
    answer=<<-STRING
equal=string1.downcase==string2.downcase
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'29'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to create a new string with lowercase letters.

given....................string1='CHANGE THIS STRING'
variable.................new_string
    STRING
    answer=<<-STRING
new_string=string1.downcase
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'30'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to modify an existing string to lowercase letters.

given....................string1='CHANGE THIS STRING'
    STRING
    answer=<<-STRING
string1.downcase!
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #==================================================================================================================
  # each_byte method ================================================================================================
  #==================================================================================================================

  rolling_count+=1
'31'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-RSTRING
when using the 'each_byte' method in strings what does it do?

    RSTRING
    answer='returns the ASCII code of a character'
    answers=<<-RSTRING
returns the ASCII code of a character
returns the character of an ASCII code
returns the size of the character
returns the hexadecimal value of the character
    RSTRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'32'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-RSTRING
write code to return the ASCII code of each character in a string and print
out the ASCII code with spaces on a single line, using the in-line method but
do not use the each_char method.

given.....................string='hello'
variable..................c

    RSTRING
    answer=<<-RSTRING
string.each_byte{|c| print c,' '}
    RSTRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'33'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-RSTRING
when using the 'each_byte' method in strings what does it return?

example...................string='hello'
                          return_string=string.each_byte{|c| print c,' '}

    RSTRING
    answer='the original string by default'
    answers=<<-RSTRING
the original string by default
a copy of the modified string
returns the size of the character
returns the hexadecimal value of the character
    RSTRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  #==================================================================================================================
  # each_char method ================================================================================================
  #==================================================================================================================
  rolling_count+=1
'34'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to iterate and print the characters in the string. make sure to use
print to keep the characters on the same line. use in-line method

given....................string1='ruby-guides'
variable.................character
    STRING
    answer=<<-STRING
string1.each_char{|character| print character}
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'35'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'each_char' method used for?
    STRING
    answer='to iterate through each character in a string'
    answers=<<-STRING
to iterate through each line of a multiline string
to iterate through each item in a string
to iterate through each character in a string
to iterate through each word in a string
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'36'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to create an array of characters from a string, do not use the
'chars' or 'split' methods. use in-line method

given....................string1='ruby-guides'
                         array=''
variable.................array, c
    STRING
    answer=<<-STRING
string1.each_char{|c| array<<c}
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'37'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-RSTRING
write code using each_char to create a new string with spaces in between
each character in in-line form.

given....................string='hello'
                         new_string=''
use variables............c
    RSTRING
    answer=<<-RSTRING
string.each_char{|c| new_string<<c+' '}
    RSTRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'38'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-RSTRING
when using the 'each_char' method, what does return_string equal to?

example:.........string='hello'
                 new_string=String.new
                 return_string=string.each_char{|c| new_string<<c+' '}
    RSTRING
    answer='the original string by default'
    answers=<<-RSTRING
the original string by default
the new_string
the modified new_string
nil
    RSTRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  #==================================================================================================================
  # each_line method ================================================================================================
  #==================================================================================================================

  rolling_count+=1
'39'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'each_line' method used for?
    STRING
    answer='to iterate through each line of a multiline string'
    answers=<<-STRING
to iterate through each line of a multiline string
to iterate through each item in a string
to iterate through each character in a string
to iterate through each word in a string
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'40'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to print out the contents of a multiline string. use in-line method.

given.......................string1='roses are red'
                                    'violets are blue'
                                    'oranges are orange'
variable....................line
print.......................puts
    STRING
    answer=<<-STRING
string1.each_line{|line| puts line}
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #==================================================================================================================
  # empty? method ===================================================================================================
  #==================================================================================================================

  rolling_count+=1
'41'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-RSTRING
write code to check if a string is empty.

given.....................string=''
variable..................empty_string

    RSTRING
    answer=<<-RSTRING
empty_string=string.empty?
    RSTRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  #==================================================================================================================
  # encoding method =================================================================================================
  #==================================================================================================================
  rolling_count+=1
'42'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'encoding' method used for?
    STRING
    answer='to check the encoding of a particular string'
    answers=<<-STRING
to check the encoding of a particular string
to encode a particular string
to check if a string is encoded
to see if a string is write protected
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'43'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to check the encoding of a string.

given....................string1='abcd'
variable.................string_encode
    STRING
    answer=<<-STRING
string_encode=string1.encoding
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #==================================================================================================================
  # end_with? method ================================================================================================
  #==================================================================================================================

  rolling_count+=1
'44'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'end_with?' method used for?
    STRING
    answer='to check if the string ends with a particular string pattern'
    answers=<<-STRING
to check if the string starts with a particular string pattern
to check if the string ends with a particular string pattern
to check if any of the words start with a particular string pattern
to check if any of the words end with the particular string pattern
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'45'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to check if the string ends with a particular character pattern.

given....................string1='ruby programming'
variable.................string_pattern
check for................'ing'
    STRING
    answer=<<-STRING
string_pattern=string1.end_with?('ing')
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #==================================================================================================================
  # eql? method =====================================================================================================
  #==================================================================================================================

  rolling_count+=1
'46'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in strings how do we check if two strings have the same string pattern?
    STRING
    answer='by using the eql? method'
    answers=<<-STRING
by using the eql? method
by using the equal? method
by using the same? method
by using the = method
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'47'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to check if both strings contain the same string pattern

given........................string1='abcdefghijklmnopqrstuvwxyz'
     ........................string2='abcdefghijklmnopqrstuvwxyz'
variable.....................result
#=>..........................true
    STRING
    answer=<<-STRING
result=string1.eql?(string2)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #==================================================================================================================
  # equal? method ===================================================================================================
  #==================================================================================================================

  rolling_count+=1
'48'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in strings how do we check if two strings refers to the same string?
    STRING
    answer='by using the equal? method'
    answers=<<-STRING
by using the eql? method
by using the equal? method
by using the same? method
by using the = method
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'49'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to check if two strings refers to the same string

given........................string1='abcdefghijklmnopqrstuvwxyz'
     ........................string2=string1
variable.....................result
#=>..........................true
    STRING
    answer=<<-STRING
result=string1.equal?(string2)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #==================================================================================================================
  # eval method =====================================================================================================
  #==================================================================================================================

  rolling_count+=1
'50'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
how do we execute text as a program in ruby
    STRING
    answer='by using the eval method'
    answers=<<-STRING
by using the eval method
by using the run method
by using the execute method
by using the exec method
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'51'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to run the following text as though it were a ruby program

given.....................string="puts 'hello'"
    STRING
    answer=<<-STRING
eval(string)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #==================================================================================================================
  # force_encoding method ===========================================================================================
  #==================================================================================================================
  rolling_count+=1
'52'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'force_encoding' method used for?
    STRING
    answer='to force the encoding of a string'
    answers=<<-STRING
to force the encoding of a string
to use a type of encoding called the force
to find out if an encoding is forced
to remove write protect
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'53'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to force an ASCII encoding on a string then print the encoding.

given....................string1="abcdefg"
encode to................ASCII
variable.................str_code
use......................puts
STRING
    answer=<<-STRING
string1.force_encoding('ASCII')
str_code=string1.encoding
puts str_code
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #==================================================================================================================
  # freeze method method ============================================================================================
  #==================================================================================================================
  rolling_count+=1
'54'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'freeze' method used for in strings?
    STRING
    answer='to prevent modifications of a string'
    answers=<<-STRING
to prevent modifications of a string
to make the string cool
to prevent append items to a string
to prevent accessing parts of a string
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'55'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
given the following string, make sure it is not modifiable.

given array......................string='love is forever'
    STRING
    answer=<<-STRING
string.freeze
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  #=====================================================================================================================
  # frozen? method =====================================================================================================
  #=====================================================================================================================
  rolling_count+=1
'56'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'frozen?' method used for in strings?
    STRING
    answer='to check if a string is modifiable'
    answers=<<-STRING
to check if a string is modifiable
to check if an string is cool
to check if a string is stuck
to check if a string is done
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'57'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to check if a string is modifiable

given array......................string='love is forever'
variable.........................frozen_string
    STRING
    answer=<<-STRING
frozen_string=string.frozen?
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # general strings ====================================================================================================
  #=====================================================================================================================

  rolling_count+=1
'58'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-RSTRING
when working with strings, before a new string variable can be used to insert
or concatenate characters in, what do we have to do with the variable first?

example:.........string1='abcdefghijklmnopqrstuvwxyz'
                 string1.each_char{|c| new_string<<c+' '}
    RSTRING
    answer="initialize the variable: new_string=''"
    answers=<<-RSTRING
initialize the variable: new_string=''
set the variable to zero: new_string=0
initialize the variable: new_string=' '
set the variable to one: new_string=1
    RSTRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  #==================================================================================================================
  # gsub and gsub! methods ==========================================================================================
  #==================================================================================================================
  rolling_count+=1
'59'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'gsub' method used for?
    STRING
    answer='to create a new string, globally substituting a new string pattern'
    answers=<<-STRING
to create a new string, globally substituting a new string pattern
to create a new string, globally searching for a string
to create a new string, globally creating an array
to create a new string, globally capitalizing letters
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'60'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'gsub!' method used for?
    STRING
    answer='to modify an existing string globally, substituting a new string pattern'
    answers=<<-STRING
to modify an existing string globally, substituting a new string pattern
to modify an existing string globally, searching for a string
to modify an existing string globally, creating an array
to modify an existing string globally, capitalizing letters
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'61'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what does the method name 'gsub' stand for?
    STRING
    answer='global substitution'
    answers=<<-STRING
global substitution
go to subroutine
go substitute
general substitution
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'62'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to change the name inside the sentences. make sure to create a new
string and not modify the original.

given....................string1='see Bob sit. see Bob walk. see Bob run.'
change...................Bob to Fido
variable.................new_string
    STRING
    answer=<<-STRING
new_string=string1.gsub('Bob','Fido')
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'63'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to change the word inside the sentences. make sure to modify the
original string.

given....................string1='see cat sleep. see cat walk. see cat poo.'
change...................cat to bird

    STRING
    answer=<<-STRING
string1.gsub!('cat','bird')
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'64'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'gsub' or 'gsub!' method, what goes in the first parameter?

example...................string1.gsub('this','that')
    STRING
    answer='the string or character to be replaced'
    answers=<<-STRING
the string or character to be replaced
the new string or character
the string pattern being searched for
the character being searched for
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'65'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'gsub' or 'gsub!' method, what goes in the second parameter?

example...................string1.gsub('this','that')
    STRING
    answer='the new string or character'
    answers=<<-STRING
the string or character to be replaced
the new string or character
the string pattern being searched for
the character being searched for
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'66'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using  the 'sub', 'sub!', 'gsub', or 'gsub!' methods what should
we remember?
    STRING
    answer='they will read the string pattern even if part of another string'
    answers=<<-STRING
they will read the string pattern even if part of another string
they are very precise to the pattern
they will only read that pattern
they are not case sensitive
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  #==================================================================================================================
  # include? method =================================================================================================
  #==================================================================================================================

  rolling_count+=1
'67'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what method do we use to check if a character pattern is within a string?
    STRING
    answer='include? method'
    answers=<<-STRING
include? method
has_string? method
has_value? method
has_key? method
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'68'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'include?' method to check for strings, what should we be
aware of?
    STRING
    answer='include? is case sensitive'
    answers=<<-STRING
include? is case sensitive
include? only checks for whole words
include? does not check for characters
include? returns the string
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'69'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to check if the following character pattern is in the string.

given............................string1='Today is Saturday'
variable.........................string_pattern
check for.......................'at'
    STRING
    answer=<<-STRING
string_pattern=string1.include?('at')
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #==================================================================================================================
  # index method ====================================================================================================
  #==================================================================================================================

  rolling_count+=1
'70'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to find the starting index of a character pattern within a string.

given........................string1='Today is Saturday'
variable.....................pattern_index
find index for..............'day'
    STRING
    answer=<<-STRING
pattern_index=string1.index('day')
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'71'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'index' method to find the index of a character pattern, what
should we be aware of?
    STRING
    answer='index returns the starting index of the string'
    answers=<<-STRING
index returns the starting index of the string
index returns the index of the string
index modifies the original string
index returns true if string is found
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  #==================================================================================================================
  # insert method ===================================================================================================
  #==================================================================================================================

  rolling_count+=1
'72'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'insert' method with strings what are the different ways we
can insert items?
    STRING
    answer='(1,string),(-1,string),(at the end,string)'
    answers=<<-STRING
(1,string),(-1,string),(at the end,string)
(1,string),(-1,string),(any where,string)
(1,string),(-1,string),(1..2,string),(1..-2,string)
(1,string),(1,2,3,string)
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'73'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what will the following program print?

        0000
        0123
string='abcd'
string.insert(0,'X')
puts string
    STRING
    answer='Xabcd'
    answers=<<-STRING
Xabcd
abcXd
abcdX
abXcd
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'74'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what will the following program print?

        0000
        0123
string='abcd'
string.insert(3,'X')
puts string
    STRING
    answer='abcXd'
    answers=<<-STRING
Xabcd
abcXd
abcdX
abXcd
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'75'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what will the following program print?

        0000
        0123
string='abcd'
string.insert(4,'X')
puts string
    STRING
    answer='abcdX'
    answers=<<-STRING
Xabcd
abcXd
abcdX
abXcd
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'76'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'insert' method with a string, what should we know?
    STRING
    answer='insert modifies the original string'
    answers=<<-STRING
insert modifies the original string
insert creates a new string
insert returns the item being inserted
insert returns the index being inserted at
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'77'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'insert' method with strings, what should we know about
inserting an item at the end?
    STRING
    answer='if no spaces skipped, we can keep inserting at the end'
    answers=<<-STRING
if no spaces skipped, we can keep inserting at the end
we cannot insert at the end because it is out of index
we can insert second to the end
we can insert anywhere
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end

  rolling_count+=1
'78'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'insert' method with strings, if we insert an item at the
end with a space what will it return?

                                    0000
                                    0123
example:....................string='abcd'
                            string.insert(5,'X')
    STRING
    answer='error'
    answers=<<-STRING
error
abcdnilX
abcd_X
abcdXX
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'79'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to place a character in a string at a certain location:

                                        0000
                                        0123
given...........................string='abcd'
character.......................'@'
location........................center but use a negative index
#=>.............................'ab@cd'
    STRING
    answer=<<-STRING
string.insert(-3,'@')
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'80'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to place a character in a string at a certain location:

                                        0000
                                        0123
given...........................string='abcd'
character.......................'@'
location........................at the end but use a negative index
#=>.............................'abcd@'
    STRING
    answer=<<-STRING
string.insert(-1,'@')
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'81'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using insert on strings, we should think to ourselves that the
position the character or string we are inserting will be...
    STRING
    answer='the position that the character or string will occupy'
    answers=<<-STRING
the position that the character or string will occupy
the position that the character or string will be inserted
the position that the character or string will shift
the position that the character or string will unshift
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  #==================================================================================================================
  # join method =====================================================================================================
  #==================================================================================================================

  rolling_count+=1
'82'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'join' method used for?
    STRING
    answer='to convert an array into a string'
    answers=<<-STRING
to convert an array into a string
to convert an array of strings into a string
to convert an array of integers into a string
to convert a string into an array of integers
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'83'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to convert an array into a string

given....................array=['a','b','c']
variable.................string1
    STRING
    answer=<<-STRING
string1=array.join('')
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'84'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to convert an array of characters into a string with no spaces.

given....................array=['a','b','c']
variable.................string1
#=>......................'abc'
    STRING
    answer=<<-STRING
string1=array.join('')
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'85'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to convert an array of characters into a string that is
separated by spaces.

given....................array=['a','b','c']
variable.................string1
#=>......................'a b c'
    STRING
    answer=<<-STRING
string1=array.join(' ')
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end



  rolling_count+=1
'86'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to convert an array of characters into a string that is
separated by dashes.

given....................array=['a','b','c']
variable.................string1
#=>......................'a-b-c'
    STRING
    answer=<<-STRING
string1=array.join('-')
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'87'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'join' method, what goes in the parentheses?

example.................string1.array.join(' ')
    STRING
    answer='a string or character to join the strings together'
    answers=<<-STRING
a string or character to join the strings together
a string that delimits the string of arrays
a character to join the strings together
a new line
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  #==================================================================================================================
  # ljust method ====================================================================================================
  #==================================================================================================================

  rolling_count+=1
'88'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to pad a string on the right side with zeros.

given.....................string1='1010'
pad with..................'0'
variable..................padded_string
                          12345678
#=>.......................10100000
    STRING
    answer=<<-STRING
padded_string=string1.ljust(8,'0')
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end

  rolling_count+=1
'89'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'ljust' or 'rjust' methods, what does the first parameter
represent?

example.....................string1.ljust(10,'0')
    STRING
    answer='total number of characters'
    answers=<<-STRING
total number of characters
character used for padding
number of indices
default
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'90'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'ljust' or 'rjust' methods, what does the second parameter
represent?

example.....................string1.ljust(10,'0')
    STRING
    answer='character used for padding'
    answers=<<-STRING
total number of characters
character used for padding
number of indices
default
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'91'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'ljust' or 'rjust' methods, what does the first parameter
have to be?

example.....................string1.ljust(10,'0')
    STRING
    answer='an integer'
    answers=<<-STRING
an integer
a character
a float
a string
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'92'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'ljust' or 'rjust' methods, what does the second parameter
have to be?

example.....................string1.ljust(10,'0')
    STRING
    answer='a string'
    answers=<<-STRING
an integer
a symbol
a float
a string
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  #==================================================================================================================
  # lstrip and lstrip! methods ======================================================================================
  #==================================================================================================================

  rolling_count+=1
'93'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'lstrip' method used for?
    STRING
    answer='creating a new string with no leading white space'
    answers=<<-STRING
creating a new string with no leading or trailing white space
creating a new string with no leading white space
creating a new string with no trailing white space
creating a new string with no white space
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'94'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'lstrip!' method used for?
    STRING
    answer='modifying an existing string so it has no leading white space'
    answers=<<-STRING
modifying an existing string removing leading and trailing white space
modifying an existing string so it has no leading white space
modifying an existing string removing trailing white space
modifying an existing string removing all white space
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'95'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code that creates a new string with no leading white spaces

given....................string1='    Hat     '
variable.................new_string
    STRING
    answer=<<-STRING
new_string=string1.lstrip
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'96'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code that modifies an existing string so that it has no leading white
spaces

given....................string1='    Hat     '
    STRING
    answer=<<-STRING
string1.lstrip!
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #==================================================================================================================
  # ord method ======================================================================================================
  #==================================================================================================================

  rolling_count+=1
'97'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-RSTRING
when using the 'ord' method in strings what does it do?

    RSTRING
    answer='returns the integer ordinal of a character (ASCII)'
    answers=<<-RSTRING
returns the integer ordinal of a character (ASCII)
returns the character of an ASCII code
returns the size of the character
returns the hexadecimal value of the character
    RSTRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'98'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-RSTRING
write code to return the integer ordinal (ASCII) of a character.

given.....................string='h'
variable..................character_ascii

    RSTRING
    answer=<<-RSTRING
character_ascii=string.ord
    RSTRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #==================================================================================================================
  # reverse and reverse! methods ====================================================================================
  #==================================================================================================================

  rolling_count+=1
'99'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-RSTRING
in strings, what does the 'reverse' method do?
    RSTRING
    answer='creates a new string with the characters in reverse order'
    answers=<<-RSTRING
creates a new string with the characters in reverse order
creates a new string with the characters in reverse case
creates a new string with the characters upside down
creates a new string with the characters in alpha order
    RSTRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'100'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-RSTRING
in strings, what does the 'reverse!' method do?
    RSTRING
    answer='modifies an existing string with the characters in reverse order'
    answers=<<-RSTRING
modifies an existing string with the characters in reverse order
modifies an existing string with the characters in reverse case
modifies an existing string with the characters upside down
modifies an existing string with the characters in alpha order
    RSTRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'101'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-RSTRING
write code to create a new string with the characters in reverse order.

given:................string='this is a test sentence.'
variable:.............reverse_string
    RSTRING
    answer=<<-RSTRING
reverse_string=string.reverse
    RSTRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'102'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-RSTRING
write code to modify an existing string with the characters in reverse order.

given:................string='this is a test sentence.'
    RSTRING
    answer=<<-RSTRING
string.reverse!
    RSTRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'103'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-RSTRING
when using the 'reverse' method on strings what should we know
    RSTRING
    answer='it creates a new string'
    answers=<<-RSTRING
it creates a new string
it modifies the existing string
it returns the original string
it modifies a copy of the string
    RSTRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'104'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-RSTRING
when using the 'reverse!' method on strings what should we know
    RSTRING
    answer='it modifies the existing string'
    answers=<<-RSTRING
it creates a new string
it modifies the existing string
it returns the original string
it modifies a copy of the string
    RSTRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  #==================================================================================================================
  # rjust method ====================================================================================================
  #==================================================================================================================

  rolling_count+=1
'105'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to pad a string on the left side with zeros.

given....................string1='1010'
variable.................padded_string
                         12345678
#=>......................00001010
    STRING
    answer=<<-STRING
padded_string=string1.rjust(8,'0')
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #==================================================================================================================
  # rstrip and rstrip! methods ======================================================================================
  #==================================================================================================================

  rolling_count+=1
'106'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'rstrip' method used for?
    STRING
    answer='creating a new string with no trailing white space'
    answers=<<-STRING
creating a new string with no leading or trailing white space
creating a new string with no leading white space
creating a new string with no trailing white space
creating a new string with no white space
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'107'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'rstrip!' method used for?
    STRING
    answer='modifying an existing string to remove trailing white space'
    answers=<<-STRING
modifying an existing string to remove leading and trailing white space
modifying an existing string to remove leading white space
modifying an existing string to remove trailing white space
modifying an existing string to remove all white space
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'108'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
create a new string with no trailing white spaces

given....................string1='    Hat     '
variable.................new_string
    STRING
    answer=<<-STRING
new_string=string1.rstrip
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'109'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
modify an existing string so it has no trailing white spaces

given....................string1='    Hat     '
    STRING
    answer=<<-STRING
string1.rstrip!
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #==================================================================================================================
  # slice and slice! methods ========================================================================================
  #==================================================================================================================


  rolling_count+=1
'110'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the 'slice!' method to delete characters from a string, what are
the different ways we can do this?
    STRING
    answer="(1),(-1),(1,3),(1..3),(1..-3),(/regexp/),('literal')"
    answers=<<-STRING
(1),(-1),(1,3),(1..3),(1..-3),(/regexp/),('literal')
(1),(-1),(1,3),(1..3),(1,2,3),(/regexp/),('literal')
(1),(-1),(1,3),(1..3),(1..-3)
(1),(-1),(1,3),(1..3),(1..-3),(1..2,4..6)
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'111'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'slice!' method on strings what does it return?
    STRING
    answer='the item(s) being removed'
    answers=<<-STRING
the item(s) being removed
a copy of the original string
the original string
the index of the string
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'112'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'slice!' method on strings what should we remember?
    STRING
    answer='it modifies the original string'
    answers=<<-STRING
it modifies the original string
it creates a new string
it deletes the whole string
it returns a copy of the original string
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'113'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the 'slice!' method on a string, think of the different ways
that we can delete parts of the string...

now use the index method.

                                       0000000000111111111122222
                                       0123456789012345678901234
given..........................string='so you want to be a hero?'
delete.........................'y'
    STRING
    answer=<<-STRING
string.slice!(3)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'114'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the slice! method on a string, think of the different ways
that we can delete parts of the string...

now use the index method with a negative index.

                                       0000000000111111111122222
                                       0123456789012345678901234
given..........................string='so you want to be a hero?'
delete.........................'?'
    STRING
    answer=<<-STRING
string.slice!(-1)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'115'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the slice! method on a string, think of the different ways
that we can delete parts of the string... dont forget to include
the space after the string.

now use the index and length method.

                                       0000000000111111111122222
                                       0123456789012345678901234
given..........................string='so you want to be a hero?'
delete.........................'so you want '
    STRING
    answer=<<-STRING
string.slice!(0,12)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'116'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the slice! method on a string, think of the different ways
that we can delete parts of the string...

now use the range method.

                                       0000000000111111111122222
                                       0123456789012345678901234
given..........................string='so you want to be a hero?'
delete.........................'to be'
    STRING
    answer=<<-STRING
string.slice!(12..16)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'117'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the slice! method on a string, think of the different ways
that we can delete parts of the string...

now use the range method with a negative range.

                                       0000000000111111111122222
                                       0123456789012345678901234
given..........................string='so you want to be a hero?'
delete.........................'to be a hero?'
    STRING
    answer=<<-STRING
string.slice!(12..-1)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'118'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the slice! method on a string, think of the different ways
that we can delete parts of the string...

now use the literal string method. note that this will only remove a single
letter 'a' from the string.

                                       0000000000111111111122222
                                       0123456789012345678901234
given..........................string='so you want to be a hero?'
delete.........................'a'
    STRING
    answer=<<-STRING
string.slice!('a')
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'119'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the 'slice' method to access characters from a string, what
are the different ways we can do this?
    STRING
    answer="(1),(-1),(1,3),(1..3),(1..-3),(/regexp/),('literal')"
    answers=<<-STRING
(1),(-1),(1,3),(1..3),(1..-3),(/regexp/),('literal')
(1),(-1),(1,3),(1..3),(1,2,3),(/regexp/),('literal')
(1),(-1),(1,3),(1..3),(1..-3)
(1),(-1),(1,3),(1..3),(1..-3),(1..2,4..6)
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'120'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'slice!' method on strings what should we remember?
    STRING
    answer='it returns the item from the sliced location'
    answers=<<-STRING
it returns the item from the sliced location
it creates a new string
it deletes the whole string
it returns the modified string
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'121'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the difference between the slice and slice! methods?
    STRING
    answer="slice! removes items, slice just reads it"
    answers=<<-STRING
slice! removes items, slice just reads it
slice returns deleted items
slice! returns a copy of the original string
slice returns strings slice! does not
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  #==================================================================================================================
  # split method ====================================================================================================
  #==================================================================================================================

  rolling_count+=1
'122'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'split' method used for?
    STRING
    answer='to convert a string into an array of strings'
    answers=<<-STRING
to convert a string into an array of strings
to convert an array of strings into a string
to convert an array of integers into a string
to convert a string into an array of integers
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'123'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to convert a string separated with spaces into an array of strings.

given....................string1='a b c d'
variable.................array
#=>......................['a','b','c','d']
    STRING
    answer=<<-STRING
array=string1.split(' ')
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'124'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to convert a string separated with dashes into an array of strings.

given....................string1='a-b-c-d'
variable.................array
#=>......................['a','b','c','d']
    STRING
    answer=<<-STRING
array=string1.split('-')
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'125'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'split' method, what goes in the parentheses?

example........................array=string1.split(' ')
    STRING
    answer='the character or string pattern that end each item'
    answers=<<-STRING
the character or string pattern that end each item
the string pattern to search for
the character to search for
the item to replace
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'126'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-RSTRING
write code to convert a string of words into an array of words.

given....................string='this is a sentence'
use variable.............array_of_words
    RSTRING
    answer=<<-RSTRING
array_of_words=string.split(' ')
    RSTRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'127'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-RSTRING
write code to convert a string into an array of characters using the split
method.

given....................string='alphabet'
use variable.............array_of_characters
    RSTRING
    answer=<<-RSTRING
array_of_characters=string.split('')
    RSTRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #==================================================================================================================
  # start_with? method ==============================================================================================
  #==================================================================================================================

  rolling_count+=1
'128'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'start_with?' method used for?
    STRING
    answer='to check if the string starts with a particular string pattern'
    answers=<<-STRING
to check if the string starts with a particular string pattern
to check if the string ends with a particular string pattern
to check if any of the words start with a particular string pattern
to check if any of the words end with the particular string pattern
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'129'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to check if the string starts with a particular character pattern

given....................string1='ruby programming'
variable.................string_pattern
check for................'ru'
    STRING
    answer=<<-STRING
string_pattern=string1.start_with?('ru')
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #==================================================================================================================
  # strip and strip! methods ========================================================================================
  #==================================================================================================================

  rolling_count+=1
'130'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'strip' method used for?
    STRING
    answer='creating a new string with no leading or trailing white space'
    answers=<<-STRING
creating a new string with no leading or trailing white space
creating a new string with no leading white space
creating a new string with no trailing white space
creating a new string with no white space
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'131'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'strip!' method used for?
    STRING
    answer='modifying an existing string removing leading and trailing white space'
    answers=<<-STRING
modifying an existing string removing leading and trailing white space
modifying an existing string removing leading white space
modifying an existing string removing trailing white space
modifying an existing string removing all white space
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'132'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
create a new string that has no leading or trailing white space

given....................string1='    Hat     '
variable.................new_string
    STRING
    answer=<<-STRING
new_string=string1.strip
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'133'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
modify an existing string so that it has no leading or trailing white space

given....................string1='    Hat     '
    STRING
    answer=<<-STRING
string1.strip!
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #==================================================================================================================
  # sub and sub! methods ============================================================================================
  #==================================================================================================================
  rolling_count+=1
'134'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'sub' method used for?
    STRING
    answer='to create a new string, substituting a new string pattern'
    answers=<<-STRING
to create a new string, substituting a new string pattern
to create a new string, substituting integers for strings
to create a new string, substituting floats for strings
to create a new string, substituting arrays for hashes
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'135'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'sub!' method used for?
    STRING
    answer='to modify an existing string, substituting a new string'
    answers=<<-STRING
to modify an existing string, substituting a new string
to modify an existing string, substituting integers for strings
to create a new string, substituting floats for strings
to create a new string, substituting arrays for hashes
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'136'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to replace a string, make sure to create a new string in the process

given....................string1='now you see me'
substitute with..........'now you dont'
variable.................new_string
    STRING
    answer=<<-STRING
new_string=string1.sub('now you see me','now you dont')
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'137'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to replace a string, make sure to modify the original

given....................string1='now you see me'
substitute with..........'now you dont'
    STRING
    answer=<<-STRING
string1.sub!('now you see me','now you dont')
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'138'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what will the following code print?

string1='see spot. see spot sit. see spot run.'
new_string=string1.sub('spot','bud')
puts new_string
    STRING
    answer='see bud. see spot sit. see spot run.'
    answers=<<-STRING
see bud. see spot sit. see spot run.
see bud. see bud sit. see bud run.
see bud. see bud sit. see spot run.
see spot. see spot sit. see bud run.
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'139'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'sub!' or 'sub' methods, what goes in the first parameter?

example.................string1.sub('this','that')
    STRING
    answer='the string or character to be replaced'
    answers=<<-STRING
the string or character to be replaced
the new string or character
the string to be searched
the string to be merged
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'140'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'sub!' or 'sub' methods, what goes in the second parameter?

example.................string1.sub('this','that')
    STRING
    answer='the new string or character'
    answers=<<-STRING
the string or character to be replaced
the new string or character
the string or character to be searched
the string or character to be merged
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  #==================================================================================================================
  # to_i method =====================================================================================================
  #==================================================================================================================

  rolling_count+=1
'141'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to convert a string into an integer

given....................string1='69'
variable.................integer
    STRING
    answer=<<-STRING
integer=string1.to_i
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #==================================================================================================================
  # to_s ============================================================================================================
  #==================================================================================================================

  rolling_count+=1
'142'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what does the to_s method do?
    STRING
    answer='it converts an object into a string representation'
    answers=<<-STRING
it converts an object into a string representation
it turns arrays into a string representation
it turns hashes into a string representation
it turns ranges into a string representation
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'143'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to represent the following data type to a string representation:

given hash.................people={'joe'=>21, 'bill'=>35, 'sally'=>24}
use variable...............string_rep
#=>........................{"joe"=>21, "bill"=>35, "sally"=>24}

    STRING
    answer=<<-STRING
string_rep=people.to_s
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'144'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to represent the following data type to a string representation:

given array................num_list=[1,2,3,4,5,6,7,8,9]
use variable...............string_rep
#=>........................[1,2,3,4,5,6,7,8,9]

    STRING
    answer=<<-STRING
string_rep=num_list.to_s
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'145'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to represent the following data type to a string representation:

given range................range=(1..9)
use variable...............string_rep
#=>........................1..9

    STRING
    answer=<<-STRING
string_rep=range.to_s
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #==================================================================================================================
  # to_sym method ===================================================================================================
  #==================================================================================================================

  rolling_count+=1
'146'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-RSTRING
what is the 'to_sym' method used for?
    RSTRING
    answer='to convert a string to a symbol'
    answers=<<-RSTRING
to convert a string to a symbol
to convert a symbol to a string
to convert an integer to a symbol
to convert a float to  a symbol
    RSTRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'147'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-RSTRING
write code to convert a string to a symbol.

given....................letter='a'
use variable.............symbol
    RSTRING
    answer=<<-RSTRING
symbol=letter.to_sym
    RSTRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #==================================================================================================================
  # upcase and upcase! methods ======================================================================================
  #==================================================================================================================

  rolling_count+=1
'148'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when comparing strings, case matters. what is a good thing to do before
comparing strings?
    STRING
    answer='use upcase or downcase on both strings'
    answers=<<-STRING
use upcase or downcase on both strings
use ==
use dup
use copy
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'149'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'upcase' method used for?
    STRING
    answer='to create a new string with all uppercase characters'
    answers=<<-STRING
to create a new string with all uppercase characters
to create a new string with the first letter capitalized
to create a new string with the first letter of every word capitalized
to create a new string and make a certain string in all caps
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'150'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'upcase!' method used for?
    STRING
    answer='to modify an existing string making all characters uppercase'
    answers=<<-STRING
to modify an existing string making all characters uppercase
to modify an existing string making the first letter capitalized
to modify an existing string making the first letter of every word caps
to modify an existing string making a certain string all caps
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'151'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
create a new string with all characters uppercase

given....................string1='the cat in the hat'
variable.................new_string
    STRING
    answer=<<-STRING
new_string=string1.upcase
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'152'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
modify an existing string making all the characters uppercase

given....................string1='the cat in the hat'
    STRING
    answer=<<-STRING
string1.upcase!
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #==================================================================================================================
  # [] method =======================================================================================================
  #==================================================================================================================

  rolling_count+=1
'153'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using [] method, think of the different ways we can access parts of the string.
write code to do this.

now write code using the index and length method!

                                         000000
                                         012345 
given...........................string1='abc123'
variable........................string_captured
access..........................'abc'
    STRING
    answer=<<-STRING
string_captured=string1[0,3]
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'154'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using [] method, think of the different ways we can access parts of the string.
write code to do this.

now write code using the range method!

                                         000000
                                         012345
given...........................string1='abc123'
variable........................captured_string
access..........................'abc'
    STRING
    answer=<<-STRING
captured_string=string1[0..2]
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'155'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using [] method, think of the different ways we can access parts of the string.
write code to do this.

now write code using the range method with a negative range!

                                         000000
                                         012345
given...........................string1='abc123'
variable........................captured_string
access..........................'123'
    STRING
    answer=<<-STRING
captured_string=string1[3..-1]
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'156'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using [] method, think of the different ways we can access parts of the string.
write code to do this.

now use a negative index!

                                         000000
                                         012345
given...........................string1='abc123'
variable........................captured_string
access..........................'1'
    STRING
    answer=<<-STRING
captured_string=string1[-3]
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'157'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using [] what are the different ways we can access parts of a string?
    STRING
    answer="[1],[-1],[1,3],[1..3],[1..-1],['literal'],[/regexp/]"
    answers=<<-STRING
[1],[-1],[1,3],[1..3],[1..-1],['literal'],[/regexp/]
[1],[-1],[1,3],[1,2,3],[1..3],[1..-1]
[1],[-1],[1,3],[1..3]
[1],[1,3],[1..3],[1..-1]
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'158'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-RSTRING
using [] method, think of the different ways we can access parts of the string.
write code to do this.

now use a literal...

given:................string='there is a troll in this sentence.'
variable:.............captured
capture:..............troll

    RSTRING
    answer=<<-RSTRING
captured=string['troll']
    RSTRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'159'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-RSTRING
when using a literal and the [] method to capture a string pattern but
the string pattern was not found, what will be returned?

example code:..........string='humpty dumpty had a great fall'
                       captured=string['troll']
    RSTRING
    answer='nil'
    answers=<<-RSTRING
nil
error
0
nothing
    RSTRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'160'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-RSTRING
using [] method, think of the different ways we can access parts of the string.
write code to do this.

now use regexp...

given:................string='there is a troll in this sentence.'
variable:.............captured
capture:..............troll

    RSTRING
    answer=<<-RSTRING
captured=string[/troll/]
    RSTRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'161'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-RSTRING
when using a regexp and the [] method to capture a string pattern but
the string pattern was not found, what will be returned?

example code:..........string='humpty dumpty had a great fall'
                       captured=string[/troll/]
    RSTRING
    answer='nil'
    answers=<<-RSTRING
nil
error
0
nothing
    RSTRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  #==================================================================================================================
  # << method =======================================================================================================
  #==================================================================================================================

  rolling_count+=1
'162'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
working with strings, what is the << method used for?
    STRING
    answer='to concatenate strings'
    answers=<<-STRING
to concatenate strings
to concatenate arrays
to insert items into a string
to push items at the end of a string
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'163'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to concatenate strings into the variable string1 on a single line.

given....................string1=' '
.........................stringa='hello '
.........................stringb='there'
    STRING
    answer=<<-STRING
string1<<stringa<<stringb
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #==================================================================================================================
  # <<- (heredoc) method ============================================================================================
  #==================================================================================================================
  rolling_count+=1
'164'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the <<- (heredoc) method used for?
    STRING
    answer='for multiline strings'
    answers=<<-STRING
for multiline strings
for multiline program documentation
for program documentation
read the document
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'165'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to assign a multiline string using heredoc.

string variable..........string1
delimiter................STRING
assign...................'roses are red'
                         'violets are blue'
                         'oranges are orange'
    STRING
    answer=<<-STRING1
string1=<<-STRING
roses are red
violets are blue
oranges are orange
STRING
    STRING1
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

