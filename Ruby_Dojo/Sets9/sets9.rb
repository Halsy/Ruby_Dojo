##################################################################################################################
#                                                                                                                #
# Program:......................sets9.rb                                                                         #
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
#                               * 08/20/2019 added more information onto the DRILLS marked as working and done.  #
#                                 now the lines contain the number of questions to go and the current date.      #
#                                 drill is completed.                                                            #
#                               * 09/24/2019 added the ability to enter a program and have the interpreter run   #
#                                 it to come up with the answers that the user has to compare and mark if they   #
#                                 it right or wrong.                                                             #
#                               * 02/18/2020 programming II type questions have a tendency to crash when an error#
#                                 occurs in the source code that was typed in. exception handling had to be added#
#                                 to prevent the program from crashing.                                          #
#                                                                                                                #
##################################################################################################################
##                    header list:                                                                              ##
#                                 add method                                                                     #
#                                 difference method                                                              #
#                                 general set                                                                    #
#                                 include? method                                                                #
#                                 intersection method                                                            #
#                                 new method                                                                     #
#                                 proper_subset? method                                                          #
#                                 proper_superset? method                                                        #
#                                 require method                                                                 #
#                                 subset? method                                                                 #
#                                 superset? method                                                               #
#                                 to_set method                                                                  #
#                                 union method                                                                   #
#                                 [] method                                                                      #
#                                 & method                                                                       #
#                                 - method                                                                       #
#                                 + method                                                                       #
#                                 | method                                                                       #
#                                 < method                                                                       #
#                                 << method                                                                      #
#                                 <= method                                                                      #
#                                 == method                                                                      #
#                                 === method                                                                     #
#                                 > method                                                                       #
#                                 >= method                                                                      #
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
  puts '==============================> sets9 <==================================='
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
    if line.include?('sets9.rb')
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
    if line.include?('sets9.rb')

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
  questions=Array.new(102){|index| index+1}
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
  # add method =========================================================================================================
  #=====================================================================================================================

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to add an array to a set but dont use the << method

given......................a=Set[1,2,3]
add array..................[2,3]
#=>........................#<Set: {1, 2, 3, [2, 3]}>

    STRING
    answer=<<-STRING
require 'set'
a.add([2,3])
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to add a hash to a set but dont use the << method

given......................a=Set[1,2,3]
add hash...................{'a'=>'apple'}
#=>........................#<Set: {1, 2, 3, {"a"=>"apple"}}>

    STRING
    answer=<<-STRING
require 'set'
a.add({'a'=>'apple'})
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to add an item to a set but dont use the << method

given......................a=Set[1,2,3]
add item...................4
#=>........................#<Set: {1, 2, 3, 4}>

    STRING
    answer=<<-STRING
require 'set'
a.add(4)
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # difference method ==================================================================================================
  #=====================================================================================================================
  rolling_count+=1
  if random_question==rolling_count
    #..............................................................................
    question_string=<<-STRING
in Sets what is the alias for difference?
    STRING
    answer='-'
    answers=<<-STRING
-
+
/
%
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in Sets, write code to get the difference of two sets but dont use
the '-' method. dont forget to require Set!

given......................set1=Set[1,3,5]
     ......................set2=Set[1,5,9]
variable...................d
#=>........................#<Set: {3}>

    STRING
    answer=<<-STRING
require 'set'
d=set1.difference(set2)
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in Sets, write code to get the difference of a set and an array but dont use
the '-' method. dont forget to require Set!

given......................set1=Set['a','b','z']
     ......................array=['a','c']
variable...................d
#=>........................#<Set: {3}>

    STRING
    answer=<<-STRING
require 'set'
d=set1.difference(array)
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in Sets, write code to get the difference of a set and a range but dont use
the '-' method. dont forget to require Set!

given......................set1=Set[2,4,6,8]
     ......................(1..3)
variable...................d
#=>........................#<Set: {4, 6, 8}>

    STRING
    answer=<<-STRING
