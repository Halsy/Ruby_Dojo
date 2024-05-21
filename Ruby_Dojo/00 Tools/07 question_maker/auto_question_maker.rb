##################################################################################################################
#                                                                                                                #
# Program:......................auto_question_maker.rb                                                           #
# Programmer:...................Harold Sy                                                                        #
# Description:..................I made a question maker program a while back. It was meant to take the questions #
#                               directly and create the questions on the fly but the creating your own questions #
#                               is complicated and I found that typing them out on the computer one after the    #
#                               other made sense but then I had to process them twice: 1. typing out the         #
#                               questions in a format then 2. entering them into the question maker. This new    #
#                               program is an attempt to shorten that process by one: 1. typing out the questions#
#                               in a format then 2. having the auto_question_maker take that format and create   #
#                               the questions on its own!                                                        #
# Program subject...............ruby programming language:                                                       #
# Programmed:...................06/23/2021                                                                       #
# Last modified:................07/09/2022                                                                       #
# Modification notes:....... *  07/09/2022 modified the type 4 questiions to just compare answers. The answer    #
#                               that is embeded in the question and the one that the user gets creating a program#
#                               in an IDE and then copy and pasting the answer for comparison. I had to modify   #
#                               the format of the type 4 questions for auto question maker.                      #
#                                                                                                                #
##################################################################################################################
ruby_questions_template="../../../../02 text_files/ruby_questions_template"




#================================================================================================================#
# programmer created methods ====================================================================================#
#================================================================================================================#

#=================================================================================#
# questions building blocks                                                       #
#=================================================================================#
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
python_string=<<-STRING
STRING1


Q_PART3A=<<-STRING1
  answer_string=<<-STRING
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
answer_string=<<-STRING  
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

Q_PART4C=<<-STRING1
  STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,python_string,answer_string)
end  
STRING1


#=================================================================================#
# print a message to the user                                                     #
#=================================================================================#
# tells the user the purpose of this program and what it does so that the user
# knows if this is the program they want to run or not.

def print_message_to_user
    system('cls') # clear the screen
    puts "This program is meant to take questions created and stored in the text file"
    puts "called ruby_questions_template and automatically create questions from them." 
    puts "If this is what you want to do then hit enter to continue..."
    wait=gets.chomp
end


#=================================================================================#
# check the questions for landmark strings                                        #
#=================================================================================#
# check the questions for landmark strings. landmark strings are strings my other
# programs may use to landmark certain parts of a program to identify the beginning
# end or whatever section of the program it is looking for. In this case the land-
# mark string is: '-------' which marks the end of the questions section of the
# drill programs'

def check_for_landmarks(ruby_questions_template)
    system('cls') # clear the screen
    file_name=File.open(ruby_questions_template,'r')
    question_number=0
    error_count=0
    while !file_name.eof?
        line=file_name.readline
        if line.include?("DRILL NAME (ARRAYS)")
            question_number+=1
            puts "checking question #{question_number}"
        end
        if line.include?("----")
            error_count+=1
            puts "    *** landmark error in question #{question_number}! ***"
        end    
    end
    file_name.close
    puts
    puts "landmark check completed, number of errors: #{error_count}"
    puts
    puts "hit enter to continue..."
    wait=gets.chomp
end


#=================================================================================#
# remove tabs from the questions because it can cause errors                      #
#=================================================================================#
# removes tabs from the question format created by the user

def remove_tabs_from_question(ruby_questions_template)
    system('cls') # clear the screen
    file_name=File.open(ruby_questions_template,'r')
    clean_questions=''
    while !file_name.eof?
        line=file_name.readline
        line=line.delete("\t")
        clean_questions<<line
    end
    file_name.close
    file_name=File.open(ruby_questions_template,'w')
    file_name.puts clean_questions
    file_name.close    
end


#=================================================================================#
# double check the questions for tabs                                             #
#=================================================================================#
# double checks the questions for tabs because the tabs may cause errors with the 
# auto create questions program.

def doublecheck_for_tabs(ruby_questions_template)
    system('cls') # clear the screen
    file_name=File.open(ruby_questions_template,'r')
    question_number=0
    error_count=0
    while !file_name.eof?
        line=file_name.readline
        if line.include?("DRILL NAME (ARRAYS)")
            question_number+=1
            puts "checking question #{question_number}"
        end
        if line.include?("\t")
            error_count+=1
            puts "    *** tab error in question #{question_number}! ***"
        end    
    end
    file_name.close
    puts
    puts "tab check completed, number of errors: #{error_count}"
    puts
    puts "hit enter to continue..."
    wait=gets.chomp
    system('cls') # clear the screen
end

#=================================================================================#
# get the question parts                                                          #
#=================================================================================#
# open the file and get one question while taking it apart. close the file then
# exit out while returning the parts of the program in a hash.

def get_the_question_parts(ruby_questions_template)
    file_name=File.open(ruby_questions_template,'r')
    parts_array=[]
    keys_array=['drill','header','question','answer','question_type','answers']
    string_holder=''
    parts_hash={}
    question_count=0 
    while !file_name.eof?
        line=file_name.readline
        if line.include?("DRILL NAME (ARRAYS)")
            question_count+=1
        end
        break if question_count>1
        if line[6..7]!="##"
            string_holder<<line
        end
        if string_holder!='' && line[6..7]=="##"
            parts_array<<string_holder.rstrip!
            string_holder=''
        end    
    end
    file_name.close
    keys_array.each.with_index do |key,index|
        parts_hash[key]=parts_array[index]
    end
    return parts_hash   
end


#=================================================================================#
# delete question from file                                                       #
#=================================================================================#
# delete the disassembled question from the file.

