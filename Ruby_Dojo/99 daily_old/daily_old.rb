##################################################################################################################
#                                                                                                                #
# Program:......................daily_old.rb                                                                     #
# Programmer:...................'Harold Sy                                                                       #
# Description:..................this program allows me to review my knowledge of the ruby programming language   #
#                               similar to how I practice katas for my martial arts class.                       #
# Kata subject..................ruby programming language:                                                       #
# Programmed:...................11/16/2017                                                                       #
# Last modified:................07/09/2022                                                                       #
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
#                                                                                                                #
##################################################################################################################




##################################################################################################################
# global variables                                                                                               #
##################################################################################################################
TITLE=                'daily_old'                                              # title for header
DRILLS_TEXT_FILE=     '../../../02 text_files/ProLanInv.txt'                   # text file to record drills metrics
DRILL_NAME=           '99 daily_old'                                           # name of this drill
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
#                                                                                                                #
# process multiple choice question:                                                                              #
#                                                                                                                #
def multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)          #
  answer_string=answer                                                                                           #
  answers_string=answers                                                                                         #
  answers=answers.split("\n")                                                                                    #
  answers.shuffle!                                                                                               #
  valid_answers=%w(a b c d x)                                                                                    #
#                                                                                                                #    
# print metrics                                                                                                  #
#                                                                                                                #
  puts "question number #{random_question}"                                                                      #
  puts "questions to go #{questions_to_go}"                                                                      #
  print_one_space()                                                                                              #
#                                                                                                                #
# print question                                                                                                 #
#                                                                                                                #
  puts question_string                                                                                           #
  print_one_space()                                                                                              #
#                                                                                                                #
# check for correct answer while printing out random questions                                                   #
#                                                                                                                #
  puts "  a.) #{answers[0]}"                                                                                     #
  answer='a' if answers[0]==answer                                                                               #
  puts "  b.) #{answers[1]}"                                                                                     #
  answer='b' if answers[1]==answer                                                                               #
  puts "  c.) #{answers[2]}"                                                                                     #
  answer='c' if answers[2]==answer                                                                               #
  puts "  d.) #{answers[3]}"                                                                                     #
  answer='d' if answers[3]==answer                                                                               #
  puts '  x.) exit'                                                                                              #
#                                                                                                                #
# get user answer                                                                                                #
#                                                                                                                #
  print_one_space                                                                                                #
  user_answer=gets.chomp                                                                                         #
#                                                                                                                #
# process user answer if 'x' was entered                                                                         #
#                                                                                                                #
  if user_answer=='x'                                                                                            #
    drill_status='exit'                                                                                          #
    return result,drill_status                                                                                   #
  end                                                                                                            #
#                                                                                                                #
# ask for a letter while answer is invalid                                                                       #
#                                                                                                                #
  while !valid_answers.include?(user_answer)                                                                     #
    puts 'please choose a letter'                                                                                #
    user_answer=gets.chomp                                                                                       #
  end                                                                                                            #
#                                                                                                                #    
# process answer if correct                                                                                      #
#                                                                                                                #
  if user_answer==answer                                                                                         #
    puts '#=> right'                                                                                             #
