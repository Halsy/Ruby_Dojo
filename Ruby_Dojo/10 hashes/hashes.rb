##################################################################################################################
#                                                                                                                #
# Program:......................hashes.rb                                                                        #
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
#                                 clear method                                                                   #
#                                 delete method                                                                  #
#                                 delete_if method                                                               #
#                                 each method                                                                    #
#                                 empty? method                                                                  #
#                                 eql? method                                                                    #
#                                 equal? method                                                                  #
#                                 fetch method                                                                   #
#                                 freeze method                                                                  #
#                                 frozen? method                                                                 #
#                                 general hash                                                                   #
#                                 has_key? method                                                                #
#                                 has_value? method                                                              #
#                                 keep_if method                                                                 #
#                                 keys method                                                                    #
#                                 max_by method                                                                  #
#                                 merge and merge! methods                                                       #
#                                 min_by method                                                                  #
#                                 new method                                                                     #
#                                 reject and reject! methods                                                     #
#                                 select and select! methods                                                     #
#                                 symbols                                                                        #
#                                 to_h method                                                                    #
#                                 values method                                                                  #
#                                 values_at method                                                               #
#                                 {} method                                                                      #
#                                 [] method                                                                      #
##################################################################################################################



##################################################################################################################
# global variables                                                                                               #
##################################################################################################################
TITLE=                'hashes'                                                 # title for header
MISSED_QUESTIONS_FILE='../00 Tools/01 missed_questions/missed_questions'       # file containing missed questions
DRILLS_TEXT_FILE=     '../text_files/ProLanInv.txt'                            # text file to record drills metrics
DRILL_NAME=           '10 hashes'                                              # name of this drill
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
  questions=Array.new(87){|index| index+1}                                                                       #
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
  # clear method =======================================================================================================
  #=====================================================================================================================

  rolling_count+=1
'1'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
how do we empty a hash?
    STRING
    answer='by using the clear method'
    answers=<<-STRING
by using the clear method
by using the empty method
by using the delete method
by using the zero method
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'2'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to remove all of the contents of a hash

given.............my_hash={'martial art':'kajukenbo'}
    STRING
    answer=<<-STRING
my_hash.clear
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # delete method ======================================================================================================
  #=====================================================================================================================

  rolling_count+=1
'3'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
how do we delete key and value pairs in a hash?
    STRING
    answer='using delete or delete_if'
    answers=<<-STRING
using delete or delete_if
using []
using {}
using ()
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'4'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
write code to delete a key and value pair in a hash.

given:...............hash_data={:r=>'red',:b=>'blue'}
delete:..............:b=>'blue'
    STRING
    answer=<<-STRING
hash_data.delete(:b)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'5'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
when using the 'delete' method on a hash to delete a key and value pair,
what should we know?
    STRING
    answer='delete will modify the original hash'
    answers=<<-STRING
delete will modify the original hash
delete will create a new hash
delete will return true or false
delete will return key value pairs
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'6'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
when using the 'delete' method on a hash, what will be returned?
    STRING
    answer='just the value being deleted'
    answers=<<-STRING
just the value being deleted
the key value pair
the new hash
nil
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'7'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
what is the 'delete' method used for in a hash?
    STRING
    answer='to delete key and value pairs'
    answers=<<-STRING
to delete key and value pairs
to delete values
to delete keys
to clear the hash
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'8'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
what is the difference between 'delete' and 'delete_if' in hashes?
    STRING
    answer='delete can only remove one item based on the key'
    answers=<<-STRING
delete can only remove one item based on the key
delete can remove multiple items
delete_if can only remove one item based on the key or value
delete_if does not modify the original hash
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  #======================================================================================================================
  # delete_if method ====================================================================================================
  #======================================================================================================================

  rolling_count+=1
'9'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
what is the 'delete_if' method used for in a hash?
    STRING
    answer='delete key/value based on a condition'
    answers=<<-STRING
