##################################################################################################################
#                                                                                                                #
# Program:......................arrays.rb                                                                        #
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
#                                 all? method                                                                    #
#                                 any? method                                                                    #
#                                 Array method                                                                   #
#                                 array operators                                                                #
#                                 at method                                                                      #
#                                 clear method                                                                   #
#                                 clone method                                                                   #
#                                 compact and compact! methods                                                   #
#                                 concat method                                                                  #
#                                 count method                                                                   #
#                                 delete method                                                                  #
#                                 delete_at method                                                               #
#                                 drop method                                                                    #
#                                 each_index method                                                              #
#                                 each_slice method                                                              #
#                                 empty? method                                                                  #
#                                 eql? method                                                                    #
#                                 equal? method                                                                  #
#                                 fetch method                                                                   #
#                                 first method                                                                   #
#                                 flatten and flatten! methods                                                   #
#                                 freeze method                                                                  #
#                                 frozen? method                                                                 #
#                                 general arrays                                                                 #
#                                 include? method                                                                #
#                                 index method                                                                   #
#                                 insert method                                                                  #
#                                 inject and inject! methods                                                     #
#                                 keep_if method                                                                 #
#                                 last method                                                                    #
#                                 length and size methods                                                        #
#                                 map and map! methods                                                           #
#                                 max method                                                                     #
#                                 min method                                                                     #
#                                 new method                                                                     #
#                                 none? method                                                                   #
#                                 one? method                                                                    #
#                                 pop method                                                                     #
#                                 push method                                                                    #
#                                 reduce method                                                                  #
#                                 reject and reject! methods                                                     #
#                                 replace method                                                                 #
#                                 reverse and reverse! methods                                                   #
#                                 rindex method                                                                  #
#                                 rotate and rotate! methods                                                     #
#                                 sample method                                                                  #
#                                 select and select! methods                                                     #
#                                 shift method                                                                   #
#                                 sort and sort! methods                                                         #
#                                 shuffle and shuffle! methods                                                   #
#                                 slice and slice! methods                                                       #
#                                 split method                                                                   #
#                                 take method                                                                    #
#                                 to_a method                                                                    #
#                                 two dimensional array                                                          #
#                                 uniq and uniq! methods                                                         #
#                                 unshift method                                                                 #
#                                 values_at method                                                               #
#                                 [] method                                                                      #
#                                 %w and %W methods                                                              #
#                                 << method                                                                      #
#                                 - method                                                                       #
##################################################################################################################



##################################################################################################################
# global variables                                                                                               #
##################################################################################################################
TITLE=                'arrays'                                                 # title for header
MISSED_QUESTIONS_FILE='../00 Tools/01 missed_questions/missed_questions'       # file containing missed questions
DRILLS_TEXT_FILE=     '../text_files/ProLanInv.txt'                            # text file to record drills metrics
DRILL_NAME=           '09 arrays'                                              # name of this drill
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
  questions=Array.new(337){|index| index+1}                                                                      #
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
# all? method ========================================================================================================
#=====================================================================================================================

  rolling_count+=1
'1'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'all?' method used for in arrays?
    STRING
    answer='checks if all the items in an array fit a criteria'
    answers=<<-STRING
checks if all the items in an array fit a criteria
checks if any of the items in an array fit a criteria
checks if some of the items in an array fit a criteria
checks if none of the items in an array fit a criteria
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end

  rolling_count+=1
'2'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to check if all items in an array are even.

                                        0 0 0 0 0 0 0 0 0
                                        0 1 2 3 4 5 6 7 8
given:...........................array=[1,2,3,4,5,6,7,8,9]
variable:........................even_items
variable:........................item
    STRING
    answer=<<-STRING
even_items=array.all?{|item| item.even?}
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'3'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'all?' method with arrays, when does it return true?

reminder: any item not literally nil or false is true!
    STRING
    answer='if all of the items are true'
    answers=<<-STRING
if all of the items are true
if some items are true
if only one of the items is true
if a few of the items are true
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

#=====================================================================================================================
# any? method ========================================================================================================
#=====================================================================================================================

  rolling_count+=1
'4'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'any?' method used for in arrays?
    STRING
    answer='checks if any of the items in an array fit a criteria'
    answers=<<-STRING
checks if all of the items in an array fit a criteria
checks if any of the items in an array fit a criteria
checks if some of the items in an array fit a criteria
checks if none of the items in an array fit a criteria
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'5'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to check if any items in an array are odd.

                                        0 0 0 0 0 0 0 0 0
                                        0 1 2 3 4 5 6 7 8
given:...........................array=[1,2,3,4,5,6,7,8,9]
variable:........................odd_items
variable:........................item
#=>..............................true
    STRING
    answer=<<-STRING
odd_items=array.any?{|item| item.odd?}
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'6'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'any?' method in arrays, when does it return true?

reminder: any item not literally nil or false is true!
    STRING
    answer='if one or more items is true including all'
    answers=<<-STRING
if one or more items is true including all
if one or more items is true but not all
if all items are false
if one item is nil and the other false
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


#=====================================================================================================================
# Array method =======================================================================================================
#=====================================================================================================================
  rolling_count+=1
'7'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the 'array' method, create an empty array

array name:..............empty array
#=>......................[]
    STRING
    answer=<<-STRING
empty_array=Array({})
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

#=====================================================================================================================
# array operators ====================================================================================================
#=====================================================================================================================
  rolling_count+=1
'8'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what operator do we use to combine two arrays into a new array?
    STRING
    answer='+'
    answers=<<-STRING
+
&
|
*
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'9'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to combine two arrays into a new array.

                                       0 0 0
                                       0 1 2
given:.........................arraya=[1,2,3]
given:.........................arrayb=[4,5,6]
use array......................combined
#=>............................[1,2,3,4,5,6]
    STRING
    answer=<<-STRING
combined=arraya+arrayb
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'10'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is it known as when we find the common elements in two arrays and
combine them into another array with no duplicates?
    STRING
    answer='intersection'
    answers=<<-STRING
intersection
union
difference or compliment
symmetrical difference
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'11'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what operator do we use to get an intersection of two arrays?
    STRING
    answer='&'
    answers=<<-STRING
&
+
|
*
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'12'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to get the intersection of two arrays.

                                       0 0 0 0
                                       0 1 2 3
given:.........................arraya=[2,3,7,8]
given:.........................arrayb=[2,7,9]
use array......................intersection
#=>............................[2,7]
    STRING
    answer=<<-STRING
intersection=arraya&arrayb
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'13'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is it known as when we combine two arrays into another array while
removing all the duplicates?
    STRING
    answer='union'
    answers=<<-STRING
union
intersection
difference or compliment
symmetrical difference
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'14'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what operator do we use to get a union?
    STRING
    answer='|'
    answers=<<-STRING
|
&
-
*
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'15'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to get the union of two arrays:

                                       0 0 0 0
                                       0 1 2 3
given:.........................arraya=[2,3,7,8]
given:.........................arrayb=[2,7,9]
use array......................union
#=>............................[2,3,7,8,9]
    STRING
    answer=<<-STRING
union=arraya|arrayb
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'16'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is it known as when we subtract the contents of an array, from another
array and the final answer?
    STRING
    answer='difference or compliment'
    answers=<<-STRING
difference or compliment
union
intersection
symmetrical difference
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'17'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what operator do we use to get a difference or compliment?
    STRING
    answer='-'
    answers=<<-STRING
|
&
-
*
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'18'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to get the difference or compliment of two arrays

                                       0 0 0 0 0
                                       0 1 2 3 4
given:.........................arraya=[1,2,3,4,5]
given:.........................arrayb=[2,4,5,6]
use array......................difference
#=>............................[1,3]
    STRING
    answer=<<-STRING
difference=arraya-arrayb
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'19'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what operator do we use to duplicate elements of an array?
    STRING
    answer='*'
    answers=<<-STRING
|
&
-
*
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'20'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to duplicate the elements of an array three times

                                       0 0 0
                                       0 1 2
given:.........................arraya=[1,2,3]
use array......................array_dup
#=>............................[1,2,3,1,2,3,1,2,3]
    STRING
    answer=<<-STRING
array_dup=arraya*3
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'21'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is a symmetrical difference between two arrays?
    STRING
    answer='values are in one array but not in both'
    answers=<<-STRING
values are in one array but not in both
values are in both arrays
duplicates
both arrays have the same values
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'22'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
how do we get a symmetrical difference?
    STRING
    answer='(a-b)|(b-a)'
    answers=<<-STRING
(a-b)|(b-a)
(a-b)&(b-a)
(a+b)-(b+a)
(a-b)+(b-a)
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'23'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to get the symmetrical difference of the two arrays

                                       0 0 0 0 0  0
                                       0 1 2 3 4  5
given:.........................arraya=[1,2,3,4,5 ,6]
given:.........................arrayb=[2,3,6,8,10]
use array......................sym_diff
#=>............................[1,4,5,8,10]
    STRING
    answer=<<-STRING
sym_diff=(arraya-arrayb)|(arrayb-arraya)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'24'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when getting the difference or compliment of two arrays what will the
following code return?

                                 0 0 0 0 0  0 0 0 0 0
                                 0 1 2 3 4  5 6 7 8 9
given:...................array1=[1,2,3,4,5 ,6,7,8,9,9]
                         array2=[2,4,6,8,10]
                         new_array=array1-array2
    STRING
    answer='[1,3,5,7,9,9]'
    answers=<<-STRING
[1,3,5,7,9,9]
[1,3,5,7,9]
[2,4,6,8,10]
[1,3,5,7]
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

#=====================================================================================================================
# at method ==========================================================================================================
#=====================================================================================================================
  rolling_count+=1
'25'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the 'at' method, access the following

                              0 0 0 0 0 0
                              0 1 2 3 4 5 
given:.................array=[1,2,3,4,5,6]
variable:..............numbers
#=>....................1
    STRING
    answer=<<-STRING
numbers=array.at(0)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'26'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what methods can we use with the at method?
    STRING
    answer='(2) and (-2)'
    answers=<<-STRING
(2) and (-2)
(1..6)
(1,6)
{block}
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

#=====================================================================================================================
# clear method =======================================================================================================
#=====================================================================================================================

  rolling_count+=1
'27'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'clear' method used for?
    STRING
    answer='to remove all items in an array'
    answers=<<-STRING
to remove all items in an array
to remove items from the end of an array
to remove an item from the beginning of an array
to remove items from the beginning of an array
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'28'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what should we remember about the 'clear' method?
    STRING
    answer='it modifies the original array'
    answers=<<-STRING
it modifies the original array
it creates a new array
it returns a nil
it requires a block
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'29'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what does the 'clear' method return?
    STRING
    answer='a copy of the modified array'
    answers=<<-STRING
a copy of the modified array
the original array
the number of nils removed
the removed item
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'30'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to remove all items in an array

                                        0  0  0 0  0  0  0
                                        0  1  2 3  4  5  6
given:...........................array=[1,nil,3,4,nil,6,nil]
    STRING
    answer=<<-STRING
array.clear
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

#=====================================================================================================================
# clone method =======================================================================================================
#=====================================================================================================================
  rolling_count+=1
'31'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what does the following code do to an array?

       0 0 0 0 0 0 0 0 0
       0 1 2 3 4 5 6 7 8
array=[1,2,3,4,5,6,7,8,9]
new_array=array
    STRING
    answer='makes new_array point to array'
    answers=<<-STRING
makes new_array point to array
makes new_array equal to array
copies the contents into new_array
makes both arrays equal
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'32'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
given the following program, what happens to new_array if array is modified?

       0 0 0 0 0 0 0 0 0
       0 1 2 3 4 5 6 7 8
array=[1,2,3,4,5,6,7,8,9]
new_array=array
    STRING
    answer='new_array will also be modified'
    answers=<<-STRING
new_array will also be modified
only array will be modified
only new_array will be modified
new_array will become empty
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'33'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what method should we use to make an individual copy of an array?
    STRING
    answer='clone'
    answers=<<-STRING
clone
=
copy
make_equal
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'34'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to make an individual copy of an array

                                         0 0 0 0 0 0 0 0 0
                                         0 1 2 3 4 5 6 7 8
given array...................old_array=[1,2,3,4,5,6,7,8,9]
use...........................new_array
    STRING
    answer=<<-STRING
new_array=old_array.clone
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  #=====================================================================================================================
  # compact and compact! methods =======================================================================================
  #=====================================================================================================================

  rolling_count+=1
'35'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'compact' method used for?
    STRING
    answer='create a new array with no nils'
    answers=<<-STRING
create a new array with no nils
create a new array with no duplicates
create a new array with no spaces
create a new array with no zeroes
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'36'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what should we remember about the 'compact' method?
    STRING
    answer='it creates a new array'
    answers=<<-STRING
it modifies the original array
it creates a new array
it returns a nil
it requires a block
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'37'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to remove all occurrences of nil in an array while creating a
new array

                                        0  0  0 0  0  0  0
                                        0  1  2 3  4  5  6 
given:...........................array=[1,nil,3,4,nil,6,nil]
remove all:......................nil
new array:.......................new_array
    STRING
    answer=<<-STRING