#                                                                                                                #    
# process answer if incorrect                                                                                    #
#                                                                                                                #
  else                                                                                                           #
    puts "#=> wrong, the answer is: #{answer}"                                                                   #
    result+=1                                                                                                    #
  end                                                                                                            #
  print_two_spaces()                                                                                             #
  return result,drill_status                                                                                     #
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
#                                                                                                                #
# processing coding test type 1 questions that compare two strings for exactness                                 #
#                                                                                                                # 
def coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)                     #
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
      print_two_spaces()                                                                                         #                                                                                                     #
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
# if answer entered is incorrect then process                                                                    #
#                                                                                                                #
  if answer!=input_string                                                                                        #
    print_one_space()                                                                                            #
    puts '#=> wrong, the answer is:'                                                                             #
    print_one_space()                                                                                            #
    puts answer                                                                                                  #
    status='wrong'                                                                                               #
    result+=1                                                                                                    #
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
# process coding test type 2 questions  <
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# notes: processes test type 2 questions that compares string for string and must be exact to be correct and     #
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
#                                                                                                                #
# processing coding test type 2 questions that compare two strings for exactness                                 #
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
# if answer entered is incorrect then process                                                                    #
#                                                                                                                #
  answer.gsub!('delimit1',delimit1)                                                                              #
  answer.gsub!('delimit2',delimit2)                                                                              #
  if answer!=input_string                                                                                        #
    print_one_space()                                                                                            #
    puts '#=> wrong, the answer is:'                                                                             #
    print_one_space()                                                                                            #
    puts answer                                                                                                  #
    status='wrong'                                                                                               #
    result+=1                                                                                                    #
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
# notes: processes test type 3 questions that compares string for string and must be exact to be correct. can    #
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
#                                                                                                                #
# processing coding test type 3 questions that compare two strings for exactness                                 #
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
# if answer entered is incorrect then process                                                                    #
#                                                                                                                #
  answers=answers.split("\n")                                                                                    #
  if !answers.include?(input_string.chomp)                                                                       #
    print_one_space()                                                                                            #
    puts '#=> wrong, the answer could be any of these:'                                                          #
    print_one_space()                                                                                            #
    answers=answers.join("\n")                                                                                   #
    puts answers                                                                                                 #
    status='wrong'                                                                                               #
    result+=1                                                                                                    #
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
#    python_string ........ [passed] actual source code for the python program                                   #
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
#     result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,python_string,answer_string)
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
      line[start_index+142..start_index+151]="          "                                                        #
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
        line[start_index+102]=' '                                                                                  #
        # quest to go                                                                                              #
        line[start_index+114..start_index+116]=0.to_s.rjust(3,'0')                                                 #
        # last touched                                                                                             #
        line[start_index+127..start_index+136]="          "                                                        #
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
  questions=Array.new(71){|index| index+1}                                                                       #
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
rolling_count+=1
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
write code to count the number of even numbers in an array

given:...........................array=[1,2,3,4,5,6,7,8,9]
variable:........................even_count
variable:........................n
 RSTRING
   answer=<<-RSTRING
even_count=array.count{|n| n.even?}
 RSTRING
   result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
write code to concatenate two arrays while modifying an existing array

given.......................array1=[1,2,3]
                            array2=[4,5,6]
#=>.........................[1,2,3,4,5,6]
 RSTRING
   answer=<<-RSTRING
array1.concat(array2)
 RSTRING
   result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1                                                                                           
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
what does the 'reverse' method return?

 RSTRING
   answer="a new array"
   answers=<<-RSTRING
the original array
a new array
a copy of the indices
a copy of the modified array
 RSTRING
   result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1                                                                                           
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
what is the difference between 'delete' and 'delete_if' in hashes?
 RSTRING
   answer="delete can only remove one item based on the key"
   answers=<<-RSTRING
delete can only remove one item based on the key
delete can remove multiple items
delete_if can only remove one item based on the key or value
delete_if does not modify the original hash
 RSTRING
   result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
write code to access a value from a hash using the 'fetch' method
with a default...

given.........................hash={'a'=>100,'b'=>200}
variable......................value, letter
access the key................'z'
default......................."\#{letter} not found, go fish"
 RSTRING
   answer=<<-RSTRING
value=hash.fetch('z'){|letter| "\#{letter} not found, go fish"}
 RSTRING
   result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
write code using 'delete_if' to remove values less than 3.

given:...............hash_data={:a=>1,:b=>2,:c=>3,:d=>4,:e=>5}
variables:...........key, value
 RSTRING
   answer=<<-RSTRING
hash_data.delete_if{|key,value| value<3}
 RSTRING
   result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
write code to select the race of characters to keep in a hash that has
more than 3 letters while modifying an existing hash. use the length method.
use in-line form.

given...............hash2={'d'=>'dwarf','h'=>'human','e'=>'elf'}
variables...........letter, race
#=>.................{"d"=>"dwarf", "h"=>"human"}
 RSTRING
   answer=<<-RSTRING
hash2.select!{|letter,race| race.length>3}
 RSTRING
   result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1                                                                                           
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
using the 'fetch' method with hashes, what are the different ways we can
access values from a hash?
 RSTRING
   answer="(key),(key,default),(key){default expression}"
   answers=<<-RSTRING
