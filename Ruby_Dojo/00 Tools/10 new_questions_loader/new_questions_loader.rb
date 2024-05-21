##################################################################################################################
#                                                                                                                #
# Program:......................new_questions_loader.rb                                                          #
# Programmer:...................'Harold Sy                                                                       #
# Description:..................this program loads new questions into the appropriate drill program for ruby.    #
#                               it first checks to see if the header that the new question has is in the header  #
#                               list. if the header is not there then the new header is placed on the list in    #
#                               alphabetical order. then the location of the new header is determined then       #
#                               placed into the drill with the new question. if the header is already in the     #
#                               list it is searched for then the new question placed right after it.             #
# Programmed:...................10/23/2019                                                                       #
# Last modified:................04/14/2022                                                                       #
# Modification notes:...........* an error occurred during the loading of new questions that started with == at  #
#                                 the header for equality check operator header. change the header landmark check#
#                                 to " ====" since ruby and python does not utilize 4 equal signs as an operator #
#                                 changes were performed in line 214.                                            #
#                                                                                                                #
##################################################################################################################
DAILY_NEW=                               '../../98 daily_new/daily_new.rb'
BEGINNING_OF_A_QUESTION=                 '#>>'
END_OF_QUESTIONS1=                       'end of questions section'
END_OF_QUESTIONS2=                       '------------'



##################################################################################################################
# programmer created functions                                                                                   #
##################################################################################################################




#========================#
# check if file is empty #
#================================================================================================================#
# a method that checks if the daily new has questions to process if not then it tells the user that there        #
# are no new questions to transfer                                                                               #
#                                                                                                                #
def check_if_file_has_questions()                                                                                #
#                                                                                                                #  
# open file                                                                                                      #
#                                                                                                                #
  file_read=open_for_reading(DAILY_NEW)                                                                          #
#                                                                                                                #  
# read file without saving to see of question are there                                                          #
#                                                                                                                #
  while !file_read.eof?                                                                                          #
    line=file_read.readline                                                                                      #
    break if line.include?(BEGINNING_OF_A_QUESTION) || line.include?(END_OF_QUESTIONS1)                          #
  end                                                                                                            #
#                                                                                                                #  
# set program state                                                                                              #
#                                                                                                                #
  if line.include?(BEGINNING_OF_A_QUESTION)                                                                      #
    program_state='not empty'                                                                                    #
  elsif line.include?(END_OF_QUESTIONS1)                                                                         #
    program_state='empty'                                                                                        # 
  end                                                                                                            #
#                                                                                                                #
# close open file                                                                                                #
#                                                                                                                #
  file_read.close                                                                                                #
#                                                                                                                #  
# return state                                                                                                   #
#                                                                                                                #
  return program_state                                                                                           # 
end                                                                                                              #
#================================================================================================================#




#===============#
# start message #
#================================================================================================================#
# a method that tells the user what the program does                                                             #
#                                                                                                                # 
def start_message()                                                                                              #
  puts 'this program moves new questions from the rubyDailyNew9.rb into'                                         #
  puts 'the appropriate drill programs. It also updates the header list'                                         #
  puts 'if this is what you want to do, hit enter to continue...'                                                #
  puts                                                                                                           #
  wait=gets.chomp                                                                                                #
end                                                                                                              #
#================================================================================================================#




#=======================#
# open file for reading #
#================================================================================================================#
# a method to open a file for reading                                                                            #
#                                                                                                                # 
def open_for_reading(string)                                                                                     #
  read_file=File.open(string,'r')                                                                                # 
end                                                                                                              #
#================================================================================================================#




#=======================#
# open file for writing #
#================================================================================================================#
# a method to open a file for writing                                                                            #
#                                                                                                                #
def open_for_writing(string)                                                                                     #
  write_file=File.open(string,'w')                                                                               #
end                                                                                                              #
#================================================================================================================#




#==============#
# get question #
#================================================================================================================#
# a method to open daily_new.rb for reading and captures a question onto memory to be placed into the correct    #
# drill program                                                                                                  #
#                                                                                                                #
def get_question                                                                                                 #
  question=''                                                                                                    #
  read_file=open_for_reading(DAILY_NEW)                                                                          #
#                                                                                                                #  
# find a question                                                                                                #
#                                                                                                                #
  while true                                                                                                     #
    line=read_file.readline                                                                                      #
    break if line.include?(BEGINNING_OF_A_QUESTION)                                                              #
  end                                                                                                            #