require 'set'
d=set1.difference(1..3)
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # general Set ========================================================================================================
  #=====================================================================================================================

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is a set?
    STRING
    answer='a collection of unordered values with no duplicates'
    answers=<<-STRING
a collection of unordered values with no duplicates
a collection of ordered values
a collection of key and value pairs
a collection of characters
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when wanting to use 'Set' what must we do to use it?
    STRING
    answer="to use Set we must 'require' it in our program"
    answers=<<-STRING
to use Set we must 'require' it in our program
to use Set we must 'include' it in our program
to use Set we must call it
to use Set we must use the set keyword
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what cant a Set contain?
    STRING
    answer='duplicates'
    answers=<<-STRING
duplicates
strings
symbols
mixed data
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-RSTRING
when working with sets, what must the first item be? see example:

example:..................require 'set'
                          variable=item1.union(item2)
    RSTRING
    answer='a set'
    answers=<<-RSTRING
a set
an array
a range
a hash
    RSTRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in sets, when we are doing comparisons, what can we compare with sets?
    STRING
    answer='only another set'
    answers=<<-STRING
only another set
arrays
hash
range
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # include? method ====================================================================================================
  #=====================================================================================================================

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the alias of include? in sets?
    STRING
    answer='==='
    answers=<<-STRING
===
=
==
<=>
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in sets, write code to check if the number 3 is in the set but dont
use the === method

given......................t=set[1,2,3]
variable...................answer
    STRING
    answer=<<-STRING
require 'set'
answer=t.include?(3)
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # intersection method ================================================================================================
  #=====================================================================================================================

  rolling_count+=1
  if random_question==rolling_count
    #..............................................................................
    question_string=<<-STRING
what is the alias of the 'intersection' method?
    STRING
    answer='&'
    answers=<<-STRING
&
-
|
+
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
get the intersection of the following but dont use the '&' method. dont
forget to require Set!

given......................set1=Set[1,3,5]
     ......................set2=Set[3,2,1]
variable...................v
#=>........................#<Set: {3,1}>

    STRING
    answer=<<-STRING
require 'set'
v=set1.intersection(set2)
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
get the intersection of the following but dont use the '&' method. dont
forget to require Set!

given......................set1=Set['a','b','z']
     ......................array=['a','b','c']
variable...................v
#=>........................#<Set: {'a','b'}>

    STRING
    answer=<<-STRING
require 'set'
v=set1.intersection(array)
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
get the intersection of the following but dont use the '&' method. dont
forget to require Set!

given......................set1=Set[2,4,6,8]
     ......................(1..3)
variable...................v
#=>........................#<Set: {2}>

    STRING
    answer=<<-STRING
require 'set'
v=set1.intersection(1..3)
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # new method =========================================================================================================
  #=====================================================================================================================

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when creating a set (and we already required 'Set') using the 'new' method',
what is required?
    STRING
    answer='parentheses ()'
    answers=<<-STRING
parentheses ()
braces[]
values
quotes ''
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to create a set using the 'new' method. dont forget to require Set!

values.....................1,2
variable...................v

    STRING
    answer=<<-STRING
require 'set'
v=Set.new([1,2])
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to create a set using the 'new' method. dont forget to require Set!

values.....................1,2,1
variable...................v

    STRING
    answer=<<-STRING
require 'set'
v=Set.new([1,2,1])
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to create a set using the 'new' method. dont forget to require Set!

values.....................1,'c',:s
variable...................v

    STRING
    answer=<<-STRING
require 'set'
v=Set.new([1,'c',:s])
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
    #..............................................................................
    question_string=<<-STRING
write code to create a set using the 'new' method. dont forget to require Set!

values.....................range from 1 to 5
variable...................v

    STRING
    answer=<<-STRING
require 'set'
v=Set.new(1..5)
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to create a set using the 'new' method. dont forget to require Set!

values.....................range from 1 to 5
variable...................v

    STRING
    answer=<<-STRING