to iterate over a hash
to delete nils in a hash
to clear a hash
delete key/value based on a condition
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'10'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
what does the 'delete_if' method return?
    STRING
    answer='a copy of the modified hash'
    answers=<<-STRING
a copy of the modified hash
nil
deleted keys and values
0
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'11'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
the 'delete_if' method returns a copy of the modified hash but what
else does it do?
    STRING
    answer='modifies the original hash'
    answers=<<-STRING
modifies the original hash
clears the hash
orders the hash
returns nil
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'12'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
write code using 'delete_if' to remove values less than 3.

given:...............hash_data={:a=>1,:b=>2,:c=>3,:d=>4,:e=>5}
variables:...........key, value
    STRING
    answer=<<-STRING
hash_data.delete_if{|key,value| value<3}
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'13'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
write code to delete all even values from a hash. use in-line form.

given.........hash_data={:a=>1, :b=>2, :c=>3, :d=>4, :e=>5, :f=>6}
variables.....key,value
    STRING
    answer=<<-STRING
hash_data.delete_if{|key,value| value.even?}
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'14'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
write code to delete the value 4 from the hash

given.........hash_data={:a=>1, :b=>2, :c=>3, :d=>4, :e=>5, :f=>6}
variables.....key,value
    STRING
    answer=<<-STRING
hash_data.delete_if{|key,value| value==4}
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'15'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
if we want to delete items in a hash based on a condition which should we use?
    STRING
    answer='delete_if'
    answers=<<-STRING
delete_if
delete
empty
clear
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end  

  rolling_count+=1
'16'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
if we want to delete an item by the value which should we use?
    STRING
    answer='delete_if'
    answers=<<-STRING
delete_if
delete
empty
clear
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end 
  
  rolling_count+=1
'17'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what method do we use to delete a key and value pair from a hash using
either key or value?
    STRING
    answer='delete_if'
    answers=<<-STRING
delete_if
clear
reject
remove
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end 

  #=====================================================================================================================
  # each method ========================================================================================================
  #=====================================================================================================================

  rolling_count+=1
'18'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
using the 'each' method, iterate over a hash and print the key and value
using the following, in block form. use puts:

given:................hash_data={:r=>'red',:b=>'blue'}
variables:............letter,color
format:...............(letter) is for (color)
    STRING
    answer=<<-STRING
hash_data.each do |letter,color|
  puts "\#{letter} is for \#{color}"
end
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # empty? method ======================================================================================================
  #=====================================================================================================================

  rolling_count+=1
'19'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
how do we check if a hash is empty?
    STRING
    answer='by using the empty? method'
    answers=<<-STRING
by using the empty? method
by using the zero? method
by using the size method
by using the is_empty? method
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'20'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to check if a hash is empty

given.............my_hash={}
use variable......result
    STRING
    answer=<<-STRING
result=my_hash.empty?
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # eql? method ========================================================================================================
  #=====================================================================================================================

  rolling_count+=1
'21'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
how do we check if two hashes have the same key and value pairs?
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
'22'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to check if two hashes have the same key and value pairs

given.............hash1={'martial art':'kajukenbo'}
     .............hash2={'martial art':'kajukenbo'}
use variable......result
#=>...............true
    STRING
    answer=<<-STRING
result=hash1.eql?(hash2)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # equal? method ======================================================================================================
  #=====================================================================================================================

  rolling_count+=1
'23'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
how do we check if two hashes refers to the same hash?
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
'24'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to check if two hashes refers to the same hash

given.............hash1={'martial art':'kajukenbo'}
     .............hash2=hash1
use variable......result
#=>...............true
    STRING
    answer=<<-STRING
result=hash1.equal?(hash2)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # fetch method =======================================================================================================
  #=====================================================================================================================
  rolling_count+=1
'25'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
how do we access values in a hash by using the 'fetch' method?
    STRING
    answer='by fetching the key'
    answers=<<-STRING