(key),(key,default),(key){default expression}
(key),(key,default)
(index),(index,default){default expression}
(key,value)
 RSTRING
   result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1                                                                                           
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
when using the 'delete' method on a hash, what will be returned?
 RSTRING
   answer="just the value being deleted"
   answers=<<-RSTRING
just the value being deleted
the key value pair
the new hash
nil
 RSTRING
   result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
write code to create and print the following array use 'puts' to print
the array and use the 'new' method to create the array

array.....................array name
print.....................[true,true,true]
 RSTRING
   answer=<<-RSTRING
array_name=Array.new(3){true}
puts array_name.inspect
 RSTRING
   result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
write code using the 'values_at' method to capture the following by using two
ranges.

given..........................array=[1,2,3,4,5,6,7,8,9,10,11,12,13]
use variable...................values
use range to capture...........1,2,3,4,5
use range to capture...........7,8,9
#=>............................[1,2,3,4,5,7,8,9]
 RSTRING
   answer=<<-RSTRING
values=array.values_at(0..4,6..8)
 RSTRING
   result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
write code to remove all duplicates in an array while creating a new array

given:...........................array=[1,nil,3,4,nil,6,nil]
new array........................new_array
 RSTRING
   answer=<<-RSTRING
new_array=array.uniq
 RSTRING
   result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1                                                                                           
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
when using the 'slice!' method on an array, what does it return?
 RSTRING
   answer="just the items being removed"
   answers=<<-RSTRING
just the items being removed
a copy of the modified array
a copy of the original array
a new array
 RSTRING
   result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
write code to search through an array of words for the word with the most
amount of characters. use in-line form with a block. capture the first
word with the most amount of characters.

                                      0     0     0     0     0
                                      0     1     2     3     4
given.........................array['imp','elf','cat','dog','ant']
use variables.................longest_word, memo, word
#=>...........................'imp'
 RSTRING
   answer=<<-RSTRING
longest_word=array.max{|memo,word| memo.length <=> word.length}
 RSTRING
   result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1                                                                                           
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
using the 'new' method, what ways can we use this to create an array?
 RSTRING
   answer="no param,(2),(2,true),(2){true},(2){block}"
   answers=<<-RSTRING
no param,(2),(2,true),(2){true},(2){block}
(2),(2,true),(2){block}
no param,(2),(2,true)
(2){block},no param,(2)
 RSTRING
   result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
using the 'slice' method, think about the different ways we can access the
following data...

now use the index, length  method!

                                  0 0 0 0 0 0
                                  0 1 2 3 4 5
given:.....................array=[1,2,3,4,5,6]
variable:..................numbers
#=>........................[4,5,6]
 RSTRING
   answer=<<-RSTRING
numbers=array.slice(3,3)
 RSTRING
   result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end
rolling_count+=1                                                                                           
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
how do we add arrays inside arrays?
 RSTRING
   answer="by using the << method"
   answers=<<-RSTRING
by using the << method
by using the insert method
by using the push method
by using the unshift method
 RSTRING
   result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
using the 'array' method, create an empty array

array name:..............empty array
#=>......................[]
 RSTRING
   answer=<<-RSTRING
empty_array=Array({})
 RSTRING
   result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1                                                                                           
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
what does the 'delete_at' method return?
 RSTRING
   answer="the deleted item"
   answers=<<-RSTRING
the deleted item
the deleted items
a copy of the modified array
the original array
 RSTRING
   result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
write code to select letters in an array that are vowels while creating
a new array. use regexp, match, and character class. use in-line form.

given..................alpha2=%w(a b c d e f g h i j k l)
variables..............answer, a
#=>....................["a", "e", "i"]
 RSTRING
   answer=<<-RSTRING
answer=alpha2.select{|a| a.match(/[aeiou]/)}
 RSTRING
   result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1                                                                                           
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
what does the 'uniq!' method return when no duplicates were removed from
the array?
 RSTRING
   answer="nil"
   answers=<<-RSTRING
a copy of the modified array
a copy of the original array
the items that were removed
nil
 RSTRING
   result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