require 'set'
v=Set.new(1..5)
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to create a set using the 'new' method with a block. dont forget
to require Set!

values.....................1,2,3
block......................multiply each number to itself
variable...................v, x

    STRING
    answer=<<-STRING
require 'set'
v=Set.new([1,2,3]){|x| x*x}
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
    #..............................................................................
    question_string=<<-STRING
when using the 'new' method to create Sets, what are the different ways we
can do this?
    STRING
    answer='([1,2]),(1..5),([1,2]){block}'
    answers=<<-STRING
([1,2]),(1..5),([1,2]){block}
([1,2]),(1..5),(1,2){block}
([1,2]),(1..5),([1..5]){block}
([1,2]),([1..5]),([1,2]){block}
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # proper_subset? method ==============================================================================================
  #=====================================================================================================================

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what does the 'proper_subset?' method do?
    STRING
    answer='it checks if a set is a proper subset of a superset'
    answers=<<-STRING
it checks if a set is a proper subset of a superset
it checks if both sets are equal
it checks if one set is less than another set
it checks if one set is larger than another set
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
which item is a proper subset of the superset?

superset....................{1,3,5}

    STRING
    answer='{1,5}'
    answers=<<-STRING
{1,5}
{1,3,5}
{1,4}
{0}
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to check if a set is a proper subset of a superset but do not use
'<' method and do not forget to require set!

given................a=Set[1,3,5]
     ................b=Set[1,5]
variable.............answer
#=>..................true

    STRING
    answer=<<-STRING
require 'set'
answer=b.proper_subset?(a)
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'proper_subset?' method what goes before the .proper_subset? ?

example.................a=Set[1,3,5]
                        b=Set[1,5]
                        answer=b.proper_subset?(a)

    STRING
    answer='the subset'
    answers=<<-STRING
the subset
the superset
the real set
the combined set
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the 'proper_subset?' method what comes after the .proper_subset? ?

example.................a=Set[1,3,5]
                        b=Set[1,5]
                        answer=b.proper_subset?(a)

    STRING
    answer='the superset'
    answers=<<-STRING
the subset
the superset
the real set
the combined set
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # proper_superset? method ============================================================================================
  #=====================================================================================================================

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in sets, what is the definition of a proper superset?
    STRING
    answer='contains the same elements as the subset but not all'
    answers=<<-STRING
contains the same elements as the subset but not all
contains the same elements as the subset including all
contains none of the elements of the subset
contains one of the elements of the subset
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in sets, when using the > for proper superset, what goes before the >?
    STRING
    answer='the superset'
    answers=<<-STRING
the superset
the subset
the proper subset
the element
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in sets, when using the proper_superset? method, what goes before the
proper_superset?
    STRING
    answer='the superset'
    answers=<<-STRING
the superset
the subset
the proper subset
element
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the alias of > in sets?
    STRING
    answer='proper_superset?'
    answers=<<-STRING
proper_superset?
superset?
subset?
proper_subset?
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to check if a superset is a proper superset of a subset in
sets but dont use the > method

given.........................a=set[1,3,5]
                              b=set[1,5]
variable......................answer
    STRING
    answer=<<-STRING
require 'set'
answer=a.proper_superset?(b)
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in sets, when using the proper_superset? method, what goes after
the proper_superset?
    STRING
    answer='the subset'
    answers=<<-STRING
the subset
the superset
the proper superset
element
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # require method =====================================================================================================
  #=====================================================================================================================

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to use Set in our programs
    STRING
    answer=<<-STRING
require 'set'
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # subset? method =====================================================================================================
  #=====================================================================================================================

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in sets, what comes after the subset? method?
    STRING
    answer='the superset'
    answers=<<-STRING
the subset
the superset
the proper subset
the proper superset
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in sets, what comes before the subset? method?
    STRING
    answer='the subset'
    answers=<<-STRING
the subset
the superset
the proper subset
the proper superset
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to check if a set is a subset of a superset but do not use the
<= method

