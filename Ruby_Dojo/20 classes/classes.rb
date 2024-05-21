##################################################################################################################
#                                                                                                                #
# Program:......................classes.rb                                                                       #
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
#                                 allocate method                                                                #
#                                 attribute accessor                                                             #
#                                 attribute reader                                                               #
#                                 attribute writer                                                               #
#                                 class method                                                                   #
#                                 class variable                                                                 #
#                                 compact notation                                                               #
#                                 general object oriented programming                                            #
#                                 getter method                                                                  #
#                                 inheritance                                                                    #
#                                 initialize method                                                              #
#                                 instance method                                                                #
#                                 instance variable                                                              #
#                                 method overriding                                                              #
#                                 object instantiation                                                           #
#                                 setter method                                                                  #
#                                 snake case                                                                     #
#                                 super method                                                                   #
#                                 to_s method                                                                    #
##################################################################################################################



##################################################################################################################
# global variables                                                                                               #
##################################################################################################################
TITLE=                'classes'                                                # title for header
MISSED_QUESTIONS_FILE='../00 Tools/01 missed_questions/missed_questions'       # file containing missed questions
DRILLS_TEXT_FILE=     '../text_files/ProLanInv.txt'                            # text file to record drills metrics
DRILL_NAME=           '20 classes'                                             # name of this drill
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
  questions=Array.new(77){|index| index+1}                                                                       #
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
# allocate method ====================================================================================================
#=====================================================================================================================

rolling_count+=1
'1'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
how do we create an object without calling the constructor?
STRING
  answer='by using the allocate method'
  answers=<<-STRING
by using the allocate method
by calling a different method
by not providing parameters
by returning values
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  

rolling_count+=1
'2'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
given the following program, create an object called b1 without calling the
constructor method.

class Being
  def initialize
    puts 'being created'
  end
end
STRING
answer=<<-STRING
b1=Being.allocate
STRING
  result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end  

#=====================================================================================================================
# attribute accessor =================================================================================================
#=====================================================================================================================

rolling_count+=1
'3'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
- create a class called 'point'
- create one shortcut for getter and setter
  * for variables 'x' and 'y'
- initialize instance variables 'x' and 'y'
  * use multiple assignments on one line
STRING
answer=<<-STRING
class Point
  attr_accessor :x, :y
  def initialize(x,y)
    @x,@y=x,y
  end
end
STRING
  result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end  


rolling_count+=1
'4'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
attr_accessor, attr_reader, attr_writer takes what as an argument before
creating the required methods? 
STRING
  answer='a symbol of the instance variable'
  answers=<<-STRING
a symbol of the instance variable
a hash
an array
a string
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  

rolling_count+=1
'5'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
what is an attribute accessor (attr_accessor)?
STRING
  answer='it is a shortcut for a setter and getter method'
  answers=<<-STRING
it is a shortcut for a setter and getter method
it reads data from files
it reads input from the keyboard
it gets input from the user
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  

#=====================================================================================================================
# attribute reader ===================================================================================================
#=====================================================================================================================

rolling_count+=1
'6'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
when is it preferred to use attr_reader or attr_writer?
STRING
  answer='when there are a lot of instance variables'
  answers=<<-STRING
when there are a lot of instance variables
when there are a lot of class methods
when there are a lot of instance methods
it is always preferred
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  

rolling_count+=1
'7'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
in the given code use an attribute reader:
in the given code use an attribute reader:

class Animal
  _________________________<-(YOUR CODE WILL GO HERE)
  def initialize(name,legs)
    @name=name
    @legs=legs
  end
end

use attribute reader with......name, and legs
STRING
answer=<<-STRING
  attr_reader :name, :legs
STRING
  result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end 

rolling_count+=1
'8'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
what is an attribute reader (attr_reader)?
STRING
  answer='it is a shortcut for a getter method'
  answers=<<-STRING
it is a shortcut for a getter method
it reads data from files
it reads input from the keyboard
it is a shortcut for a setter method
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  

#=====================================================================================================================
# attribute writer ===================================================================================================
#=====================================================================================================================