#                                                                                                                #  
# record the question in memory                                                                                  #
#                                                                                                                #
  question<<line                                                                                                 #
  while true                                                                                                     #
    line=read_file.readline                                                                                      #
    break if line.include?(BEGINNING_OF_A_QUESTION) || line.include?(END_OF_QUESTIONS2)                          #
    question<<line                                                                                               #
  end                                                                                                            #
#                                                                                                                #  
# close file                                                                                                     #
#                                                                                                                #                      
  read_file.close                                                                                                #
#                                                                                                                #  
# return question                                                                                                #
#                                                                                                                #
  return question                                                                                                #
end                                                                                                              #
#================================================================================================================#




#===============#
# get the drill #
#================================================================================================================#
# a method that captures and returns the drill from the question. this method basically takes the piece that has #
# the drill name out of the question string for separate use. It also removes it from the actual question string #
# as it serves no further purpose for it there.                                                                  #
#                                                                                                                #
def get_the_drill(question)                                                                                      #
  drill_end=question.index("\n")                                                                                 #
  drill=question.slice(0..drill_end)                                                                             #
  drill.slice!(0..2)                                                                                             #
  drill.slice!("\n")                                                                                             #
  return drill                                                                                                   #
end                                                                                                              #
#================================================================================================================#




#================#
# get the folder #
#================================================================================================================#
# a method that gets the folder by removing the .rb and checking for the folder with the program name in it to   #
# get the number before the folder name so the program can find the path to the actual drill program that is in  #
# the numbered folder.                                                                                           #
#                                                                                                                # 
def get_the_folder(drill)                                                                                        #
  folder=drill.clone                                                                                             #
  folder_end=folder.index('.')                                                                                   #
  folder.slice!(folder_end..-1)                                                                                  #
  Dir.foreach('../../'){|file| folder=file if file.include?(folder)}                                             #
  return folder                                                                                                  #
end                                                                                                              #
#================================================================================================================#
 



#================================#
# remove drill tag from question #
#================================================================================================================#
# a method that removes the drill tag from the question because it is not needed once transferred to the         #
# correct drill                                                                                                  #
#                                                                                                                #
def remove_drill_tag_from_question(question)                                                                     #
  drill_tag_end=question.index("\n")                                                                             #
  question.slice!(0..drill_tag_end)                                                                              #
  return question                                                                                                #
end                                                                                                              #
#================================================================================================================#




#==============================#
# get header from the question #
#================================================================================================================#
# a method that captures the header from the question for individual use but does not remove the header from the #
# question string itself as this could still be needed.                                                          #
#                                                                                                                #
def get_header(question)                                                                                         #
  header_end=question.index(" ====")-1                                                                           #
  header=question.slice(0..header_end)                                                                           #
  header_front=header.index(" ")                                                                                 #
  header.slice!(0..header_front)                                                                                 #
  return header                                                                                                  #
end                                                                                                              #
#================================================================================================================#




#=====================#
# get the header list #
#================================================================================================================#
# a method to capture the header list from the appropriate drill program to compare to the incoming questions    #
#                                                                                                                #
def get_the_headerlist(drill,folder)                                                                             #
  header_list_array=[]                                                                                           #
  file_read=open_for_reading("../../#{folder}/#{drill}")                                                         #
#                                                                                                                #  
# read until header list:                                                                                        #
#                                                                                                                #
  while true                                                                                                     #
    line=file_read.readline                                                                                      #
    break if line.include?('header list:')                                                                       #
  end                                                                                                            #
#                                                                                                                #  
# capture headers into array                                                                                     #
#                                                                                                                #
  while true                                                                                                     #
    line=file_read.readline                                                                                      #
    break if line.include?('#####')                                                                              #
    line.delete!('#').delete!("\n")                                                                              #
    line.strip!                                                                                                  #
    header_list_array<<line                                                                                      #
  end                                                                                                            #
#                                                                                                                #  
# close file                                                                                                     #
#                                                                                                                #
  file_read.close                                                                                                #
  return header_list_array                                                                                       #
end                                                                                                              #
#================================================================================================================#




#========================#
# check if header is new #
#================================================================================================================#
# a method to check if the header is new to the drill and is not listed in the header list                       #
#                                                                                                                #
def check_if_header_is_new(header_list_array,header)                                                             #
  header_list_array.include?(header)                                                                             #