new_array=array.compact
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'38'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what should we remember about the 'compact!' method?
    STRING
    answer='it modifies the original array'
    answers=<<-STRING
it modifies the original array
it creates a new array
it returns a nil
it requires a block
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'39'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what does the 'compact!' method return?
    STRING
    answer='a copy of the modified array'
    answers=<<-STRING
a copy of the modified array
the original array
the number of nils removed
the removed item
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'40'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to remove all occurrences of nil in an array while modifying the
original array

                                        0  0  0 0  0  0  0
                                        0  1  2 3  4  5  6
given:...........................array=[1,nil,3,4,nil,6,nil]
remove all:......................nil
    STRING
    answer=<<-STRING
array.compact!
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # concat method ======================================================================================================
  #=====================================================================================================================

  rolling_count+=1
'41'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the concat method used for in arrays?
    STRING
    answer='to concatenate two arrays together'
    answers=<<-STRING
to concatenate two arrays together
to compare two arrays
to merge two arrays, removing duplicates
to find the difference of two arrays
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'42'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in arrays, how do we concatenate two arrays together?
    STRING
    answer='by using the concat method'
    answers=<<-STRING
by using the concat method
by using the concatenate method
by using the merge method
by using the union method
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'43'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to concatenate two arrays together while creating a new array

                              0 0 0 0 0
                              0 1 2 3 4
given.................array1=[1,2,3,4]
                      array2=[5,6,7,8,9]
variable..............answer
#=>...................[1,2,3,4,5,6,7,8,9]
    STRING
    answer=<<-STRING
answer=array1.concat(array2)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'44'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the concat method in arrays what should we know?
    STRING
    answer='it can create a new array or modify an existing one'
    answers=<<-STRING
it can create a new array or modify an existing one
it modifies the original array
it creates a copy of the original array
it creates a new array
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'45'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the difference between the + method and the concat method
in arrays?
    STRING
    answer='+ method cannot modify an existing array'
    answers=<<-STRING
+ method cannot modify an existing array
concat method can only create a new array
concat method puts items in order
+ method puts items in order
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'46'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to concatenate two arrays while modifying an existing array

                                    0 0 0
                                    0 1 2
given.......................array1=[1,2,3]
                            array2=[4,5,6]
#=>.........................[1,2,3,4,5,6]
    STRING
    answer=<<-STRING
array1.concat(array2)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

#=====================================================================================================================
# count method =======================================================================================================
#=====================================================================================================================

  rolling_count+=1
'47'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'count' method used for in arrays?
    STRING
    answer='it can check the size of an array or count the occurrences of an item'
    answers=<<-STRING
it can check the size of an array or count the occurrences of an item
it can check the bytes in an array
it can check the values in an array
it can count the indices in an array
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'48'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to count the number of 6s in an array

                                        0 0 0 0 0 0 0 0 0
                                        0 1 2 3 4 5 6 7 8
given:...........................array=[1,2,6,4,5,6,7,6,9]
variable:........................six_count
    STRING
    answer=<<-STRING
six_count=array.count(6)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'49'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to count the number of even numbers in an array

                                        0 0 0 0 0 0 0 0 0
                                        0 1 2 3 4 5 6 7 8
given:...........................array=[1,2,3,4,5,6,7,8,9]
variable:........................even_count
variable:........................n
    STRING
    answer=<<-STRING
even_count=array.count{|n| n.even?}
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


#=====================================================================================================================
# delete method ======================================================================================================
#=====================================================================================================================

  rolling_count+=1
'50'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'delete' method used for?
    STRING
    answer='to delete all occurrences of an item in an array'
    answers=<<-STRING
to delete all occurrences of an item in an array
to delete items from an array
to conditionally delete items from an array
to conditionally delete an item from an array
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'51'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what should we remember about the 'delete' method?
    STRING
    answer='it modifies the original array'
    answers=<<-STRING
it modifies the original array
it creates a new array
it returns a nil
it requires a block
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'52'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what does the 'delete' method return?
    STRING
    answer='the deleted item'
    answers=<<-STRING
the deleted item
the deleted items
a copy of the modified array
the original array
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'53'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what does the 'delete' method return when the item to be deleted is not in
the array?
    STRING
    answer='nil'
    answers=<<-STRING
nil
the deleted item
a copy of the modified array
the original array
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'54'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to remove all occurrences of an item in an array

                                        0 0 0 0 0 0 0 0 0 0
                                        0 1 2 3 4 5 6 7 8 9
given:...........................array=[1,2,3,4,5,6,6,6,6,6]
remove all:......................6
    STRING
    answer=<<-STRING
array.delete(6)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

#=====================================================================================================================
# delete_at method ===================================================================================================
#=====================================================================================================================

  rolling_count+=1
'55'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'delete_at' method used for?
    STRING
    answer='to remove an item at a given location in an array'
    answers=<<-STRING
to remove an item at a given location in an array
to delete items from an array
to conditionally delete items from an array
to conditionally delete an item from an array
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'56'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what should we remember about the 'delete_at' method?
    STRING
    answer='it modifies the original array'
    answers=<<-STRING
it modifies the original array
it creates a new array
it returns a nil
it requires a block
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'57'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what does the 'delete_at' method return?
    STRING
    answer='the deleted item'
    answers=<<-STRING
the deleted item
the deleted items
a copy of the modified array
the original array
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'58'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what does the 'delete_at' method return when the index is out of range?
    STRING
    answer='nil'
    answers=<<-STRING
nil
the deleted item
a copy of the modified array
the original array
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'59'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to remove an item from a location in an array but do not use the
slice! method.    

                                        0 0 0 0 0
                                        0 1 2 3 4
given:...........................array=[1,2,3,4,5]
remove at index..................2
    STRING
    answer=<<-STRING
array.delete_at(2)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'60'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what two methods can we use to remove an element somewhere inside an array?
    STRING
    answer='slice!, delete_at'
    answers=<<-STRING
slice!, delete_at
delete_if, delete
remove, clear
at, []
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  

#=====================================================================================================================
# drop method ========================================================================================================
#=====================================================================================================================
  rolling_count+=1
'61'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
given the following program with an array, what value is returned?

                             0 0 0 0 0 0
                             0 1 2 3 4 5
given:................array=[1,2,3,4,5,6]
code:.................number=array.drop(3)
    STRING
    answer='[4,5,6]'
    answers=<<-STRING
[4,5,6]
[1,2,3]
3
4
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'62'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the drop method on arrays, capture the last 4 elements of the array

                              0 0 0 0 0 0
                              0 1 2 3 4 5
given:.................array=[1,2,3,4,5,6]
variable:..............number
    STRING
    answer=<<-STRING
number=array.drop(2)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

#=====================================================================================================================
# each_index method ==================================================================================================
#=====================================================================================================================
  rolling_count+=1
'63'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'each_index' method used for?
    STRING
    answer='to iterate through each index in an array'
    answers=<<-STRING
to iterate through each index in an array
to find the index in an array
to iterate through each item in an array
to find the item in an array
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'64'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the 'each_index method', write code to iterate and print the items in an
array. use a block form. note: the printed items are not on the same line.

given:................array=%w(a b c d e f g h)
use variable:.........i
    STRING
    answer=<<-STRING
array.each_index do |i|
  puts array[i]
end
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'65'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what does the following program print?

array=%w(a b c d e f g h)
array.each_index{|item| puts item}
    STRING
    answer='the indices of the array'
    answers=<<-STRING
the indices of the array
the contents of the array
numbers 1 through 8
letters a through h
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

#=====================================================================================================================
# each_slice method ==================================================================================================
#=====================================================================================================================

  rolling_count+=1
'66'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
how do we access elements in an array and group them for printing to the
screen?
    STRING
    answer="by using the 'each_slice' method"
    answers=<<-STRING
by using the 'each_slice' method
my using the 'each_piece' method
by using the 'each_with_index' method
by using the 'each' method
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'67'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to access an array and group the elements into 2's for printing to
the screen. use in-line method use puts to print.

                                    0 0 0 0 0 0 0 0 0
                                    0 1 2 3 4 5 6 7 8
given........................array=[1,2,3,4,5,6,7,8,9]
variable.....................items
#=>..........................[1, 2]
                             [3, 4]
                             [5, 6]
                             [7, 8]
                             [9]
    STRING
    answer=<<-STRING
array.each_slice(2){|items| puts items.inspect}
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end


#=====================================================================================================================
# each_with_index method =============================================================================================
#=====================================================================================================================
  rolling_count+=1
'68'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'each_with_index' method used for in arrays?
    STRING
    answer='to iterate through each item while getting the index'
    answers=<<-STRING
to iterate through each item while getting the index
to iterate through the index
access the index through the items
replace the index
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'69'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the 'each_with_index method', write code to iterate through an array and
change the letter b then print the array using puts. use a block form.

given:.............array=%w(a b c d e f g h)
change:............'b' to '(b)'
use variables:.....letter, index
    STRING
    answer=<<-STRING
array.each_with_index do |letter,index|
  array[index]='(b)' if letter=='b'
end
puts array.inspect
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'70'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'each_with_index method' with arrays, what variable goes in 
what order?

example:      array.each_with_index do |variable,variable|
    STRING
    answer='element,index'
    answers=<<-STRING
element,index
index,element
it does not matter
ruby will figure it out
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

#=====================================================================================================================
# empty? method ======================================================================================================
#=====================================================================================================================

  rolling_count+=1
'71'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'empty?' method used for?
    STRING
    answer='to check if an array is empty'
    answers=<<-STRING
to check if an array is empty
to check how many nils are in an array
to check how many zeroes are in an array
to check how many items are in an array
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'72'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to check if an array is empty

                                        0 0 0 0 0 0 0 0 0
                                        0 1 2 3 4 5 6 7 8
given:...........................array=[1,2,3,4,5,6,7,8,9]
variable:........................empty_array
    STRING
    answer=<<-STRING
empty_array=array.empty?
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

#=====================================================================================================================
# eql? method ========================================================================================================
#=====================================================================================================================
  rolling_count+=1
'73'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'eql?' method used for?
    STRING
    answer='to check if two arrays are equal'
    answers=<<-STRING
to check if two arrays are equal
to check if two arrays are the same length
to check if two arrays have the same name
to check if two arrays have the same data types
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'74'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to check if two arrays are equal

                                         0 0 0 0 0 0 0 0 0
                                         0 1 2 3 4 5 6 7 8
given:...........................array1=[1,2,3,4,5,6,7,8,9]
      ...........................array2=[2,4,3,5,6,7,5,6,7]
variable:........................result
    STRING
    answer=<<-STRING
result=array1.eql?(array2)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'75'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the eql? method, what should we be aware of?
    STRING
    answer='eql? compares if both data types are the same'
    answers=<<-STRING
eql? compares if both data types are the same
eql? compares if both operands refer to the same object
eql? compares the size of both objects
eql? compares the length of the objects
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

#=====================================================================================================================
# equal? method ======================================================================================================
#=====================================================================================================================

  rolling_count+=1
'76'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in arrays, how do we check if both operands refer to the same array?
    STRING
    answer='by using the equal? method'
    answers=<<-STRING
by using the equal? method
by using the eql? method
by using the same? method?
by using the = method
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'77'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to check if two arrays refer to the same array

                          0 0 0 0 0
                          0 1 2 3 4
given.............array1=[1,2,3,4,5]
     .............array2=[1,2,3,4,5]
use variable......result
#=>...............false
    STRING
    answer=<<-STRING
result=array1.equal?(array2)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

#=====================================================================================================================
# fetch method =======================================================================================================
#=====================================================================================================================
  rolling_count+=1
'78'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the 'fetch' method, access the following

                                0 0 0 0 0 0
                                0 1 2 3 4 5
given:...................array=[1,2,3,4,5,6]
variable:................numbers
default:.................0
#=>......................3
    STRING
    answer=<<-STRING
numbers=array.fetch(2,0)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'79'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'fetch' method, what does the numbers in the parameters
represent respectively?

code................number=array.fetch(100,0)
    STRING
    answer='index and default value'
    answers=<<-STRING
index and default value
starting range and ending range
starting index and number of items
starting number and number of items
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'80'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'fetch' method, what can go in the second parameter?

code..................number=array.fetch(100,0)
    STRING
    answer='any object'
    answers=<<-STRING
any object
0 only
nil
end of file
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'81'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'fetch' method, what is the default value used for?
    STRING
    answer='returns default once outside of array index'
    answers=<<-STRING
returns default once outside of array index
returns default when nil
returns default if zero
returns default when no value passed
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'82'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'fetch' method with a block, when is the block invoked?
    STRING
    answer='once outside of array index'
    answers=<<-STRING
once outside of array index
once value is zero
once the value is even
once the value is nil
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'83'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the 'fetch' method what are the different ways to access an array?
    STRING
    answer="(1),(-1),(1,'default'),(1){block}"
    answers=<<-STRING
(1),(-1),(1,'default'),(1){block}
(1),(1,'default')
(1),(1,'default'),(1){block}
(1),(-1)
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'84'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code using the 'fetch' method using a block to execute when out of
array index...

                                      0 0 0 0 0 0 0 0 0
                                      0 1 2 3 4 5 6 7 8