rolling_count+=1
'9'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
  in the following code use an attribute writer:

  class Animal
    attr_reader :name, :legs
    _________________________<-(YOUR CODE GOES HERE)
    def initialize(name,legs)
      @name=name
      @legs=legs
    end
  end
  STRING
  answer=<<-STRING
  attr_writer :name, :legs
  STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

rolling_count+=1
'10'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
what is an attribute writer (attr_writer)?
STRING
  answer='it is a shortcut for a setter method'
  answers=<<-STRING
it is a shortcut for a setter method
it reads data from files
it reads input from the keyboard
it gets data from a collection
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  

#=====================================================================================================================
# class method =======================================================================================================
#=====================================================================================================================

rolling_count+=1
'11'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
when creating a class, what must we remember abot the class name?
STRING
  answer='it must start with an uppercase letter'
  answers=<<-STRING
it must start with an uppercase letter
it must start with a lowercase letter
it must start with an underscore
it must start with a $
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  


rolling_count+=1
'12'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
- create a class called 'monster'
- initialize a class variable to zero for counting monsters
  * use 'count' as the variable
- define an initialize method
  * initialize 'type' and 'strength' use multi-variable assignment
  * initialize the 'count' variable to +1
- create a class method that prints out the count called 'print count'
  * use puts
  * format: "monster count is: (count)"
  * use compact notation for the 'count' variable
STRING
answer=<<-STRING
class Monster
  @@count=0
  def initialize(type,strength)
    @type,@strength=type,strength
    @@count+=1
  end
  def self.printCount
    puts "monster count is: \#@@count"
  end
end
STRING
  result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end  


rolling_count+=1
'13'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
here we need to create a class then define a class method.

class..................calc
method.................sqr
parameter..............x
calculate..............x*x
print..................square root of 8
STRING
answer=<<-STRING
class Calc
  def self.sqr(x)
    x*x
  end
end
puts Calc.sqr(8)
STRING
  result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end  


rolling_count+=1
'14'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
what is a 'class' method?
STRING
  answer='methods usable by classes only and not instances'
  answers=<<-STRING
methods usable by classes only and not instances
methods called by a class
methods that return class variables
any method really
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  


rolling_count+=1
'15'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
how do we know to use a class instead of a module in our programs?
STRING
  answer="if the relationship can be defined as a 'is-a' relationship"
  answers=<<-STRING
if the relationship can be defined as a 'is-a' relationship
if the relationship can be defined as a 'could-a' relationship
if the relationship can be defined as a 'should-a' relationship
if the relationship can be defined as a 'has-a' relationship
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  


rolling_count+=1
'16'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
classes are about?
STRING
  answer='objects'
  answers=<<-STRING
objects
methods
variables
data
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  


rolling_count+=1
'17'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
define a class called 'my class name' using camel case
STRING
answer=<<-STRING
class MyClassName
STRING
  result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end  


rolling_count+=1
'18'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
what is the preferred way to write a class name that contains multiple words?
STRING
  answer='use camel case'
  answers=<<-STRING
use camel case
use snake case
use chicken case
use dog case
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  

rolling_count+=1
'19'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
how do we make a class?
STRING
  answer='by using the class keyword'
  answers=<<-STRING
by using the class keyword
by calling one
by invoking one
by using the def key word
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  

#=====================================================================================================================
# class variable =====================================================================================================
#=====================================================================================================================

rolling_count+=1
'20'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
what is the output of the following program?

class Box
  @@count=0
  def initialize(w,h)
    @width=w
    @height=h
    @@count+=1
  end
  def self.printCount()
    puts "box count is: \#@@count"
  end
end
box1=Box.new(10,20)
box2=Box.new(30,40)
puts Box.printCount
STRING
  answer='box count is: 2'
  answers=<<-STRING
box count is: 2
box count is: 3
box count is: 1
box count is: 4
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  

rolling_count+=1
'21'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
what is a class variable?
STRING
  answer='a single variable shared by the class'
  answers=<<-STRING
a single variable shared by the class
variables belonging to each instance
local variables
a global variable
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  