given......................a=Set[1,3,5]
                           b=Set[1,5]
variable...................answer
#=>........................true

    STRING
    answer=<<-STRING
require 'set'
answer=b.subset?(a)
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the definition of a subset?
    STRING
    answer='contains only items from the superset including all'
    answers=<<-STRING
contains only items from the superset including all
contains only items from the superset but not all
contains no items from the superset
contains one item from the superset
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the alias for <=?
    STRING
    answer='subset'
    answers=<<-STRING
subset
superset
proper subset
union
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # superset? method ===================================================================================================
  #=====================================================================================================================
  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in sets, write code to check if a set is a superset of a subset but
dont use the >= method and remember to require 'set'.

given....................a=Set[1,2,3]
                         b=Set[1,2,3]
variable.................answer
    STRING
    answer=<<-STRING
require 'set'
answer=a.superset?(b)
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in sets, what is the definition of a superset?
    STRING
    answer='contains only items from the subset including all'
    answers=<<-STRING
contains only items from the subset including all
contains no items from the subset
contains some items from the subset but not all
contains only even items
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in sets, what is the alias for >=?
    STRING
    answer='superset?'
    answers=<<-STRING
superset?
subset?
proper_subset?
proper_superset?
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in sets, when using the superset? method, what goes before
the superset?
    STRING
    answer='the superset'
    answers=<<-STRING
the superset
the proper superset
the proper subset
the subset
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in sets, when using the superset? method, what goes after the superset?
    STRING
    answer='the subset'
    answers=<<-STRING
the subset
the proper subset
the superset
the proper superset
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # to_set method ======================================================================================================
  #=====================================================================================================================
  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to convert an array to a set. dont forget to require set!

given................survey=[1,2,7,3]
variable.............set_answer
#=>..................#<Set: {1,2,7,3}>

    STRING
    answer=<<-STRING
require 'set'
set_answer=survey.to_set
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
how do we convert an array to a set?
    STRING
    answer='use to_set method'
    answers=<<-STRING
use to_set method
use to_s method
use %s method
use /s method
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # union method =======================================================================================================
  #=====================================================================================================================

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in sets what does the union method do?
    STRING
    answer='puts two sets together with no duplicates'
    answers=<<-STRING
puts two sets together with no duplicates
puts two sets together
combines two sets together
merges two sets together
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to get a union of two sets but dont use '|' and dont forget
to require set!

given................survey1=Set[1,2,3]
     ................survey2=Set[2,4,5]
variable.............survey_compiled
#=>..................#<Set: {1, 2, 3, 4, 5}>

    STRING
    answer=<<-STRING
require 'set'
survey_compiled=survey1.union(survey2)
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to get a union of a set and a range but dont use '|' and
dont forget to require set!

given................survey1=Set[1,5,'z']
range................(1..6)
variable.............survey_compiled
#=>..................#<Set: {1,5,'z',2,3,4,6}>

    STRING
    answer=<<-STRING
require 'set'
survey_compiled=survey1.union(1..6)
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to get a union of a set and an array but dont use '|' and
dont forget to require set!

given................survey1=Set[1,5,8]
     ................array_survey2=[2,6,7,3]
variable.............survey_compiled
#=>..................#<Set: {1, 5, 8, 2, 6, 7, 3}>

    STRING
    answer=<<-STRING
require 'set'
survey_compiled=survey1.union(array_survey2)
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end


  #=====================================================================================================================
  # [] method ==========================================================================================================
  #=====================================================================================================================

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to create a set using '[]'. dont forget to require Set!

values.....................1,2
variable...................v

    STRING
    answer=<<-STRING
require 'set'
v=Set[1,2]
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to create a set using '[]'. dont forget to require Set!

values.....................1,2,1
variable...................v

    STRING
    answer=<<-STRING
require 'set'
v=Set[1,2,1]
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to create a set using '[]'. dont forget to require Set!

