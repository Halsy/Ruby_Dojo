##################################################################################################################
#                                                                                                                #
# Program:......................question_maker.rb                                                                #
# Programmer:...................Harold Sy                                                                        #
# Description:..................this program allows me to create questions for version 9 of my drills            #
#                               so that the questions can be easily created and placed into the dailyNew9.rb     #
#                               The program that will move the questions into the daily will be separate from    #
#                               this one.                                                                        #
# Kata subject..................ruby programming language:                                                       #
# Programmed:...................06/15/2019                                                                       #
# Last modified:................02/25/2021                                                                       #
# Modification notes:...........* 10/05/2019 added the ability to create coding test type II questions that I    #
#                                 added this year.                                                               #
#                               * drill programs were modified so these tools needed to have their file pathes   #
#                                 reset. also added some global varaibles for easier modifications               #
#                               * 03/08/2021 needed to update this program because coding test questions were    #
#                                 modified to type 1 through type 4. also added the ability to list the headers  #
#                                 in a given drill to help with the creation of the questions.                   #
##################################################################################################################

#===========================#
# questions building blocks #
#================================================================================================================#
Q_PART1A=<<-STRING1                                                                                               
rolling_count+=1
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
STRING1

Q_PART1B=<<-STRING1
rolling_count+=1
if random_question==rolling_count
#..............................................................................
   choices=<<-RSTRING
STRING1

Q_PART2A=<<-STRING1
STRING
  answer=
STRING1

Q_PART2B=<<-STRING1
RSTRING
  question_string=<<-RSTRING
STRING1

Q_PART2C=<<-STRING1
STRING
answer=<<-STRING
STRING1

Q_PART2D=<<-STRING1
STRING
  answers=<<-STRING
STRING1

Q_PART2E=<<-STRING1
STRING
program_string=<<-STRING
STRING1

Q_PART3A=<<-STRING1
  answers=<<-STRING
STRING1


Q_PART3B=<<-STRING1
RSTRING
  answer=<<-RSTRING
STRING1

Q_PART3C=<<-STRING1
STRING
  result,drill_status=coding_test1(question_string,answer,result,random_question,questions_to_go,drill_status)
end  
STRING1

Q_PART3D=<<-STRING1
STRING
  result,drill_status=coding_test3(question_string,answers,result,random_question,questions_to_go,drill_status)
end  
STRING1

Q_PART3E=<<-STRING1
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,program_string)
end  
STRING1

Q_PART4A=<<-STRING1
STRING
  result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end  
STRING1

Q_PART4B=<<-STRING1
RSTRING
  result,drill_status=coding_test2(question_string,answer,result,random_question,questions_to_go,drill_status,choices)
end  
STRING1
#================================================================================================================#




##################################################################################################################
# programmer created methods                                                                                     #
##################################################################################################################


#========================================================================#
# this method gets the name of the drill that the question will go into  #
#================================================================================================================#
def file_name()                                                                                                  #
  system('cls')                                                                                                  #
  print 'please enter the drill name :'                                                                          # 
  drill_name=gets                                                                                                #
  new_drill_name="\n"+'#>>'+drill_name                                                                           #
  new_drill_name[-1]=".rb"+"\n" if !new_drill_name.include?('.rb')                                               #
  return new_drill_name                                                                                          #
end                                                                                                              #
#================================================================================================================#



#================================================#
# get header listing and print out for the user  #
#================================================================================================================#
def get_header_listing(new_file_name)                                                                            #
  header_list_array=[]                                                                                           #
  folder=''                                                                                                      #
  new_file_name=new_file_name[4..-1].gsub(".rb","\n").delete("\n")                                               #
#                                                                                                                #
# get the folder name                                                                                            #
#                                                                                                                #
  Dir.foreach('../../'){|file| folder<<file if file.include?(new_file_name)}                                     #
#                                                                                                                #
# open the file for reading                                                                                      #
#                                                                                                                #
new_file_name=new_file_name+".rb"                                                                                # 
file_read=File.open("../../#{folder}/#{new_file_name}",'r')                                                      #
#                                                                                                                #  
# read until header list:                                                                                        #
#                                                                                                                #
while true                                                                                                       #
  line=file_read.readline                                                                                        #
  break if line.include?('header list:')                                                                         #
end                                                                                                              #
#                                                                                                                #  
# capture headers into array                                                                                     #
#                                                                                                                #
while true                                                                                                       #
  line=file_read.readline                                                                                        #
  break if line.include?('#####')                                                                                #
  line.delete!('#').delete!("\n")                                                                                #
  line.strip!                                                                                                    #
  header_list_array<<line                                                                                        #
end                                                                                                              #
#                                                                                                                # 
# close file that was openned for reading                                                                        #
#                                                                                                                #
file_read.close                                                                                                  #
#                                                                                                                #
# print the header listing and pause                                                                             #
#                                                                                                                #
puts header_list_array                                                                                           #
puts                                                                                                             #
puts 'read over listing and hit enter to continue...'                                                            #
wait=gets.chomp                                                                                                  #
end                                                                                                              #
#================================================================================================================#