end                                                                                                              #
#================================================================================================================#




#============================#
# put header in drill if new #
#================================================================================================================#
# put header in the header list if it is not there. it is placed in the list in alphabetical order               #
#                                                                                                                #
def put_header_in_drill_if_new(header_list_array,header)                                                         #
  alpha_list=[]                                                                                                  #
  symbol_list=[]                                                                                                 #
#                                                                                                                #  
# separate alpha and symbols                                                                                     #
#                                                                                                                #
  header_list_array.each do |item|                                                                               #
    if item[0].match(/[a-zA-Z]/)                                                                                 #
      alpha_list<<item                                                                                           #
    else                                                                                                         #
      symbol_list<<item                                                                                          #
    end                                                                                                          #
  end                                                                                                            #
#                                                                                                                #  
# put header in the appropriate list then sort the list                                                          #
#                                                                                                                #
  if header[0].match(/[a-zA-Z]/)                                                                                 #
    alpha_list<<header                                                                                           #
    alpha_list.sort!                                                                                             #
  else                                                                                                           #
    symbol_list<<header                                                                                          #
  end                                                                                                            #
#                                                                                                                #  
# clear header list array and put new array in                                                                   #
#                                                                                                                #
  header_list_array=[]                                                                                           #
  header_list_array<<alpha_list<<symbol_list                                                                     #
  return header_list_array.flatten!                                                                              #
end                                                                                                              #
#================================================================================================================#




#========================================#
# get header position on the header list #
#================================================================================================================#
# a method that gets the header position on the header list. this determines where in the actual header list the #
# header will go.                                                                                                #
#                                                                                                                #
def get_header_position(header_list_array,header)                                                                #
  header_position=header_list_array.index(header)                                                                #
  return header_position+1                                                                                       #
end                                                                                                              #
#================================================================================================================#




#==================================#
# put header in actual list if new #
#================================================================================================================#
# a method that puts the header in the actual header list if the header is new, physically writing it onto       #
# the actual file                                                                                                # 
#                                                                                                                #                         
def put_header_in_actual_list_if_new(header_position,header,folder,drill)                                        #
  header_count=0                                                                                                 #
  formated_header=''                                                                                             #
  file_read=open_for_reading("../../#{folder}/#{drill}")                                                         #
  file_write=open_for_writing('temp')                                                                            #
#                                                                                                                #  
# read and save until start of header list                                                                       #
#                                                                                                                #
  while true                                                                                                     #
    line=file_read.readline                                                                                      #
    break if line.include?('header list:')                                                                       #
    file_write.puts line                                                                                         #
  end                                                                                                            #
#                                                                                                                #
# read, save, and count until header position is reached                                                         #
#                                                                                                                #
  file_write.puts line                                                                                           #
  while true                                                                                                     #
    line=file_read.readline                                                                                      #
    header_count+=1                                                                                              #
    break if header_count==header_position                                                                       #
    file_write.puts line                                                                                         #
  end                                                                                                            #
#                                                                                                                #   
# put new header in                                                                                              #
#                                                                                                                #
  formated_header<<'#'<<' '*33<<header<<' '*(79-header.length)<<'#'                                              #
  file_write.puts formated_header                                                                                #
#                                                                                                                #  
# put next item in                                                                                               #
#                                                                                                                # 
  file_write.puts line                                                                                           #
#                                                                                                                #  
# read and save the rest of the file                                                                             #
#                                                                                                                #
  while !file_read.eof?                                                                                          #
    line=file_read.readline                                                                                      #
    file_write.puts line                                                                                         #
  end                                                                                                            #
#                                                                                                                #
# close files                                                                                                    #
#                                                                                                                #  
  file_read.close                                                                                                #
  file_write.close                                                                                               #
#                                                                                                                #  
# replace actual header list                                                                                     #
#                                                                                                                #
  file_read=open_for_reading('temp')                                                                             #
  file_write=open_for_writing("../../#{folder}/#{drill}")                                                        #
  while !file_read.eof?                                                                                          #
    line=file_read.readline                                                                                      #
    file_write.puts line                                                                                         #
  end                                                                                                            #
#                                                                                                                #  
# close files                                                                                                    #
#                                                                                                                #
  file_read.close                                                                                                #
  file_write.close                                                                                               #
end                                                                                                              #
#================================================================================================================#