#=====================================================================================================================
# compact notation ===================================================================================================
#=====================================================================================================================

rolling_count+=1
'22'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
compact notation only works with?
STRING
  answer='instance, class, global variables'
  answers=<<-STRING
instance, class, global variables
local variables
instance, class, local variables
class variables only
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  


rolling_count+=1
'23'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
which of the following is an example of a compact notation?
STRING
  answer='puts \"\#@@count\"'
  answers=<<-STRING
puts \"\#@@count\"
puts "{\#@@count}"
puts "{count}"
puts "%count"
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  

rolling_count+=1
'24'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
what is compact notation?
STRING
  answer='shortcut to interpolate instance, class, or global variables'
  answers=<<-STRING
shortcut to interpolate instance, class, or global variables
shortcut to interpolate local, class, or global variables
shortcut to interpolate instance, class, or static variables
shortcut to interpolate variable values
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  

#=====================================================================================================================
# general object oriented programming ================================================================================
#=====================================================================================================================

rolling_count+=1
'25'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
what are the two steps in creating an object?
STRING
  answer='define a class, create an instance'
  answers=<<-STRING
define a class, create an instance
define a class, call a method
define a class, initialize a variable
define a class, call the class
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  


rolling_count+=1
'26'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
how do objects communicate with one another?
STRING
  answer='through methods'
  answers=<<-STRING
through methods
through data
through variables
through classes
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  


rolling_count+=1
'27'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
an object is a combination of what?
STRING
  answer='data and methods'
  answers=<<-STRING
data and methods
data and variables
data and classes
data and instances
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  

rolling_count+=1
'28'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
what is the basic building block of a ruby oop program?
STRING
  answer='objects'
  answers=<<-STRING
objects
methods
variables
data
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  

#=====================================================================================================================
# getter method ======================================================================================================
#=====================================================================================================================

rolling_count+=1
'29'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
given the following program, assign the width and height to the variables x
and y

class Box
  def initialize(w,h)
    @width=w
    @height=h
  end
  def printWidth
    @width
  end
  def printHeight
    @height
  end
end
box=Box.new(10,20)
STRING
answer=<<-STRING
x=box.printWidth
y=box.printHeight
STRING
  result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end  


rolling_count+=1
'30'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
how do we identify a 'getter' method?
STRING
  answer='getter methods returns an instance variable'
  answers=<<-STRING
getter methods returns an instance variable
getter method has the name getter
getter methods has an '=' sign
getter methods have '?' in the method name
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  

rolling_count+=1
'31'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
what does a 'getter' method do?
STRING
  answer='allows reading of instance variables'
  answers=<<-STRING
allows reading of instance variables
allows access to local variables
makes instance variables global
gets the value of a variable
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  

#=====================================================================================================================
# inheritance ========================================================================================================
#=====================================================================================================================

rolling_count+=1
'32'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
how many classes are our subclasses allowed to inherit from?
STRING
  answer='just one'
  answers=<<-STRING
just one
as many as we want
twenty at the most
five
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  


rolling_count+=1
'33'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
consider the following: 'A' inherits from 'B', which inherits from 'C'. which
class is considered the superclass of 'B'?
STRING
  answer='C'
  answers=<<-STRING
C
A
B
A and C
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  


rolling_count+=1
'34'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
in a multilevel inheritance, where dog inherits from mammal, which inherits
from animal, what kind of relationship is this called?
STRING
  answer='is a relationship'
  answers=<<-STRING
is a relationship
is the same as relationship
is like relationship
is equal to relationship
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  


rolling_count+=1
'35'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
class Animal
  def initialize(name,color)
    @name=name
    @color=color
  end
  def speak
    puts 'hi'
  end
end
class Dog<Animal
end

create a subclass cat
use attribute accessor for age
override speak method to say meow
create cat instance called c with name:lucy and color:white
make c's age=2
make c speak 
STRING
answer=<<-STRING
class Cat<Animal
  attr_accessor :age
  def speak
    puts 'meow'
  end