by fetching the key
by fetching the value
by fetching the index
by fetching the range
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'26'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'fetch' method with a hash what does each parameter
represent respectively?
    STRING
    answer='(key,default)'
    answers=<<-STRING
(key,default)
(key,value)
(index,value)
(index,default)
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'27'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to access a value from a hash using the 'fetch' method...

given.........................hash={'a'=>100,'b'=>200}
variable......................value
access........................100
    STRING
    answer=<<-STRING
value=hash.fetch('a')
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'28'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to access a value from a hash using the 'fetch' method
with a default...

given.........................hash={'a'=>100,'b'=>200}
variable......................value
access the key................'z'
default.......................'go fish'
    STRING
    answer=<<-STRING
value=hash.fetch('z','go fish')
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'29'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to access a value from a hash using the 'fetch' method
with a default...

given.........................hash={'a'=>100,'b'=>200}
variable......................value, letter
access the key................'z'
default......................."\#{letter} not found, go fish"
    STRING
    answer=<<-STRING
value=hash.fetch('z'){|letter| "\#{letter} not found, go fish"}
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'30'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the 'fetch' method with hashes, what are the different ways we can
access values from a hash?
    STRING
    answer='(key),(key,default),(key){default expression}'
    answers=<<-STRING
(key),(key,default),(key){default expression}
(key),(key,default)
(index),(index,default){default expression}
(key,value)
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'31'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in the following program, why is it ok to use:
"\#{letter} not found, go fish", instead of a puts?

hash={'a'=>100,'b'=>200}
value=hash.fetch('z'){|letter| "\#{letter} not found, go fish"}
    STRING
    answer="because it is considered as a string to be passed to the variable 'value'"
    answers=<<-STRING
because it is considered as a string to be passed to the variable 'value'
because it is still considered as a puts and will print
because it is interchangeable with a puts or print
because the fetch method will print it
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  #=====================================================================================================================
  # freeze method ======================================================================================================
  #=====================================================================================================================
  rolling_count+=1
'32'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'freeze' method used for in hashes?
    STRING
    answer='to prevent modifications of a hash'
    answers=<<-STRING
to prevent modifications of a hash
to make the hash cool
to prevent adding items to a hash
to prevent accessing elements of a hash
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'33'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
given the following hash, make sure it is not modifiable.

given array...................hash_data={:a=>1,:b=>2,:c=>3,:d=>4,:e=>5}
    STRING
    answer=<<-STRING
hash_data.freeze
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # frozen? method =====================================================================================================
  #=====================================================================================================================
  rolling_count+=1
'34'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'frozen?' method used for in a hash?
    STRING
    answer='to check if a hash is modifiable'
    answers=<<-STRING
to check if a hash is modifiable
to check if a hash is cool
to check if a hash is stuck
to check if a hash is done
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'35'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to check if a hash is modifiable

given array..................hash_data={:a=>1,:b=>2,:c=>3,:d=>4,:e=>5}
variable.....................frozen_hash
    STRING
    answer=<<-STRING
frozen_hash=hash_data.frozen?
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # general hash =======================================================================================================
  #=====================================================================================================================

  rolling_count+=1
'36'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
what is a hash?
    STRING
    answer='a collection of key and value pairs'
    answers=<<-STRING
a collection of key and value pairs
a collection of objects
a collection of strings
a collection of values
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'37'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
what is allowed in hashes?
    STRING
    answer='duplicate values'
    answers=<<-STRING
duplicate values
duplicate keys
duplicate keys and values
nil
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'38'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
what is not allowed in hashes?
    STRING
    answer='duplicate keys'
    answers=<<-STRING
duplicate values
duplicate keys
duplicate keys and values
nil
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'39'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
when an empty hash is created it has a default value or one can be
assigned. when one is assigned, when is it returned?
    STRING
    answer='when an item is not found'
    answers=<<-STRING
when an item is not found
when the end of the hash is reached
when the default is reached
when a duplicate key is found
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'40'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
when an empty hash is created it has a default value or one can be assigned.
when no default value is assigned what will be the default value?
    STRING
    answer='nil'
    answers=<<-STRING