given..........................array=[1,2,3,4,5,6,7,8,9]
try to fetch at index..........9
if out of index................take the search index and multiply by 2
variables......................result, index
    STRING
    answer=<<-STRING
result=array.fetch(9){|index| index*2}
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

#=====================================================================================================================
# first method =======================================================================================================
#=====================================================================================================================
  rolling_count+=1
'85'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the 'first' method, access the first element in the array.

                              0 0 0 0 0 0
                              0 1 2 3 4 5
given:.................array=[1,2,3,4,5,6]
variable:..............number
    STRING
    answer=<<-STRING
number=array.first
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'86'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the first method used for in arrays?
    STRING
    answer='accessing the first item, or with a parameter the first n items'
    answers=<<-STRING
accessing the first item, or with a parameter the first n items
accessing the first item in an array
accessing the item that will come first when the array is ordered
accessing the item that will come last when the array is ordered
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'87'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code that will access the first two items in an array using the
first method

                                     0 0 0 0 0
                                     0 1 2 3 4
given.........................array=[1,2,3,4,5]
variable......................numbers
#=>...........................[1,2]
    STRING
    answer=<<-STRING
numbers=array.first(2)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end



#=====================================================================================================================
# flatten and flatten! methods =======================================================================================
#=====================================================================================================================

  rolling_count+=1
'88'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'flatten' method used for in arrays?
    STRING
    answer='to create a new array while removing nesting, or (n) level of nesting'
    answers=<<-STRING
to create a new array while removing nesting, or (n) level of nesting
to create a new array backwards
to modify an existing array while removing nesting
to modify an existing array backwards
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'89'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'flatten!' method used for in arrays?
    STRING
    answer='to modify an existing array while removing nesting, or (n) level of nesting'
    answers=<<-STRING
to create a new array while removing nesting
to create a new array backwards
to modify an existing array while removing nesting, or (n) level of nesting
to modify an existing array backwards
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'90'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to create a new array without any nesting.

given:.................array=[[1,2],[3,4],[5,6],[7,8,9]]
new array..............new_array
    STRING
    answer=<<-STRING
new_array=array.flatten
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'91'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to modify an existing array, removing one level of nesting.

given:.................array=[[1,2],[3,4],[5,6],[7,8,9]]
    STRING
    answer=<<-STRING
array.flatten!(1)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'92'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to create a new array while removing two levels of nesting

given...............array=[1,1,[2,2,[3,3,[4,4],0,0]0,0],0,0]
variable............answer
#=>.................[1, 1, 2, 2, 3, 3, [4, 4], 0, 0, 0, 0, 0, 0]
    STRING
    answer=<<-STRING
answer=array.flatten(2)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'93'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to modify an existing array while removing one level of nesting

given................array=[1,1,[2,2,[3,3,[4,4],0,0],0,0],0,0]
#=>..................[1, 1, 2, 2, [3, 3, [4, 4], 0, 0], 0, 0, 0, 0]
    STRING
    answer=<<-STRING
array.flatten!(1)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'94'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to create a new array while removing all levels of nesting

given...............array=[1,1,[2,2,[3,3,[4,4],0,0],0,0],0,0]
variable............answer
#=>.................[1,1,2,2,3,3,4,4,0,0,0,0,0,0]
    STRING
    answer=<<-STRING
answer=array.flatten
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'95'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to modify an existing array while removing all levels of nesting

given...............array=[1,1,[2,2,[3,3,[4,4],0,0],0,0],0,0]
#=>.................[1,1,2,2,3,3,4,4,0,0,0,0,0,0]
    STRING
    answer=<<-STRING
array.flatten!
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

#=====================================================================================================================
# freeze method ======================================================================================================
#=====================================================================================================================
  rolling_count+=1
'96'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'freeze' method used for in arrays?
    STRING
    answer='to prevent modifications of an array'
    answers=<<-STRING
to prevent modifications of an array
to make the array cool
to prevent adding items to an array
to prevent accessing elements of an array
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'97'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
given the following array, make sure it is not modifiable.


                                        0 0 0 0 0 0 0 0 0
                                        0 1 2 3 4 5 6 7 8
given array......................array=[1,2,3,4,5,6,7,8,9]
    STRING
    answer=<<-STRING
array.freeze
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

#=====================================================================================================================
# frozen? method =====================================================================================================
#=====================================================================================================================
  rolling_count+=1
'98'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'frozen?' method used for in arrays?
    STRING
    answer='to check if an array is modifiable'
    answers=<<-STRING
to check if an array is modifiable
to check if an array is cool
to check if an array is stuck
to check if an array is done
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'99'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to check if an array is modifiable

                                        0 0 0 0 0 0 0 0 0
                                        0 1 2 3 4 5 6 7 8
given array......................array=[1,2,3,4,5,6,7,8,9]
variable.........................frozen_array
    STRING
    answer=<<-STRING
frozen_array=array.frozen?
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

#=====================================================================================================================
# general arrays =====================================================================================================
#=====================================================================================================================
  rolling_count+=1
'100'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is an array?
    STRING
    answer='arrays are ordered, integer-indexed collections of any mixture of objects'
    answers=<<-STRING
arrays are ordered, integer-indexed collections of any mixture of objects
arrays are collections of key and value pairs
arrays are a collection of methods
arrays are special variables
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'101'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
how should arrays be named?
    STRING
    answer='descriptive, plural names starting with a lowercase letter'
    answers=<<-STRING
descriptive, plural names starting with a lowercase letter
in all caps
with a leading underscore
descriptive, singular names starting with a lowercase letter
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'102'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
how are arrays indexed?
    STRING
    answer='starting with a zero'
    answers=<<-STRING
starting with a zero
starting with a one
ending in a negative number
paired with a key
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'103'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code that will print the contents of an array, using 'puts' (make
sure the actual array is printed).

variable:........................array
    STRING
    answer=<<-STRING
puts array.inspect
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'104'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when a variable receives more than one value from an expression or method
what data type is used?
    STRING
    answer='an array'
    answers=<<-STRING
an array
a hash
a string
an integer
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'105'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-RSTRING
what should we know about passing an array to a method, when it comes to
changing data inside the array?
    RSTRING
    answer='the array is modified and does not need to be returned'
    answers=<<-RSTRING
the array is modified and does not need to be returned
the array must be returned for it to be modified
the array cannot be modified by a method
the array cannot be returned by a method
    RSTRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

#=====================================================================================================================
# include? method ====================================================================================================
#=====================================================================================================================
  rolling_count+=1
'106'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what does the following code do?

                                 0 0 0 0 0 0 0 0 0 0
                                 0 1 2 3 4 5 6 7 8 9    
given:...................answer=[1,2,3,4,5,6,7,8,9,10]
code:....................answer=number.include?(9)
    STRING
    answer='checks if 9 is in the array'
    answers=<<-STRING
checks if 9 is in the array
checks what is in index 9
checks the first 9 items
checks the last 9 items
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'107'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'include?' method, what goes in the parentheses?
    STRING
    answer='element'
    answers=<<-STRING
element
index
number of items
default value
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'108'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to check if the number 8 is in the array.

given array......................number_list
variable:........................answer
    STRING
    answer=<<-STRING
answer=number_list.include?(8)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'109'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'include?' method, what is returned?
    STRING
    answer='true or false'
    answers=<<-STRING
true or false
the element
the index
a nil
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

#=====================================================================================================================
# index method =======================================================================================================
#=====================================================================================================================
  rolling_count+=1
'110'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what method do we use to find the index of an item in an array?
    STRING
    answer='index or rindex'
    answers=<<-STRING
index or rindex
find
locate
search
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'111'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to find the index of an item in an array.

given array:...................array
variable:......................num
#=>............................5
    STRING
    answer=<<-STRING
num=array.index(5)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'112'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'index' method what should we be aware of?
    STRING
    answer='duplicate items'
    answers=<<-STRING
duplicate items
nils
zeroes
the length of the array
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'113'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'index' method what goes in the parentheses?
    STRING
    answer='item'
    answers=<<-STRING
item
index
default
number of items
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

#=====================================================================================================================
# insert method ======================================================================================================
#=====================================================================================================================

  rolling_count+=1
'114'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
how do we enter an item(s) into an array at any given point?
    STRING
    answer='by using the insert method'
    answers=<<-STRING
by using the unshift method
by using the insert method
by using the push method
by using the put method
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'115'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the 'insert' method, what does it return?
    STRING
    answer='a copy of the modified array'
    answers=<<-STRING
a copy of the modified array
the item(s) being entered in
the original array
a new array
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'116'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what will the following code return?

       0 0 0 0 0 0 0 0 0
       0 1 2 3 4 5 6 7 8
array=[1,2,3,4,5,6,7,8,9]
array.insert(10,11)
    STRING
    answer='[1,2,3,4,5,6,7,8,9,nil,11]'
    answers=<<-STRING
[1,2,3,4,5,6,7,8,9,nil,11]
[1,2,3,4,5,6,7,8,9,10,11]
[10,11]
[11]
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'117'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code using the 'insert' method to put 2 items in an array


                                   0 0 0 0 0 0 0 0 0
                                   0 1 2 3 4 5 6 7 8
given.......................array=[1,2,3,4,5,6,7,8,9]
at index....................5
add item....................'x','y'
    STRING
    answer=<<-STRING
array.insert(5,'x','y')
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'118'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the 'insert' method, what do the numbers in the parentheses represent
respectively?

array=[1,2,3,4,5,6,7,8,9]
array.insert(5,10,11)
    STRING
    answer='index to insert at, item1, item2'
    answers=<<-STRING
index to insert at, item1, item2
index to insert at, item, items to shift
index to insert at, number of spaces, item
index to insert at, index to end at, item2
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

#=====================================================================================================================
# inject and inject! methods =========================================================================================
#=====================================================================================================================

  rolling_count+=1
'119'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what does the inject method give the enumerable module?
    STRING
    answer='a way to total all the elements in a collection using + or *'
    answers=<<-STRING
a way to total all the elements in a collection using + or *
a way to include other elements into a collection
a way to insert items into a collection
a way to take out items in a collection
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'120'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the difference between inject and reduce?
    STRING
    answer='no difference they are aliases of each other'
    answers=<<-STRING
no difference they are aliases of each other
inject inserts items reduce removes items
inject totals items reduce subtracts items
inject changes the original collection and reduce does not
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'121'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to sum all numbers in an array in in-line form but do not use the
'reduce' method.

given............................array=[5,6,7,8,9,10]
accumulator......................sum
current number...................num
variable.........................added_nums
#=>..............................45

    STRING
    answer=<<-STRING
added_nums=array.inject{|sum,num| sum+num}
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'122'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to sum all numbers in an array in block form but do not use the
'reduce' method.

given............................array=[5,6,7,8,9,10]
accumulator......................sum
current number...................num
variable.........................added_nums
#=>..............................45

    STRING
    answer=<<-STRING
added_nums=array.inject do |sum,num|
  sum+num
end
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'123'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to sum all numbers in an array in short form but do not use the
'reduce' method.

given............................array=[5,6,7,8,9,10]
variable.........................added_nums
#=>..............................45

    STRING
    answer=<<-STRING
added_nums=array.inject(:+)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'124'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to multiply all numbers in an array in in-line form but do not use
the 'reduce' method.

given............................array=[5,6,7,8,9,10]
accumulator......................product
current number...................num
variable.........................product_nums
#=>..............................151200

    STRING
    answer=<<-STRING
product_nums=array.inject{|product,num| product*num}
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'125'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to multiply all numbers in an array in block form but do not use
the 'reduce' method.

given............................array=[5,6,7,8,9,10]
accumulator......................product
current number...................num
variable.........................product_nums
#=>..............................151200

    STRING
    answer=<<-STRING
product_nums=array.inject do |product,num|
  product*num
end
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'126'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to multiply all numbers in an array in short form but do not use
the 'reduce' method.

given............................array=[5,6,7,8,9,10]
variable.........................product_nums
#=>..............................151200

    STRING
    answer=<<-STRING
product_nums=array.inject(:*)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'127'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code using the 'inject' method to find the longest word in block form
while also utilizing the ternary method. get the last word in the array
that fits the criteria.

given............................array=['cat','sheep','bear']
variables........................longest_word, memo, word
#=>..............................sheep
    STRING
    answer=<<-STRING
longest_word=array.inject do |memo,word|
  memo.length>word.length ? memo : word
end
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end

  rolling_count+=1
'128'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
The following program finds the longest word in the array. If two words are
the same size which one will be returned?

array=['cat','bear','goat']
longest_word=array.inject do |memo,word|
  memo.length>word.length ? memo : word
end
    STRING
    answer='the last word on the list that fit the criteria'
    answers=<<-STRING
the last word on the list that fit the criteria
the first word on the list that fit the criteria
it will choose alphabetically the closest to a
it will choose alphabetically the closest to z
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'129'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code using the 'inject' method to find the word with the most vowels
in block form while utilizing the ternary method.

given............................array=['allow','superb','bellow']
variable.........................most_vowels, memo, word
#=>..............................'bellow'

    STRING
    answer=<<-STRING
most_vowels=array.inject do |memo,word|
  memo.count('aeiou')>word.count('aeiou') ? memo : word
