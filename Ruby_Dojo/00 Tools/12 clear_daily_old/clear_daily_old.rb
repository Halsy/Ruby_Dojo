##################################################################################################################
#                                                                                                                #
# Program:......................clear_daily_old.rb                                                               #
# Programmer:...................Harold Sy                                                                        #
# Description:..................this program allows me to clear the DailyOld9 drill for new questions            #
# Programmed:...................10/20/2019                                                                       #
# Last modified:................10/20/2019                                                                       #
# Modification notes:...........None                                                                             #
##################################################################################################################
DAILY_OLD_FILE=              '../../99 daily_old/daily_old.rb'
TEMP=                        'temp'
LANDMARK1=                   'rolling_count+=1'
LANDMARK2=                   '#----'



##################################################################################################################
# programmer created functions                                                                                   #
##################################################################################################################




#=======================#
# open file for reading #
#================================================================================================================#
# opens a file for reading                                                                                       #
#                                                                                                                #
def open_file_for_reading(file_name_reading)                                                                     #
  open_file_reading=File.open(file_name_reading,'r')                                                             #
  return open_file_reading                                                                                       #
end                                                                                                              #
#================================================================================================================#




#=======================#
# open file for writing #
#================================================================================================================#
# opens a file for writing                                                                                       #
#                                                                                                                #
def open_file_for_writing(file_name_writing)                                                                     #
  open_file_writing=File.open(file_name_writing,'w')                                                             #
  return open_file_writing                                                                                       #
end                                                                                                              #
#================================================================================================================#




#=======================#
# close openned files   #
#================================================================================================================#
# close a file that was openned regardless of function                                                           #
#                                                                                                                #
def close_the_open_file(file_name_close)                                                                         #
  file_name_close.close                                                                                          #
end                                                                                                              #
#================================================================================================================#




#====================================================#
# read daily old and save until LANDMARK1 is reached #
#================================================================================================================#
# reads the daily old file saving each line until LANDMARK1 is located                                           #
#                                                                                                                #
def read_file_and_save_until_target_string_is_found(reading_file,write_file)                                     #
  while true                                                                                                     #
    line=reading_file.readline                                                                                   #
    break if line.include?(LANDMARK1)                                                                            #
    write_file.puts line                                                                                         #
  end                                                                                                            #
  return line                                                                                                    #
end                                                                                                              #
#================================================================================================================#




#====================================================================#
# read daily old questions without saving until LANDMARK2 is reached #
#================================================================================================================#
#                                                                                                                # 
def read_file_without_saving_until_target_string_is_found(reading_file,line)                                     #
  while true                                                                                                     #
    line=reading_file.readline                                                                                   #
    break if line.include?(LANDMARK2)                                                                            #
  end                                                                                                            #
  return line                                                                                                    #
end                                                                                                              #
#================================================================================================================#




#=====================================================================#
# read and save the rest of daily old without the questions variation #
#================================================================================================================#
# reads and saves the rest of the file while saving an extra line before that                                    #
#                                                                                                                #
def read_line_and_save_until_eof(reading_file,writing_file,line)                                                 #
  writing_file.puts line                                                                                         #
  while !reading_file.eof?                                                                                       #
    line=reading_file.readline                                                                                   #
    writing_file.puts line                                                                                       #
  end                                                                                                            #
end                                                                                                              #
#================================================================================================================#




#===========================================================#
# read and save the rest of daily old without the questions #
#================================================================================================================#
# reads and saves the rest of the file only                                                                      #
#                                                                                                                #
def read_line_and_save_until_eof_only(reading_file,writing_file)                                                 #
  while !reading_file.eof?                                                                                       #
    line=reading_file.readline                                                                                   #
    writing_file.puts line                                                                                       #
  end                                                                                                            #
end                                                                                                              #
#================================================================================================================#




#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# main program <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
#                                                                                                                #
# message to user                                                                                                #
#                                                                                                                #
puts 'this program clears the daily old drill of questions so that'                                              #
puts 'new questions can be entered in. if this is what you want to'                                              #
puts 'do hit enter...'                                                                                           #
#                                                                                                                #
wait=gets.chomp                                                                                                  #
#                                                                                                                #
# open daily old for reading and temp for writing                                                                #                                                                             
#                                                                                                                #
reading_file=open_file_for_reading(DAILY_OLD_FILE)                                                               #
writing_file=open_file_for_writing(TEMP)                                                                         #
#                                                                                                                #
# read daily old and save into temp without the questions                                                        #
#                                                                                                                #
line=read_file_and_save_until_target_string_is_found(reading_file,writing_file)                                  #
line=read_file_without_saving_until_target_string_is_found(reading_file,line)                                    #
read_line_and_save_until_eof(reading_file,writing_file,line)                                                     #
#                                                                                                                #
# close files for reading and writing                                                                            #
#                                                                                                                #
close_the_open_file(reading_file)                                                                                #
close_the_open_file(writing_file)                                                                                #
#                                                                                                                #
# copy temp file to actual file                                                                                  #
# open files for reading and writing                                                                             #
#                                                                                                                #
reading_file=open_file_for_reading(TEMP)                                                                         #
writing_file=open_file_for_writing(DAILY_OLD_FILE)                                                               #
#                                                                                                                #          
# save t0 daily old without the questions into the regular file                                                  #
#                                                                                                                #
read_line_and_save_until_eof_only(reading_file,writing_file)                                                     #
#                                                                                                                # 
# close files for reading and writing                                                                            #
#                                                                                                                #
close_the_open_file(reading_file)                                                                                #
close_the_open_file(writing_file)                                                                                #
#                                                                                                                #
# clear temp file                                                                                                #
#                                                                                                                #
writing_file=open_file_for_writing(TEMP)                                                                         #
close_the_open_file(writing_file)                                                                                #
#                                                                                                                #
# message to user                                                                                                #
#                                                                                                                #
puts                                                                                                             #
puts 'daily_old drill was successfully cleared'                                                                  #
puts 'clean up was also successful'                                                                              #
#                                                                                                                #
wait=gets.chomp                                                                                                  #
#================================================================================================================#