#====================================================#
# remove header from question if already on the list #
#================================================================================================================# fixed!
# a method to remove the header from the question if it already exists                                           # was not removing the header
#                                                                                                                #
def remove_header_from_question(question)                                                                        #
  header_end=question.index("rolling_count+=1")                                                                  #
  question.slice!(0..header_end-1)                                                                               #
  return question                                                                                                #
end                                                                                                              #
#================================================================================================================#




#=============================================================================#
# put question in proper place in the drill if header is already on the drill #
#=============================================================================================================# fixed
# a method to place the question in the proper location on the drill if not new                               # was not saving correctly
#                                                                                                             #
def put_question_in_proper_location_when_not_new(header_position,question,folder,drill)                       #
  physical_header_count=0                                                                                     #
  calculated_header_count=0                                                                                   #
#                                                                                                             #
# open files                                                                                                  #
#                                                                                                             #
  file_read=open_for_reading("../../#{folder}/#{drill}")                                                      #
  file_write=open_for_writing('temp')                                                                         #
#                                                                                                             #  
# read and save the upper part of the program until start of questions section is found                       #
#                                                                                                             #         
  while true                                                                                                  #
    line=file_read.readline                                                                                   #
    break if line.include?('start of questions section')                                                      #
    file_write.puts line                                                                                      #
  end                                                                                                         #
#                                                                                                             #  
# save start of question section, read the next line and save                                                 #
#                                                                                                             #
  file_write.puts line                                                                                        #
  line=file_read.readline                                                                                     #
  file_write.puts line                                                                                        # 
#                                                                                                             #   
# read and count headers until proper header count is achieved                                                #
#                                                                                                             #
  while true                                                                                                  #
    line=file_read.readline                                                                                   #
    physical_header_count+=1 if line.include?('============')                                                 #
    calculated_header_count=physical_header_count/3 if physical_header_count!=0 && physical_header_count%3==0 #
    break if calculated_header_count==header_position                                                         #
    file_write.puts line                                                                                      #
  end                                                                                                         #
#                                                                                                             #  
# save last border of the header                                                                              #
#                                                                                                             #
  file_write.puts line                                                                                        # 
  file_write.puts "\n"                                                                                        #
#                                                                                                             #  
# save question onto the drill                                                                                #
#                                                                                                             # 
  file_write.puts question                                                                                    #
#                                                                                                             #  
# save the rest of the file                                                                                   #
#                                                                                                             #
  while !file_read.eof?                                                                                       #
    line=file_read.readline                                                                                   # 
    file_write.puts line                                                                                      #
  end                                                                                                         #
#                                                                                                             #  
# close the open files                                                                                        #
  file_read.close                                                                                             #
  file_write.close                                                                                            #
end                                                                                                           #
#=============================================================================================================#




#============================================================#
# put question in proper place on the drill if header is new #
#=============================================================================================================#
# a method to put the question in the proper location when header is new                                      #
#                                                                                                             #
def put_question_in_proper_location_when_new(header_position,question,folder,drill)                           #
  physical_header_count=0                                                                                     #
  calculated_header_count=0                                                                                   #
#                                                                                                             #  
# open files                                                                                                  #
#                                                                                                             #
  file_read=open_for_reading("../../#{folder}/#{drill}")                                                      #                            
  file_write=open_for_writing('temp')                                                                         #
#                                                                                                             #  
# read and save to skip the upper part of the program                                                         #
#                                                                                                             #
  while true                                                                                                  #
    line=file_read.readline                                                                                   #
    break if line.include?('start of questions section')                                                      #
    file_write.puts line                                                                                      #
  end                                                                                                         #
#                                                                                                             #  
# save start of question section                                                                              #
#                                                                                                             #
file_write.puts line                                                                                          #
#                                                                                                             #
# read and save count headers until proper header count is achieved                                           #
#                                                                                                             #
  while true                                                                                                  #
    line=file_read.readline                                                                                   #
    physical_header_count+=1 if line.include?('============')                                                 #
    calculated_header_count=physical_header_count/3 if physical_header_count!=0 && physical_header_count%3==0 #
    break if calculated_header_count==header_position-1                                                       #
    file_write.puts line                                                                                      #
  end                                                                                                         #
#                                                                                                             # 
# save last border of the header                                                                              #
#                                                                                                             #
  file_write.puts line                                                                                        #