write code to get the difference or compliment of two arrays

                                       0 0 0 0 0
                                       0 1 2 3 4
given:.........................arraya=[1,2,3,4,5]
given:.........................arrayb=[2,4,5,6]
use array......................difference
#=>............................[1,3]
 RSTRING
   answer=<<-RSTRING
difference=arraya-arrayb
 RSTRING
   result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1                                                                                           
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
what will the following code print?

   0 0 0 0 0 0 0 0 0
   0 1 2 3 4 5 6 7 8
a=[1,2,3,4,5,6,7,8,9]
new_array=a[8..10]
puts(new_array.inspect)
 RSTRING
   answer="[9]"
   answers=<<-RSTRING
[9]
[8,9]
error
eof
 RSTRING
   result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
write code to reject vowels from an array of letters while creating a new
array. use regexp and character class. use in-line form.

given.................alpha1=%w(a b c e d f g h i j k l)
variable..............answer, a
#=>...................["b", "c", "d", "f", "g", "h", "j", "k", "l"]
 RSTRING
   answer=<<-RSTRING
answer=alpha1.reject{|a| a=~/[aeiou]/}
 RSTRING
   result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1                                                                                           
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
what does the 'delete' method return?
 RSTRING
   answer="the deleted item"
   answers=<<-RSTRING
the deleted item
the deleted items
a copy of the modified array
the original array
 RSTRING
   result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
using the literal constructor [], think about the different ways we can
access data from the following array..

now, access the data by using the range method with a negative index!

                             0 0 0 0 0 0
                             0 1 2 3 4 5
given:................array=[1,2,3,4,5,6]
variable:.............numbers
#=>...................[2,3,4]
 RSTRING
   answer=<<-RSTRING
numbers=array[1..-3]
 RSTRING
   result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
write code that will take a string and turn it into an array of strings

given:.....................string="this is a string"
variable:..................array
 RSTRING
   answer=<<-RSTRING
array=string.split('')
 RSTRING
   result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
write code to search through an array of words for the word with the least
amount of characters. use an in-line form. capture the first word that fits
the criteria.

                                     0     0     0     0     0
                                     0     1     2     3     4
given.......................array=['dog','elf','cat','ant','imp']
variables...................shortest_word, memo, word
#=>.........................'dog'
 RSTRING
   answer=<<-RSTRING
shortest_word=array.min{|memo,word| memo.length <=> word.length}
 RSTRING
   result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
write code to keep vowels found in the array while creating a new array.
use regexp and character class. use in-line form.

given...............array3=%w(a b c d e f)
variables...........answer, v
#=>.................["a", "e"]
 RSTRING
   answer=<<-RSTRING
answer=array3.keep_if{|v| v=~/[aeiou]/}
 RSTRING
   result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
write code to modify an existing array, removing one level of nesting.

given:.................array=[[1,2],[3,4],[5,6],[7,8,9]]
 RSTRING
   answer=<<-RSTRING
array.flatten!(1)
 RSTRING
   result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1                                                                                           
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
what is the 'eql?' method used for?
 RSTRING
   answer="to check if two arrays are equal"
   answers=<<-RSTRING
to check if two arrays are equal
to check if two arrays are the same length
to check if two arrays have the same name
to check if two arrays have the same data types
 RSTRING
   result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1                                                                                           
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
select and keep_if work similarly on arrays, other than the fact that keep_if
can modify an existing array or create a new one what is another difference
between the two?
 RSTRING
   answer="keep_if does not work with ranges"
   answers=<<-RSTRING
keep_if does not work with ranges
keep_if does not create a new array
select does not create a new array
select does not work with ranges
 RSTRING
   result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
what will the following print?

puts false || false 
 RSTRING
   answer=<<-RSTRING
false
 RSTRING
   result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
what will the following print?

puts false || true 
 RSTRING
   answer=<<-RSTRING
true
 RSTRING
   result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
what will the following print?

puts true && true || false 
 RSTRING
   answer=<<-RSTRING
true
 RSTRING
   result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1                                                                                           
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
what is the keep_if method used for in arrays?
 RSTRING
   answer="to create or modify an array keeping items based on a condition"
   answers=<<-RSTRING