end
c=Cat.new('lucy','white')
c.age=2
c.speak
STRING
  result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end  


rolling_count+=1
'36'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
class Animal
  def initialize(name,color)
    @name=name
    @color=color
  end
  def speak
    puts 'hi'
  end
end

create a subclass called dog
instantiate dog as d with name:fido and color:red
make d speak 
STRING
answer=<<-STRING
class Dog<Animal
end
d=Dog.new('fido','red')
d.speak
STRING
  result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end  


rolling_count+=1
'37'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
given that a subclass called 'Dog' was created from a superclass called
'Animal', create an instance of the dog class called 'd'.
STRING
answer=<<-STRING
d=Dog.new
STRING
  result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end  


rolling_count+=1
'38'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
what operator is used to inherit a class from another class?
STRING
  answer='<'
  answers=<<-STRING
<
>
=
+
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  


rolling_count+=1
'39'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
what is the class being inherited from called?
STRING
  answer='superclass or base class'
  answers=<<-STRING
superclass or base class
subclass or derived class
lower class
upper class
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  


rolling_count+=1
'40'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
what is the inheriting class called?
STRING
  answer='subclass or derived class'
  answers=<<-STRING
subclass or derived class
superclass or base class
lower class
upper class
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  


rolling_count+=1
'41'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
given the 'Animal class', define a subclass called 'Dog'.
STRING
answer=<<-STRING
class Dog<Animal
end
STRING
  result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end  

rolling_count+=1
'42'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
what is inheritance in objects?
STRING
  answer='where subclasses inherits attributes and behavior from a super class'
  answers=<<-STRING
where subclasses inherits attributes and behavior from a super class
where methods receives attributes from methods
where attributes are passed as parameters
where data is entered by user
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  

#=====================================================================================================================
# initialize method ==================================================================================================
#=====================================================================================================================

rolling_count+=1
'43'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
what is the only method that is called and not inherited?
STRING
  answer='the initialize method (constructor)'
  answers=<<-STRING
the initialize method (constructor)
the to_s method
the getter method
the setter method
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  


rolling_count+=1
'44'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
what happens to a class' constructor (initialize method) when an object is
created?
STRING
  answer='it is automatically called'
  answers=<<-STRING
it is automatically called
it is inherited
it is modified
it is copied
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  


rolling_count+=1
'45'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
constructors (initialize methods) do not return what?
STRING
  answer='values'
  answers=<<-STRING
values
methods
classes
calls
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  


rolling_count+=1
'46'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
in ruby what is known as a constructor?
STRING
  answer='the initialize method'
  answers=<<-STRING
the initialize method
the to_s method
the getter method
the setter method
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  


rolling_count+=1
'47'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
how do we recognize an 'initialize' method?
STRING
  answer='it is called initialize'
  answers=<<-STRING
it is called initialize
it takes a parameter
it assigns values to variables
it returns values
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  

rolling_count+=1
'48'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
what is an initialize method used for?
STRING
  answer='used to initialize variables'
  answers=<<-STRING
used to initialize variables
used to pass values
used to set objects
used to create objects
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  

#=====================================================================================================================
# instance method ====================================================================================================
#=====================================================================================================================

rolling_count+=1
'49'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
name three special instance methods:
STRING
  answer='initialize, getter, setter'
  answers=<<-STRING
initialize, getter, setter
reader, writer, definer
constructor, destructor, accessor
getter, setter, definer
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  

rolling_count+=1
'50'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
what are instance methods?
STRING
  answer='methods usable by any instance'
  answers=<<-STRING
methods usable by any instance
methods outside the class body
stand alone methods
methods used by the class
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  

#=====================================================================================================================
# instance variable ==================================================================================================
#=====================================================================================================================

rolling_count+=1
'51'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
instance variables are private and that is why we need what to access them?
STRING
  answer='getter and setter methods'
  answers=<<-STRING
getter and setter methods
values
method call
getter
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  


rolling_count+=1
'52'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
what are instance variables also known as?
STRING
  answer='attributes'
  answers=<<-STRING
attributes
local
private
global
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  