#                                                                                                             #  
# read and save until the next boarder is reached or end                                                      #
#                                                                                                             #
  while true                                                                                                  #
    line=file_read.readline                                                                                   #
    break if line.include?('============') || line.include?('------------')                                   #
    file_write.puts line                                                                                      #
  end                                                                                                         #
#                                                                                                             #  
# save question onto the drill                                                                                #
#                                                                                                             #
  file_write.puts question                                                                                    #
#                                                                                                             # 
# save first part of the header border                                                                        #
#                                                                                                             #
  file_write.puts line                                                                                        #
#                                                                                                             #
# save the rest of the file                                                                                   #                                                    
  while !file_read.eof?                                                                                       #
    line=file_read.readline                                                                                   #
    file_write.puts line                                                                                      #
  end                                                                                                         #
#                                                                                                             #   
# close the open files                                                                                        #
#                                                                                                             #
  file_read.close                                                                                             #
  file_write.close                                                                                            #
end                                                                                                           #
#=============================================================================================================#




#==============================#
# copy revised drill to actual #
#=============================================================================================================#
# a method to copy the revised drill with the new question into the actual drill file                         #    
#                                                                                                             # 
def copy_revised_drill_to_actual(folder,drill)                                                                #
#                                                                                                             #   
# open files                                                                                                  #
#                                                                                                             #
  file_read=open_for_reading('temp')                                                                          #
  file_write=open_for_writing("../../#{folder}/#{drill}")                                                     #
#                                                                                                             #  
# read and write to actual                                                                                    #
#                                                                                                             #
  while !file_read.eof?                                                                                       #
    line=file_read.readline                                                                                   #
    file_write.puts line                                                                                      #
  end                                                                                                         #
#                                                                                                             #  
# close the open files                                                                                        #
#                                                                                                             #
  file_read.close                                                                                             #
  file_write.close                                                                                            #
end                                                                                                           #
#=============================================================================================================#




#=============================================================================================================#
# deletes a question from the daily new ======================================================================#
#=============================================================================================================#
def delete_question_from_the_dailynew()                                                                       #
#                                                                                                             #  
# open files                                                                                                  #
#                                                                                                             #
  file_read=open_for_reading(DAILY_NEW)                                                                       #
  file_write=open_for_writing('temp')                                                                         #
#                                                                                                             #   
# read and save file until start of question is found                                                         # 
#                                                                                                             #
  while true                                                                                                  #
    line=file_read.readline                                                                                   #
    break if line.include?(BEGINNING_OF_A_QUESTION)                                                           #
    file_write.puts line                                                                                      #
  end                                                                                                         #
#                                                                                                             #  
# read only without saving until the start of the next question is found                                      #
#                                                                                                             #
  while true                                                                                                  #
    line=file_read.readline                                                                                   #
    break if line.include?(BEGINNING_OF_A_QUESTION) || line.include?('------------')                          #
  end                                                                                                         #
#                                                                                                             #  
# save last line read                                                                                         #
#                                                                                                             #     
  file_write.puts line                                                                                        #
#                                                                                                             #  
# read and save the rest of the file                                                                          #
#                                                                                                             #
  while !file_read.eof?                                                                                       #
    line=file_read.readline                                                                                   #
    file_write.puts line                                                                                      #
  end                                                                                                         #
#                                                                                                             #  
# close open files                                                                                            #
#                                                                                                             #
  file_read.close                                                                                             #
  file_write.close                                                                                            #
#                                                                                                             #  
# open files                                                                                                  #
#                                                                                                             #                
  file_read=open_for_reading('temp')                                                                          #
  file_write=open_for_writing(DAILY_NEW)                                                                      #
#                                                                                                             #  
# read and save file                                                                                          #
#                                                                                                             #
  while !file_read.eof?                                                                                       #
    line=file_read.readline                                                                                   #
    file_write.puts line                                                                                      #
  end                                                                                                         #
#                                                                                                             #  
# close open files                                                                                            #
#                                                                                                             #
  file_read.close                                                                                             #
  file_write.close                                                                                            #
end                                                                                                           #
#=============================================================================================================#




#=================#
# empty temp file #
#=============================================================================================================#
# a method to clear the temp file                                                                             #
def empty_temp_file()                                                                                         #
  File.open('temp','w')                                                                                       #
end                                                                                                           #
#=============================================================================================================#