end
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'130'
  if random_question==rolling_count
  #..............................................................................
    question_string=<<-STRING
  write code using the 'inject' method to find the word with the most vowels
  in in-line form while utilizing the ternary method. get the last word from
  the array that fit the criteria
  
  given............................array=['allow','superb','bellow']
  variable.........................most_vowels, memo, word
  #=>..............................'bellow'
    STRING
    answer=<<-STRING
  most_vowels=array.inject{|memo,word| memo.count('aeiou')>word.count('aeiou') ? memo : word}
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end 
  
  rolling_count+=1
'131'
  if random_question==rolling_count
  #..............................................................................
    question_string=<<-STRING
  write code using the 'inject' method to find the longest word in in-line form
  while also utilizing the ternary method. get the last word in the array that
  fits the criteria.
  
  given............................array=['cat','sheep','bear']
  variable.........................longest_word, memo, word
  #=>..............................'sheep'
    STRING
    answer=<<-STRING
  longest_word=array.inject{|memo,word| memo.length>word.length ? memo : word}
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end  

#=====================================================================================================================
# keep_if method =====================================================================================================
#=====================================================================================================================

  rolling_count+=1
'132'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
select and keep_if work similarly on arrays, other than the fact that keep_if
can modify an existing array or create a new one what is another difference
between the two?
    STRING
    answer='keep_if does not work with ranges'
    answers=<<-STRING
keep_if does not work with ranges
keep_if does not create a new array
select does not create a new array
select does not work with ranges
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'133'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to keep vowels found in the array while creating a new array.
use regexp and character class. use in-line form.

given...............array3=%w(a b c d e f)
variables...........answer, v
#=>.................["a", "e"]
    STRING
    answer=<<-STRING
answer=array3.keep_if{|v| v=~/[aeiou]/}
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'134'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to keep numbers in the array that are larger than 5 while
modifying the original array. use in-line form.

                               0 0 0 0 0 0 0 0 0 0
                               0 1 2 3 4 5 6 7 8 9
given..................array2=[1,2,3,4,5,6,7,8,9,10]
variable...............n
#=>....................[6,7,8,9,10]
    STRING
    answer=<<-STRING
array2.keep_if{|n| n>5}
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end

  rolling_count+=1
'135'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the keep_if method used for in arrays?
    STRING
    answer='to create or modify an array keeping items based on a condition'
    answers=<<-STRING
to create or modify an array keeping items based on a condition
to create a new array keeping items based on a condition
to modify an existing array removing items based on a condition
to create a new array removing items based on a condition
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'136'
  if random_question==rolling_count
  #..............................................................................
    question_string=<<-STRING
  write code to keep numbers in the array that are larger than 5 while
  modifying the original array. use a block form.
  
  given..........................array2=[1,2,3,4,5,6,7,8,9,10]
  variable.......................n
  #=>............................[6,7,8,9,10]
    STRING
    answer=<<-STRING
  array2.keep_if do |n|
    n>5
  end
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end  

  rolling_count+=1
'137'
  if random_question==rolling_count
  #..............................................................................
    question_string=<<-STRING
  write code to keep vowels found in the array while creating a new array.
  use regexp and character class. use block form.
  
  given...............array3=%w(a b c d e f)
  variables...........answer, v
  #=>.................["a", "e"]
    STRING
    answer=<<-STRING
  array3.keep_if do |v|
    v=~/[aeiou]/
  end
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end  

#=====================================================================================================================
# last method ========================================================================================================
#=====================================================================================================================

  rolling_count+=1
'138'
  if random_question==rolling_count#
#..............................................................................
    question_string=<<-STRING
using the 'last' method, access the last element in the array.

                             0 0 0 0 0 0
                             0 1 2 3 4 5
given:................array=[1,2,3,4,5,6]
variable:.............number
    STRING
    answer=<<-STRING
number=array.last
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'139'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the last method used for in arrays?
    STRING
    answer='accessing the last item or if with a parameter, the last n items'
    answers=<<-STRING
accessing the last item or if with a parameter, the last n items
accessing the last item in an array
accessing the item that will go last when the array is ordered
accessing the item with the least value
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'140'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code that will access the last two items in an array using the last
method

                                     0 0 0 0 0
                                     0 1 2 3 4
given.........................array=[1,2,3,4,5]
variable......................numbers
#=>...........................[4,5]
    STRING
    answer=<<-STRING
numbers=array.last(2)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

#=====================================================================================================================
# length and size methods ============================================================================================
#=====================================================================================================================

  rolling_count+=1
'141'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'length' and 'size' methods used for?
    STRING
    answer='checking the size of an array'
    answers=<<-STRING
checking the size of an array
checking the bytes in an array
checking the values in an array
checking the length of each item in an array
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'142'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the difference between the 'length' and 'size' methods?
    STRING
    answer='no difference they are aliases of one another'
    answers=<<-STRING
no difference they are aliases of one another
spelling
size counts the number of indices
length counts the number of items
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'143'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code using the 'length' method to find the size of an array

                                        0 0 0 0 0 0 0 0 0
                                        0 1 2 3 4 5 6 7 8
given:...........................array=[1,2,3,4,5,6,7,8,9]
variable:........................array_length
    STRING
    answer=<<-STRING
array_length=array.length
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'144'
  if random_question==rolling_count
##..............................................................................
    question_string=<<-STRING
write code using the 'size' method to find the size of an array

                                        0 0 0 0 0 0 0 0 0
                                        0 1 2 3 4 5 6 7 8
given:...........................array=[1,2,3,4,5,6,7,8,9]
variable:........................array_size
    STRING
    answer=<<-STRING
array_size=array.size
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

#=====================================================================================================================
# map and map! methods ===============================================================================================
#=====================================================================================================================

  rolling_count+=1
'145'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the alias for the collect method?
    STRING
    answer='map'
    answers=<<-STRING
map
reject
select
keep_if
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'146'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'map' method used for?
    STRING
    answer='to conditionally create a new array from an existing one'
    answers=<<-STRING
to conditionally create a new array from an existing one
to conditionally modify an existing array
to traverse an array
to delete an array
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'147'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'map!' method used for?
    STRING
    answer='to conditionally modify an existing array'
    answers=<<-STRING
to conditionally create a new array from an existing one
to conditionally modify an existing array
to traverse an array
to delete an array
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'148'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
create a new array using the 'map' method by taking the numbers in
the array and multiplying them by 2. use an in-line form.

                                            0 0 0 0 0 0
                                            0 1 2 3 4 5
given...........................array_name=[1,2,3,4,5,6]
created array...................new_array
variable........................num
#=>.............................[2,4,6,8,10,12]
    STRING
    answer=<<-STRING
new_array=array_name.map{|num| num*2}
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end

  rolling_count+=1
'149'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
modify the array using 'map!' by taking the numbers in the array and
multiplying them by 2. use in-line form.

                                             0 0 0 0 0 0
                                             0 1 2 3 4 5
given............................array_name=[1,2,3,4,5,6]
variable.........................num
    STRING
    answer=<<-STRING
array_name.map!{|num| num*2}
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'150'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the difference between the 'map and 'map!' methods?
    STRING
    answer='map! modifies the original array'
    answers=<<-STRING
map! modifies the original array
map modifies the original array
map! creates a new array
map creates a duplicate of the array
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'151'
  if random_question==rolling_count
  #..............................................................................
    question_string=<<-STRING
  create a new array using the 'map' method by taking the numbers in the array
  and multiplying them by 2. use a block form.
  
  given........................array_name=[1,2,3,4,5,6]
  created array................new_array
  variable.....................numbers
    STRING
    answer=<<-STRING
  new_array=array_name.map do |num|
    num*2
  end
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end 

#=====================================================================================================================
# max method =========================================================================================================
#=====================================================================================================================

  rolling_count+=1
'152'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
how do we find the largest number in an array?
    STRING
    answer="by using the 'max' method"
    answers=<<-STRING
by using the 'min' method
by using the 'max' method
by using the 'length' method
by using the 'size' method
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'153'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to find the largest number in an array

                                   0 0 0 0 0 0 0 0 0
                                   0 1 2 3 4 5 6 7 8
given.......................array=[1,2,3,4,5,6,7,8,9]
use variable................largest_item
#=>.........................9
    STRING
    answer=<<-STRING
largest_item=array.max
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'154'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in an array of letters, how do we find the last, or biggest, letter?
    STRING
    answer="by using the 'max' method"
    answers=<<-STRING
by using the 'min' method
by using the 'max' method
by using the 'length' method
by using the 'size' method
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'155'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to find the last or biggest letter

                                    0   0   0   0   0   0   0   0
                                    0   1   2   3   4   5   6   7
given.......................array=['a','b','c','d','e','f','g','h']
use variable................largest_letter
#=>.........................'h'
    STRING
    answer=<<-STRING
largest_letter=array.max
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'156'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in an array of words, how do we find the last word in alphabetical order?
    STRING
    answer="by using the 'max' method"
    answers=<<-STRING
by using the 'min' method
by using the 'max' method
by using the 'length' method
by using the 'size' method
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'157'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to find the word, that will come last in alphabetical order

                                     0     0     0     0     0
                                     0     1     2     3     4
given.......................array=['ant','cat','dog','imp','elf']
use variable................last_word
#=>.........................'imp'
    STRING
    answer=<<-STRING
last_word=array.max
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'158'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in an array of words, how do we find the longest word (most amount of
characters)?
    STRING
    answer="by using the 'max' method"
    answers=<<-STRING
by using the 'min' method
by using the 'max' method
by using the 'length' method
by using the 'size' method
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'159'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to search through an array of words for the word with the most
amount of characters. use in-line form with a block. capture the first
word with the most amount of characters.

                                      0     0     0     0     0
                                      0     1     2     3     4
given.........................array['imp','elf','cat','dog','ant']
use variables.................longest_word, memo, word
#=>...........................'imp'
    STRING
    answer=<<-STRING
longest_word=array.max{|memo,word| memo.length <=> word.length}
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end

  rolling_count+=1
'160'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when searching through an array of words to find the word with the most
amount of characters while utilizing the 'max' method, which word will be
chosen when there is a tie?
    STRING
    answer='first word found that fits the criteria'
    answers=<<-STRING
first word found that fits the criteria
the last word found that fits the criteria
the second word found that fits the criteria
the word first in alphabetical order
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'161'
  if random_question==rolling_count
  #..............................................................................
    question_string=<<-STRING
  write code to search through an array of words for the word with the most
  amount of characters. use a block form with a block. capture the first word
  that fit the criteria.
  
  given..........................array['imp','elf','cat','dog','ant']
  use variables..................longest_word, memo, word
  #=>............................'imp'
    STRING
    answer=<<-STRING
  longest_word=array.max do |memo,word|
    memo.length <=> word.length
  end
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end 
  
#=====================================================================================================================
# min method =========================================================================================================
#=====================================================================================================================

  rolling_count+=1
'162'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
how do we find the smallest number in an array?
    STRING
    answer="by using the 'min' method"
    answers=<<-STRING
by using the 'min' method
by using the 'max' method
by using the 'length' method
by using the 'size' method
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'163'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to find the smallest number in an array

                                   0 0 0 0 0 0 0 0 0
                                   0 1 2 3 4 5 6 7 8
given.......................array=[1,2,3,4,5,6,7,8,9]
use variable................smallest_item
#=>.........................1
    STRING
    answer=<<-STRING
smallest_item=array.min
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'164'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in an array of letters, how do we find the first, or smallest, letter?
    STRING
    answer="by using the 'min' method"
    answers=<<-STRING
by using the 'min' method
by using the 'max' method
by using the 'length' method
by using the 'size' method
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'165'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to find the first or smallest letter

                                    0   0   0   0   0   0   0   0
                                    0   1   2   3   4   5   6   7
given.......................array=['a','b','c','d','e','f','g','h']
use variable................smallest_letter
#=>.........................'a'
    STRING
    answer=<<-STRING
smallest_letter=array.min
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'166'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in an array of words, how do we find the first word in alphabetical order?
    STRING
    answer="by using the 'min' method"
    answers=<<-STRING
by using the 'min' method
by using the 'max' method
by using the 'length' method
by using the 'size' method
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'167'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to find the word, that will come first in alphabetical order

                                     0     0     0     0     0
                                     0     1     2     3     4
given.......................array=['ant','cat','dog','imp','elf']
use variable................first_word
#=>.........................'ant'
    STRING
    answer=<<-STRING
first_word=array.min
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'168'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in an array of words, how do we find the shortest word (least amount of
characters)?
    STRING
    answer="by using the 'min' method"
    answers=<<-STRING
by using the 'min' method
by using the 'max' method
by using the 'length' method
by using the 'size' method
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'169'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to search through an array of words for the word with the least
amount of characters. use an in-line form. capture the first word that fits
the criteria.

                                     0     0     0     0     0
                                     0     1     2     3     4
given.......................array=['dog','elf','cat','ant','imp']
variables...................shortest_word, memo, word
#=>.........................'dog'
    STRING
    answer=<<-STRING
shortest_word=array.min{|memo,word| memo.length <=> word.length}
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end

  rolling_count+=1