values.....................1,'c',:s
variable...................v

    STRING
    answer=<<-STRING
require 'set'
v=Set[1,'c',:s]
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # & method ===========================================================================================================
  #=====================================================================================================================

  rolling_count+=1
  if random_question==rolling_count
    #..............................................................................
    question_string=<<-STRING
what does the '&' return in Sets?
    STRING
    answer='intersection'
    answers=<<-STRING
intersection
difference
union
concatenation
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
    #..............................................................................
    question_string=<<-STRING
what is the alias of '&'?
    STRING
    answer='intersection'
    answers=<<-STRING
intersection
difference
union
concatenation
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
get the intersection of the following but dont use the 'intersection'
method. dont forget to require Set!

given......................set1=Set[1,3,5]
     ......................set2=Set[3,2,1]
variable...................v
#=>........................#<Set: {3,1}>

    STRING
    answer=<<-STRING
require 'set'
v=set1&set2
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
get the intersection of the following but dont use the 'intersection'
method. dont forget to require Set!

given......................set1=Set['a','b','z']
     ......................array=['a','b','c']
variable...................v
#=>........................#<Set: {'a','b'}>

    STRING
    answer=<<-STRING
require 'set'
v=set1&array
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
    #..............................................................................
    question_string=<<-STRING
what, other than another set can we get the intersection of with a set?
    STRING
    answer='an array and a range'
    answers=<<-STRING
an array and a range
a hash and an array
a string and a hash
a range and a string
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
get the intersection of the following but dont use the 'intersection'
method. dont forget to require set!

given.......................set1=Set[2,4,6,8]
     .......................(1..3)
variable....................v
#=>.........................#<Set: {2}>
    STRING
    answer=<<-STRING
require 'set'
v=set1&(1..3)
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
end

  #=====================================================================================================================
  # - method ===========================================================================================================
  #=====================================================================================================================

  rolling_count+=1
  if random_question==rolling_count
    #..............................................................................
    question_string=<<-STRING
in Sets what does the '-' return?
    STRING
    answer='difference'
    answers=<<-STRING
difference
union
minus
intersection
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in Sets, write code to get the difference of two sets but dont use
the 'difference' method. dont forget to require Set!

given......................set1=Set[1,3,5]
     ......................set2=Set[1,5,9]
variable...................d
#=>........................#<Set: {3}>

    STRING
    answer=<<-STRING
require 'set'
d=set1-set2
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in Sets, write code to get the difference of a set and an array but dont use
the 'difference' method. dont forget to require Set!

given......................set1=Set['a','b','z']
     ......................array=['a','c']
variable...................d
#=>........................#<Set: {'b','z'}>

    STRING
    answer=<<-STRING
require 'set'
d=set1-array
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in Sets, write code to get the difference of a set and a range but dont use
the 'difference' method. dont forget to require Set!

given......................set1=Set[2,4,6,8]
     ......................(1..3)
variable...................d
#=>........................#<Set: {4, 6, 8}>

    STRING
    answer=<<-STRING
require 'set'
d=set1-(1..3)
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
    #..............................................................................
    question_string=<<-STRING
other than another set what can we take the difference of from a set?
    STRING
    answer='an array and a range'
    answers=<<-STRING
an array and a range
a hash and an array
a string and a hash
a range and a string
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
    #..............................................................................
    question_string=<<-STRING
when we are finding the difference in a set, how should we think about it?

example:....................set1=Set[1,2,3]
                            set2=Set[2,3,5]
                            d=set1-set2
                            #=> #<Set: {1}>
    STRING
    answer='we are subtracting items in set2 from set1 and the final answer'
    answers=<<-STRING
we are subtracting items in set2 from set1 and the final answer
we are looking for the difference between the two sets
we are looking for the same items in the two sets
we are doing subtraction
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # + method ===========================================================================================================
  #=====================================================================================================================

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in sets what is the '+' method used for?
    STRING
    answer='alias for union'
    answers=<<-STRING
