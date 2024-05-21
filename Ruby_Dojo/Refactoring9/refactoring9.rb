##################################################################################################################
#                                                                                                                #
# Program:......................refactoring9.rb                                                                  #
# Programmer:...................'Corvus'                                                                         #
# Description:..................this program allows me to review my knowledge of the ruby programming language   #
#                               similar to how I practice katas for my martial arts class.                       #
# Kata subject..................ruby programming language:                                                       #
# Programmed:...................11/16/2017                                                                       #
# Last modified:................02/18/2020                                                                       #
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
#                                 it right or wrong.                                                             #
#                               * 02/18/2020 programming II type questions have a tendency to crash when an error#
#                                 occurs in the source code that was typed in. exception handling had to be added#
#                                 to prevent the program from crashing.                                          #
#                                                                                                                #
##################################################################################################################
##                    header list:                                                                              ##
#                                 case method                                                                    #
#                                 general refactoring                                                            #
#                                 if method                                                                      #
#                                 unless method                                                                  #
#                                 ||= operator                                                                   #
#                                 ! operator                                                                     #
#                                 !! operator                                                                    #
##################################################################################################################
# programmer created functions                                                                                   #
##################################################################################################################

#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# pause output for the user to read <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

def pause_output
  wait=gets
end

#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# print one line spacing <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

def print_one_space
  puts
end

#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# print two line spacing <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

def print_two_spaces
  puts
  puts
end

#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# process multiple choice questions <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


#   rolling_count+=1
#   if random_question==rolling_count
#..............................................................................
#     question_string=<<-STRING
#     STRING
#     answer='yes'
#     answers=<<-STRING
#     STRING
#     result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
#   end

def multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)

  answer_string=answer
  answers_string=answers
  temp1=answers
  answers=temp1.split("\n")
  answers.shuffle!
  valid_answers=%w(a b c d x)
  puts "question number #{random_question}"
  puts "questions to go #{questions_to_go}"
  print_one_space
  puts question_string
  print_one_space

  puts "  a.)#{answers[0]}"
  answer='a' if answers[0]==answer
  puts "  b.)#{answers[1]}"
  answer='b' if answers[1]==answer
  puts "  c.)#{answers[2]}"
  answer='c' if answers[2]==answer
  puts "  d.)#{answers[3]}"
  answer='d' if answers[3]==answer
  puts '  x.)exit'

  print_one_space
  user_answer=gets.chomp

  if user_answer=='x'
    drill_status='exit'
    return result,drill_status
  end

  while !valid_answers.include?(user_answer)
    puts 'please choose a letter'
    user_answer=gets.chomp
  end
  if user_answer==answer
    puts '#=> right'
  else
    puts "#=> wrong, the answer is: #{answer}"
    result+=1
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
    file=File.open('../02 Questions/missed_questions','a')
    file.print save_question
    file.close
  end
  print_two_spaces
  return result,drill_status
end

#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# process coding test type questions <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

#   rolling_count+=1
#   if random_question==rolling_count
#..............................................................................
#     question_string=<<-STRING
#     STRING
#     answer=<<-STRING
#     STRING
#     result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
#   end

def coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)

  line=''
  input_string=''
  status='right'
  puts "question number #{random_question}"
  puts "questions to go #{questions_to_go}"
  puts
  puts question_string
  print_one_space

  until line==".\n"
    line=gets

    # re-enter code
    if line=="..\n"
      puts
      puts
      input_string=''
      line=''
    end
    break if line=="x\n"
    input_string<<line if line!=".\n"
  end

  if line=="x\n"
    drill_status='exit'
    return result,drill_status
  end

  if answer!=input_string
    puts
    puts '#=> wrong, the answer is:'
    puts
    puts answer
    status='wrong'
    result+=1
    save_question=<<-QSTRING
   rolling_count+=1
   if random_question==rolling_count
#..............................................................................
     question_string=<<-RSTRING
#{question_string} RSTRING
     answer=<<-RSTRING
#{answer} RSTRING
     result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
   end

    QSTRING

    save_question.gsub!("\#{","\\\#{")

    file=File.open('../02 Questions/missed_questions','a')
    file.print save_question
    file.close
  end

  puts '#=> right'  if status=='right'
  print_two_spaces
  return result,drill_status