'170'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when searching through an array of words to find the word with the least
amount of characters while utilizing the 'min' method, which word will be
chosen when there is a tie?
    STRING
    answer='first word found that fits the criteria'
    answers=<<-STRING
first word found that fits the criteria
the last word found that fits the criteria
the second word found that fits the criteria
the word first in alphabetical order
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'171'
  if random_question==rolling_count
  #..............................................................................
    question_string=<<-STRING
  write code to search through an array of words for the word with the least
  amount of characters. use block form. get the first word in the array
  that fit the criteria.
  
  given.......................array=['dog','elf','cat','ant','imp']
  use variable................shortest_word, a, b
  dont forget to use a block!
  #=>.........................'dog'
    STRING
    answer=<<-STRING
  shortest_word=array.min do |a,b|
    a.length <=> b.length
  end
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end 
  
  rolling_count+=1
'172'
  if random_question==rolling_count
  #..............................................................................
    question_string=<<-STRING
  write code to search through an array of words for the word that has the
  least amount of characters. use a block form. capture the first word that
  fits the criteria.
  
  given......................array=['dog','elf','cat','ant','imp']
  variables..................shortest_word, memo, word
  #=>........................'dog'
    STRING
    answer=<<-STRING
  shortest_word=array.min do |memo,word|
    memo.length <=> word.length
  end
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end 

#=====================================================================================================================
# new method =========================================================================================================
#=====================================================================================================================
  rolling_count+=1
'173'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the 'new' method, write code to create an empty array

array name:......collections
#=>..............[]
    STRING
    answer=<<-STRING
collections=Array.new
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'174'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the 'new' method, write code to create an array which contains the
following

array name:......test array
#=>..............[nil,nil,nil]
    STRING
    answer=<<-STRING
test_array=Array.new(3)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'175'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the 'new' method, create an array that contains the following

array name:.........truthy
#=>.................[true,true,true]
    STRING
    answer=<<-STRING
truthy=Array.new(3,true)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'176'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the 'new' method with a block, create an array with the following

array name:...........hash collection
#=>...................[{},{}]
    STRING
    answer=<<-STRING
hash_collection=Array.new(2){Hash.new}
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'177'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the 'new' method with a block create an array with the following

array name:............array collection
#=>....................[[],[],[]]
    STRING
    answer=<<-STRING
array_collection=Array.new(3){Array.new}
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'178'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the 'new' method with a block, create an array with the following

array name:.............three count
utilize variable:.......index
#=>.....................[0,3,6]
    STRING
    answer=<<-STRING
three_count=Array.new(3){|index| index*3}
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'179'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the 'new' method with a block, create an array with the following

array name:.............nil collection
#=>.....................[[nil,nil],[nil,nil]]
    STRING
    answer=<<-STRING
nil_collection=Array.new(2){Array.new(2)}
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'180'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the 'new' method, what ways can we use this to create an array?
    STRING
    answer='no param,(2),(2,true),(2){true},(2){block}'
    answers=<<-STRING
no param,(2),(2,true),(2){true},(2){block}
(2),(2,true),(2){block}
no param,(2),(2,true)
(2){block},no param,(2)
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'181'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to create and print the following array use 'puts' to print
the array and use the 'new' method to create the array

array.....................array name
print.....................[true,true,true]
    STRING
    answer=<<-STRING
array_name=Array.new(3){true}
puts array_name.inspect
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


#=====================================================================================================================
# none? method =======================================================================================================
#=====================================================================================================================

  rolling_count+=1
'182'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'none?' method used for?
    STRING
    answer='checks if none of the items in an array fit a criteria'
    answers=<<-STRING
checks if none of the items in an array fit a criteria
checks if any of the items in an array fit a criteria
checks if some of the items in an array fit a criteria
checks if one of the items in an array fit a criteria
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end

  rolling_count+=1
'183'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to check if none of the items in an array are nil

                                        0 0 0 0 0 0 0 0 0
                                        0 1 2 3 4 5 6 7 8
given:...........................array=[1,2,3,4,5,6,7,8,9]
variable:........................nil_items
variable:........................item
    STRING
    answer=<<-STRING
nil_items=array.none?{|item| item.nil?}
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'184'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'none?' method, when does it return true?

reminder: any item not literally nil or false is true!
    STRING
    answer='if none of the items are true'
    answers=<<-STRING
if none of the items are true
if some items are true
if only one of the items is true
if a few of the items are true
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

#=====================================================================================================================
# one? method ========================================================================================================
#=====================================================================================================================
  rolling_count+=1
'185'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'one?' method used for?
    STRING
    answer='checks if one of the items in an array fit a criteria'
    answers=<<-STRING
checks if all the items in an array fit a criteria
checks if any of the items in an array fit a criteria
checks if some of the items in an array fit a criteria
checks if one of the items in an array fit a criteria
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'186'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to check if one of the items in an array is a 3
 
                                        0 0 0 0 0 0 0 0 0
                                        0 1 2 3 4 5 6 7 8
given:...........................array=[1,2,3,4,5,6,7,8,9]
variable:........................item_3
variable:........................item
    STRING
    answer=<<-STRING
item_3=array.one?{|item| item==3}
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'187'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'one?' method, when does it return true?

reminder: any item not literally nil or false is true!
    STRING
    answer='if only one of the items is true'
    answers=<<-STRING
if only one of the items is true
if some items are true
if only one of the items is false
if a few of the items are true
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


#=====================================================================================================================
# pop method =========================================================================================================
#=====================================================================================================================

  rolling_count+=1
'188'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'pop' method used for?
    STRING
    answer='to remove item(s) from the end of an array'
    answers=<<-STRING
to remove item(s) from the end of an array
to remove an item from the end of an array
to add an item from the beginning of an array
to remove items from the beginning of an array
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'189'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what should we remember about the 'pop' method?
    STRING
    answer='it modifies the original array'
    answers=<<-STRING
it modifies the original array
it creates a new array
it returns a nil
it requires a block
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'190'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what does the 'pop' method return?
    STRING
    answer='the item(s) being removed'
    answers=<<-STRING
the item(s) being removed
the original array
a copy of the modified array
a nil
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'191'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to remove two items from the end of an array and assign them
to two separate variables. use multi-variable assignment:

                                      0 0 0 0 0 0 0 0 0
                                      0 1 2 3 4 5 6 7 8
array..........................array=[1,2,3,4,5,6,7,8,9]
variables......................x,y
    STRING
    answer=<<-STRING
x,y=array.pop(2)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'192'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to remove two items from the end of an array and assign them to a
variable

                                      0 0 0 0 0 0 0 0 0
                                      0 1 2 3 4 5 6 7 8
array..........................array=[1,2,3,4,5,6,7,8,9]
variable.......................x
    STRING
    answer=<<-STRING
x=array.pop(2)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'193'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in the following program what does x and y equal to?

       0 0 0 0 0 0 0 0 0
       0 1 2 3 4 5 6 7 8
array=[1,2,3,4,5,6,7,8,9]
x,y=array.pop(2)
    STRING
    answer='x=8, y=9'
    answers=<<-STRING
x=8, y=9
x=9, y=8
x=nil, y=9
x=9, y=nil
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'194'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in the following program what does x equal to?

       0 0 0 0 0 0 0 0 0
       0 1 2 3 4 5 6 7 8
array=[1,2,3,4,5,6,7,8,9]
x=array.pop(2)
    STRING
    answer='x=[8,9]'
    answers=<<-STRING
x=[8,9]
x=[9,8]
x=[nil,9]
x=[9,nil]
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

#=====================================================================================================================
# push method ========================================================================================================
#=====================================================================================================================

  rolling_count+=1
'195'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what method can we use to add item(s) to the end of an array?
    STRING
    answer='push'
    answers=<<-STRING
push
insert
<<
put
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'196'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'push' method, what does it return?
    STRING
    answer='a copy of the modified array'
    answers=<<-STRING
a copy of the modified array
just the item being inserted
a copy of the original array
a separate new array
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'197'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'push' method, what should we be aware of?
    STRING
    answer='push modifies the original array'
    answers=<<-STRING
push modifies the original array
push creates a new array
push uses blocks
push inserts at the beginning of the array
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'198'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code using the 'push' method to put 2 items at the end of the array

                                   0 0 0 0 0 0 0 0 0
                                   0 1 2 3 4 5 6 7 8
given.......................array=[1,2,3,4,5,6,7,8,9]
add item....................10,11
    STRING
    answer=<<-STRING
array.push(10,11)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

#=====================================================================================================================
# reduce method ======================================================================================================
#=====================================================================================================================

  rolling_count+=1
'199'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what does the reduce method give the enumerable module?
    STRING
    answer='a way to total all the elements in a collection using + or *'
    answers=<<-STRING
a way to total all the elements in a collection using + or *
a way to include other elements into a collection
a way to insert items into a collection
a way to take out items in a collection
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'200'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to sum all numbers in an array in in-line form but do not use the
'inject' method.

range............................array=[5,6,7,8,9,10]
accumulator......................sum
current number...................num
variable.........................added_nums
#=>..............................45

    STRING
    answer=<<-STRING
added_nums=array.reduce{|sum,num| sum+num}
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'201'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to sum all numbers in an array in block form but do not use the
'inject' method.

range............................array=[5,6,7,8,9,10]
accumulator......................sum
current number...................num
variable.........................added_nums
#=>..............................45

    STRING
    answer=<<-STRING
added_nums=array.reduce do |sum,num|
  sum+num
end
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'202'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to sum all numbers in an array in short form but do not use the
'inject' method.

range............................array=[5,6,7,8,9,10]
variable.........................added_nums
#=>..............................45

    STRING
    answer=<<-STRING
added_nums=array.reduce(:+)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'203'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to multiply all numbers in an array in in-line form but do not use
the 'inject' method.

range............................array=[5,6,7,8,9,10]
accumulator......................product
current number...................num
variable.........................multiplied_nums
#=>..............................151200

    STRING
    answer=<<-STRING
multiplied_nums=array.reduce{|product,num| product*num}
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'204'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to multiply all numbers in an array in block form but do not use
the 'inject' method.

range............................array=[5,6,7,8,9,10]
accumulator......................product
current number...................num
variable.........................multiplied_nums
#=>..............................151200

    STRING
    answer=<<-STRING
multiplied_nums=array.reduce do |product,num|
  product*num
end
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'205'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to multiply all numbers in an array in short form but do not use
the 'inject' method.

range............................array=[5,6,7,8,9,10]
variable.........................multiplied_nums
#=>..............................151200

    STRING
    answer=<<-STRING
multiplied_nums=array.reduce(:*)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'206'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code using the 'reduce' method to find the longest word in block form
while also utilizing the ternary method. get the last word in the array
that fit the criteria.

given................array=['cat','bear','goat']
variables............longest_word, memo, word
#=>..................goat
    STRING
    answer=<<-STRING
longest_word=array.reduce do |memo,word|
  memo.length>word.length ? memo : word
end
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end

  rolling_count+=1
'207'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
The following program finds the longest word in the array. If two words are
the same size which one will be returned?

array=['cat','bear','goat']
longest_word=array.reduce do |memo,word|
  memo.length>word.length ? memo : word
end
    STRING
    answer='the last word on the list that fit the criteria'
    answers=<<-STRING
the last word on the list that fit the criteria
the first word on the list that fit the criteria
it will choose alphabetically the closest to a
it will choose alphabetically the closest to z
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'208'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code using the 'reduce' method to find the word with the most vowels
in block form, while utilizing the ternary method. get the last word in the
array that fit the criteria.

given............................array=['allow','superb','bellow']
variable.........................most_vowels, memo, word
#=>..............................bellow
    STRING
    answer=<<-STRING
most_vowels=array.reduce do |memo,word|
  memo.count('aeiou')>word.count('aeiou') ? memo : word
end
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end

rolling_count+=1
'209'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
write code using the 'reduce' method to find the longest word in in-line form
while also utilizing the ternary method. get the last word that fits the criteria.

given............................array=['cat','sheep','bear']
variable.........................longest_word, memo, word
#=>..............................'sheep'
  STRING
  answer=<<-STRING
longest_word=array.reduce{|memo,word| memo.length>word.length ? memo : word}
  STRING
  result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end

rolling_count+=1
'210'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
write code using the 'reduce' method to find the word with the most vowels
in in-line form while utilizing the ternary method. get the last word in the
array that fit the criteria.

given............................array=['allow','superb','bellow']
variable.........................most_vowels, memo, word
#=>..............................'bellow'
  STRING
  answer=<<-STRING
most_vowels=array.reduce{|memo,word| memo.count('aeiou')>word.count('aeiou') ? memo : word}
  STRING
  result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end

#=====================================================================================================================
# reject and reject! methods =========================================================================================
#=====================================================================================================================

  rolling_count+=1
'211'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the reject method used for in arrays?
    STRING
    answer='to create a new array, keeping non rejected items'
    answers=<<-STRING
to create a new array, keeping non rejected items
to modify an existing array, keeping non rejected items
by keeping the rejected items
by keeping the non rejected items
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'212'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to reject even numbers from an array while creating a new array.
use an in-line form. use the 'even?' method.

                            0 0 0 0 0 0 0 0 0 0
                            0 1 2 3 4 5 6 7 8 9