nil
zero
-1
false
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'41'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
create an empty hash using the new method and assign a default value:

hash name:................empty_hash
default value:............'item not found'
    STRING
    answer=<<-STRING
empty_hash=Hash.new('item not found')
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'42'
  if random_question==rolling_count
    #..............................................................................
    question_string=<<-STRING
there is a shorthand to creating hashes without using the rocket operator, use
this shorthand method to make the following hash:

hash name............................my hash
keys.................................name,alignment
values...............................rabbid,chaotic
    STRING
    answer=<<-STRING
my_hash={'name':'rabbid','alignment':'chaotic'}
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # has_key? method ====================================================================================================
  #=====================================================================================================================

  rolling_count+=1
'43'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
how do we check to see if a hash contains a specific key?
    STRING
    answer='by using the has_key? method'
    answers=<<-STRING
by using the has_key? method
by using the keys? method
by using is_key? method
by using what_key? method
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'44'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
write code to check if a specific key is in a hash.

given:..............hash_data={:a=>1,:b=>2,:c=>3}
variable:...........key
find:...............:c
    STRING
    answer=<<-STRING
key=hash_data.has_key?(:c)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #======================================================================================================================
  # has_value? method ===================================================================================================
  #======================================================================================================================

  rolling_count+=1
'45'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
write code to check if a specific value is in a hash.

given:..............hash_data={:a=>1,:b=>2,:c=>3}
variable:...........value
find:...............2
    STRING
    answer=<<-STRING
value=hash_data.has_value?(2)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'46'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
how do we check to see if a hash contains a specific value?
    STRING
    answer='by using the has_value? method'
    answers=<<-STRING
by using the has_value? method
by using the value? method
by using is_value? method
by using what_value? method
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # keep_if method =====================================================================================================
  #=====================================================================================================================

  rolling_count+=1
'47'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the keep_if method used for in hashes?
    STRING
    answer='to create a new or modify an existing hash keeping items based on a condition'
    answers=<<-STRING
to create a new or modify an existing hash keeping items based on a condition
to create a new hash removing items based on a condition
modify an existing hash keeping items based on a condition
modifying an existing hash removing items based on a condition
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'48'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to keep food items that are longer than 4 characters while
modifying an existing hash. use the length method. use in-line form.

given.............hash3={'a'=>'apple','e'=>'eggplant','k'=>'kiwi'}
variables.........letter, food
#=>...............{"a"=>"apple", "e"=>"eggplant"}
    STRING
    answer=<<-STRING
hash3.keep_if{|letter,food| food.length>4}
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end

  rolling_count+=1
'49'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to keep food items that are longer than 4 characters while
creating a new hash. use the length method. use in-line form.

given.............hash3={'a'=>'apple','e'=>'eggplant','k'=>'kiwi'}
variables.........answer, letter, food
#=>...............{"a"=>"apple", "e"=>"eggplant"}
    STRING
    answer=<<-STRING
answer=hash3.keep_if{|letter,food| food.length>4}
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end

  #=====================================================================================================================
  # keys method ========================================================================================================
  #=====================================================================================================================

  rolling_count+=1
'50'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
how do we collect all the keys in a hash and put them in an array?
    STRING
    answer='by using the keys method'
    answers=<<-STRING
by using the keys method
by using collect method
by using <<
by using ()
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'51'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
write code to collect all the keys in a hash and put them in an array

given:..............hash_data={:a=>1,:b=>2,:c=>3}
variable:...........key_collection
    STRING
    answer=<<-STRING
key_collection=hash_data.keys
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # max_by methods =====================================================================================================
  #=====================================================================================================================

  rolling_count+=1
'52'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
given the hash below, how do we find the person with the highest age?

given hash.................people={'joe'=>21, 'bill'=>35, 'sally'=>24}
    STRING
    answer='by using the max_by method'
    answers=<<-STRING