end

#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# process coding II test type questions <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

#   rolling_count+=1
#   if random_question==rolling_count
#..............................................................................
#     question_string=<<-STRING
#     STRING
#     program_string=<<-STRING
#     STRING
#     result,drill_status=coding_testII(question_string,result,random_question,questions_to_go,drill_status,program_string)
#   end

def coding_testII(question_string,result,random_question,questions_to_go,drill_status,program_string)

  line=''
  input_string=''
  status='right'
  puts "question number #{random_question}"
  puts "questions to go #{questions_to_go}"
  puts "PROGRAMMING TYPE II QUESTION:"
  puts
  puts question_string
  print_one_space

  begin
    until line==".\n"
      line=gets

      # re-enter code
      if line=="..\n"
        puts
        puts
        input_string=''
        line=''
      end
      break if line=="x\n"
      input_string<<line if line!=".\n"
    end

    if line=="x\n"
      drill_status='exit'
      return result,drill_status
    end

########################################################################
    system('cls')
########################################################################
    puts '###############################'
    puts '#       YOUR ANSWER IS:       #'
    puts '###############################'
    puts
    eval(input_string)
    puts
  rescue Exception => exc
    puts '*** AN EXCEPTION WAS THROWN BUT RESCUED ***'
    puts
  end


  puts '###############################'
  puts '#    THE ANSWER SHOULD BE:    #'
  puts '###############################'
  puts
  eval(program_string)
  puts

  puts 'did your answer match up (y or n)'
  your_answer=gets.chomp

########################################################################
  system('cls')
########################################################################

  if your_answer=='n'
    puts
    result+=1
    save_question=<<-QSTRING
   rolling_count+=1
   if random_question==rolling_count
#..............................................................................
     question_string=<<-RSTRING
#{question_string} RSTRING
     program_string=<<-RSTRING
#{program_string} RSTRING
     result,drill_status=coding_testII(question_string,result,random_question,questions_to_go,drill_status,program_string)
   end
    QSTRING

    save_question.gsub!("\#{","\\\#{")

    file=File.open('../02 Questions/missed_questions','a')
    file.print save_question
    file.close
  end

  print_two_spaces
  return result,drill_status
end


#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# shuffle the questions thoroughly <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

def shuffle_questions(questions)
  100.times{questions.shuffle!}
  questions
end

#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# print out the results to the kata <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

def kata_results(result,number_of_questions)
  puts "you got #{result} wrong out of #{number_of_questions}"
  if result==0
    puts 'perfect kata!'
  end
end

#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# print heading of the kata's subject <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

def print_heading
  #.................................................................................
  puts '===========================> refactoring9 <================================'
  puts
  puts
end

#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# early exit of the drill <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# note: this is a method to process the unfinished and early exit of the drill

def early_drill_exit(questions,random_question,number_of_questions,questions_to_go,result,empty)

  # prepare questions array to save to questions file
  questions.unshift(random_question)
  questions<<number_of_questions
  questions<<questions_to_go
  questions<<result
  empty=true


  # open DRILL file and mark as being worked
  new_line=''
  file_name=File.open('../../textfiles/DRILLS.txt','r')
  while !file_name.eof?
    line=file_name.readline
    if line.include?('refactoring9.rb')
      end_of_line_index=line.index('.#')
      line.slice!(end_of_line_index+2..-1)
      to_go=questions_to_go.to_s.rjust(3,'0')
      time=Time.new
      date=time.strftime("%m.%d.%Y")
      line.insert(-1,"<=== working =#{to_go}=#{date}==\n")
      new_line<<line
    else
      new_line<<line
    end
  end
  file_name.close

  # save the new data to DRILL file
  file_name=File.open('../../textfiles/DRILLS.txt','w')
  file_name.puts new_line
  file_name.close

  return questions,empty
end

#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# update questions file <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

def update_questions_file(questions)
  file=File.open('questions_file','w')
  file.puts questions
  file.close
end


#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# update DRILLS file <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# notes: when the drill is complete the DRILLS file is updated

def update_drills_file(rolling_count,result)
  missed=12