#============================================================================#
# this method gets the header for the drill that this question will go into  #
#================================================================================================================#
def header()                                                                                                     #
  system('cls')                                                                                                  #
  header_ends='#'+'='*117+"\n"                                                                                   #
  print 'please enter the header :'                                                                              # 
  header=gets.chomp                                                                                              #
  new_header=header_ends+'# '+"#{header} ".ljust(116,'=')+"\n"+header_ends                                       # 
  return new_header                                                                                              #
end                                                                                                              #
#================================================================================================================#



#==============================================#
# this method gets the question for the drill  #
#================================================================================================================#
def question()                                                                                                   #
  system('cls')                                                                                                  #
  question=''                                                                                                    #
  puts 'enter your question below. enter a (.) on a line by itself to end.'                                      #
  puts 'enter (..) on a line by itself to redo the question in case of typos:'                                   # 
  puts '#..............................................................................'                         #
  line=gets                                                                                                      #
  while line!=".\n"                                                                                              #
    question<<line                                                                                               #
    if line=="..\n"                                                                                              #
      question=''                                                                                                #
    end                                                                                                          #
    line=gets                                                                                                    #
  end                                                                                                            #
  return question                                                                                                #
end                                                                                                              #
#================================================================================================================#



#============================================================#
# this method gets the answer to the question for the drill  #
#================================================================================================================#
def answer()                                                                                                     #
  system('cls')                                                                                                  #
  answer=''                                                                                                      #
  puts 'enter your answer below. enter a (.) on a line by itself to end.'                                        #
  puts 'enter (..) on a line by itself to redo the question in case of typos:'                                   #
  puts '#..............................................................................'                         #
  line=gets                                                                                                      #
  while line!=".\n"                                                                                              #
    answer<<line                                                                                                 #
    if line=="..\n"                                                                                              #
      answer=''                                                                                                  #
    end                                                                                                          #
    line=gets                                                                                                    #
  end                                                                                                            #
  return answer                                                                                                  #
end                                                                                                              #
#================================================================================================================#



#===========================================================#
# this method gets the type of question that is to be made  #
#================================================================================================================#
def get_question_type()                                                                                          #
  system('cls')                                                                                                  #
  questions='abcde'                                                                                              #
  answer='x'                                                                                                     #
  while !questions.include?(answer)                                                                              #
    puts                                                                                                         #
    puts 'what type of question are you making?'                                                                 #
    puts '(a) multiple choice'                                                                                   #
    puts '(b) coding test 1'                                                                                     #
    puts '(c) coding test 2'                                                                                     # 
    puts '(d) coding test 3'                                                                                     #
    puts '(e) coding test 4'                                                                                     #
    answer=gets.chomp                                                                                            #
  end                                                                                                            #
  return answer                                                                                                  #
end                                                                                                              #
#================================================================================================================#



#===============================================#
# this method creates multiple choice questions #
#================================================================================================================#
#                                                                                                                #
def create_multiple_choice_question(new_file_name,new_header,question,answer)                                    #
  system('cls')                                                                                                  #
  answers=''                                                                                                     #
  puts 'enter three extra answers below. enter a (.) on line by itself to end or a'                              #
  puts '(..) on a line by itself to redo the answers in case of typos:'                                          #
  puts '#..............................................................................'                         #
  line=gets                                                                                                      #
  while line!=".\n"                                                                                              #
    answers<<line                                                                                                #
    if line=="..\n"                                                                                              #
      answers=''                                                                                                 #
    end                                                                                                          #
    line=gets                                                                                                    #
  end                                                                                                            #
  multiple_choice_question=''                                                                                    #
  multiple_choice_question<<new_file_name<<new_header<<Q_PART1A<<question                                        #
  if answer.include?("'")                                                                                        #
    quote='"'                                                                                                    #
  else quote="'"                                                                                                 #
  end                                                                                                            #
  multiple_choice_question<<Q_PART2A.chomp<<quote+answer.chomp+quote+"\n"<<Q_PART3A<<answer<<answers<<Q_PART4A   #
  return multiple_choice_question                                                                                #
end                                                                                                              #
#================================================================================================================#




#========================================#
# this method creates coding 1 questions #
#================================================================================================================#
#                                                                                                                #
def create_coding1_question(new_file_name,new_header,question,answer)                                            #
  system('cls')                                                                                                  #
  coding_question=''                                                                                             #
  coding_question<<new_file_name<<new_header<<Q_PART1A<<question                                                 #
  coding_question<<Q_PART2C<<answer<<Q_PART3C                                                                    #
  coding_question.gsub!("\#{","\\\#{")                                                                           #
  return coding_question                                                                                         #
end                                                                                                              # 
#================================================================================================================#