to create or modify an array keeping items based on a condition
to create a new array keeping items based on a condition
to modify an existing array removing items based on a condition
to create a new array removing items based on a condition
 RSTRING
   result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
write code to remove an item from a location in an array but do not use the
slice! method.

                                        0 0 0 0 0
                                        0 1 2 3 4
given:...........................array=[1,2,3,4,5]
remove at index..................2
 RSTRING
   answer=<<-RSTRING
array.delete_at(2)
 RSTRING
   result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
write code to get the union of two arrays:

                                       0 0 0 0
                                       0 1 2 3
given:.........................arraya=[2,3,7,8]
given:.........................arrayb=[2,7,9]
use array......................union
#=>............................[2,3,7,8,9]
 RSTRING
   answer=<<-RSTRING
union=arraya|arrayb
 RSTRING
   result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1                                                                                           
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
what will the following code print?

   0 0 0 0 0 0 0 0 0
   0 1 2 3 4 5 6 7 8
a=[1,2,3,4,5,6,7,8,9]
new_array=a[8..1]
puts(new_array.inspect)
 RSTRING
   answer="[]"
   answers=<<-RSTRING
[]
[9,8,7,6,5,4,3,2,1]
error
eof
 RSTRING
   result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
write code to modify an existing array while removing one level of nesting

given................array=[1,1,[2,2,[3,3,[4,4],0,0],0,0],0,0]
#=>..................[1, 1, 2, 2, [3, 3, [4, 4], 0, 0], 0, 0, 0, 0]
 RSTRING
   answer=<<-RSTRING
array.flatten!(1)
 RSTRING
   result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
write code to delete the value 4 from the hash

given.........hash_data={:a=>1, :b=>2, :c=>3, :d=>4, :e=>5, :f=>6}
variables.....key,value
 RSTRING
   answer=<<-RSTRING
hash_data.delete_if{|key,value| value==4}
 RSTRING
   result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1                                                                                           
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
how do we delete key and value pairs in a hash?
 RSTRING
   answer="using delete or delete_if"
   answers=<<-RSTRING
using delete or delete_if
using []
using {}
using ()
 RSTRING
   result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1                                                                                           
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
what is allowed in hashes?
 RSTRING
   answer="duplicate values"
   answers=<<-RSTRING
duplicate values
duplicate keys
duplicate keys and values
nil
 RSTRING
   result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end
  
rolling_count+=1
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
using the 'each' method, iterate over a hash and print the key and value
using the following, in block form. use puts:

given:................hash_data={:r=>'red',:b=>'blue'}
variables:............letter,color
format:...............(letter) is for (color)
 RSTRING
   answer=<<-RSTRING
hash_data.each do |letter,color|
  puts "\#{letter} is for \#{color}"
end
 RSTRING
   result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end
rolling_count+=1
if random_question==rolling_count
#..............................................................................
   question_string=<<-RSTRING
what will the following print?

puts false || true 
 RSTRING
   answer=<<-RSTRING
true
 RSTRING
   result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end
  

rolling_count+=1 #================#
if random_question==rolling_count #============================================================================#
#..............................................................................
     question_string=<<-RSTRING
write code to compare two strings but make sure to make both lowercase first
and do not use the eql? method.

given....................string1='The cat in the Hat'
given....................string2='the cat in the hat'
variable.................equal
RSTRING
     answer=<<-RSTRING
equal=string1.downcase==string2.downcase
RSTRING
     result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
   end
#=================================================================================================================#


rolling_count+=1 #================#
if random_question==rolling_count #============================================================================#
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
#=================================================================================================================#


rolling_count+=1 #================#
if random_question==rolling_count #============================================================================#
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
#=================================================================================================================#


rolling_count+=1 #================#
if random_question==rolling_count #============================================================================#
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
#=================================================================================================================#


rolling_count+=1 #================#
if random_question==rolling_count #============================================================================#
#..............................................................................
     question_string=<<-RSTRING
write code to convert an array into a string

given....................array=['a','b','c']
variable.................string1
RSTRING
     answer=<<-RSTRING
string1=array.join('')
RSTRING
     result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
   end
#=================================================================================================================#