given................array=[1,2,3,4,5,6,7,8,9,10]
variables............answer, n
#=>..................[1,3,5,7,9]
    STRING
    answer=<<-STRING
answer=array.reject{|n| n.even?}
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end

  rolling_count+=1
'213'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the reject! method used for in arrays?
    STRING
    answer='to modify an existing array, keeping non rejected items'
    answers=<<-STRING
to modify an existing array, keeping non rejected items
to create a new array, keeping non rejected items
by keeping the rejected items
by keeping the non rejected items
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'214'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code that will exclude odd numbers while modifying an existing
array. use in-line form. use the 'odd?' method.

                                        0 0 0 0 0 0 0 0 0 0
                                        0 1 2 3 4 5 6 7 8 9
given............................array=[1,2,3,4,5,6,7,8,9,10]
variable.........................n
#=>..............................[2,4,6,8,10]
    STRING
    answer=<<-STRING
array.reject!{|n| n.odd?}
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end

  rolling_count+=1
'215'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to reject vowels from an array of letters while creating a new
array. use regexp and character class. use in-line form.

given.................alpha1=%w(a b c e d f g h i j k l)
variable..............answer, a
#=>...................["b", "c", "d", "f", "g", "h", "j", "k", "l"]
    STRING
    answer=<<-STRING
answer=alpha1.reject{|a| a=~/[aeiou]/}
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'216'
  if random_question==rolling_count
  #..............................................................................
    question_string=<<-STRING
  write code to exclude odd numbers while modifying an existing array.
  use block form. use 'odd?' method.
  
  given..........................array=[1,2,3,4,5,6,7,8,9,10]
  variable.......................n
  #=>............................[2,4,6,8,10]
    STRING
    answer=<<-STRING
  array.reject! do |n|
    n.odd?
  end
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end 

  rolling_count+=1
'217'
  if random_question==rolling_count
  #..............................................................................
    question_string=<<-STRING
  write code to reject even numbers from an array while creating a new array.
  use the even? method. use a block form.
  
  given...............array=[1,2,3,4,5,6,7,8,9,10]
  variables...........answer, n
  #=>.................[1,3,5,7,9]
    STRING
    answer=<<-STRING
  answer=array.reject do |n|
    n.even?
  end
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'218'
  if random_question==rolling_count
  #..............................................................................
    question_string=<<-STRING
  write code to reject vowels from an array of letters while creating a new
  array. use regexp and character class. use block form.
  
  given.................alpha1=%w(a b c e d f g h i j k l)
  variable..............answer, a
  #=>...................["b", "c", "d", "f", "g", "h", "j", "k", "l"]
    STRING
    answer=<<-STRING
  answer=alpha1.reject do |a|
    a=~/[aeiou]/
  end
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end  
  
#=====================================================================================================================
# replace method =====================================================================================================
#=====================================================================================================================

  rolling_count+=1
'219'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'replace' method used for?
    STRING
    answer='to replace an entire array'
    answers=<<-STRING
to replace an entire array
to conditionally replace items in an array
to replace items in an array
to replace one item in an array
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'220'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what should we remember about the 'replace' method?
    STRING
    answer='it modifies the original array'
    answers=<<-STRING
it modifies the original array
it creates a new array
it returns a nil
it requires a block
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'221'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what does the 'replace' method return?
    STRING
    answer='a copy of the modified array'
    answers=<<-STRING
a copy of the modified array
the original array
the items being replaced
a nil
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'222'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to replace an entire array
 
                                        0 0 0 0 0
                                        0 1 2 3 4
given:...........................array=[1,2,3,4,5]
replace with:....................[2,4,6,8]
    STRING
    answer=<<-STRING
array.replace([2,4,6,8])
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

#=====================================================================================================================
# reverse and reverse! methods =======================================================================================
#=====================================================================================================================
  rolling_count+=1
'223'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'reverse' method used for in arrays?
    STRING
    answer='to create a new array with the elements listed backwards'
    answers=<<-STRING
to create a new array with the elements listed backwards
to create a new array with elements in opposite case
modify an existing array putting the elements backwards
modify an existing array putting elements in opposite case
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'224'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what does the 'reverse' method return?

    STRING
    answer='a new array'
    answers=<<-STRING
the original array
a new array
a copy of the indices
a copy of the modified array
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'225'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'reverse!' method used for in arrays?
    STRING
    answer='modify an existing array putting the elements backwards'
    answers=<<-STRING
to create a new array with the elements listed backwards
to create a new array with elements in opposite case
modify an existing array putting the elements backwards
modify an existing array putting elements in opposite case
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'226'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what does the 'reverse!' method return?
    STRING
    answer='a copy of the modified array'
    answers=<<-STRING
a copy of the modified array
the original array
a copy of the indices
part of the array
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'227'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the difference between 'reverse' and 'reverse!'?
    STRING
    answer='reverse! modifies the original array'
    answers=<<-STRING
reverse! modifies the original array
reverse! creates a new array
reverse modifies the original array
reverse returns the original array
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'228'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to create a new array with the elements backwards.

                                        0 0 0 0 0 0 0 0 0
                                        0 1 2 3 4 5 6 7 8
given:...........................array=[1,2,3,4,5,6,7,8,9]
new array........................new_array
    STRING
    answer=<<-STRING
new_array=array.reverse
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'229'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to modify an existing array putting the elements backwards.

                                        0 0 0 0 0 0 0 0 0
                                        0 1 2 3 4 5 6 7 8
given:...........................array=[1,2,3,4,5,6,7,8,9]
    STRING
    answer=<<-STRING
array.reverse!
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end
#=====================================================================================================================
# rindex method ======================================================================================================
#=====================================================================================================================

  rolling_count+=1
'230'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'rindex' method used for?
    STRING
    answer='finding the index of an item but starting from the rear'
    answers=<<-STRING
finding the index of an item but starting from the rear
finding the index of an item that is right
finding the index of the remainder
finding the index of an item from the left
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'231'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code using the 'rindex' method

given:.....................numbers=[1,3,5]
variable...................num
find index for:............3
    STRING
    answer=<<-STRING
num=numbers.rindex(3)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'232'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using 'rindex' what do we need to watch out for?
    STRING
    answer='duplicate items'
    answers=<<-STRING
duplicate items
eof
nil
newline
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

#=====================================================================================================================
# rotate and rotate! methods =========================================================================================
#=====================================================================================================================
  rolling_count+=1
'233'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'rotate' method used for in arrays?
    STRING
    answer='to create a new array with elements rotated'
    answers=<<-STRING
to create a new array with elements rotated
to create a new array with elements in order
to create a new array with elements randomized
to create a new array with elements backwards
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'234'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what will the following code return?

        0 0 0 0 0 0 0 0 0
        0 1 2 3 4 5 6 7 8
array1=[1,2,3,4,5,6,7,8,9]
variable=array1.rotate
puts variable.inspect
    STRING
    answer='[2,3,4,5,6,7,8,9,1]'
    answers=<<-STRING
[2,3,4,5,6,7,8,9,1]
[9,8,7,6,5,4,3,2,1]
[2,4,6,8,1,3,5,7,9]
[4,5,6,7,8,9,1,2,3]
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'235'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what will the following code return?

        0 0 0 0 0 0 0 0 0
        0 1 2 3 4 5 6 7 8
array1=[1,2,3,4,5,6,7,8,9]
variable=array1.rotate(1)
puts variable.inspect
    STRING
    answer='same as variable=array1.rotate'
    answers=<<-STRING
same as variable=array1.rotate
[9,8,7,6,5,4,3,2,1]
[2,4,6,8,1,3,5,7,9]
[4,5,6,7,8,9,1,2,3]
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end



  rolling_count+=1
'236'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what will the following code return?

        0 0 0 0 0 0 0 0 0
        0 1 2 3 4 5 6 7 8
array1=[1,2,3,4,5,6,7,8,9]
variable=array1.rotate(0)
puts variable.inspect
    STRING
    answer='[1,2,3,4,5,6,7,8,9]'
    answers=<<-STRING
[1,2,3,4,5,6,7,8,9]
[9,8,7,6,5,4,3,2,1]
[2,4,6,8,1,3,5,7,9]
[4,5,6,7,8,9,1,2,3]
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'237'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what will the following code return?

        0 0 0 0 0 0 0 0 0
        0 1 2 3 4 5 6 7 8
array1=[1,2,3,4,5,6,7,8,9]
variable=array1.rotate(3)
puts variable.inspect
    STRING
    answer='[4,5,6,7,8,9,1,2,3]'
    answers=<<-STRING
[4,5,6,7,8,9,1,2,3]
[9,8,7,6,5,4,3,2,1]
[2,4,6,8,1,3,5,7,9]
[4,5,6,1,2,3,7,8,9]
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'238'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
so basically, what we are doing when we use the 'rotate' method with a
parameter is

example.....................variable=array1.rotate(3)

    STRING
    answer='take the first 3 elements and append them to the array'
    answers=<<-STRING
take the first 3 elements and append them to the array
take 3 items and shuffle them into the array
take the item at index 3 and rotate it
take the last 3 elements and put them in the front
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'239'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'rotate' method, what goes in the parameter?

example.....................variable=array1.rotate(3)

    STRING
    answer='the count of elements to rotate'
    answers=<<-STRING
the count of elements to rotate
the element at what index to move from the front of the array
the value that needs to be rotated
the number of times to rotate the array
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'240'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'rotate' method, how do we move numbers from the back of
the array to the front?
    STRING
    answer='by counting backwards with a negative number'
    answers=<<-STRING
by counting backwards with a negative number
by reversing the order of the array first
by counting to the last numbers
by shuffling the numbers
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'241'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'rotate!' method used for in arrays?
    STRING
    answer='to modify an existing array rotating the elements'
    answers=<<-STRING
to modify an existing array rotating the elements
to modify an existing array ordering the elements
to modify an existing array randomizing the elements
to modify an existing array flipping the elements
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'242'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the difference between the 'rotate' and 'rotate!' methods?
    STRING
    answer='rotate! modifies the original array'
    answers=<<-STRING
rotate! modifies the original array
rotate! creates a new array
rotate modifies the original array
rotate does things backwards
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


#=====================================================================================================================
# sample method ======================================================================================================
#=====================================================================================================================
  rolling_count+=1
'243'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
how do we get random elements out of an array?
    STRING
    answer='sample method'
    answers=<<-STRING
sample method
random method
slice method
capture method
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'244'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
capture a random number from the array

given array:.........................array
variable:............................number
    STRING
    answer=<<-STRING
number=array.sample
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'245'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
capture a unique group of 12 items from the array into a new array

given array:...................array
variable:......................number
    STRING
    answer=<<-STRING
number=array.sample(12)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'246'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what does the 'sample' method return?
    STRING
    answer='a random item or an array of random items'
    answers=<<-STRING
a random item or an array of random items
a single item
a single item or a group of items
nil
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'247'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to rotate the first 4 numbers to the back of the array while
creating a new array

                                  0 0 0 0 0 0 0 0 0
                                  0 1 2 3 4 5 6 7 8
given:.....................array=[1,2,3,4,5,6,7,8,9]
new array..................new_array
numbers to rotate..........4
#=>........................[5,6,7,8,9,1,2,3,4]
    STRING
    answer=<<-STRING
new_array=array.rotate(4)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end



  rolling_count+=1
'248'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to rotate the last 2 numbers to the front of the array while
modifying the original array

                                  0 0 0 0 0 0 0 0 0
                                  0 1 2 3 4 5 6 7 8
given:.....................array=[1,2,3,4,5,6,7,8,9]
numbers to rotate..........2
#=>........................[8,9,1,2,3,4,5,6,7]
    STRING
    answer=<<-STRING
array.rotate!(-2)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

#=====================================================================================================================
# select and select! methods =========================================================================================
#=====================================================================================================================

  rolling_count+=1
'249'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the select method used for in arrays?
    STRING
    answer='create a new array selecting items to keep based on a condition'
    answers=<<-STRING
create a new array selecting items to keep based on a condition
modify an existing array selecting items to keep based on a condition
create a new array selecting items not to keep based on a condition
modify an existing array selecting items not to keep based on a condition
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'250'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the select! method used for in arrays?
    STRING
    answer='modify an existing array selecting items to keep based on a condition'
    answers=<<-STRING
create a new array selecting items to keep based on a condition
modify an existing array selecting items to keep based on a condition
create a new array selecting items not to keep based on a condition
modify an existing array selecting items not to keep based on a condition
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'251'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code selecting items to keep while modifying an existing array.
keep items that are greater than 5. use in-line form.

                                0 0 0 0 0 0 0 0 0 0
                                0 1 2 3 4 5 6 7 8 9
given...................array1=[1,2,3,4,5,6,7,8,9,10]
variable................n
#=>.....................[6, 7, 8, 9, 10]
    STRING
    answer=<<-STRING