rolling_count+=1
'53'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
what is an instance variable?
STRING
  answer='variables defined in a class, which each object has a separate copy'
  answers=<<-STRING
variables defined in a class, which each object has a separate copy
variable shared by all instance
local variables
global variables
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  

rolling_count+=1
'54'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
instance variables have what type of access?
STRING
  answer='private'
  answers=<<-STRING
private
public
global
plural
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  

#=====================================================================================================================
# method overriding ==================================================================================================
#=====================================================================================================================
rolling_count+=1
'55'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
what is method overriding?
STRING
  answer='replacing an inherited method'
  answers=<<-STRING
replacing an inherited method
sending parameters to a method
sending a block to a method
changing method parameters
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  

#=====================================================================================================================
# object instantiation ===============================================================================================
#=====================================================================================================================

rolling_count+=1
'56'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
what are instances?
STRING
  answer='objects created at runtime'
  answers=<<-STRING
objects created at runtime
classes that are called
objects that return values
methods that are called
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  

rolling_count+=1
'57'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
given the following program, create an instance of a box called 'box' with
width 10 and height 20

class Box
  def initialize(w,h)
    @width=w
    @height=h
  end
  def printWidth
    @width
  end
  def printHeight
    @height
  end
end 
STRING
answer=<<-STRING
box=Box.new(10,20)
STRING
  result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end  

#=====================================================================================================================
# setter method ======================================================================================================
#=====================================================================================================================

rolling_count+=1
'58'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
not all setter methods have an equal operator in the name. what other way can
we identify a setter method?
STRING
  answer='setter methods will assign value to instance variables'
  answers=<<-STRING
setter methods will assign value to instance variables
setter methods have setter as name
setter methods returns values
setter methods have instance variables
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  


rolling_count+=1
'59'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
in ruby it is common to name a 'getter' or 'setter' method using what?
STRING
  answer='same name as the instance variable'
  answers=<<-STRING
same name as the instance variable
letters and underscores
uppercase letters
using snake case
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  


rolling_count+=1
'60'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
given the following program, reset width and height to 30 ,50

class Box
  def initialize(w,h)
    @width=w
    @height=h
  end
  def printWidth
    @width
  end
  def printHeight
    @height
  end
  def setWidth=(value)
    @width=value
  end
  def setHeight=(value)
    @height=value
  end
end
box=Box.new(100,100)
STRING
answer=<<-STRING
box.setWidth=30
box.setHeight=50
STRING
  result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end  


rolling_count+=1
'61'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
which one is a setter method?
STRING
  answer='def width=(value)'
  answers=<<-STRING
def width=(value)
def width(value=)
def =width(value)
def width(=value)
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  


rolling_count+=1
'62'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
how do we identify a 'setter' method?
STRING
  answer="setter methods have '=' sign in the name"
  answers=<<-STRING
setter methods have '=' sign in the name
setter methods have setter as name
setter methods returns values
setter methods have instance variables
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  


rolling_count+=1
'63'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
define two 'setter' methods inside of a class

given:
class Box
  def initialize(w,h)
    @width=w
    @height=h
  end
  def printWidth
    @width
  end
  def printHeight
    @height
  end
  ____________________<-(YOUR CODE GOES HERE)
end

setter method............set width
setter method............set height
use variable.............value (for both setter methods)
STRING
answer=<<-STRING
def setWidth=(value)
  @width=value
end
def setHeight=(value)
  @height=value
end
STRING
  result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end 
  
rolling_count+=1
'64'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
what does a setter method do?
STRING
  answer='allows modifying of instance variables'
  answers=<<-STRING
allows modifying of instance variables
allows modifying of instance variables
makes instance variables global
gets user input
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  

#=====================================================================================================================
# snake case =========================================================================================================
#=====================================================================================================================

rolling_count+=1
'65'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
define a method called 'my method name' using snake case. it does not take
parameters but make sure to use ()
STRING
answer=<<-STRING
def my_method_name()
end
STRING
  result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end  

#=====================================================================================================================
# super method =======================================================================================================
#=====================================================================================================================