#========================================#
# this method creates coding 2 questions #
#================================================================================================================#
#                                                                                                                #
def create_coding2_question(new_file_name,new_header,question,answer)                                            #
  choices=''                                                                                                     #
  system('cls')                                                                                                  #
  puts 'enter choices by pairs on each line. enter a (.) on line by itself to end or a'                          #
  puts '(..) on a line by itself to redo the answers in case of typos:'                                          #
  puts '#..............................................................................'                         #
  line=gets                                                                                                      #
  while line!=".\n"                                                                                              #
    choices<<line                                                                                                #
    if line=="..\n"                                                                                              #
      choices=''                                                                                                 #
    end                                                                                                          #
    line=gets                                                                                                    #
  end                                                                                                            #
  system('cls')                                                                                                  #
  coding_question=''                                                                                             #
  coding_question<<new_file_name<<new_header<<Q_PART1B<<choices                                                  #
  coding_question<<Q_PART2B<<question<<Q_PART3B<<answer<<Q_PART4B                                                #
  coding_question.gsub!("\#{","\\\#{")                                                                           #
  return coding_question                                                                                         #
end                                                                                                              #
#================================================================================================================#




#========================================#
# this method creates coding 3 questions #
#================================================================================================================#
#                                                                                                                #
def create_coding3_question(new_file_name,new_header,question,answer)                                            #
  system('cls')                                                                                                  #
  coding_question=''                                                                                             # 
  coding_question<<new_file_name<<new_header<<Q_PART1A<<question                                                 #
  coding_question<<Q_PART2D<<answer<<Q_PART3D                                                                    #
  return coding_question                                                                                         #
end                                                                                                              #
#================================================================================================================#



#========================================#
# this method creates coding 4 questions #
#================================================================================================================#
#                                                                                                                #
def create_coding4_question(new_file_name,new_header,question,answer)                                            #
  system('cls')                                                                                                  #
  coding_question=''                                                                                             #
  coding_question<<new_file_name<<new_header<<Q_PART1A<<question                                                 # 
  coding_question<<Q_PART2E<<answer<<Q_PART3E                                                                    #
  return coding_question                                                                                         #
end                                                                                                              #
#================================================================================================================#




##################################################################################################################
# main program                                                                                                   #
##################################################################################################################
#                                                                                                                #
# print message to user about this program and what it does.                                                     #
#                                                                                                                #
puts 'this program helps create new questions that will be moved into the daily drills'                          #
puts 'if this is what you want to do hit enter...'                                                               #
w=gets.chomp                                                                                                     #
#                                                                                                                #
# main loop                                                                                                      #
#                                                                                                                #
a='y'                                                                                                            #
while a=='y'                                                                                                     #
#                                                                                                                #
# get the name of the drill that the question will go into                                                       #
#                                                                                                                #  
  new_file_name=file_name()                                                                                      #
#                                                                                                                #
# check if the user wants to see the existing header files                                                       #
#                                                                                                                #
  puts 'would you like a listing of the existing header files? (y or n)'                                         #
  answer=gets.chomp                                                                                              #
  get_header_listing(new_file_name) if answer=='y'                                                               #
#                                                                                                                #
# get the header for the drill that the question will go into                                                    #
#                                                                                                                #
  new_header=header()                                                                                            #
#                                                                                                                #
# get the actual question                                                                                        #
#                                                                                                                #
  question=question()                                                                                            #
#                                                                                                                #
# get the actual answer to the question                                                                          #
#                                                                                                                #
  answer=answer()                                                                                                #
#                                                                                                                #                                                      
# get the type of question that is being made                                                                    #
#                                                                                                                #
  question_type=get_question_type()                                                                              #
  if question_type=='a'                                                                                          #
    save_question=create_multiple_choice_question(new_file_name,new_header,question,answer)                      #
  elsif question_type=='b'                                                                                       #                                                                                       
    save_question=create_coding1_question(new_file_name,new_header,question,answer)                              #
  elsif question_type=='c'                                                                                       #
    save_question=create_coding2_question(new_file_name,new_header,question,answer)                              #
  elsif question_type=='d'                                                                                       #
    save_question=create_coding3_question(new_file_name,new_header,question,answer)                              #
  elsif question_type=='e'                                                                                       #
    save_question=create_coding4_question(new_file_name,new_header,question,answer)                              #
  end                                                                                                            #
#                                                                                                                #  
# display the created question for the user                                                                      #
#                                                                                                                #
  puts save_question                                                                                             #
#                                                                                                                #
# ask if user want to save the created question                                                                  #
#                                                                                                                #
  puts                                                                                                           #
  puts 'do you want to save the question? (y or n)'                                                              #
  a=gets.chomp                                                                                                   #
  if a=='y'                                                                                                      #
    file_name=File.open('temp','a')                                                                              #
    file_name.print save_question                                                                                #
    file_name.close                                                                                              #
  end                                                                                                            #
#                                                                                                                #
# ask if user wants to create another question                                                                   #
#                                                                                                                #
  system('cls')                                                                                                  #
  if a=='y'                                                                                                      #
    puts 'question was saved!'                                                                                   #
  else                                                                                                           #
    puts 'question was not saved!'                                                                               #
  end                                                                                                            #
  puts 'do you want to create another question? (y or n)'                                                        #
  a=gets.chomp                                                                                                   #
end                                                                                                              #
#================================================================================================================#