alias for union
for addition
for concatenation
for merging
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # | method ===========================================================================================================
  #=====================================================================================================================

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in sets what does the '|' method stand for?
    STRING
    answer='it is an alias for union'
    answers=<<-STRING
it is an alias for union
it is the pipe operator
it is the modulus operator
merges two things together
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to get a union of two sets but dont use 'union' and dont forget
to require set!

given................survey1=Set[1,2,3]
     ................survey2=Set[2,4,5]
variable.............survey_compiled
#=>..................#<Set: {1, 2, 3, 4, 5}>

    STRING
    answer=<<-STRING
require 'set'
survey_compiled=survey1|survey2
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to get a union of a set and a range but dont use 'union' and
dont forget to require set!

given................survey1=Set[1,5,'z']
range................(1..6)
variable.............survey_compiled
#=>..................#<Set: {1,5,'z',2,3,4,6}>

    STRING
    answer=<<-STRING
require 'set'
survey_compiled=survey1|(1..6)
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to get a union of a set and an array but dont use 'union' method
and dont forget to require set!

given................survey1=Set[1,5,8]
     ................array_survey2=[2,6,7,3]
variable.............survey_compiled
#=>..................#<Set: {1, 5, 8, 2, 6, 7, 3}>

    STRING
    answer=<<-STRING
require 'set'
survey_compiled=survey1|array_survey2
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in sets, other than two sets being joined in union what other data types
can be joined?
    STRING
    answer='arrays and ranges'
    answers=<<-STRING
arrays and ranges
hashes and arrays
strings and ranges
arrays and strings
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # < method ===========================================================================================================
  #=====================================================================================================================

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is a proper subset in sets?
    STRING
    answer='a set that contains only items from the superset but not all'
    answers=<<-STRING
a set that contains only items from the superset but not all
a set that contains all of the items that are in the superset
a set that contains only one of the items from the superset
a set that is equal to the superset
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when comparing sets, what must a proper subset be?
    STRING
    answer='a set'
    answers=<<-STRING
a set
an array
a hash
a range
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what does the '<' method do in sets?
    STRING
    answer='it checks if a set is a proper subset of a superset'
    answers=<<-STRING
it checks if a set is a proper subset of a superset
it checks if both sets are equal
it checks if one set is less than another set
it checks if one set is larger than another set
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end


  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to check if a set is a proper subset of a superset but do not use
the 'proper_subset?' method and do not forget to require set!

given................a=Set[1,3,5]
     ................b=Set[1,5]
variable.............answer
#=>..................true

    STRING
    answer=<<-STRING
require 'set'
answer=b<(a)
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the '<' method for proper subset what goes before the < ?

example.................a=Set[1,3,5]
                        b=Set[1,5]
                        answer=b<(a)

    STRING
    answer='the subset'
    answers=<<-STRING
the subset
the superset
the real set
the combined set
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
when using the '<' method for proper subset what comes after the < ?

example.................a=Set[1,3,5]
                        b=Set[1,5]
                        answer=b<(a)

    STRING
    answer='the superset'
    answers=<<-STRING
the subset
the superset
the real set
the combined set
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # << method ==========================================================================================================
  #=====================================================================================================================

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the alias for << in sets?
    STRING
    answer='add'
    answers=<<-STRING
add
shovel
insert
concatenate
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the alias for add in sets?
    STRING
    answer='<<'
    answers=<<-STRING
<<
+
include
++
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
using the add or << methods on sets, what can we add to a set?
    STRING
    answer='a single item, array, hash, and range'
    answers=<<-STRING
a single item, array, hash, and range
a single item
array
hash
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to add an array to a set but dont use the add method

given......................a=Set[1,2,3]
add array..................[2,3]
#=>........................#<Set: {1, 2, 3, [2, 3]}>

    STRING
    answer=<<-STRING
require 'set'
a<<([2,3])
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to add a hash to a set but dont use the add method