# open file and update number of questions, how many times drilled, how many missed:
  new_line=''
  new_results=''
  new_data=''
  file_name=File.open('../../textfiles/DRILLS.txt','r')
  while !file_name.eof?
    line=file_name.readline
    if line.include?('refactoring9.rb')

      # mark done at end of line
      end_of_line_index=line.index('.#')
      line.slice!(end_of_line_index+2..-1)
      time=Time.new
      date=time.strftime("%m.%d.%Y")
      line.insert(-1,"<=== done =#{date}==\n")

      # increment times drilled
      times_drilled_index=line.index('d(')
      drill_number=line[times_drilled_index+2,3].to_i
      drill_number+=1
      new_drill_number=drill_number.to_s.rjust(3,'0')
      line.slice!(times_drilled_index+2,3)
      line.insert(times_drilled_index+2,new_drill_number)

      # update total number of questions
      number_of_questions_index=line.index('.(')
      quest_number=line[number_of_questions_index+2,3].to_i
      if rolling_count!=quest_number
        new_quest_number=rolling_count.to_s.rjust(3,'0')
        line.slice!(number_of_questions_index+2,3)
        line.insert(number_of_questions_index+2,new_quest_number)
      end

      # update drill results
      drill_results_index=line.index('wrong')
      line.slice!(drill_results_index-5,22)
      new_results<<'('<<result.to_s.rjust(3,'0')<<' wrong out of '<<rolling_count.to_s.rjust(3,'0')<<')'
      line.insert(drill_results_index-5,new_results)


      # update results data
      results_data_index=line.index('(low')
      recorded_low=line[results_data_index+5,3].to_i
      recorded_high=line[results_data_index+18,3].to_i
      recorded_low=result if recorded_low>result
      recorded_high=result if recorded_high<result
      line.slice!(results_data_index,22)
      new_data<<'(low:'<<recorded_low.to_s.rjust(3,'0')<<'.....high:'<<recorded_high.to_s.rjust(3,'0')<<')'
      line.insert(results_data_index,new_data)


      new_line<<line
    else
      new_line<<line
    end
  end
  file_name.close

# save the new data to file
  file_name=File.open('../../textfiles/DRILLS.txt','w')
  file_name.puts new_line
  file_name.close

end

#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# main program <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

file_status=File.zero?('questions_file')
if file_status==false
  file=File.open('questions_file','r')
  string=file.read
  file.close
  questions=string.split("\n")
  questions.each_with_index{|item,index| questions[index]=item.to_i}
  result=questions.pop
  questions_to_go=questions.pop
  number_of_questions=questions.pop
else
  result=0
  questions=Array.new(17){|index| index+1}
  number_of_questions=questions.count
  questions_to_go=number_of_questions+1
  questions=shuffle_questions(questions)
  questions.unshift(0)
end


drill_status=' '
empty=questions.empty?




while empty==false
  rolling_count=0
  random_question=questions.shift
  print_heading if random_question!=0

  #--------------------------------------------------------------------------------------------------------------
  # start of questions section ----------------------------------------------------------------------------------
  #--------------------------------------------------------------------------------------------------------------

  #=====================================================================================================================
  # case method ========================================================================================================
  #=====================================================================================================================

  rolling_count+=1
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
when we end up using a lot of if statements in our program what is a better
way to write this?
    STRING
    answer='using the case method'
    answers=<<-STRING
using the case method
using ternary
using in-line
using the block method
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
using the case method, refactor the following code:

code:......................if dice_roll==1
                             attack='miss'
                           elsif dice_roll==2
                             attack='miss'
                           elsif dice_roll==3
                             attack='miss'
                           else
                             attack='hit'
                           end
    STRING
    answer=<<-STRING
case dice_roll
when 1
  attack='miss'
when 2
  attack='miss'
when 3
  attack='miss'
else
  attack='hit'
end
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # general refactoring ================================================================================================
  #=====================================================================================================================

  rolling_count+=1
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
what is refactoring?
    STRING
    answer='rewriting code to make it better'
    answers=<<-STRING
