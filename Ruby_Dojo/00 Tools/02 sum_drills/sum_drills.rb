##################################################################################################################
#                                                                                                                #
# Program:......................sum_drills.rb                                                                    #
# Programmer:...................Harold Sy                                                                        #
# Description:..................this program allows me to sum the number of questions drilled, sum the number of #
#                               questions to go, sum the total number of errors made, record the least amount of #
#                               errors made and the greatest amount of errors made.                              #
# Kata subject..................not a kata but a tool.                                                           #
# Programmed:...................04/14/2022                                                                       #
# Last modified:................05/17/2022                                                                       #
# Modification notes:...........* 05/17/2022 added lines to process marks on the ProLanIn.txt (Programming       #
#                                 Language Inventory text file) to show when num of quest are added and when     #
#                                 missed goes up or down or stays the same to help track my progress.            #
#                                                                                                                #
##################################################################################################################
INVENTORY_FILE='../../../../02 text_files/ProLanInv.txt'
LANDMARK1="HAROLDS RUBY INVENTORY"
LANDMARK2='+ ======='

#================================================================================================================#
# programmer created methods ====================================================================================#
#================================================================================================================#

#-----------------------------------------------------------------#
# print message to user ------------------------------------------#
#-----------------------------------------------------------------#
def print_intro_message_to_user()
  puts 'this program sums the number of drill questions, sums the number'
  puts 'of questions to go, sums the errors made, records the least number'
  puts 'of errors made and the greatest number of errors made for ruby'
  puts 'on the inventory list. if this is what you want to do then hit enter...'
  w=gets.chomp
end


#-----------------------------------------------------------------#
# print completed message to user --------------------------------#
#-----------------------------------------------------------------#
def print_completed_message_to_user()
  puts 'Ruby Drills successfully summed!'
  wait=gets.chomp
end


#-----------------------------------------------------------------#
# count and replace totals ---------------------------------------#
#-----------------------------------------------------------------#
def count_and_replace_totals()
  
  total_questions=0
  total_missed=0
  total_lowest=0
  total_greatest=0
  total_to_go=0
  num_questions=[]
  questions_missed=[]
  lowest_missed=[]
  greatest_missed=[]
  questions_to_go=[]
  letter_grades=[]
  new_file=''
  
  # open file for reading
  read_file=File.open(INVENTORY_FILE,'r')

  # read to find "HAROLDS RUBY INVENTORY"
  while true
    line=read_file.readline
    break if line.include?(LANDMARK1)
    new_file<<line
  end

  # read and capture question count until + ======= is reached
  new_file<<line
  while true
    line=read_file.readline
    break if line.include?(LANDMARK2)
    if line.include?('(')
      string_index=line.index('(')
      num_questions<<line[string_index+1,3].to_i
      questions_missed<<line[string_index+32,3].to_i
      letter_grades<<line[string_index+38].to_s
      lowest_missed<<line[string_index+44,3].to_i
      greatest_missed<<line[string_index+62,3].to_i
      questions_to_go<<line[string_index+91,3].to_i
    end
    new_file<<line
  end

  # add up all the numbers
  num_questions.each do |q|
    total_questions+=q
  end
  questions_missed.each do |q|
    total_missed+=q
  end
  lowest_missed.each do |q|
    total_lowest+=q
  end
  greatest_missed.each do |q|
    total_greatest+=q
  end
  questions_to_go.each do |q|
    total_to_go+=q
  end
    
  # save line with + ======= and read next line
  new_file<<line
  line=read_file.readline

  # save new numbers
  string_index=line.index(/[1234567890]/)
  # num of quest:
  noq=(line[string_index..string_index+3]).to_i
  line[string_index..string_index+3]=total_questions.to_s.rjust(4,'0')
  if noq==total_questions
    line[string_index+6]='-'
  elsif noq<total_questions
    line[string_index+6]='>'
  elsif noq>total_questions
    line[string_index+6]='<'
  end
  # missed:
  m=(line[string_index+31..string_index+34]).to_i
  line[string_index+31..string_index+34]=total_missed.to_s.rjust(4,'0')
  if m==total_missed
    line[string_index+37]='-'
  elsif m<total_missed
    line[string_index+37]='>'
  elsif m>total_missed
    line[string_index+37]='<'
  end
  # lowest missed:
  line[string_index+43..string_index+46]=total_lowest.to_s.rjust(4,'0')
  # greatest missed:
  line[string_index+61..string_index+64]=total_greatest.to_s.rjust(4,'0')
  # quest to go
  line[string_index+90..string_index+93]=total_to_go.to_s.rjust(4,'0')
  new_file<<line

  # python inventory overall state
  overallstate=(((total_questions-total_missed)/(total_questions+0.0))*100).round
  if overallstate>=90
    grade='A'
  elsif overallstate>=80
    grade='B'
  elsif overallstate>=70
    grade='C'
  elsif overallstate>=60
    grade='D'
  else
    grade='F'
  end

  # read and save until we find RUBY INVENTORY OVERALL STATE
  while true
    line=read_file.readline
    break if line.include?('RUBY INVENTORY OVERALL STATE')
    new_file<<line
  end
  start_index=line.index('RUBY INVENTORY OVERALL STATE')
  line[start_index+35]=grade
  new_file<<line
  
  # read and save until we find 'A'
  while true
    line=read_file.readline
    break if line.include?('A')
    new_file<<line
  end
  start_index=line.index('A')
  line[start_index+5..start_index+7]=letter_grades.count('A').to_s.rjust(3,'0')
  new_file<<line

  # read and save until we find 'B'
  while true
    line=read_file.readline
    break if line.include?('B')
    new_file<<line
  end
  start_index=line.index('B')
  line[start_index+5..start_index+7]=letter_grades.count('B').to_s.rjust(3,'0')
  new_file<<line

  # read and save until we find 'C'
  while true
    line=read_file.readline
    break if line.include?('C')
    new_file<<line
  end
  start_index=line.index('C')
  line[start_index+5..start_index+7]=letter_grades.count('C').to_s.rjust(3,'0')
  new_file<<line

  # read and save until we find 'D'
  while true
    line=read_file.readline
    break if line.include?('D')
    new_file<<line
  end
  start_index=line.index('D')
  line[start_index+5..start_index+7]=letter_grades.count('D').to_s.rjust(3,'0')
  new_file<<line

  # read and save until we find 'F'
  while true
    line=read_file.readline
    break if line.include?('F')
    new_file<<line
  end
  start_index=line.index('F')
  line[start_index+5..start_index+7]=letter_grades.count('F').to_s.rjust(3,'0')
  new_file<<line

  # read and save until we find 'N'
  while true
    line=read_file.readline
    break if line.include?('N')
    new_file<<line
  end
  start_index=line.index('N')
  line[start_index+5..start_index+7]=letter_grades.count('N').to_s.rjust(3,'0')
  new_file<<line

  # read rest of the file and place in new_file
  while !read_file.eof?
    line=read_file.readline
    new_file<<line
  end
  read_file.close

  # open file for writing and save new file
  file_write=File.open(INVENTORY_FILE,'w')
  file_write.puts new_file
  file_write.close

end


#================================================================================================================#
# main program ==================================================================================================#
#================================================================================================================#



print_intro_message_to_user()
count_and_replace_totals()
print_completed_message_to_user()