given......................a=Set[1,2,3]
add hash...................{'a'=>'apple'}
#=>........................#<Set: {1, 2, 3, {"a"=>"apple"}}>

    STRING
    answer=<<-STRING
require 'set'
a<<({'a'=>'apple'})
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to add an item to a set but dont use the add method

given......................a=Set[1,2,3]
add item...................4
#=>........................#<Set: {1, 2, 3, 4}>

    STRING
    answer=<<-STRING
require 'set'
a<<(4)
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
end

  #=====================================================================================================================
  # <= method ==========================================================================================================
  #=====================================================================================================================
  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the alias for subset?
    STRING
    answer='<='
    answers=<<-STRING
<=
=>
<
==
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to check if a set is a subset of a superset but do not use the
subset? method

given......................a=Set[1,3,5]
                           b=Set[1,5]
variable...................answer
#=>........................true

    STRING
    answer=<<-STRING
require 'set'
answer=b<=(a)
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in sets, what comes before the <= method?
    STRING
    answer='the subset'
    answers=<<-STRING
the subset
the superset
the proper subset
the proper superset
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in sets, what comes after the <= method?
    STRING
    answer='the superset'
    answers=<<-STRING
the subset
the superset
the proper subset
the proper superset
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # == method ==========================================================================================================
  #=====================================================================================================================

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to check if both sets are equal

given.......................set1=Set.new([1,2])
                            set2=Set.new([2,1])
variable....................answer
#=>.........................true
    STRING
    answer=<<-STRING
require 'set'
answer=set1==set2
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in sets, what do we use the == method for?
    STRING
    answer='comparing two sets for equality'
    answers=<<-STRING
comparing two sets for equality
comparing two sets for size
comparing two sets for id
comparing two sets for type
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  #=====================================================================================================================
  # === method =========================================================================================================
  #=====================================================================================================================

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the alias of === in sets?
    STRING
    answer='include?'
    answers=<<-STRING
include?
equal?
eql?
empty?
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in sets, write code to check if the number 2 is in the set but dont use
the include? method and remember to require 'set'

given.....................s=Set[1,2,3]
variable..................answer
    STRING
    answer=<<-STRING
require 'set'
answer=s===(2)
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
end

  #=====================================================================================================================
  # > method ===========================================================================================================
  #=====================================================================================================================

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in sets, when using the > for proper superset, what goes after the >?
    STRING
    answer='the subset'
    answers=<<-STRING
the subset
the proper superset
element
the proper subset
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
what is the alias for proper superset in sets?
    STRING
    answer='>'
    answers=<<-STRING
>
>=
===
<=>
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
write code to check if a set is a proper superset of a subset but
dont use the proper_superset? method.

given......................a=Set[1,2,3]
                           b=Set[1,3]
variable...................answer
    STRING
    answer=<<-STRING
require 'set'
answer=a>(b)
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
end

  #=====================================================================================================================
  # >= method ==========================================================================================================
  #=====================================================================================================================

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in sets, write code to check if a set is a superset of a subset but
dont use the superset? method

given..................a=set[1,3,5]
                       b=set[1,5]
variable...............answer
    STRING
    answer=<<-STRING
require 'set'
answer=a>=(b)
    STRING
    result,drill_status=coding_test(question_string,answer,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in sets, what is the alias for superset?
    STRING
    answer='>='
    answers=<<-STRING
>=
=<
<=
===
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in sets, when using the >= for superset? what goes before the
>=?
    STRING
    answer='the superset'
    answers=<<-STRING
the superset
the subset
the proper subset
the proper superset
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
  end

  rolling_count+=1
  if random_question==rolling_count
#..............................................................................
    question_string=<<-STRING
in sets, when using the >= for superset? what goes after the >=?
    STRING
    answer='the subset'
    answers=<<-STRING
the subset
the superset
the proper subset
the proper superset
    STRING
    result,drill_status=multiple_choice(question_string,answer,answers,result,random_question,questions_to_go,drill_status)
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