rolling_count+=1 #================#
if random_question==rolling_count #============================================================================#
#..............................................................................
     question_string=<<-RSTRING
write code to check if both strings contain the same string pattern

given........................string1='abcdefghijklmnopqrstuvwxyz'
   ........................string2='abcdefghijklmnopqrstuvwxyz'
variable.....................result
#=>..........................true
RSTRING
     answer=<<-RSTRING
result=string1.eql?(string2)
RSTRING
     result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
   end
#=================================================================================================================#


rolling_count+=1 #================#
if random_question==rolling_count #============================================================================#
#..............................................................................
     question_string=<<-RSTRING
write code using delete to create a new string while deleting the following:

given........................string='abcdefghijklmnopqrstuvwxyz'
use variable.................new_string
delete.......................letters d to i then letters l to u
RSTRING
     answer=<<-RSTRING
new_string=string.delete('d-il-u')
RSTRING
     result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
   end
#=================================================================================================================#


rolling_count+=1 #================#
if random_question==rolling_count #============================================================================#
#..............................................................................
     question_string=<<-RSTRING
using the slice! method on a string, think of the different ways
that we can delete parts of the string...

now use the range method with a negative range.

                                     000000000011111111112222
                                     012345678901234567890123
given..........................string='so you want to be a hero?'
delete.........................'to be a hero?'
RSTRING
     answer=<<-RSTRING
string.slice!(12..-1)
RSTRING
     result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
   end
#=================================================================================================================#


rolling_count+=1 #================#
if random_question==rolling_count #============================================================================#
#..............................................................................
     question_string=<<-RSTRING
when using the 'insert' method with strings what are the different ways we
can insert items?
RSTRING
     answer="(1,string(s)),(-1,string(s)),(at the end,string(s))"
     answers=<<-RSTRING
(1,string(s)),(-1,string(s)),(at the end,string(s))
(1,string(s)),(-1,string(s)),(any where,string(s))
(1,string(s)),(-1,string(s)),(1..2,string(s)),(1..-2,string(s))
(1,string(s)),(1,2,3,string(s))
RSTRING
     result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
   end
#=================================================================================================================#


rolling_count+=1 #================#
if random_question==rolling_count #============================================================================#
#..............................................................................
     question_string=<<-RSTRING
when using the 'ljust' or 'rjust' methods, what does the second parameter
represent?

example.....................string1.ljust(10,'0')
RSTRING
     answer="character used for padding"
     answers=<<-RSTRING
total number of characters
character used for padding
number of indices
default
RSTRING
     result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
   end
#=================================================================================================================#


rolling_count+=1 #================#
if random_question==rolling_count #============================================================================#
#..............................................................................
     question_string=<<-RSTRING
write code using delete! to modify an existing string, removing the following:

given........................string='abcdefghijklmnopqrstuvwxyz'
delete.......................letters a to d then letters h to m
RSTRING
     answer=<<-RSTRING
string.delete!('a-dh-m')
RSTRING
     result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
   end
#=================================================================================================================#


rolling_count+=1 #================#
if random_question==rolling_count #============================================================================#
#..............................................................................
     question_string=<<-RSTRING
write code to convert an array of characters into a string with no spaces.

given....................array=['a','b','c']
variable.................string1
#=>......................'abc'
RSTRING
     answer=<<-RSTRING
string1=array.join('')
RSTRING
     result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
   end
#=================================================================================================================#


rolling_count+=1 #================#
if random_question==rolling_count #============================================================================#
#..............................................................................
     question_string=<<-RSTRING
write code to convert an array of characters into a string that is
separated by spaces.

given....................array=['a','b','c']
variable.................string1
#=>......................'a b c'
RSTRING
     answer=<<-RSTRING
string1=array.join(' ')
RSTRING
     result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
   end
#=================================================================================================================#


rolling_count+=1 #================#
if random_question==rolling_count #============================================================================#
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
#=================================================================================================================#


rolling_count+=1 #================#
if random_question==rolling_count #============================================================================#
#..............................................................................
     question_string=<<-RSTRING
write code to convert a string into an array of characters but do not use the
split method or the each_char method.  

given....................string1='ruby-guides'
variable.................array
#=>......................['r','u','b','y','-','g','u','i','d','e','s']
RSTRING
     answer=<<-RSTRING