rolling_count+=1
'66'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
given:    class A
            def initialize(x)
              puts x/2
            end
          end

         class B<A
            def initialize(y)
              super(y+2)
            end
          end

ob=B.new(6)
puts ob

what is the output of the above?
STRING
  answer='4'
  answers=<<-STRING
4
6
5
8
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  


rolling_count+=1
'67'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
given:   class Animal
           def initialize(name)
             @name=name
           end
         end

- create a subclass 'cat'
- override the initialize method
  * call super for the name
  * initialize  age variable
- create a to_s method
  * do not use print or puts
  * (name) is (age) years old.
- create an instance of cat called 'c'
  parameters are 'Bob' and 3
- print c using puts
STRING
answer=<<-STRING
class Cat<Animal
  def initialize(name,age)
    super(name)
    @age=age
  end
  def to_s
    "\\#{@name} is \\#{@age} years old."
  end
end
c=Cat.new('Bob',3)
puts c
STRING
  result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end  


rolling_count+=1
'68'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
where is super most commonly used?
STRING
  answer='in the initialize method'
  answers=<<-STRING
in the initialize method
in the speak method
in the getter method
in the setter method
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  


rolling_count+=1
'69'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
super calls the corresponding method of?
STRING
  answer='superclass'
  answers=<<-STRING
superclass
subclass
upper class
lower class
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  


rolling_count+=1
'70'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
given the program below, what is printed out?

class Animal
  def speak
    puts('hi')
  end
end
class Cat<Animal
  def speak
    super
    puts('meow')
  end
end
c=Cat.new
c.speak
STRING
answer=<<-STRING
hi
meow
STRING
  result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end  

rolling_count+=1
'71'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
what is the 'super' method used for?
STRING
  answer='to call methods from the super class'
  answers=<<-STRING
to call methods from the super class
to copy a method from the super class
to override the methods from a super class
to send a block to the super class
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  

#=====================================================================================================================
# to_s method ========================================================================================================
#=====================================================================================================================

rolling_count+=1
'72'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
why do we not want to use puts or print inside a to_s method?
STRING
  answer='because it will print the object id'
  answers=<<-STRING
because it will print the object id
because it will not work
because it will print the text twice
because it will create an error
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  


rolling_count+=1
'73'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
create a class called person that takes name and age. make a to_s method that
prints out 'Stacy is 16.' instantiate an object 's' for peron then print and
interpolate 's' with the text 'happy sweet 16!'
STRING
answer=<<-STRING
class Person
  def initialize(name,age)
    @name=name
    @age=age
  end
  def to_s
    "\\#{@name} is \\#{@age}."
  end
end
s=Person.new('Stacy',16)
puts "\\#{s} happy sweet 16!"
STRING
  result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end  


rolling_count+=1
'74'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
given the program below, what does it print?

class Person
  def initialize(n,a)
    @name=n
    @age=a
  end
  def to_s
    "\\#{@name} is \\#{@age} years old"
  end
end
p=Person.new('Ruby',21)
puts "\\#{p}, oops 19"
STRING
answer=<<-STRING
Ruby is 21 years old, oops 19
STRING
  result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end  


rolling_count+=1
'75'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
class Person
  def initialize(n,a)
    @name=n
    @age=a
  end
  ____________________<-(YOUR CODE GOES HERE)
end
p=Person.new('Ruby',21)
puts p

create a to_s method
do not use puts or print
use the following format
(name) is (age) years old
STRING
answer=<<-STRING
  def to_s
    "\\#{@name} is \\#{@age} years old"
  end
STRING
  result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end  

rolling_count+=1
'76'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
class Person
  def initialize(n,a)
    @name=n
    @age=a
  end

rolling_count+=1
'77'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
the to_s method can be called by what?
STRING
  answer='any object'
  answers=<<-STRING
any object
another method
a class
a variable
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  

rolling_count+=1
'78'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
why would we want to modify the to_s method in our classes?
STRING
  answer='because it is easier to output information'
  answers=<<-STRING
because it is easier to output information
because it is not perfect
because it is possible
because it is better
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
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