by using the min_by method
by using the max_by method
by using the min method
by using the max method
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'53'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to find the person with the highest age in the hash below.
use in-line method.

given hash.................people={'joe'=>21, 'bill'=>35, 'sally'=>24}
use variables..............person, name, age
#=>........................["bill",35]
    STRING
    answer=<<-STRING
person=people.max_by{|name,age| age}
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end

rolling_count+=1
'54'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
write code to find the person with the highest age in the hash below. use a block form.


given hash.................people={'joe'=>21, 'bill'=>35, 'sally'=>24}
use variables..............person, name, age
#=>........................["bill",35]
  STRING
  answer=<<-STRING
person=people.max_by do |name,age|
  age
end
  STRING
  result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end

  #=====================================================================================================================
  # merge and merge! methods ===========================================================================================
  #=====================================================================================================================

  rolling_count+=1
'55'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
how do we merge two hashes?
    STRING
    answer='by using merge or merge!'
    answers=<<-STRING
by using merge or merge!
by using + operator
by using * operator
by using | operator
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'56'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
what is the difference between 'merge' and 'merge!'?
    STRING
    answer='merge! modifies the original hash'
    answers=<<-STRING
merge! modifies the original hash
merge clears the hash
merge! returns nil
merge uses interpolation
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'57'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
write code using  the 'merge' method

given:...............hash_data1={:a=>1,:b=>2}
                     hash_data2={:c=>1,:d=>2}
use:.................hash_data3
    STRING
    answer=<<-STRING
hash_data3=hash_data1.merge(hash_data2)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'58'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
when using the 'merge' or 'merge!' methods on a hash, what is inside the
() called?

example:.........hash_data3=hash_data1.merge(hash_data2)
    STRING
    answer='merged hash'
    answers=<<-STRING
calling hash
merging hash
caller hash
merged hash
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'59'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
when using the 'merge' or 'merge!' methods on a hash, what is before the
.merge called?

example:.........hash_data3=hash_data1.merge(hash_data2)
    STRING
    answer='calling hash'
    answers=<<-STRING
calling hash
merging hash
caller hash
merged hash
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end



  rolling_count+=1
'60'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
when merging two hashes, and duplicate keys are present between them,
what will happen?
    STRING
    answer='the calling hash will be overwritten'
    answers=<<-STRING
the calling hash will be overwritten
both keys will be left out
an error will be thrown
the merged hash will be overwritten
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'61'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
given the following code, what will be printed out

given:...................hash_data1={:a=>1,:b=>2}
                         hash_data2={:b=>3,:c=>4}
                         hash_data3=hash_data1.merge(hash_data2)
                         puts(hash_data3.inspect)
    STRING
    answer='{:a=>1,:b=>3,:c=>4}'
    answers=<<-STRING
{:a=>1,:b=>3,:c=>4}
{:a=>1,:b=>2,:c=>4}
{:a=>1,:b=>2,:b=>3,:c=>4}
{:a=>1,:c=>4}
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'62'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
using the 'merge!' method, what does it return?
    STRING
    answer='a copy of the modified hash'
    answers=<<-STRING
a copy of the modified hash
the calling hash
the merged hash
nothing
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'63'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
write code using the 'merge!' method.

given:..............hash_data1{:a=>1, :b=>2}
                    hash_data2{:b=>3, :c=>4}
    STRING
    answer=<<-STRING
hash_data1.merge!(hash_data2)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # min_by method ======================================================================================================
  #=====================================================================================================================

  rolling_count+=1
'64'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
given the hash below, how do we find the person with the lowest age?

given hash.................people={'joe'=>21, 'bill'=>35, 'sally'=>24}
    STRING
    answer='by using the min_by method'
    answers=<<-STRING
by using the min_by method
by using the max_by method
by using the min method
by using the max method
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'65'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to find the person with the lowest age in the hash below.
use in-line form.