#====================#
# print last message #
#=============================================================================================================#
# a method to print closing messages                                                                          #
def print_last_message(drill,header)                                                                          #
  puts "new question --> #{drill} --> #{header}"                                                              #
end                                                                                                           #
#=============================================================================================================#




#===============#
# close program #
#=============================================================================================================#
# a method to close the program                                                                               #
def close_program()                                                                                           #
  puts                                                                                                        #
  puts '*** no questions in file ***'                                                                         #
  wait=gets.chomp                                                                                             #
end                                                                                                           #
#=============================================================================================================#




#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# main program <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
#                                                                                                                      #
# calls a method that prints a message to the user as to what this program does                                        #
#                                                                                                                      #
start_message                                                                                                          #
#                                                                                                                      #
# call a method to check if the file (daily new) is empty of questions                                                 #
#                                                                                                                      #
program_state=check_if_file_has_questions()                                                                            #
#                                                                                                                      #
# main loop                                                                                                            #
#                                                                                                                      # 
while program_state=='not empty'                                                                                       #
#                                                                                                                      #
# calls a method that gets a question from daily_new.rb                                                                #
#                                                                                                                      #
  question=get_question                                                                                                #
#                                                                                                                      #
# call a method that gets the drill                                                                                    #
#                                                                                                                      #
  drill=get_the_drill(question)                                                                                        #
#                                                                                                                      #
# call a method that gets the folder                                                                                   #
#                                                                                                                      #
  folder=get_the_folder(drill)                                                                                         #
#                                                                                                                      #
# call a method that removes the drill tag from the question                                                           #
#                                                                                                                      # 
  question=remove_drill_tag_from_question(question)                                                                    #
#                                                                                                                      #
# call a method that gets the header from the question                                                                 #
#                                                                                                                      #
  header=get_header(question)                                                                                          #
#                                                                                                                      #
# call a method that gets the header list                                                                              #
#                                                                                                                      #
  header_list_array=get_the_headerlist(drill,folder)                                                                   #
#                                                                                                                      #
# call a method that checks if the header is in the drill or not                                                       #
#                                                                                                                      #
  header_in_drill=check_if_header_is_new(header_list_array,header)                                                     #
#                                                                                                                      #
# call a method that puts the header in the drill if the header is new                                                 #
#                                                                                                                      #
  header_list_array=put_header_in_drill_if_new(header_list_array,header) if header_in_drill==false                     #
#                                                                                                                      # 
# call a method that gets the header position on the header list                                                       #
#                                                                                                                      # 
  header_position=get_header_position(header_list_array,header)                                                        #
#                                                                                                                      #
# call a method that puts the header in the actual list if it is new                                                   #
#                                                                                                                      #
  put_header_in_actual_list_if_new(header_position,header,folder,drill) if header_in_drill==false                      #
#                                                                                                                      #
# call a method that removes the header from the question if the header already exists in the drill                    #
#                                                                                                                      # 
  question=remove_header_from_question(question) if header_in_drill==true                                              #
#                                                                                                                      #
# call a method that puts the question in the proper location in the drill if not new                                  #
#                                                                                                                      #
  put_question_in_proper_location_when_not_new(header_position,question,folder,drill) if header_in_drill==true         #
#                                                                                                                      #
# call a method to put the question in the drill if the header is new                                                  #
#                                                                                                                      #
  put_question_in_proper_location_when_new(header_position,question,folder,drill) if header_in_drill==false            #
#                                                                                                                      #
# call a method to copy the drill with the new question into the actual file                                           #
#                                                                                                                      #
  copy_revised_drill_to_actual(folder,drill)                                                                           #
#                                                                                                                      #
# call a method that deletes the processed question from the daily new                                                 #
#                                                                                                                      #
  delete_question_from_the_dailynew()                                                                                  #
#                                                                                                                      #
# call method to empty temp file                                                                                       #
#                                                                                                                      #
  empty_temp_file()                                                                                                    #
#                                                                                                                      #
# call print closing messages                                                                                          #
#                                                                                                                      #
  print_last_message(drill,header)                                                                                     #
#                                                                                                                      #
# call a method to check if the file (daily new) is empty of questions                                                 # 
#                                                                                                                      #
  program_state=check_if_file_has_questions()                                                                          #
#                                                                                                                      #
end                                                                                                                    #
#                                                                                                                      #
# call close program to end the process                                                                                #
#                                                                                                                      #
 close_program()                                                                                                       #
#======================================================================================================================#