array=string1.chars
RSTRING
     result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
   end
#=================================================================================================================#


rolling_count+=1 #================#
if random_question==rolling_count #============================================================================#
#..............................................................................
     question_string=<<-RSTRING
write code to check if two strings refers to the same string

given........................string1='abcdefghijklmnopqrstuvwxyz'
   ........................string2=string1
variable.....................result
#=>..........................true
RSTRING
     answer=<<-RSTRING
result=string1.equal?(string2)
RSTRING
     result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
   end
#=================================================================================================================#


rolling_count+=1 #================#
if random_question==rolling_count #============================================================================#
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
#=================================================================================================================#


rolling_count+=1 #================#
if random_question==rolling_count #============================================================================#
#..............................................................................
     question_string=<<-RSTRING
when using the 'each_byte' method in strings what does it return?

example...................string='hello'
                        return_string=string.each_byte{|c| print c,' '}

RSTRING
     answer="the original string by default"
     answers=<<-RSTRING
the original string by default
a copy of the modified string
returns the size of the character
returns the hexadecimal value of the character
RSTRING
     result,drill_status=multiple_choiceI(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
   end
#=================================================================================================================#


rolling_count+=1 #================#
if random_question==rolling_count #============================================================================#
#..............................................................................
     question_string=<<-RSTRING
write code to force an ASCII encoding on a string then print the encoding.

given....................string1="abcdefg"
encode to................ASCII
variable.................str_code
use......................puts
RSTRING
     answer=<<-RSTRING
string1.force_encoding('ASCII')
str_code=string1.encoding
puts str_code
RSTRING
     result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
   end
#=================================================================================================================#


rolling_count+=1 #================#
if random_question==rolling_count #============================================================================#
#..............................................................................
     question_string=<<-RSTRING
write code to convert a string separated with spaces into an array of strings.

given....................string1='a b c d'
variable.................array
#=>......................['a','b','c','d']
RSTRING
     answer=<<-RSTRING
array=string1.split(' ')
RSTRING
     result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
   end
#=================================================================================================================#


rolling_count+=1 #================#
if random_question==rolling_count #============================================================================#
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
#=================================================================================================================#

rolling_count+=1 #================#
if random_question==rolling_count #============================================================================#
#..............................................................................
     question_string=<<-RSTRING
write code to check if the following character pattern is in the string.

given............................string1='Today is Saturday'
variable.........................string_pattern
check for.......................'at'
use puts to print
RSTRING
     answer=<<-RSTRING
string_pattern=string1.include?('at')
RSTRING
     result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
   end
#=================================================================================================================#


rolling_count+=1 #================#
if random_question==rolling_count #============================================================================#
#..............................................................................
     question_string=<<-RSTRING
given the following string, make sure it is not modifiable.

given array......................string='love is forever'
RSTRING
     answer=<<-RSTRING
string.freeze
RSTRING
     result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
   end
#=================================================================================================================#


rolling_count+=1 #================#
if random_question==rolling_count #============================================================================#
#..............................................................................
     question_string=<<-RSTRING
write code to check the encoding of a string.

given....................string1='abcd'
variable.................string_encode
RSTRING
     answer=<<-RSTRING
string_encode=string1.encoding
RSTRING
     result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
   end
#=================================================================================================================#


rolling_count+=1 #================#
if random_question==rolling_count #============================================================================#
#..............................................................................
     question_string=<<-RSTRING
when using the 'each_byte' method in strings what does it do?

RSTRING
     answer="returns the ASCII code of a character"
     answers=<<-RSTRING
returns the ASCII code of a character
returns the character of an ASCII code
returns the size of the character
returns the hexadecimal value of the character
RSTRING
     result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
   end
#=================================================================================================================#


rolling_count+=1 #================#
if random_question==rolling_count #============================================================================#
#..............................................................................
     question_string=<<-RSTRING
in strings how do we check if two strings refers to the same string?
RSTRING
     answer="by using the equal? method"
     answers=<<-RSTRING
by using the eql? method
by using the equal? method
by using the same? method
by using the = method
RSTRING
     result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
   end
#=================================================================================================================#
  
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