given hash.................people={'joe'=>21, 'bill'=>35, 'sally'=>24}
use variables..............person, name, age
#=>........................["joe",21]
    STRING
    answer=<<-STRING
person=people.min_by{|name,age| age}
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end

rolling_count+=1
'66'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
write code to find the person with the lowest age in the hash below. use block form.

given hash.................people={'joe'=>21, 'bill'=>35, 'sally'=>24}
use variables..............person, name, age
#=>........................["joe",21]
  STRING
  answer=<<-STRING
person=people.min_by do |name,age|
  age
end
  STRING
  result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end

  #=====================================================================================================================
  # new method =========================================================================================================
  #=====================================================================================================================

  rolling_count+=1
'67'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
before we can use any operator with assignment with a hash such as:
+= or *=, what do we need to do first?
    STRING
    answer='hash=Hash.new(0)'
    answers=<<-STRING
hash=Hash.new(0)
hash={}
hash={0}
hash=Hash.new
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'68'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
using the 'new 'method, create an empty hash

hash name:................empty_hash
    STRING
    answer=<<-STRING
empty_hash=Hash.new
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # reject and reject! methods =========================================================================================
  #=====================================================================================================================

  rolling_count+=1
'69'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to reject animals from a hash that are bigger than 3 characters
while creating a new hash. use the length method. use in-line method.

given.................hash1={'b'=>'bird','c'=>'cat','d'=>'dog'}
variables.............answer, letter, animal
#=>...................{"c"=>"cat", "d"=>"dog"}
    STRING
    answer=<<-STRING
answer=hash1.reject{|letter,animal| animal.length>3}
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end

rolling_count+=1
'70'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
write code to reject animals from a hash that are bigger than 3 characters
while creating a new hash. use the length method. use block form.

given.................hash1={'b'=>'bird','c'=>'cat','d'=>'dog'}
variables.............answer, letter, animal
#=>...................{"c"=>"cat", "d"=>"dog"}
  STRING
  answer=<<-STRING
answer=hash1.reject do |letter,animal|
  animal.length>3
end
  STRING
  result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end

  #=====================================================================================================================
  # select and select! methods =========================================================================================
  #=====================================================================================================================

  rolling_count+=1
'71'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the select method used for in hashes?
    STRING
    answer='create a new hash selecting items to keep based on a condition'
    answers=<<-STRING
create a new hash selecting items to keep based on a condition
modify an existing hash selecting items to keep based on a condition
create a new hash selecting items not to keep based on a condition
modify an existing hash selecting items not to keep based on a condition
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'72'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the select! method used for in hashes?
    STRING
    answer='modify an existing hash selecting items to keep based on a condition'
    answers=<<-STRING
create a new hash selecting items to keep based on a condition
modify an existing hash selecting items to keep based on a condition
create a new hash selecting items not to keep based on a condition
modify an existing hash selecting items not to keep based on a condition
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'73'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to select the race of characters to keep in a hash that has
more than 3 letters while creating a new hash. use the length method.
use in-line form.

given...............hash2={'d'=>'dwarf','h'=>'human','e'=>'elf'}
variables...........answer, letter, race
#=>.................{"d"=>"dwarf", "h"=>"human"}
    STRING
    answer=<<-STRING
answer=hash2.select{|letter,race| race.length>3}
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end

rolling_count+=1
'74'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
write code to select the race of characters to keep in a hash that has
more than 3 letters while creating a new hash. use the length method.
use block form.

given...............hash2={'d'=>'dwarf','h'=>'human','e'=>'elf'}
variables...........answer, letter, race
#=>.................{"d"=>"dwarf", "h"=>"human"}
  STRING
  answer=<<-STRING
answer=hash2.select do |letter,race|
  race.length>3
end
  STRING
  result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end

  #=====================================================================================================================
  # symbols ============================================================================================================
  #=====================================================================================================================

  rolling_count+=1
'75'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
what are symbols?
    STRING
    answer='symbols are names starting with a colon, :'
    answers=<<-STRING