def delete_question_from_file(ruby_questions_template)
    long_string=''
    ends_count=0
    file_name=File.open(ruby_questions_template,'r')
    while !file_name.eof?
        line=file_name.readline
        ends_count+=1 if line[0..2]=='###'
        break if ends_count>1
    end
    while !file_name.eof?
        line=file_name.readline
        long_string<<line
    end
    file_name.close
    file_name=File.open(ruby_questions_template,'w')
    file_name.puts long_string
    file_name.close
end


#=================================================================================#
# build drill name                                                                #
#=================================================================================#
# question will need a drill name so that it can be placed in the correct drill
# program down the line

def build_drill_name(parts_hash)
    new_drill_name="\n"+'#>>'+parts_hash['drill']
    new_drill_name<<".rb"+"\n" if !new_drill_name.include?('.rb')
    parts_hash['drill']=new_drill_name
    return parts_hash 
end


#=================================================================================#
# build header name                                                               #
#=================================================================================#
# question will need a header name so that it can be placed in the correct order
# in the drill iteself

def build_header_name(parts_hash)
    header_ends='#'+'='*117+"\n"
    parts_hash['header']=parts_hash['header'].chomp
    new_header=header_ends+'# '+"#{parts_hash['header']} ".ljust(116,'=')+"\n"+header_ends
    parts_hash['header']=new_header 
    return parts_hash
end


#=================================================================================#
# create multiple choice question                                                 #
#=================================================================================#
# takes in the question parts and uses it to create a multiple choice question

def create_multiple_choice_question(parts_hash)
    multiple_choice_question=''
    multiple_choice_question<<parts_hash['drill']<<parts_hash['header']<<Q_PART1A<<parts_hash['question']+"\n"
    if parts_hash['answer'].include?("'")                                                
      quote='"'                                                            
    else 
      quote="'"                                                         
    end                                                                    
    multiple_choice_question<<Q_PART2A.chomp<<quote+parts_hash['answer'].chomp+quote+"\n"<<Q_PART3A
    multiple_choice_question<<parts_hash['answer']+"\n"<<parts_hash['answers']+"\n"<<Q_PART4A 
    return multiple_choice_question                                                                             
end                                                                                                           
  

#=================================================================================#
# create coding test 1 question                                                   #
#=================================================================================#
# takes in the question parts and uses it to create a coding test 1 question

def create_coding_test1_question(parts_hash)
    coding_question=''                                                                    
    coding_question<<parts_hash['drill']<<parts_hash['header']<<Q_PART1A<<parts_hash['question']+"\n"                        
    coding_question<<Q_PART2C<<parts_hash['answer']+"\n"<<Q_PART3C                                           
    coding_question.gsub!("\#{","\\\#{")
    return coding_question
end


#=================================================================================#
# create coding test 2 question                                                   #
#=================================================================================#
# coding test 2 is a one off question type and will now be discontinued due to its
# one case use only inflexibility!


#=================================================================================#
# create coding test 3 question                                                   #
#=================================================================================#
# takes in the question parts and uses it to create a coding test 3 question

def create_coding_test3_question(parts_hash)
    coding_question=''                                                                                              
    coding_question<<parts_hash['drill']<<parts_hash['header']<<Q_PART1A                                                 
    coding_question<<parts_hash['question']+"\n"<<Q_PART2D<<parts_hash['answer']+"\n"<<Q_PART3D
    return coding_question
end


#=================================================================================#
# create coding test 4 question                                                   #
#=================================================================================#
# takes in the question parts and uses it to create a coding test 4 question

def create_coding_test4_question(parts_hash)
    coding_question=''                                                                                             
    coding_question<<parts_hash['drill']<<parts_hash['header']<<Q_PART1A                                                  
    coding_question<<parts_hash['question']+"\n"<<Q_PART2E<<parts_hash['answer']+"\n"<<Q_PART3E
    coding_question<<parts_hash['answers']+"\n"<<Q_PART4C
    return coding_question
end


#=================================================================================#
# save created question                                                           #
#=================================================================================#
# save question that was auto created from the boiler plate file

def save_created_question(new_question)
    file_name=File.open('temp','a')
    file_name.puts new_question
    puts "question saved..."
    file_name.close
end

#================================================================================================================#
# main program section ==========================================================================================#
#================================================================================================================#

# print message to let user know what this program does
print_message_to_user()

# check for items that may cause errors
check_for_landmarks(ruby_questions_template)
remove_tabs_from_question(ruby_questions_template)
doublecheck_for_tabs(ruby_questions_template)

while File.size(ruby_questions_template)>2
    parts_hash=get_the_question_parts(ruby_questions_template) # disassemble a question for parts
    delete_question_from_file(ruby_questions_template)         # delete disassebled question
    parts_hash=build_drill_name(parts_hash)                      # build drill name
    parts_hash=build_header_name(parts_hash)                     # build header name
    if parts_hash['question_type']=="multiple_choice"            # create questions
        new_question=create_multiple_choice_question(parts_hash) #        *
    elsif parts_hash['question_type']=="coding_test1"            #        *
        new_question=create_coding_test1_question(parts_hash)    #        *
    elsif parts_hash['question_type']=="coding_test3"            #        *
        new_question=create_coding_test3_question(parts_hash)    #        *
    elsif parts_hash['question_type']=="coding_test4"            #        *
        new_question=create_coding_test4_question(parts_hash)    #        *
    end                                                          #        *

    puts new_question
    wait=gets


    save_created_question(new_question)                          # save created question
end
puts
puts "*** file empty! ***"
wait=gets.chomp