rewriting code to make it better
re-calculating code
using methods
rewriting code in another language
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # if method ==========================================================================================================
  #=====================================================================================================================

  rolling_count+=1
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
when using an if method without an else, what is a better way to write
the code?
    STRING
    answer='using in-line'
    answers=<<-STRING
using in-line
using block
using ternary
using or equals
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # unless method ======================================================================================================
  #=====================================================================================================================

  rolling_count+=1
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
using the unless method, refactor the following code, use a block form
and keep the text 'character lives':

given...................health=10
                        if health!=0
                          print 'character lives'
                        end
    STRING
    answer=<<-STRING
unless health==0
  print 'character lives'
end
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
using the unless method in inline form, refactor the following code and
keep the text 'trap disarmed'

code:...................if dice_roll>4
                          puts 'trap disarmed'
                        end
    STRING
    answer=<<-STRING
puts 'trap disarmed' unless dice_roll<4
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
when using the unless method without an else, what is a better way to write
the code?
    STRING
    answer='using in-line'
    answers=<<-STRING
using in-line
using block
using ternary
using or equals
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
using the unless method, refactor the following code, keep the dice_roll>15
and write the code in block form:

given.....................dice_roll=10
                          if dice_roll>15
                            puts 'you kill the zombie'
                          else
                            puts 'the zombie kills you'
                          end
    STRING
    answer=<<-STRING
unless dice_roll>15
  puts 'the zombie kills you'
else
  puts 'you kill the zombie'
end
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # ||= operator =======================================================================================================
  #=====================================================================================================================

  rolling_count+=1
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
what is ||= called?
    STRING
    answer='or equals'
    answers=<<-STRING
or equals
or equals to
set variable to
set equals to
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
write a method that will check if a variable has been initialized. If not
then initialize the variable.

variable:................score
method:..................check_score
set to:..................0
    STRING
    answer=<<-STRING
def check_score(score)
  score||=0
end
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
when using the 'or equal' operator, what value must the variable contain
before its value is set by the statement?
    STRING
    answer='nil'
    answers=<<-STRING
nil
0
-1
EOF
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # ! operator =========================================================================================================
  #=====================================================================================================================

  rolling_count+=1
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
what is the '!' operator called?
    STRING
    answer='bang'
    answers=<<-STRING
bang
pow
blang
bling
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
sometimes we may need to use the not '!' to get the opposite of a given
statement. but this can make the statement confusing what is a better
option to using the '!' not operator?
    STRING
    answer='unless'
    answers=<<-STRING
unless
if
case
ternary
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # !! operator ========================================================================================================
  #=====================================================================================================================

  rolling_count+=1
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
what is the !! operator called?
    STRING
    answer='bang bang'
    answers=<<-STRING
bang bang
boom pow
shwing
ringa ding ding
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
create a method that will return the boolean value of a variable that has
been passed to the method using the !! operator.

method:..............................true?
variable:............................thing
    STRING
    answer=<<-STRING
def true?(thing)
  !!thing
end
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # ?: operator ========================================================================================================
  #=====================================================================================================================

  rolling_count+=1
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
what is the operator ?: called?
    STRING
    answer='ternary operator'
    answers=<<-STRING
ternary operator
guess what operator
what choice operator
choose one operator
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#.................................................................................
    question_string=<<-STRING
using the ternary method, refactor the following code:

code:.........................if choice==1
                                puts 'you leave the dungeon'
                              else
                                puts 'you go down a corridor'
                              end
    STRING
    answer=<<-STRING
puts choice==1 ? 'you leave the dungeon' : 'you go down a corridor'
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  #--------------------------------------------------------------------------------------------------------------
  # end of questions section ------------------------------------------------------------------------------------
  #--------------------------------------------------------------------------------------------------------------

  # check number of questions:
  if random_question==0
    if rolling_count!=number_of_questions
      puts "warning, check number of questions! should be:#{rolling_count}"
      pause_output
    end
  end



  if drill_status=='exit'
    questions,empty=early_drill_exit(questions,random_question,number_of_questions,questions_to_go,result,empty)
  else
    questions_to_go-=1
    empty=questions.empty?
  end

end



# update questions file
update_questions_file(questions)


if questions.empty?
  update_drills_file(rolling_count,result)
end



kata_results(result,number_of_questions)
pause_output