symbols are names starting with a colon, :
symbols are punctuation marks
symbols are numbers
symbols are math signs
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  #======================================================================================================================
  # to_h method =========================================================================================================
  #======================================================================================================================

  rolling_count+=1
'76'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what does the to_h method do to a nested array?
    STRING
    answer='it converts a nested array to a hash'
    answers=<<-STRING
it converts a nested array to a hash
it converts a nested array to an array
it converts a nested array string
it converts a nested array to a range
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'77'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to convert a nested array to a hash

given hash.................array1=[["a", "apple"], ["b", "berry"]]
use variable...............hash1
#=>........................{"a"=>"apple", "b"=>"berry"}

    STRING
    answer=<<-STRING
hash1=array1.to_h
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #======================================================================================================================
  # values method =======================================================================================================
  #======================================================================================================================

  rolling_count+=1
'78'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
how do we collect all the values in a hash and put them in an array?
    STRING
    answer='by using the values method'
    answers=<<-STRING
by using the keys method
by using the values method
by using <<
by using ()
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'79'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
write code to collect all the values in a hash and put them in an array

given:..............hash_data={:a=>1,:b=>2,:c=>3}
variable:...........values_collected
    STRING
    answer=<<-STRING
values_collected=hash_data.values
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #======================================================================================================================
  # values_at method ====================================================================================================
  #======================================================================================================================

  rolling_count+=1
'80'
  if random_question==rolling_count
    #..............................................................................
    question_string=<<-STRING
write code using the 'values_at' method to access a value from a hash using
the keys:

given.............................hash={'cat'=>'feline','dog',=>'canine'}
use variable......................value
use key...........................'cat','dog'
    STRING
    answer=<<-STRING
value=hash.values_at('cat','dog')
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'81'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the 'values_at' method with a hash, what are the different ways we
can access values from a hash?
    STRING
    answer="(key1),(key1,key2,..)"
    answers=<<-STRING
(key1),(key1,key2,..)
(key1),(key1..key2)
(key1),(key1..-key2)
(key1),(value)
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'82'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'values_at' method to access the values in a hash, what
should we watch out for?
    STRING
    answer="the data type of the keys"
    answers=<<-STRING
the data type of the keys
the data type of the values
the key length
the value length
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end
  #=====================================================================================================================
  # {} method ==========================================================================================================
  #=====================================================================================================================

  rolling_count+=1
'83'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
what do we use to create a hash?
    STRING
    answer='new method or {}'
    answers=<<-STRING
new method or {}
({})
||= or !!
|| or &&
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'84'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
using the {}, create an empty hash

hash name:................empty_hash
    STRING
    answer=<<-STRING
empty_hash={}
    STRING
    result,drill_status=coding_testI(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #======================================================================================================================
  # [] method ===========================================================================================================
  #======================================================================================================================

  rolling_count+=1
'85'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
how do we add key and value pairs to a hash?
    STRING
    answer='hash_name[key]=value'
    answers=<<-STRING
hash_name[key]=value
hash_name<<key=>value
hash_name.push(key=>value)
hash_name.shift(key=>value)
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'86'
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
write code to add a key and value pair to a hash.

given:...............hash_data={:r=>'red',:b=>'blue'}
add:.................:p=>'pink'
    STRING
    answer=<<-STRING
hash_data[:p]='pink'
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'87'
  if random_question==rolling_count
    #.................................................................................
    question_string=<<-STRING
how do we access values in a hash using keys?
    STRING
    answer='value=hash_name[key]'
    answers=<<-STRING
value=hash_name[key]
value=hash_name(key)
value=hash_name.key
value=hash_name=key
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'88'
  if random_question==rolling_count
    #.................................................................................
    question_string=<<-STRING
write code to access the value 22 by using the key.

given:................hash_data={:a=>10,:b=>22}
variable:.............value
    STRING
    answer=<<-STRING
value=hash_data[:b]
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