array1.select!{|n| n>5}
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'252'
  if random_question==rolling_count
  #..............................................................................
    question_string=<<-STRING
  write code to select letters in an array that are vowels while creating
  a new array. use regexp, match, and character class. use in-line form.
  
  given..................alpha2=%w(a b c d e f g h i j k l)
  variables..............answer, a
  #=>....................["a", "e", "i"]
    STRING
    answer=<<-STRING
  answer=alpha2.select{|a| a.match(/[aeiou]/)}
  answer=alpha2.select{|a| /[aeiou]/.match(a)}
  answer=alpha2.select{|a| (/[aeiou]/).match(a)}
    STRING
    result,drill_status=coding_test3(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'253'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
write code selecting items to keep while modifying an existing array. keep
items that are greater than 5. use a block form.

given.........................array1=[1,2,3,4,5,6,7,8,9,10]
variable......................new
#=>...........................[6,7,8,9,10]
  STRING
  answer=<<-STRING
array1.select! do |n|
  n>5
end
  STRING
  result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end

rolling_count+=1
'254'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
write code to select letters in an array that are vowels while creating
a new array. use regexp, match, and character class. use block form.

given..................alpha2=%w(a b c d e f g h i j k l)
variables..............answer, a
#=>....................["a", "e", "i"]
  STRING
  answer=<<-STRING
answer=alpha2.select do |a|
  a.match(/[aeiou]/)
end
  STRING
  result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end

#=====================================================================================================================
# shift method =======================================================================================================
#=====================================================================================================================

  rolling_count+=1
'255'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'shift' method used for?
    STRING
    answer='to remove an item(s) from the beginning of an array'
    answers=<<-STRING
to remove an item from the end of an array
to remove items from the end of an array
to remove an item(s) from the beginning of an array
to remove an item from the beginning of an array
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'256'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what should we remember about the 'shift' method?
    STRING
    answer='it modifies the original array'
    answers=<<-STRING
it modifies the original array
it creates a new array
it returns a nil
it requires a block
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'257'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what does the 'shift' method return?
    STRING
    answer='the item(s) being removed'
    answers=<<-STRING
the item(s) being removed
the original array
a copy of the modified array
a nil
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'258'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to remove two items from the beginning of an array, putting
them in a variable

                                        0 0 0 0 0 0 0 0 0
                                        0 1 2 3 4 5 6 7 8
given:...........................array=[1,2,3,4,5,6,7,8,9]
variable:........................x
    STRING
    answer=<<-STRING
x=array.shift(2)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'259'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to remove two items from the beginning of an array, putting them
in two separate variables. use multi-variable assignment

                                        0 0 0 0 0 0 0 0 0
                                        0 1 2 3 4 5 6 7 8
given:...........................array=[1,2,3,4,5,6,7,8,9]
variables:........................x and y
    STRING
    answer=<<-STRING
x,y=array.shift(2)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'260'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in the following program, what does x and y equal to?

       0 0 0 0 0 0 0 0 0
       0 1 2 3 4 5 6 7 8
array=[1,2,3,4,5,6,7,8,9]
x,y=array.shift(2)
    STRING
    answer='x=1, y=2'
    answers=<<-STRING
x=1, y=2
x=2, y=1
x=[1,2], y=[3,4]
x=0, y=1
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'261'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in the following program, what does x equal to?

       0 0 0 0 0 0 0 0 0
       0 1 2 3 4 5 6 7 8
array=[1,2,3,4,5,6,7,8,9]
x=array.shift(2)
    STRING
    answer='x=[1,2]'
    answers=<<-STRING
x=[1,2]
x=3
x=2
x=1
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end
#=====================================================================================================================
# sort and sort! methods =============================================================================================
#=====================================================================================================================
  rolling_count+=1
'262'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'sort' method used for in arrays?
    STRING
    answer='to create a new array with ordered elements'
    answers=<<-STRING
to create a new array with ordered elements
to create a new array with elements moved around
to create a new array with elements backwards
to create a new array with elements rotated
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'263'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the difference between the 'sort' and 'sort!' methods?
    STRING
    answer='sort! modifies the original array'
    answers=<<-STRING
sort! modifies the original array
sort! creates a new array
sort! modifies a copy of the array
sort! modifies a new array
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'264'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to sort the following array while creating a new array.

given:...........................array1=%w(a7 a1 a9 a4 a2)
new array........................new_array
    STRING
    answer=<<-STRING
new_array=array1.sort
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'265'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to sort the following array while modifying the original array.

given:...........................array1=%w(a7 a1 a9 a4 a2)
    STRING
    answer=<<-STRING
array1.sort!
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end
#=====================================================================================================================
# shuffle and shuffle! methods =======================================================================================
#=====================================================================================================================
  rolling_count+=1
'266'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'shuffle' method used for?
    STRING
    answer='to create a new array with elements randomized'
    answers=<<-STRING
to create a new array with elements randomized
to create a new array with indices randomized
to modify an existing array randomizing the elements
to modify an existing array randomizing the indices
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'267'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'shuffle!' method used for?
    STRING
    answer='to modify an existing array randomizing the elements'
    answers=<<-STRING
to create a new array with elements randomized
to create a new array with indices randomized
to modify an existing array randomizing the elements
to modify an existing array randomizing the indices
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'268'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
create a new array with randomized elements
                                        
                                        0 0 0 0 0 0 0 0 0
                                        0 1 2 3 4 5 6 7 8
given:...........................array=[1,2,3,4,5,6,7,8,9]
variables:.......................new_array
    STRING
    answer=<<-STRING
new_array=array.shuffle
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'269'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
modify an existing array while randomizing its elements
                                   
                                        0 0 0 0 0 0 0 0 0
                                        0 1 2 3 4 5 6 7 8
given:...........................array=[1,2,3,4,5,6,7,8,9]
    STRING
    answer=<<-STRING
array.shuffle!
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

#=====================================================================================================================
# slice and slice! method ============================================================================================
#=====================================================================================================================
  rolling_count+=1
'270'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'slice' method, what does the following code return?

              0 0 0 0 0 0
              0 1 2 3 4 5
given: array=[1,2,3,4,5,6]
code: numbers=array.slice(3,3)
    STRING
    answer='[4,5,6]'
    answers=<<-STRING
[4,5,6]
[4,4]
[1,2,3]
[1,2,3,4,5,6]
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'271'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the 'slice' method, think about the different ways we can access the
following data...

now use the index, length  method!

                                  0 0 0 0 0 0
                                  0 1 2 3 4 5
given:.....................array=[1,2,3,4,5,6]
variable:..................numbers
#=>........................[4,5,6]
    STRING
    answer=<<-STRING
numbers=array.slice(3,3)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'272'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the 'slice' method, think about the different ways we can access the
following data...

now use the range method.

                                  0 0 0 0 0 0
                                  0 1 2 3 4 5
given:.....................array=[1,2,3,4,5,6]
variable:..................numbers
#=>........................[1,2,3,4]
    STRING
    answer=<<-STRING
numbers=array.slice(0..3)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'273'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the 'slice' method, what are the different ways that we can access an
array?
    STRING
    answer='(1),(-1),(1,6),(1..6),(1..-1)'
    answers=<<-STRING
(1),(-1),(1,6),(1..6),(1..-1)
(1),(-1),(1,6)
(1),(1,6),(1..6)
(1),(-1),(1,6),(1..6)
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'274'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the difference between the 'slice' and 'slice!' methods when used
with arrays?
    STRING
    answer='slice! removes elements from the array'
    answers=<<-STRING
slice! removes elements from the array
slice! returns a copy of the original array
slice modifies the original array
slice removes elements from the array
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'275'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'slice!' method on an array, what does it return?
    STRING
    answer='just the items being removed'
    answers=<<-STRING
just the items being removed
a copy of the modified array
a copy of the original array
a new array
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'276'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using 'slice!' with arrays, what are the different ways we can use this
to remove elements from the array?
    STRING
    answer='(1),(-1),(1,4),(1..6),(2..-1)'
    answers=<<-STRING
(1),(-1),(1,4),(1..6),(2..-1)
(1),(-1),(1,4,7),(1..6),(2..-1)
(1),(1,4),(1..6),(2..-1)
(1),(-1),(1,4),(1..6)
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end



#=====================================================================================================================
# split method =======================================================================================================
#=====================================================================================================================
  rolling_count+=1
'277'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what method can we use to turn a string into an array of strings?
    STRING
    answer='split'
    answers=<<-STRING
split
join
to_a
+=
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'278'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code that will take a string and turn it into an array of strings

given:.....................string="this is a string"
variable:..................array
    STRING
    answer=<<-STRING
array=string.split('')
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end

  rolling_count+=1
'279'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to turn a string into an array separated at the \\n newlines.

given....................string=<<-STRING1
                         Ruby Prize
                         Jypsie Blade
                         Purple Prince
                         Dirty Dame
                         STRING1
use......................my_array
    STRING
    answer=<<-STRING
my_array=string.split("\\n")
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


#=====================================================================================================================
# take method ========================================================================================================
#=====================================================================================================================
  rolling_count+=1
'280'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
given the following program, what value is returned?

                             0 0 0 0 0 0
                             0 1 2 3 4 5
given:................array=[1,2,3,4,5,6]
code:.................number=array.take(3)
    STRING
    answer='[1,2,3]'
    answers=<<-STRING
[1,2,3]
[4,5,6]
4
3
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'281'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the 'take' method, capture the first 5 elements of the array.

                             0 0 0 0 0 0
                             0 1 2 3 4 5
given:................array=[1,2,3,4,5,6]
variable:.............number
    STRING
    answer=<<-STRING
number=array.take(5)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

#=====================================================================================================================
# to_a method ========================================================================================================
#=====================================================================================================================

  rolling_count+=1
'282'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what does the to_a method do to a hash?
    STRING
    answer='it converts a hash to a nested array'
    answers=<<-STRING
it converts a hash to a nested array
it converts a hash to an array
it converts a hash into another object
it converts a hash into string
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'283'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to convert a hash into a nested array

given hash...................hash1={'a'=>'apple', 'b'=>'berry'}
use variable.................array1
#=>..........................[["a", "apple"],["b", "berry"]]
    STRING
    answer=<<-STRING
array1=hash1.to_a
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end

#=====================================================================================================================
# two dimensional array ==============================================================================================
#=====================================================================================================================
  rolling_count+=1
'284'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
given the following two dimensional array access the following using
rows[][]

rows=[
[0,1,2],
[3,4,5],
[6,7,8]
]

access:...........1
    STRING
    answer=<<-STRING
rows[0][1]
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'285'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
given the following two dimensional array access the following using
rows[][]

rows=[
[0,1,2],
[3,4,5],
[6,7,8]
]

access:...........3
    STRING
    answer=<<-STRING
rows[1][0]
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'286'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
given the following two dimensional array access the following using
rows[][]

rows=[
[0,1,2],
[3,4,5],
[6,7,8]
]

access:...........8
    STRING
    answer=<<-STRING
rows[2][2]
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

#=====================================================================================================================
# uniq and uniq! methods =============================================================================================
#=====================================================================================================================

  rolling_count+=1
'287'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'uniq' method used for?
    STRING
    answer='to remove all duplicates in an array while creating a new array'
    answers=<<-STRING
to remove all duplicates in an array while creating a new array
to remove items from the end of an array
to remove an item from the beginning of an array
to remove items from the beginning of an array
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'288'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what should we remember about the 'uniq' method?
    STRING
    answer='it creates a new array'
    answers=<<-STRING
it modifies the original array
it creates a new array
it returns a nil
it requires a block
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'289'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to remove all duplicates in an array while creating a new array

                                        0  0  0 0  0  0  0
                                        0  1  2 3  4  5  6 
given:...........................array=[1,nil,3,4,nil,6,nil]
new array........................new_array
    STRING
    answer=<<-STRING
new_array=array.uniq
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'290'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what does the 'uniq!' method return?
    STRING
    answer='a copy of the modified array'
    answers=<<-STRING
a copy of the modified array
a copy of the original array
the items that were removed
nil
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'291'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what should we remember about the 'uniq!' method?
    STRING
    answer='it modifies the original array'
    answers=<<-STRING
it modifies the original array
it creates a new array
it returns a nil
it requires a block
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'292'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what does the 'uniq!' method return when no duplicates were removed from
the array?
    STRING
    answer='nil'
    answers=<<-STRING
a copy of the modified array
a copy of the original array
the items that were removed
nil
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'293'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to remove all duplicates in an array while modifying the original
array

                                        0  0  0 0  0  0  0
                                        0  1  2 3  4  5  6
given:...........................array=[1,nil,3,4,nil,6,nil]
    STRING
    answer=<<-STRING
array.uniq!
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


#=====================================================================================================================
# unshift method =====================================================================================================
#=====================================================================================================================

  rolling_count+=1
'294'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
how do we add an item(s) at the beginning of an array?
    STRING
    answer='by using the unshift method'
    answers=<<-STRING
by using the unshift method
by using the insert method
by using the push method
by using the put method
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'295'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'unshift' method, what does it return?
    STRING
    answer='a copy of the modified array'
    answers=<<-STRING
a copy of the modified array
a new array
the original array
just the item being added
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'296'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to add two items at the beginning of an array

                                   0 0 0 0 0 0 0 0 0
                                   0 1 2 3 4 5 6 7 8
given.......................array=[1,2,3,4,5,6,7,8,9]
add item....................10,11
    STRING
    answer=<<-STRING
array.unshift(10,11)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


#=====================================================================================================================
# values_at method ===================================================================================================
#=====================================================================================================================
  rolling_count+=1
'297'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the 'values_at' method used for?
    STRING
    answer='accessing selected items'
    answers=<<-STRING
accessing selected items
adding items
searching for an item
removing items
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'298'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the 'values_at' method, capture only the even numbers in the array

                                           0 0 0 0 0 0
                                           0 1 2 3 4 5
given:..............................array=[1,2,3,4,5,6]
variable:...........................captured
    STRING
    answer=<<-STRING
captured=array.values_at(1,3,5)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'299'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the 'values_at' method, capture the last 3 items in the array

                                           0 0 0 0 0 0
                                           0 1 2 3 4 5
given:..............................array=[1,2,3,4,5,6]
variable:...........................captured
    STRING
    answer=<<-STRING
captured=array.values_at(3..5)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'300'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the 'values_at' method, capture the last item in the array by using
the indices backwards

                                            0 0 0 0 0 0
                                            0 1 2 3 4 5
given:...............................array=[1,2,3,4,5,6]
variable:............................captured
    STRING
    answer=<<-STRING
captured=array.values_at(-1)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'301'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'values_at' method, what will the following code return?

                                           0 0 0 0 0 0
                                           0 1 2 3 4 5
given:..............................array=[1,2,3,4,5,6]
code:...............................numbers=array.values_at(3,3)
    STRING
    answer='[4,4]'
    answers=<<-STRING
[4,4]
[4,5,6]
[1,2,3]
[1,2,3,4,5,6]
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'302'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'values_at' method, can we get just one element in an array?

example: numbers=array.values_at(3)
    STRING
    answer='yes'
    answers=<<-STRING
yes
no
sometimes
depends
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'303'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'values_at' method, what are the ways that we can access an
array?

              0 0 0 0 0 0 0 0 0
              0 1 2 3 4 5 6 7 8 
given:  array[1,2,3,4,5,6,7,8,9]
    STRING
    answer='(1),(-1),(1,2,3),(1..6),(1..-1),(1..5,7..10)'
    answers=<<-STRING
(1),(-1),(1,2,3),(1..6),(1..-1),(1..5,7..10)
(1),(1,2,3),(1,3),(1..6),(1..5,7..10)
(1),(-1),(1,3),(1..5,7..10)
(1),(-1)
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'304'
  if random_question==rolling_count
    #..............................................................................
    question_string=<<-STRING
write code using the 'values_at' method to capture the following by using two
ranges.

                                      0 0 0 0 0 0 0 0 0 0  1  1  1
                                      0 1 2 3 4 5 6 7 8 9  0  1  2
given..........................array=[1,2,3,4,5,6,7,8,9,10,11,12,13]
use variable...................values
use range to capture...........1,2,3,4,5
use range to capture...........7,8,9
#=>............................[1,2,3,4,5,7,8,9]
    STRING
    answer=<<-STRING
values=array.values_at(0..4,6..8)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


#=====================================================================================================================
# [] method ==========================================================================================================
#=====================================================================================================================
  rolling_count+=1
'305'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the literal constructor [], write code to create an empty array

array name:....names
#=>............[]
    STRING
    answer=<<-STRING
names=[]
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'306'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the literal constructor [], write code to create the following array

array name:.....................colors
#=>.............................['red','white','black']
    STRING
    answer=<<-STRING
colors=['red','white','black']
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'307'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the literal constructor [], access data from the following array by
writing code

                           0 0 0 0 0 0
                           0 1 2 3 4 5
given:..............array=[1,2,3,4,5,6]
variable:...........num
#=>.................3
    STRING
    answer=<<-STRING
num=array[2]
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'308'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the literal constructor [], think about the different ways we can
access the data from the following array...

now, access the data by using the indices backwards!

                            0 0 0 0 0 0
                            0 1 2 3 4 5
given:...............array=[1,2,3,4,5,6]
variable.............num
#=>..................5
    STRING
    answer=<<-STRING
num=array[-2]
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'309'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in the following code what does the numbers 1 and 3 represent respectively?

given:.................. variable_name=array[1,3]
    STRING
    answer='index to start at and how many items'
    answers=<<-STRING
index to start at and how many items
the value to start with and the value to end
range from 1 to 3
items and index
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'310'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the literal constructor [], think about the different ways we can
access data from the following array...

now, access the data by using the starting index and length parameters!

                            0 0 0 0 0 0
                            0 1 2 3 4 5
given:...............array=[1,2,3,4,5,6]
variable:............num
#=>..................[2,3,4]
    STRING
    answer=<<-STRING
num=array[1,3]
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'311'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the literal constructor [], think about the different ways we can
access data from the following array..

now, access the data by using the range method!

                             0 0 0 0 0 0
                             0 1 2 3 4 5
given:................array=[1,2,3,4,5,6]
variable:.............numbers
#=>...................[2,3,4,5]
    STRING
    answer=<<-STRING
numbers=array[1..4]
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'312'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the literal constructor [], think about the different ways we can
access data from the following array..

now, access the data by using the range method with a negative index!

                             0 0 0 0 0 0
                             0 1 2 3 4 5
given:................array=[1,2,3,4,5,6]
variable:.............numbers
#=>...................[2,3,4]
    STRING
    answer=<<-STRING
numbers=array[1..-3]
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'313'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the [] method, what are the ways we can use this for accessing
elements in an array?

             0 0 0 0 0 0 0 0 0
             0 1 2 3 4 5 6 7 8
given: array[1,2,3,4,5,6,7,8,9]
    STRING
    answer='[1],[-1],[1,6],[1..6],[1..-1]'
    answers=<<-STRING
[1],[-1],[1,6],[1..6],[1..-1]
[1,6],[1..6],[1]
[1],[1,6],[1..6]
[1],[-1],[1,6],[1..6]
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'314'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what will the following code print?

   0 0 0 0 0 0 0 0 0
   0 1 2 3 4 5 6 7 8
a=[1,2,3,4,5,6,7,8,9]
new_array=a[8..10]
puts(new_array.inspect)
    STRING
    answer='[9]'
    answers=<<-STRING
[9]
[8,9]
error
eof
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'315'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what will the following code print?

   0 0 0 0 0 0 0 0 0
   0 1 2 3 4 5 6 7 8
a=[1,2,3,4,5,6,7,8,9]
new_array=a[9..13]
puts(new_array.inspect)
    STRING
    answer='[]'
    answers=<<-STRING
[]
0
error
eof
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'316'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what will the following code print?

   0 0 0 0 0 0 0 0 0
   0 1 2 3 4 5 6 7 8
a=[1,2,3,4,5,6,7,8,9]
new_array=a[8..1]
puts(new_array.inspect)
    STRING
    answer='[]'
    answers=<<-STRING
[]
[9,8,7,6,5,4,3,2,1]
error
eof
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'317'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what will the following code print?

   0 0 0 0 0 0 0 0 0
   0 1 2 3 4 5 6 7 8
a=[1,2,3,4,5,6,7,8,9]
new_array=a[8,10]
puts(new_array.inspect)
    STRING
    answer='[9]'
    answers=<<-STRING
[9]
[9,8,7,6,5,4,3,2,1]
error
eof
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'318'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what will the following code print?

   0 0 0 0 0 0 0 0 0
   0 1 2 3 4 5 6 7 8
a=[1,2,3,4,5,6,7,8,9]
new_array=a[10]
puts(new_array.inspect)
    STRING
    answer='nil'
    answers=<<-STRING
nil
0
error
eof
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'319'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the result of the following code?

given:...................array_name=Array.new(2,Array.new)
                         array_name[1]=5
    STRING
    answer='[[5],[5]]'
    answers=<<-STRING
[[5],[5]]
[[],[5]]
[[nil],[5]]
[[nil][nil,5]]
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end



  rolling_count+=1
'320'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the result of the following code?

given:...................array_name=Array.new(2){Array.new}
                         array_name[1]=5
    STRING
    answer='[[],[5]]'
    answers=<<-STRING
[[5],[5]]
[[],[5]]
[[nil],[5]]
[[nil][nil,5]]
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


#=====================================================================================================================
# %w and %W methods ==================================================================================================
#=====================================================================================================================
  rolling_count+=1
'321'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the '%w' method, write a line of code that creates an array of strings

array name:................stooges
#=>........................['moe','larry','curly']
    STRING
    answer=<<-STRING
stooges=%w(moe larry curly)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'322'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the '%W' method, write a line of code that creates an array of strings

array name:..................words
#=>..........................['this','is','a','sentence']
    STRING
    answer=<<-STRING
words=%W(this is a sentence)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'323'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the difference between '%w' and '%W' methods?
    STRING
    answer='%W is interpolated'
    answers=<<-STRING
%W is interpolated
%w creates an array of integers
%W is a dangerous method
%w converts all strings to lowercase
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'324'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using '%w 'or '%W', the elements can be delimited using?
    STRING
    answer='any non alphanumeric characters'
    answers=<<-STRING
any non alphanumeric characters
alphabetic characters
numeric characters
% symbols only
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'325'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code that will create an interpolated array of strings

given:..............a='and'
array name:.........array
#=>.................['red','white','and','blue']
    STRING
    answer=<<-STRING
array=%W(red white \#{a} blue)
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'326'
  if random_question==rolling_count
#..............................................................................
    choices=<<-RSTRING
~~
@@
##
$$
%%
^^
&&
**
()
__
++
==
--
<>
??
//
{}
[]
::
;;
\\\\
||
RSTRING
    question_string=<<-RSTRING
using the '%w' method create an array of words while using delimit1 delimit2
as delimiters

use array...............................array1
#=>.....................................['cat','dog','bird']
    RSTRING
    answer=<<-RSTRING
array1=%wdelimit1cat dog birddelimit2
    RSTRING
    result,drill_status=coding_test2(question_string,answer,result,random_question,questions_to_go,drill_status,choices)
  end

#=====================================================================================================================
# << method ==========================================================================================================
#=====================================================================================================================

  rolling_count+=1
'327'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the << method called?
    STRING
    answer='shovel method'
    answers=<<-STRING
shovel method
inset method
push method
put method
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'328'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the shovel << method used for?
    STRING
    answer='inserting an item (1 item) at the end of an array or an array into the array'
    answers=<<-STRING
inserting an item (1 item) at the end of an array or an array into the array
inserting items into the beginning of an array
inserting items into an array
creating a new array
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'329'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what does the shovel << method return?
    STRING
    answer='a copy of the modified array'
    answers=<<-STRING
a copy of the modified array
just the item being inserted
a copy of the original array
a separate new array
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'330'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code using the shovel << method to put an item at the end of the
array

                                   0 0 0 0 0 0 0 0 0
                                   0 1 2 3 4 5 6 7 8
given.......................array=[1,2,3,4,5,6,7,8,9]
add item....................10
    STRING
    answer=<<-STRING
array<<10
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'331'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
both the << (shovel) method and the 'push' method adds an item at the end
of an array but what is the difference between the two?
    STRING
    answer='the << (shovel) method can only add one item or an array into an array'
    answers=<<-STRING
the << (shovel) method can only add one item or an array into an array
the 'push' method can add multiple items at the beginning of an array
the 'push' method can only add one item to an array
the << (shovel) method can add multiple items to an array
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'332'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
how do we add arrays inside arrays?
    STRING
    answer='by using the << method'
    answers=<<-STRING
by using the << method
by using the insert method
by using the push method
by using the unshift method
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'333'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to insert an array inside another array

given hash.................array=[[1,2]]
insert array...............[2,3]
#=>........................[[1,2],[2,3]]
    STRING
    answer=<<-STRING
array<<[2,3]
    STRING
    result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

#=====================================================================================================================
# - method ===========================================================================================================
#=====================================================================================================================
  rolling_count+=1
'334'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when working with the difference or compliment of two arrays what is the
array on the left side of the '-' operator called?
    STRING
    answer='minuend'
    answers=<<-STRING
minuend
subtrahend
the second array
the compared array
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'335'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when working with the difference or compliment of two arrays what is the
array on the right side of the '-' operator called?
    STRING
    answer='subtrahend'
    answers=<<-STRING
minuend
subtrahend
the second array
the compared array
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
'336'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when working with the difference or compliment of two arrays what are we
trying to do?
    STRING
    answer='remove all numbers in the subtrahend from the minuend and the answer'
    answers=<<-STRING
remove all numbers in the subtrahend from the minuend and the answer
remove all numbers in the first array from the second array
remove all the numbers that are the same from both arrays
remove numbers common in both arrays
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
'337'
  if random_question==rolling_count
#..............................................................................
    question_string=<<-RSTRING
when getting the difference of one array from another, how should we think
about it?

                                            0 0 0
                                            0 1 2
example.............................array1=[1,2,3]
                                    array2=[2,3,5]
                                    d=array1-array2
                                    #=> [1]
    RSTRING
    answer='take the items in the subtrahend from the minuend and the answer'
    answers=<<-RSTRING
take the items in the subtrahend from the minuend and the answer
take the items in the minuend from the subtrahend and the answer
subtract all the same items
do subtraction
    RSTRING
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

