##################################################################################################################
#                                                                                                                #
# Program:......................coding_kata.rb                                                                   #
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
#                                 abbreviate                                                                     #
#                                 abbreviate_sentence                                                            #
#                                 addition_sequence                                                              #
#                                 adjacent_sum                                                                   #
#                                 adults                                                                         #
#                                 ae_count                                                                       #
#                                 all_else_equal                                                                 #
#                                 alternate_case                                                                 #
#                                 anagrams?                                                                      #
#                                 are_coprime                                                                    #
#                                 array_builder                                                                  #
#                                 array_diff                                                                     #
#                                 array_substring                                                                #
#                                 array_translate                                                                #
#                                 average_of_four                                                                #
#                                 average_of_three                                                               #
#                                 bubble_sort                                                                    #
#                                 ceasar_string_cipher                                                           #
#                                 camel_to_snake                                                                 #
#                                 cap_vowels                                                                     #
#                                 cat_builder                                                                    #
#                                 caesar_word_cipher                                                             #
#                                 censor                                                                         #
#                                 clever_characters                                                              #
#                                 collapse_string                                                                #
#                                 combinations                                                                   #
#                                 common_factors                                                                 #
#                                 common_prime_factors                                                           #
#                                 consonant_cancel                                                               #
#                                 copy_machine                                                                   #
#                                 correct_hash                                                                   #
#                                 count_adjacent_sums                                                            #
#                                 count_inner_element                                                            #
#                                 count_of_letter                                                                #
#                                 count_repeats                                                                  #
#                                 count_scores                                                                   #
#                                 cryptic_conversion                                                             #
#                                 diff_array_len                                                                 #
#                                 disemvowel                                                                     #
#                                 divisible_by_five_pair_sum                                                     #
#                                 does_key_exist                                                                 #
#                                 double_letter_count                                                            #
#                                 doubler                                                                        #
#                                 dynamic_fizz_buzz                                                              #
#                                 echo                                                                           #
#                                 element_count                                                                  #
#                                 element_replace                                                                #
#                                 element_times_index                                                            #
#                                 even_caps                                                                      #
#                                 even_nums                                                                      #
#                                 every_other_word                                                               #
#                                 factor_array                                                                   #
#                                 factorial                                                                      #
#                                 factors_of                                                                     #
#                                 favorite_word                                                                  #
#                                 fib                                                                            #
#                                 fibonacci                                                                      #
#                                 fibonacci_II                                                                   #
#                                 fibonacci_sequence                                                             #
#                                 first_and_last                                                                 #
#                                 first_half                                                                     #
#                                 first_in_array                                                                 #
#                                 first_last_cap                                                                 #
#                                 first_n_primes                                                                 #
#                                 fizz_buzz                                                                      #
#                                 format_name                                                                    #
#                                 frequent_letters                                                               #
#                                 get_double_age                                                                 #
#                                 get_full_name                                                                  #
#                                 goodbye                                                                        #
#                                 greatest_common_factor                                                         #
#                                 greatest_factor_array                                                          #
#                                 hand_score                                                                     #
#                                 has_all_vowels                                                                 #
#                                 has_favorite_food                                                              #
#                                 hash_size                                                                      #
#                                 hash_to_pairs                                                                  #
#                                 highest_Score                                                                  #
#                                 hipsterfy                                                                      #
#                                 in_all_strings                                                                 #
#                                 in_pig_latin                                                                   #
#                                 isSorted                                                                       #
#                                 is_anagram_with_dups                                                           #
#                                 is_factor_of                                                                   #
#                                 is_inside                                                                      #
#                                 is_palindrome                                                                  #
#                                 is_power_of_two                                                                #
#                                 is_prime                                                                       #
#                                 is_prime2                                                                      #
#                                 is_unique_anagram                                                              #
#                                 is_valid_email                                                                 #
#                                 is_valid_name                                                                  #
#                                 isogram_matcher                                                                #
#                                 laligat_array                                                                  #
#                                 last_index                                                                     #
#                                 lcm                                                                            #
#                                 letter_count                                                                   #
#                                 long_word_count                                                                #
#                                 longest_bigram                                                                 #
#                                 longest_letter_streak                                                          #
#                                 longest_word                                                                   #
#                                 lucky_sevens                                                                   #
#                                 magic_cipher                                                                   #
#                                 magic_numbers                                                                  #
#                                 map_by_key                                                                     #
#                                 map_by_name                                                                    #
#                                 max_adjacent_sum                                                               #
#                                 max_pair_product                                                               #
#                                 max_value                                                                      #
#                                 min_max_difference                                                             #
#                                 mind_Ps_and_Qs                                                                 #
#                                 mirror_array                                                                   #
#                                 more_dot_less_dash                                                             #
#                                 morse_code                                                                     #
#                                 most_vowels                                                                    #
#                                 my_index                                                                       #
#                                 my_transpose                                                                   #
#                                 my_unique                                                                      #
#                                 nearest_larger                                                                 #
#                                 negative_sum                                                                   #
#                                 next_two_primes                                                                #
#                                 nick_name                                                                      #
#                                 no_numerals                                                                    #
#                                 no_repeats                                                                     #
#                                 number_primes                                                                  #
#                                 o_words                                                                        #
#                                 odd_ones_out                                                                   #
#                                 odd_range                                                                      #
#                                 odd_words_out                                                                  #
#                                 oddball_sum                                                                    #
#                                 opposing_sums                                                                  #
#                                 opposite_count                                                                 #
#                                 ordered_vowels                                                                 #
#                                 pair_product                                                                   #
#                                 pairs_to_string                                                                #
#                                 passing_students                                                               #
#                                 peak_finder                                                                    #
#                                 perfect_square?                                                                #
#                                 pick_primes                                                                    #
#                                 pig_latin_word                                                                 #
#                                 pig_latinize                                                                   #
#                                 potent_product                                                                 #
#                                 power_sequence                                                                 #
#                                 previous_prime_array                                                           #
#                                 prime?                                                                         #
#                                 prime_factors                                                                  #
#                                 print_reverse                                                                  #
#                                 pyramid_scheme                                                                 #
#                                 pyramid_sum                                                                    #
#                                 range                                                                          #
#                                 remove_nth_letter                                                              #
#                                 repeated_chars                                                                 #
#                                 retrieve_values                                                                #
#                                 reverb                                                                         #
#                                 reverse_hipsterfy                                                              #
#                                 reverse_range                                                                  #
#                                 reverse_sentence                                                               #
#                                 reverse_string                                                                 #
#                                 reverse_words                                                                  #
#                                 rotate_array                                                                   #
#                                 royal_we                                                                       #
#                                 safe_speed_change                                                              #
#                                 same_char_collapse                                                             #
#                                 second_largest                                                                 #
#                                 select_long_words                                                              #
#                                 select_odds                                                                    #
#                                 select_upcase_keys                                                             #
#                                 shift_chars                                                                    #
#                                 shopping_cart_cost                                                             #
#                                 sign_flip_count                                                                #
#                                 silly_cipher                                                                   #
#                                 smallest_Prime                                                                 #
#                                 snake_to_camel                                                                 #
#                                 sneaky_sentence                                                                #
#                                 split_half_array                                                               #
#                                 stock_picker                                                                   #
#                                 string_Range                                                                   #
#                                 sum_2d_array                                                                   #
#                                 sum_elements                                                                   #
#                                 sum_of_n_primes                                                                #
#                                 summation_sequence                                                             #
#                                 tally_count                                                                    #
#                                 three_in_a_row                                                                 #
#                                 three_increasing                                                               #
#                                 three_unique_vowels                                                            #
#                                 titleize                                                                       #
#                                 to_feet                                                                        #
#                                 to_initials                                                                    #
#                                 trifling_triplet                                                               #
#                                 triple_sequence                                                                #
#                                 triplet_sum                                                                    #
#                                 troublesome_translate                                                          #
#                                 two_d_sum                                                                      #
#                                 two_d_translate                                                                #
#                                 two_diff                                                                       #
#                                 two_dimensional_size                                                           #
#                                 uncompress_string                                                              #
#                                 unique_elements                                                                #
#                                 upcased                                                                        #
#                                 user_names                                                                     #
#                                 value_counter                                                                  #
#                                 value_pair                                                                     #
#                                 vigenere_cipher                                                                #
#                                 vowel_cipher                                                                   #
#                                 vowelize                                                                       #
#                                 whisper_words                                                                  #
#                                 winning_hand                                                                   #
#                                 wonky_coins                                                                    #
#                                 word_Sandwich                                                                  #
#                                 word_lengths                                                                   #
#                                 word_periods                                                                   #
#                                 word_unscrambler                                                               #
#                                 word_yeller                                                                    #
#                                 yell                                                                           #
#                                 yell_II                                                                        #
#                                 yell_sentence                                                                  #
#                                 zip_array                                                                      #
##################################################################################################################



##################################################################################################################
# global variables                                                                                               #
##################################################################################################################
TITLE=                'coding_kata'                                            # title for header
MISSED_QUESTIONS_FILE='../00 Tools/01 missed_questions/missed_questions'       # file containing missed questions
DRILLS_TEXT_FILE=     '../text_files/ProLanInv.txt'                            # text file to record drills metrics
DRILL_NAME=           '97 coding_kata'                                         # name of this drill
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
  questions=Array.new(217){|index| index+1}                                                                      #
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




#====================================================================================================================#
# abbreviate ========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'1'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function `abbreviate(sentence)` that takes in a sentence string and      #
# returns a new sentence where words longer than 4 characters have their vowels    #
# removed. Assume the sentence has all lowercase characters. Feel free to use the  #
# array below in your solution:                                                    #
#                                                                                  #
#           vowels = ['a', 'e', 'i', 'o', 'u']                                     #
#                                                                                  #
# Examples:                                                                        #
#           abbreviate('bootcamp prep is fun')        => 'btcmp prep is fun'       #
#           abbreviate('programming is fantastic')    => 'prgrmmng is fntstc'      #
#           abbreviate('hello world')                 => 'hll wrld'                #
#           abbreviate('how are you')                 => 'how are you'             #
#                                                                                  #
# answers should be:                                                               #
#            => 'btcmp prep is fun'                                                #
#            => 'prgrmmng is fntstc'                                               #
#            => 'hll wrld'                                                         #
#            => 'how are you'                                                      #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts abbreviate('bootcamp prep is fun')
puts abbreviate('programming is fantastic')
puts abbreviate('hello world')
puts abbreviate('how are you')

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def abbreviate(string)
  vowels='aeiou'
  array_of_words=string.split
  array_of_words.each_with_index do |word,index|
      if word.length>4
          string=''
          word.each_char do |character|
              string+=character if !vowels.include?(character)
          end
          array_of_words[index]=string
      end
  end
  return array_of_words.join(' ')
end
puts abbreviate('bootcamp prep is fun')
puts abbreviate('programming is fantastic')
puts abbreviate('hello world')
puts abbreviate('how are you')
  STRING
  answer_string=<<-STRING
'btcmp prep is fun'
'prgrmmng is fntstc'
'hll wrld'
'how are you'
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# abbreviate_sentence ===============================================================================================#
#====================================================================================================================#

rolling_count+=1
'2'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method abbreviate_sentence that takes in a sentence string and returns   #
# a new sentence where every word longer than 4 characters has all of it's vowels  #
# removed.                                                                         #
#                                                                                  #
# example:                                                                         #
#          abbreviate_sentence("follow the yellow brick road")                     #
#          abbreviate_sentence("what a wonderful life")                            #
#                                                                                  #
# answers should be:                                                               #
#            => "fllw the yllw brck road"                                          #
#            => "what a wndrfl life"                                               #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts abbreviate_sentence("follow the yellow brick road")
puts abbreviate_sentence("what a wonderful life")

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def abbreviate_sentence(string)
  new_string=''
  vowels='aeiou'
  array_of_words=string.split
  array_of_words.each_with_index do |word,index|
      if word.length>4
          new_string=''
          word.each_char do |character|
              new_string+=character if !vowels.include?(character)
          end
          array_of_words[index]=new_string
      end
  end
  return array_of_words.join(' ')
end
puts abbreviate_sentence("follow the yellow brick road")
puts abbreviate_sentence("what a wonderful life")
  STRING
  answer_string=<<-STRING
"fllw the yllw brck road"
"what a wndrfl life"
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# addition_sequence =================================================================================================#
#====================================================================================================================#

rolling_count+=1
'3'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method `addition_sequence(array, seq)` that takes in an array of numbers #
# and a sequence of numbers. The function should return a new array where numbers  #
# of the original array are added to the numbers in the sequence. See the          #
# following example.                                                               #
#                                                                                  #
#          array = [3, 2, 5, 4, 2, 1, 10]                                          #
#          sequence = [2, 4, 6]                                                    #
#          array:    3 2 5 4 2 1 10                                                #
#          sequence: 2 4 6 2 4 6  2                                                #
#          result:   5 6 11 6 6 7 12                                               #
#                                                                                  #
#  Examples:                                                                       #
#            arr1 = [3, 2, 5, 4, 2, 1, 10]                                         #
#            seq1 = [2, 4, 6]                                                      #
#            addition_sequence(arr1, seq1)                                         #
#                                                                                  #
#            arr2 = [1, 2, 3, 4, 5, 6, 7]                                          #
#            seq2 = [1, 2]                                                         #
#            addition_sequence(arr2, seq2)                                         #
#                                                                                  #
# answers should be:                                                               #
#            => [ 5, 6, 11, 6, 6, 7, 12                                            #
#            => [ 2, 4, 4, 6, 6, 8, 8 ]                                            #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

arr1 = [3, 2, 5, 4, 2, 1, 10]
seq1 = [2, 4, 6]
puts addition_sequence(arr1, seq1)
arr2 = [1, 2, 3, 4, 5, 6, 7]
seq2 = [1, 2]
puts addition_sequence(arr2, seq2)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: HARD (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def addition_sequence(array,seq)
  array.each_with_index do |element,index|
      array[index]=element+seq[index%seq.length]
  end
  return array
end
arr1 = [3, 2, 5, 4, 2, 1, 10]
seq1 = [2, 4, 6]
puts addition_sequence(arr1, seq1).inspect
arr2 = [1, 2, 3, 4, 5, 6, 7]
seq2 = [1, 2]
puts addition_sequence(arr2, seq2).inspect
  STRING
  answer_string=<<-STRING
[5, 6, 11, 6, 6, 7, 12]
[2, 4, 4, 6, 6, 8, 8]
  STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# adjacent_sum ======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'4'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method adjacent_sum that takes in an array of numbers and returns a new  #
# array containing the sums of adjacent numbers in the original array. See the     #
# examples.                                                                        #
#                                                                                  #
# EXAMPLES:                                                                        #
#            puts adjacent_sum([3, 7, 2, 11])                                      #
#                       => [10, 9, 13], because [ 3+7, 7+2, 2+11 ]                 #
#            puts adjacent_sum([2, 5, 1, 9, 2, 4])                                 #
#                       => [7, 6, 10, 11, 6], because [2+5, 5+1, 1+9, 9+2, 2+4]    #
#                                                                                  #
# answers should be:                                                               #
#            => [10, 9, 13]                                                        #
#            => [7, 6, 10, 11, 6]                                                  #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts adjacent_sum([3, 7, 2, 11])
puts adjacent_sum([2, 5, 1, 9, 2, 4])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def adjacent_sum(numbers_array)
  new_array=[]
  numbers_array.each_with_index do |number,index|
      if index>0
          new_array<<number+numbers_array[index-1]
      end
  end
  return new_array
end
puts adjacent_sum([3, 7, 2, 11]).inspect
puts adjacent_sum([2, 5, 1, 9, 2, 4]).inspect
  STRING
  answer_string=<<-STRING
[10, 9, 13]
[7, 6, 10, 11, 6]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# adults ============================================================================================================#
#====================================================================================================================#

rolling_count+=1
'5'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method 'adults(people)' that takes in an array of person hashes.         #
# The function should return an array containing the names of those who have an    #
# age of 18 or higher.                                                             #
#                                                                                  #
# Example:                                                                         #
#          ppl = [                                                                 #
#                  {'name'=>'John', 'age'=>20},                                    #
#                  {'name'=>'Jim', 'age'=>13},                                     #
#                  {'name'=>'Jane', 'age'=>18},                                    #
#                  {'name'=>'Bob', 'age'=>7}                                       #
#                ]                                                                 #
#         adults(ppl)                                                              #
#                                                                                  #
# answers should be:                                                               #
#            => [ 'John', 'Jane' ]                                                 #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

ppl = [
     {'name'=>'John', 'age'=>20},
     {'name'=>'Jim', 'age'=>13},
     {'name'=>'Jane', 'age'=>18},
     {'name'=>'Bob', 'age'=>7}
    ]
puts adults(ppl)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def adults(array_of_hashes)
  new_array=[]
  array_of_hashes.each do |hash|
      new_array<<hash['name'] if hash['age']>=18
  end
  return new_array
end
ppl = [
  {'name'=>'John', 'age'=>20},
  {'name'=>'Jim', 'age'=>13},
  {'name'=>'Jane', 'age'=>18},
  {'name'=>'Bob', 'age'=>7}
 ]
puts adults(ppl).inspect
  STRING
  answer_string=<<-STRING
[ 'John', 'Jane' ]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# ae_count ==========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'6'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method ae_count that takes in a string and returns a hash containing     #
# the number of a's and e's in the string. Assume the string contains only         #
# lowercase characters.                                                            #
#                                                                                  #
# example:                                                                         #
#          ae_count("everyone can program")        => {"a"=>2, "e"=>3}             #
#          ae_count("keyboard")                    => {"a"=>1, "e"=>1}             #
#                                                                                  #
# answers should be:                                                               #
#            => {"a"=>2, "e"=>3}                                                   #
#            => {"a"=>1, "e"=>1}                                                   #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts ae_count("everyone can program")
puts ae_count("keyboard")

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def ae_count(string)
  search='ae'
  new_hash=Hash.new{0}
  string.each_char do |character|
      new_hash[character]+=1 if search.include?(character)
  end
  return new_hash
end
puts ae_count("everyone can program").to_a.sort.to_h
puts ae_count("keyboard").to_a.sort.to_h
  STRING
  answer_string=<<-STRING
{"a"=>2, "e"=>3}
{"a"=>1, "e"=>1}
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end





#====================================================================================================================#
# all_else_equal ====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'7'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method all_else_equal that takes in an array of numbers. The method      #
# should return the element of the array that is equal to half of the sum of all   #
# elements of the array. If there is no such element, the method should return     #
# nil.                                                                             #
#                                                                                  #
# EXAMPLES:                                                                        #
#           p all_else_equal([2, 4, 3, 10, 1])                                     #
#           p all_else_equal([6, 3, 5, -9, 1])                                     #
#           p all_else_equal([1, 2, 3, 4])                                         #
#                                                                                  #
# answers should be:                                                               #
#     => 10, because the sum of all elements is 20                                 #
#     => 3, because the sum of all elements is 6                                   #
#     => nil, because the sum of all elements is 10 and there is no 5 in the array #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

p all_else_equal([2, 4, 3, 10, 1])
p all_else_equal([6, 3, 5, -9, 1])
p all_else_equal([1, 2, 3, 4])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def all_else_equal(numbers_array)
  sum=0
  numbers_array.each do |number|
      sum+=number
  end
  if numbers_array.include?(sum/2)
      return sum/2
  else
      return nil
  end
end
p all_else_equal([2, 4, 3, 10, 1])
p all_else_equal([6, 3, 5, -9, 1])
p all_else_equal([1, 2, 3, 4])
  STRING
  answer_string=<<-STRING
10
3
nil
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end





#====================================================================================================================#
# alternate_case ====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'8'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function alternate_case(str) that takes in a word and returns the word   #
# where the characters alternate between uppercase and lowercase.                  #
#                                                                                  #
# Examples:                                                                        #
#            alternate_case('BOOTCAMPPREP')           => 'BoOtCaMpPrEp'            #
#            alternate_case('bOotCamPpREP')           => 'BoOtCaMpPrEp'            #
#            alternate_case('hello')                  => 'HeLlO'                   #
#                                                                                  #
# answers should be:                                                               #
#            => 'BoOtCaMpPrEp'                                                     #
#            => 'BoOtCaMpPrEp'                                                     #
#            => 'HeLlO'                                                            #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts alternate_case('BOOTCAMPPREP')
puts alternate_case('bOotCamPpREP')
puts alternate_case('hello')

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def alternate_case(string)
  string.each_char.with_index do |character,index|
      if index%2==0
          string[index]=character.upcase
      else
          string[index]=character.downcase
      end
  end
  return string
end
puts alternate_case('BOOTCAMPPREP')
puts alternate_case('bOotCamPpREP')
puts alternate_case('hello')
  STRING
  answer_string=<<-STRING
'BoOtCaMpPrEp'
'BoOtCaMpPrEp'
'HeLlO'
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end





#====================================================================================================================#
# anagrams? =========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'9'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method anagrams? that takes in two words and returns a boolean           #
# indicating whether or not the words are anagrams. Anagrams are words that        #
# contain the same characters but not necessarily in the same order. Solve this    #
# without using .sort                                                              #
#                                                                                  #
# EXAMPLES:                                                                        #
#           puts anagrams?("cat", "act")               => true                     #
#           puts anagrams?("restful", "fluster")       => true                     #
#           puts anagrams?("cat", "dog")               => false                    #
#           puts anagrams?("boot", "bootcamp")         => false                    #
#                                                                                  #
# answers should be:                                                               #
#            => true                                                               #
#            => true                                                               #
#            => false                                                              #
#            => false                                                              #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts anagrams?("cat", "act")
puts anagrams?("restful", "fluster")
puts anagrams?("cat", "dog")
puts anagrams?("boot", "bootcamp")

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def anagrams?(word1,word2)
  return false if word1.length!=word2.length
  word1.each_char do |character|
      return false if !word2.include?(character)
  end
  return true
end
puts anagrams?("cat", "act")
puts anagrams?("restful", "fluster")
puts anagrams?("cat", "dog")
puts anagrams?("boot", "bootcamp")
  STRING
  answer_string=<<-STRING
true
true
false
false
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# are_coprime =======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'10'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method 'are_coprime(num1, num2)' that takes in two numbers and returns   #
# a boolean indicating whether or not the given numbers are coprime. Two numbers   #
# are said to be coprime if the only common factor between them is the number 1.   #
#                                                                                  #
# For example,                                                                     #
#               16 and 25 are coprime because 1 is the only number that divides    #
#                  both of them                                                    #
#               14 and 21 are not coprime because 7 divides both of them           #
#                                                                                  #
# answers should be:                                                               #
#           => true                                                                #
#           => true                                                                #
#           => false                                                               #
#           => false                                                               #
#           => false                                                               #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts are_coprime(16, 25)
puts are_coprime(15, 14)
puts are_coprime(14, 21)
puts are_coprime(15, 6)
puts are_coprime(15, 5)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def are_coprime(num1,num2)
  (2..([num1,num2].max)).each do |number|
      if num1%number==0 && num2%number==0
          return false
      end
  end
  return true
end
puts are_coprime(16, 25)
puts are_coprime(15, 14)
puts are_coprime(14, 21)
puts are_coprime(15, 6)
puts are_coprime(15, 5)
  STRING
  answer_string=<<-STRING
true
true
false
false
false
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# array_builder =====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'11'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method `array_builder(count)` that takes in a count object and returns   #
# an array filled with the appropriate numbers of elements. The order of the       #
# elements in the array does not matter, but repeated elements should be grouped.  #
#                                                                                  #
# Examples:                                                                        #
#            array_builder({'cats'=>2, 'dogs'=>1})                                 #
#                                                                                  #
# answers should be:                                                               #
#            => ['cats', 'cats', 'dogs']                                           #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts array_builder({'cats'=>2, 'dogs'=>1})

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def array_builder(hash)
  new_array=[]
  hash.each_key do |key|
      (1..hash[key]).each do
          new_array<<key
      end
  end
  return new_array
end
puts array_builder({'cats'=>2, 'dogs'=>1}).inspect
  STRING
  answer_string=<<-STRING
['cats', 'cats', 'dogs']
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# array_diff ========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'12'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function `array_diff(arr1, arr2)` that takes in two arrays. The function #
# should return a new array, containing the elements of bigger array that are not  #
# also in the smaller array. Note: Assume both arrays have unique elements and the #
# data has been arranged so that the bigger and the smaller of the arrays must be  #
# identified and used correctly in the function                                    #
#                                                                                  #
# Example:                                                                         #
#          array1 = [1,23,2,43,3,4]                                                #
#          array2 = [3, 23]                                                        #
#          array_diff(array1, array2)                    => [1, 2, 43 ,4]          #
#                                                                                  #
#          array4 = ['a', 'ab', 'c', 'd', 'c']                                     #
#          array3 = ['d']                                                          #
#          array_diff(array3, array4)                    => ['a', 'ab', 'c', 'c']  #
#                                                                                  #
# answers should be:                                                               #
#            => [1, 2, 43 ,4]                                                      #
#            => ['a', 'ab', 'c', 'c']                                              #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

array1 = [1,23,2,43,3,4]
array2 = [3, 23]
puts array_diff(array1, array2)

array4 = ['a', 'ab', 'c', 'd', 'c']
array3 = ['d']
puts array_diff(array3, array4)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: HARD (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def smallest_array(array1,array2)
  return array1.length<array2.length ? array1 : array2
end
def biggest_array(array1,array2)
  return array1.length>array2.length ? array1 : array2
end
def array_diff(array1,array2)
  # return array1-array2
  new_array=[]
  biggest_array(array1,array2).each do |item|
      new_array<<item if !(smallest_array(array1,array2)).include?(item)
  end
  return new_array
end
array1 = [1,23,2,43,3,4]
array2 = [3, 23]
puts array_diff(array1, array2).inspect

array4 = ['a', 'ab', 'c', 'd', 'c']
array3 = ['d']
puts array_diff(array3, array4).inspect
  STRING
  answer_string=<<-STRING
[1, 2, 43 ,4]
['a', 'ab', 'c', 'c']
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# array_substring ===================================================================================================#
#====================================================================================================================#

rolling_count+=1
'13'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function 'array_substring(words, str)' that takes in an array of strings #
# and a string as arguments and returns an array where each element is replaced    #
# with true if the string is a substring of the element and false if it is not.    #
#                                                                                  #
# Examples:                                                                        #
#            array_substring(["hello", "history", "helix", "hellos"],"hel")        #
#            array_substring(["prefix", "problems", "pragmatic", "prefer"], "pre") #
#                                                                                  #
# answers should be:                                                               #
#            => [true, false, true, true]                                          #
#            => [true, false, false, true]                                         #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts array_substring(["hello", "history", "helix", "hellos"],"hel")
puts array_substring(["prefix", "problems", "pragmatic", "prefer"], "pre")

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def array_substring(array,string)
  array.each_with_index do |word,index|
      array[index]=word.include?(string)
  end
  return array
end
puts array_substring(["hello", "history", "helix", "hellos"],"hel").inspect
puts array_substring(["prefix", "problems", "pragmatic", "prefer"], "pre").inspect
  STRING
  answer_string=<<-STRING
[true, false, true, true]
[true, false, false, true]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# array_translate ===================================================================================================#
#====================================================================================================================#

rolling_count+=1
'14'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method array_translate that takes in an array whose elements alternate   #
# between words and numbers. The method should return a string where each word is  #
# repeated the number of times that immediately follows in the array.              #
#                                                                                  #
# example:                                                                         #
#         array_translate(["Cat", 2, "Dog", 3, "Mouse", 1])                        #
#         array_translate(["red", 3, "blue", 1])                                   #
#                                                                                  #
# answers should be:                                                               #
#            => "CatCatDogDogDogMouse"                                             #
#            => "redredredblue"                                                    #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts array_translate(["Cat", 2, "Dog", 3, "Mouse", 1])
puts array_translate(["red", 3, "blue", 1])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def array_translate(array)
  new_string=''
  array.each_slice(2) do |items|
      word,num=items.pop(2)
      new_string+=(word*num)
  end
  return new_string
end
puts array_translate(["Cat", 2, "Dog", 3, "Mouse", 1])
puts array_translate(["red", 3, "blue", 1])
  STRING
  answer_string=<<-STRING
"CatCatDogDogDogMouse"
"redredredblue"
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# average_of_four ===================================================================================================#
#====================================================================================================================#

rolling_count+=1
'15'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method 'average_of_four(num1, num2, num3, num4)' that takes in four      #
# numbers. The function should return the average of all of the numbers.           #
#                                                                                  #
# Examples:                                                                        #
#           average_of_four(10, 10, 15, 5)             => 10                       #
#           average_of_four(3, 10, 11, 4)              => 7                        #
#           average_of_four(1, 2, 3, 4)                => 2.5                      #
#                                                                                  #
# answers should be:                                                               #
#            => 10                                                                 #
#            => 7                                                                  #
#            => 2.5                                                                #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts average_of_four(10, 10, 15, 5)
puts average_of_four(3, 10, 11, 4)
puts average_of_four(1, 2, 3, 4)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def average_of_four(num1,num2,num3,num4)
  sum=0
  array=[num1,num2,num3,num4]
  array.each do |number|
      sum+=number
  end
  return sum%4==0 ? sum/4 : sum/4.0
end
puts average_of_four(10, 10, 15, 5)
puts average_of_four(3, 10, 11, 4)
puts average_of_four(1, 2, 3, 4)
  STRING
  answer_string=<<-STRING
10
7
2.5
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# average_of_three ==================================================================================================#
#====================================================================================================================#

rolling_count+=1
'16'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method average_of_three(num1, num2, num3) that returns the average of    #
# three numbers                                                                    #
#                                                                                  #
# EXAMPLES:                                                                        #
#            puts average_of_three(3, 7, 8)   # => 6.0                             #
#            puts average_of_three(2, 5, 17)  # => 8.0                             #
#            puts average_of_three(2, 8, 1)   # => 3.666666                        #
#                                                                                  #
# answers should be:                                                               #
#            => 6.0                                                                #
#            => 8.0                                                                #
#            => 3.666666                                                           #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts average_of_three(3, 7, 8)
puts average_of_three(2, 5, 17)
puts average_of_three(2, 8, 1)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def average_of_three(num1,num2,num3)
  return (num1+num2+num3)/3.0
end
puts average_of_three(3, 7, 8)
puts average_of_three(2, 5, 17)
puts average_of_three(2, 8, 1)
  STRING
  answer_string=<<-STRING
6.0
8.0
3.666666
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# bubble_sort =======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'17'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method 'bubble_sort(arr)'   which will sort an array of integers         #
# using the "bubble sort" methodology. (http://en.wikipedia.org/wiki/Bubble_sort)  #
#                                                                                  #
# answers should be:                                                               #
#           => bubble_sort([])              == []                                  #
#           => bubble_sort([1])             == [1]                                 #
#           => bubble_sort([5, 4, 3, 2, 1]) == [1, 2, 3, 4, 5]                     #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts 'bubble_sort([])              == '+bubble_sort([])
puts 'bubble_sort([1])             == '+bubble_sort([1])
puts 'bubble_sort([5, 4, 3, 2, 1]) == '+bubble_sort([5, 4, 3, 2, 1])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def bubble_sort(arr)
  counter=1
  while counter>0
      counter=0
      arr.each_with_index do |number,index|
          if index>0
              if arr[index-1]>number
                  arr[index],arr[index-1]=arr[index-1],number
                  counter+=1
              end
          end
      end
  end
  return arr
end
puts 'bubble_sort([])              == '+bubble_sort([]).to_s
puts 'bubble_sort([1])             == '+bubble_sort([1]).to_s
puts 'bubble_sort([5, 4, 3, 2, 1]) == '+bubble_sort([5, 4, 3, 2, 1]).to_s
  STRING
  answer_string=<<-STRING
[]
[1]
[1, 2, 3, 4, 5]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# ceasar_string_cipher ==============================================================================================#
#====================================================================================================================#

rolling_count+=1
'18'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# write a method 'ceasar_string_cipher(string)' that takes in a string and a number#
# to shift by and returns the encoded string. use a string of letters.             #
#                                                                                  #
# answers should be:                                                               #
#           => 'khoor'                                                             #
#           => 'ejgwf'                                                             #
#           => 'dqqv ecor'                                                         #
#           => 'abwx'                                                              #
#           => 'u my nmfymz'                                                       #
#           => 'tlla tl vu aol iypknl ha tpkupnoa'                                 #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts ceasar_string_cipher("Hello",3)
puts ceasar_string_cipher("zebra",5)
puts ceasar_string_cipher("boot camp",2)
puts ceasar_string_cipher("STOP",8)
puts ceasar_string_cipher("I am Batman",12)
puts ceasar_string_cipher("Meet me on the bridge at midnight",7)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def ceasar_string_cipher(str,shift)
  str=str.downcase
  new_string=''
  alphabet='abcdefghijklmnopqrstuvwxyz'
  str.each_char do |c|
      if c==' '
          new_string+=' '
      else
          idx=alphabet.index(c)
          idx+=shift
          new_string+=alphabet[idx%alphabet.length]
      end
  end
  return new_string
end
puts ceasar_string_cipher("Hello",3)
puts ceasar_string_cipher("zebra",5)
puts ceasar_string_cipher("boot camp",2)
puts ceasar_string_cipher("STOP",8)
puts ceasar_string_cipher("I am Batman",12)
puts ceasar_string_cipher("Meet me on the bridge at midnight",7)
  STRING
  answer_string=<<-STRING
'khoor'
'ejgwf'
'dqqv ecor'
'abwx'
'u my nmfymz'
'tlla tl vu aol iypknl ha tpkupnoa'
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# camel_to_snake ====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'19'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method camel_to_snake(str) that takes in a CamelCase string and          #
# returns the string snake_cased. snake_case is a string where each word is        #
# separated with underscores (_). CamelCase is a string where the first char of    #
# each word is capitalized, all other characters lowercase.                        #
#                                                                                  #
# Examples:                                                                        #
#            camel_to_snake('SnakesGoHiss')                                        #
#            camel_to_snake('SayHelloWorld')                                       #
#            camel_to_snake('BootcampPrepIsCool')                                  #
#                                                                                  #
# answers should be:                                                               #
#            => 'snakes_go_hiss'                                                   #
#            => 'say_hello_world'                                                  #
#            => 'bootcamp_prep_is_cool'                                            #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts camel_to_snake('SnakesGoHiss')
puts camel_to_snake('SayHelloWorld')
puts camel_to_snake('BootcampPrepIsCool')

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: HARD (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def camel_to_snake(string)
  array_of_words=[]
  new_string=''
  string.each_char.with_index do |character,index|
      if index==0 || character.downcase==character
          new_string+=character.downcase
      else
          array_of_words<<new_string
          new_string=''
          new_string+=character.downcase
      end
  end
  array_of_words<<new_string
  return array_of_words.join('_')
end
puts camel_to_snake('SnakesGoHiss')
puts camel_to_snake('SayHelloWorld')
puts camel_to_snake('BootcampPrepIsCool')
  STRING
  answer_string=<<-STRING
'snakes_go_hiss'
'say_hello_world'
'bootcamp_prep_is_cool'
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# cap_vowels ========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'20'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method called cap_vowels(string) that takes in a string and returns the  #
# string where every vowel is capitalized. All other letters should be lower cased.#
#                                                                                  #
# reminder: strings are immutable in javascript!                                   #
#                                                                                  #
# Examples:                                                                        #
#           cap_vowels('hello world')                      => 'hEllO wOrld'        #
#           cap_vowels('HELLO WORLD')                      => 'hEllO wOrld'        #
#           cap_vowels('boOtCamP PreP')                    => 'bOOtcAmp prEp'      #
#                                                                                  #
# answers should be:                                                               #
#            => 'hEllO wOrld'                                                      #
#            => 'hEllO wOrld'                                                      #
#            => 'bOOtcAmp prEp'                                                    #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts cap_vowels('hello world')
puts cap_vowels('HELLO WORLD')
puts cap_vowels('boOtCamP PreP')

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: HARD (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def cap_vowels(string)
  vowels='aeiou'
  string.each_char.with_index do |character,index|
      if vowels.include?(character.downcase)
          string[index]=character.upcase
      else
          string[index]=character.downcase
      end
  end
  return string
end
puts cap_vowels('hello world')
puts cap_vowels('HELLO WORLD')
puts cap_vowels('boOtCamP PreP')
  STRING
  answer_string=<<-STRING
'hEllO wOrld'
'hEllO wOrld'
'bOOtcAmp prEp'
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# cat_builder =======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'21'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method cat_builder that takes in a name, color, and age. The method      #
# should return a hash representing a cat with those values.                       #
#                                                                                  #
# example:                                                                         #
#          cat_builder("Whiskers", "orange", 3)                                    #
#          cat_builder("Salem", "black", 100)                                      #
#                                                                                  #
# answers should be:                                                               #
#            => {"name"=>"Whiskers", "color"=>"orange", "age"=>3}                  #
#            => {"name"=>"Salem", "color"=>"black", "age"=>100}                    #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts cat_builder("Whiskers", "orange", 3)
puts cat_builder("Salem", "black", 100)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def cat_builder(name,color,age)
  new_hash={}
  keys=[:name,:color,:age]
  values=[name,color,age]
  keys.each_with_index do |key,index|
      new_hash[key]=values[index]
  end
  return new_hash
end
puts cat_builder("Whiskers", "orange", 3)
puts cat_builder("Salem", "black", 100)
  STRING
  answer_string=<<-STRING
{"name"=>"Whiskers", "color"=>"orange", "age"=>3}
{"name"=>"Salem", "color"=>"black", "age"=>100}
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# caesar_word_cipher ================================================================================================#
#====================================================================================================================#

rolling_count+=1
'22'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method caesar_word_cipher that takes in a string and a number. The method#
# should return a new string where every character of the original is shifted num  #
# characters in the alphabet.                                                      #
#                                                                                  #
# EXAMPLES:                                                                        #
#           puts caesar_word_cipher("apple", 1)       => "bqqmf"                   #
#           puts caesar_word_cipher("bootcamp", 2)    => "dqqvecor"                #
#           puts caesar_word_cipher("zebra", 4)       => "difve"                   #
#                                                                                  #
# answers should be:                                                               #
#            => "bqqmf"                                                            #
#            => "dqqvecor"                                                         #
#            => "difve"                                                            #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts caesar_word_cipher("apple", 1)
puts caesar_word_cipher("bootcamp", 2)
puts caesar_word_cipher("zebra", 4)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def caesar_word_cipher(string,shift)
  alphabet='abcdefghijklmnopqrstuvwxyz'
  string.each_char.with_index do |character,index|
      string[index]=alphabet[(alphabet.index(character)+shift)%alphabet.length]
  end
  return string
end
puts caesar_word_cipher("apple", 1)
puts caesar_word_cipher("bootcamp", 2)
puts caesar_word_cipher("zebra", 4)
  STRING
  answer_string=<<-STRING
"bqqmf"
"dqqvecor"
"difve"
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# censor ============================================================================================================#
#====================================================================================================================#

rolling_count+=1
'23'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method `censor(sentence, curse_words)` that censors the given sentence   #
# by replacing the vowels in curse words with "*". Assume no punctuation.          #
#                                                                                  #
# Example:                                                                         #
#                                                                                  #
# censor("Darn you Harold you son of a gun", ["darn", "gun"])                      #
# censor("Schnikeys I dont give a diddly squat", ["schnikeys", "diddly", "squat"]) #
#                                                                                  #
# answers should be:                                                               #
#            => "D*rn you Harold you son of a g*n"                                 #
#            => "Schn*k*ys I dont give a d*ddly sq**t"                             #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts censor("Darn you Harold you son of a gun", ["darn", "gun"])
puts censor("Schnikeys I dont give a diddly squat", ["schnikeys", "diddly", "squat"])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: HARD (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def censorize(word)
  vowels='aeiou'
  word.each_char.with_index do |character,index|
      word[index]='*' if vowels.include?(character)
  end
  return word
end
def censor(string,curse_words)
  array_of_words=string.split
  array_of_words.each_with_index do |word,index|
      array_of_words[index]=censorize(word) if curse_words.include?(word.downcase)
  end
  return array_of_words.join(' ')
end
puts censor("Darn you Harold you son of a gun", ["darn", "gun"]).inspect
puts censor("Schnikeys I dont give a diddly squat", ["schnikeys", "diddly", "squat"]).inspect
  STRING
  answer_string=<<-STRING
"D*rn you Harold you son of a g*n"
"Schn*k*ys I dont give a d*ddly sq**t"
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# clever_characters =================================================================================================#
#====================================================================================================================#

rolling_count+=1
'24'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method clever_characters that accepts a string as an argument. The       #
# method should return an array containing the characters of the string that       #
# appeared more than twice. The characters in the returned array may be in any     #
# order.                                                                           #
#                                                                                  #
# answers should be                                                                #
#           => ["t"]                                                               #
#           => ["i", "s"]                                                          #
#           => ["o", "t", " ", "p"]                                                #
#           => []                                                                  #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

p clever_characters("that's alright folks")
p clever_characters("mississippi")
p clever_characters("hot potato soup please")
p clever_characters("runtime")

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def get_character_count(string)
  new_hash=Hash.new{0}
  string.each_char do |character|
      new_hash[character]+=1
  end
  return new_hash
end
def clever_characters(string)
  new_array=[]
  character_count=get_character_count(string)
  array_of_keys=character_count.keys
  array_of_keys.each do |key|
      new_array<<key if character_count[key]>2
  end
  return new_array
end
p clever_characters("that's alright folks")
p clever_characters("mississippi")
p clever_characters("hot potato soup please")
p clever_characters("runtime")
  STRING
  answer_string=<<-STRING
["t"]
["i", "s"]
["o", "t", " ", "p"]
[]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end



#====================================================================================================================#
# collapse_string  ==================================================================================================#
#====================================================================================================================#

rolling_count+=1
'25'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method 'collapse_string(str)' that takes in a string as an argument.     #
# The method should return the string where 'streaks' of consecutive characters    #
# are collapsed to a single character.                                             #
#                                                                                  #
# Examples:                                                                        #
#           collapse_string('apple')                 => 'aple'                     #
#           collapse_string('AAAaalviiiiin!!!')      => 'Aalvin!'                  #
#           collapse_string('hello   app academy')   => 'helo ap academy'          #
#                                                                                  #
# answers should be:                                                               #
#            => 'aple'                                                             #
#            => 'Aalvin!'                                                          #
#            => 'helo ap academy'                                                  #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts collapse_string('apple')
puts collapse_string('AAAaalviiiiin!!!')
puts collapse_string('hello   app academy')

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def collapse_string(string)
  new_array=[]
  string.each_char do |character|
      if new_array[-1]!=character
          new_array<<character
      end
  end
  return new_array.join('')
end
puts collapse_string('apple')
puts collapse_string('AAAaalviiiiin!!!')
puts collapse_string('hello   app academy')
  STRING
  answer_string=<<-STRING
'aple'
'Aalvin!'
'helo ap academy'
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# combinations ======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'26'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method combinations that takes in an array of unique elements, the       #
# method should return a 2D array representing all possible combinations of 2      #
# elements of the array.                                                           #
#                                                                                  #
# example:                                                                         #
#         combinations(["a", "b", "c"])                                            #
#         combinations([0, 1, 2, 3])                                               #
#                                                                                  #
# answers should be:                                                               #
#            => [ [ "a", "b" ], [ "a", "c" ], [ "b", "c" ] ]                       #
#            => [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 1, 2 ], [ 1, 3 ], [ 2, 3 ] ]     #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts combinations(["a", "b", "c"])
puts combinations([0, 1, 2, 3])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def combinations(array)
  new_array=[]
  array.each_with_index do |num1,index1|
      array.each_with_index do |num2,index2|
          if index2>index1
              new_array<<[num1,num2]
          end
      end
  end
  return new_array
end
puts combinations(["a", "b", "c"]).inspect
puts combinations([0, 1, 2, 3]).inspect
  STRING
  answer_string=<<-STRING
[["a", "b"], ["a", "c"], ["b", "c"]]
[[0, 1], [0, 2], [0, 3], [1, 2], [1, 3], [2, 3]]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# common_factors ====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'27'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method common_factors(num1, num2) that returns an array that contains    #
# the common factors between both numbers. A factor is a number that divides       #
# another number with no remainder.                                                #
#                                                                                  #
# Examples:                                                                        #
#            common_factors(12, 50)                 => [ 1, 2 ]                    #
#            common_factors(6, 24)                  => [ 1, 2, 3, 6 ]              #
#            common_factors(11, 22)                 => [ 1, 11 ]                   #
#            common_factors(45, 60)                 => [ 1, 3, 5, 15 ]             #
#                                                                                  #
# answers should be:                                                               #
#            => [ 1, 2 ]                                                           #
#            => [ 1, 2, 3, 6 ]                                                     #
#            => [ 1, 11 ]                                                          #
#            => [ 1, 3, 5, 15 ]                                                    #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts common_factors(12, 50).inspect
puts common_factors(24, 6).inspect
puts common_factors(11, 22).inspect
puts common_factors(60, 45).inspect

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def common_factors(num1,num2)
new_array=[]
(1..(num1>num2 ? num1 : num2)).each do |number|
    new_array<<number if num1%number==0 && num2%number==0
end
return new_array
end
puts common_factors(12, 50).inspect
puts common_factors(24, 6).inspect
puts common_factors(11, 22).inspect
puts common_factors(60, 45).inspect
  STRING
  answer_string=<<-STRING
[1, 2]
[1, 2, 3, 6]
[1, 11]
[1, 3, 5, 15]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# common_prime_factors ==============================================================================================#
#====================================================================================================================#

rolling_count+=1
'28'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method 'common_prime_factors' that takes in two numbers as arguments     #
# and returns an array of all prime factors that are common between the two        #
# numbers. A prime is a number that divides another number without resulting       #
# in a remainder.                                                                  #
#                                                                                  #
# Examples:                                                                        #
#            common_prime_factors(12, 50)              => [ 2 ]                    #
#            common_prime_factors(6, 24)               => [ 2, 3 ]                 #
#            common_prime_factors(11,22)               => [ 11 ]                   #
#            common_prime_factors(45, 60)              => [ 3, 5 ]                 #
#                                                                                  #
# answers should be:                                                               #
#            => [ 2 ]                                                              #
#            => [ 2, 3 ]                                                           #
#            => [ 11 ]                                                             #
#            => [ 3, 5 ]                                                           #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts common_prime_factors(12, 50).inspect
puts common_prime_factors(6, 24).inspect
puts common_prime_factors(11,22).inspect
puts common_prime_factors(45, 60).inspect

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def is_prime?(num)
  (2...num).each do |number|
      return false if num%number==0
  end
  return true
end
def common_prime_factors(num1,num2)
  new_array=[]
  (2..num2).each do |number|
      if num1%number==0 && num2%number==0
          new_array<<number if is_prime?(number)
      end
  end
  return new_array
end
puts common_prime_factors(12, 50).inspect
puts common_prime_factors(6, 24).inspect
puts common_prime_factors(11,22).inspect
puts common_prime_factors(45, 60).inspect
  STRING
  answer_string=<<-STRING
[2]
[2, 3]
[11]
[3, 5]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# consonant_cancel ==================================================================================================#
#====================================================================================================================#

rolling_count+=1
'29'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method consonant_cancel that takes in a sentence and returns a new       #
# sentence where every word begins with it's first vowel.                          #
#                                                                                  #
# EXAMPLES:                                                                        #
#           puts consonant_cancel("down the rabbit hole")                          #
#           puts consonant_cancel("writing code is challenging")                   #
#                                                                                  #
# answers should be:                                                               #
#            => "own e abbit ole"                                                  #
#            => "iting ode is allenging"                                           #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts consonant_cancel("down the rabbit hole")
puts consonant_cancel("writing code is challenging")

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def consonant_cancel(string)
  vowels='aeiou'
  array_of_words=string.split(' ')
  array_of_words.each_with_index do |word,index1|
      word.each_char.with_index do |character,index2|
          if vowels.include?(character)
              array_of_words[index1]=word[index2..-1]
              break
          end
      end
  end
  return array_of_words.join(' ')
end
puts consonant_cancel("down the rabbit hole")
puts consonant_cancel("writing code is challenging")
  STRING
  answer_string=<<-STRING
"own e abbit ole"
"iting ode is allenging"
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# copy_machine ======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'30'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function 'copy_machine(element, num)' that takes in an element and a     #
# number it should return an array of length 'num' that is filled with 'element'.  #
#                                                                                  #
# Examples:                                                                        #
#          copy_machine('candy', 0)                                                #
#          copy_machine('candy', 2)                                                #
#          copy_machine('bread', 4)                                                #
#          copy_machine(11, 6)                                                     #
#                                                                                  #
# answers should be:                                                               #
#            => []                                                                 #
#            => [ 'candy', 'candy' ]                                               #
#            => [ 'bread', 'bread', 'bread', 'bread' ]                             #
#            => [ 11, 11, 11, 11, 11, 11 ]                                         #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts copy_machine('candy', 0)
puts copy_machine('candy', 2)
puts copy_machine('bread', 4)
puts copy_machine(11, 6)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def copy_machine(item,number)
  new_array=[]
  (1..number).each do
      new_array<<item
  end
  return new_array
end
puts copy_machine('candy', 0).inspect
puts copy_machine('candy', 2).inspect
puts copy_machine('bread', 4).inspect
puts copy_machine(11, 6).inspect
  STRING
  answer_string=<<-STRING
[]
['candy', 'candy']
['bread', 'bread', 'bread', 'bread']
[ 11, 11, 11, 11, 11, 11]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# correct_hash ======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'31'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Martha has created a hash with letter symbols as keys to represent items that    #
# start with their keys. However, she realized everything is off by one letter.    #
# see example:                                                                     #
#                                                                                  #
# wrong_hash = { :a => "banana",                                                   #
#                :b => "cabbage",                                                  #
#                :c => "dental_floss",                                             #
#                :d => "eel_sushi"                                                 #
#              }                                                                   #
#                                                                                  #
# answers should be:                                                               #
#           => { :b => "banana",                                                   #
#                :c => "cabbage",                                                  #
#                :d => "dental_floss",                                             #
#                :e => "eel_sushi"                                                 #
#              }                                                                   #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

wrong_hash = { :a => "banana", :b => "cabbage", :c => "dental_floss", :d => "eel_sushi" }
puts correct_hash(wrong_hash)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def correct_hash(wrong_hash)
  new_hash={}
  wrong_hash.each_value do |value|
      new_hash[value[0].to_sym]=value
  end
  return new_hash
end
wrong_hash = { :a => "banana", :b => "cabbage", :c => "dental_floss", :d => "eel_sushi" }
puts correct_hash(wrong_hash)
  STRING
  answer_string=<<-STRING
{:b=>"banana", :c=>"cabbage", :d=>"dental_floss", :e=>"eel_sushi"}
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# count_adjacent_sums ===============================================================================================#
#====================================================================================================================#

rolling_count+=1
'32'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write the method `count_adjacent_sums(arr, n)` that takes an array and number.   #
# It should count the number of times that two adjacent numbers in an array add up #
# to n.                                                                            #
#                                                                                  #
# Examples:                                                                        #
#            count_adjacent_sums([1, 5, 1], 6)                      => 2           #
#            count_adjacent_sums([7, 2, 4, 6], 7)                   => 0           #
#            count_adjacent_sums([6, 7, 11, 2, 5, 10, 3], 13)       => 3           #
#                                                                                  #
# answers should be:                                                               #
#            => 2                                                                  #
#            => 0                                                                  #
#            => 3                                                                  #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts count_adjacent_sums([1, 5, 1], 6)
puts count_adjacent_sums([7, 2, 4, 6], 7)
puts count_adjacent_sums([6, 7, 11, 2, 5, 10, 3], 13)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def count_adjacent_sums(array,num)
  count=0
  array.each_with_index do |number,index|
      if index>0
          count+=1 if number+array[index-1]==num
      end
  end
  return count
end
puts count_adjacent_sums([1, 5, 1], 6)
puts count_adjacent_sums([7, 2, 4, 6], 7)
puts count_adjacent_sums([6, 7, 11, 2, 5, 10, 3], 13)
  STRING
  answer_string=<<-STRING
2
0
3
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# count_inner_element ===============================================================================================#
#====================================================================================================================#

rolling_count+=1
'33'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# write a function `count_inner_element(arr)` that takes in a 2-D array of         #
# elements. Each element of 'arr' is a sub array that contains multiple elements.  #
# The number of elements contained in each sub array are not the same. We can      #
# assume each sub array contains at least one element. We should return a hash     #
# that counts how many times each element in each sub array repeats.               #
#                                                                                  #
# Examples:                                                                        #
#           arr1 = [                                                               #
#                    [1,2,4,5],                                                    #
#                    [2,7,4],                                                      #
#                    [1,4,5,2,7]                                                   #
#                  ]                                                               #
#                                                                                  #
#           count_inner_element(arr1)                                              #
#           arr2 = [                                                               #
#                    ['a','b','c','d'],                                            #
#                    ['a','b'],                                                    #
#                    ['a','c','d','a']                                             #
#                  ]                                                               #
#                                                                                  #
#                                                                                  #
# answers should be:                                                               #
#            => {1=>2, 2=>3, 4=>3, 5=>2, 7=>2}                                     #
#            => {'a'=>4, 'b'=>2, 'c'=>2, 'd'=>2}                                   #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

arr1 = [
       [1,2,4,5],
       [2,7,4],
       [1,4,5,2,7]
     ]
puts count_inner_element(arr1)
arr2 = [
       ['a','b','c','d'],
       ['a','b'],
       ['a','c','d','a']
     ]
puts count_inner_element(arr2)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def count_inner_element(array)
  new_hash=Hash.new{0}
  array.each do |subarray|
      subarray.each do |element|
          new_hash[element]+=1
      end
  end
  return new_hash
end
arr1 = [
  [1,2,4,5],
  [2,7,4],
  [1,4,5,2,7]
]
puts count_inner_element(arr1)
arr2 = [
  ['a','b','c','d'],
  ['a','b'],
  ['a','c','d','a']
]
puts count_inner_element(arr2)
  STRING
  answer_string=<<-STRING
{1=>2, 2=>3, 4=>3, 5=>2, 7=>2}
{'a'=>4, 'b'=>2, 'c'=>2, 'd'=>2}
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# count_of_letter ===================================================================================================#
#====================================================================================================================#

rolling_count+=1
'34'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function `count_of_letter(string, char)` that takes in a string and a    #
# character and returns the number of times that character appears in the string   #
#                                                                                  #
# Examples:                                                                        #
#           count_of_letter('mississippi', 's')                 => 4               #
#           count_of_letter('MISSISSIPPI', 'p')                 => 2               #
#           count_of_letter('BOOTCAMP', 't')                    => 1               #
#                                                                                  #
# answers should be:                                                               #
#            => 4                                                                  #
#            => 2                                                                  #
#            => 1                                                                  #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts count_of_letter('mississippi', 's')
puts count_of_letter('MISSISSIPPI', 'p')
puts count_of_letter('BOOTCAMP', 't')

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def count_of_letter(string,letter)
  count=0
  string.each_char do |character|
      count+=1 if letter==character.downcase
  end
  return count
end
puts count_of_letter('mississippi', 's')
puts count_of_letter('MISSISSIPPI', 'p')
puts count_of_letter('BOOTCAMP', 't')
  STRING
  answer_string=<<-STRING
4
2
1
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# count_repeats =====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'35'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function `count_repeats(string)` that takes in a string and returns the  #
# number of letters that appear more than once in the string. You may assume the   #
# string contains only lowercase letters. Count the number of letters that repeat, #
# not the number of times they repeat in the string.                               #
#                                                                                  #
# Examples:                                                                        #
#           count_repeats('alvin')                     => 0                        #
#           count_repeats('aaaalvin')                  => 1                        #
#           count_repeats('pops')                      => 1                        #
#           count_repeats('mississippi')               => 3                        #
#           count_repeats('hellobootcampprep')         => 4                        #
#                                                                                  #
# answers should be:                                                               #
#            => 0                                                                  #
#            => 1                                                                  #
#            => 1                                                                  #
#            => 3                                                                  #
#            => 4                                                                  #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts count_repeats('alvin')
puts count_repeats('aaaalvin')
puts count_repeats('pops')
puts count_repeats('mississippi')
puts count_repeats('hellobootcampprep')

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def get_letter_count(string)
  new_hash=Hash.new{0}
  string.each_char do |character|
      new_hash[character]+=1
  end
  return new_hash
end
def count_repeats(string)
  count=0
  letter_count=get_letter_count(string)
  letter_count.each_key do |key|
      count+=1 if letter_count[key]>1
  end
  return count
end
puts count_repeats('alvin')
puts count_repeats('aaaalvin')
puts count_repeats('pops')
puts count_repeats('mississippi')
puts count_repeats('hellobootcampprep')
  STRING
  answer_string=<<-STRING
0
1
1
3
4
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# count_scores ======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'36'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method 'count_scores(people)' that takes in an array of score hashes     #
# (people) as its input. A score hash has two key-value pairs: a name (string) and #
# a score (number). `count_scores(people)` should return a hash that has key-value #
# pairs where each name is a key and the value is their total score.               #
#                                                                                  #
# answers should be:                                                               #
#            => { Anthony: 2, Fred: 10, Winnie: 12 }                               #
#            => { Anthony: 4, Fred: 4, Winnie: 6 }                                 #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

ppl = [ {'name'=>"Anthony", 'score'=>10},
{'name'=>"Fred", 'score'=>10},
{'name'=>"Anthony", 'score'=>-8},
{'name'=>"Winnie", 'score'=>12}
]
peeps = [ {'name'=>"Anthony", 'score'=>2},
  {'name'=>"Winnie", 'score'=>2},
  {'name'=>"Fred", 'score'=>2},
  {'name'=>"Winnie", 'score'=>2},
  {'name'=>"Fred", 'score'=>2},
  {'name'=>"Anthony", 'score'=>2},
  {'name'=>"Winnie", 'score'=>2}
]
puts count_scores(ppl)
puts count_scores(peeps)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def count_scores(array)
new_hash=Hash.new{0}
array.each do |subhash|
    new_hash[subhash['name']]+=subhash['score']
end
return new_hash
end
ppl = [ {'name'=>"Anthony", 'score'=>10},
{'name'=>"Fred", 'score'=>10},
{'name'=>"Anthony", 'score'=>-8},
{'name'=>"Winnie", 'score'=>12}
]
peeps = [ {'name'=>"Anthony", 'score'=>2},
  {'name'=>"Winnie", 'score'=>2},
  {'name'=>"Fred", 'score'=>2},
  {'name'=>"Winnie", 'score'=>2},
  {'name'=>"Fred", 'score'=>2},
  {'name'=>"Anthony", 'score'=>2},
  {'name'=>"Winnie", 'score'=>2}
]
puts count_scores(ppl).to_a.sort.to_h
puts count_scores(peeps).to_a.sort.to_h
  STRING
  answer_string=<<-STRING
{Anthony:2, Fred:10, Winnie:12}
{Anthony:4, Fred:4, Winnie:6}
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# cryptic_conversion ================================================================================================#
#====================================================================================================================#

rolling_count+=1
'37'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method cryptic_conversion that accepts a sentence as an argument. The    #
# method should translate the sentence according to the following rules:           #
#                                                                                  #
#    - words that are shorter than 3 characters are unchanged                      #
#    - words that are 3 characters or longer are translated accordingly:           #
#        * if the word begins with a vowel, simply add 'yay' to the end of the     #
#          word (example: 'eat'->'eatyay')                                         #
#        * if the word begins with a non-vowel, move all letters that come before  #
#          the word's first vowel to the end of the word and add 'ay'              #
#          (example: 'trash'->'ashtray')                                           #
#        * Note that if words are capitalized in the original sentence, they       #
#          should remain capitalized in the translated sentence. Vowels are the    #
#          letters a, e, i, o, u.                                                  #
#                                                                                  #
# answers should be                                                                #
#           => "We ikelay to eatyay ananasbay"                                     #
#           => "I annotcay indfay ethay ashtray"                                   #
#           => "Atwhay an interestingyay oblempray"                                #
#           => "Erhay amilyfay ewflay to Ancefray"                                 #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

p cryptic_conversion('We like to eat bananas')
p cryptic_conversion('I cannot find the trash')
p cryptic_conversion('What an interesting problem')
p cryptic_conversion('Her family flew to France')

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def get_the_vowel_index(string)
  vowels='aeiou'
  string.each_char.with_index do |character,index|
      return index if vowels.include?(character)
  end
end
def pig_latinize(word)
  idx=0
  vowels='aeiou'
  if word.length<3
      return word
  elsif vowels.include?(word[0])
      return word+'yay'
  else
      idx=get_the_vowel_index(word)
      return word[idx..-1]+word[0...idx]+'ay'
  end
end
def cryptic_conversion(sentence)
  new_array=[]
  array_of_words=sentence.split
  array_of_words.each do |word|
      if word[0].upcase==word[0]
          word=pig_latinize(word.downcase)
          new_array<<word[0].upcase+word[1..-1]
      else
          new_array<<pig_latinize(word)
      end
  end
  return new_array.join(' ')
end
p cryptic_conversion('We like to eat bananas')
p cryptic_conversion('I cannot find the trash')
p cryptic_conversion('What an interesting problem')
p cryptic_conversion('Her family flew to France')
  STRING
  answer_string=<<-STRING
"We ikelay to eatyay ananasbay"
"I annotcay indfay ethay ashtray"
"Atwhay an interestingyay oblempray"
"Erhay amilyfay ewflay to Ancefray"
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# diff_array_len ====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'38'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function `diff_array_len(arr1, arr2)` that takes two arrays. The         #
# function should return true if the arrays have different lengths. The function   #
# should return false otherwise.                                                   #
#                                                                                  #
# Examples:                                                                        #
#           a1 = ['a', 'b', 'c']                                                   #
#           a2 = ['w', 'x', 'y']                                                   #
#           a3 = [1, 3, 7, 4]                                                      #
#           diff_array_len(a1, a2)           => false                              #
#           diff_array_len(a1, a3)           => true                               #
#                                                                                  #
# answers should be:                                                               #
#            => false                                                              #
#            => true                                                               #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

a1 = ['a', 'b', 'c']
a2 = ['w', 'x', 'y']
a3 = [1, 3, 7, 4]
puts diff_array_len(a1, a2)
puts diff_array_len(a1, a3)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def diff_array_len(array1,array2)
  return array1.length!=array2.length
end
a1 = ['a', 'b', 'c']
a2 = ['w', 'x', 'y']
a3 = [1, 3, 7, 4]
puts diff_array_len(a1, a2)
puts diff_array_len(a1, a3)
  STRING
  answer_string=<<-STRING
false
true
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# disemvowel ========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'39'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method, 'disemvowel(string)' which takes in a string, and returns        #
# that string with all the vowels removed. Treat "y" as a consonant.               #
#                                                                                  #
# answers should be:                                                               #
#           => 'xtrmntr'                                                           #
#           => 'why'                                                               #
#           => 'wzrd672'                                                           #
#           => 'ppl'                                                               #
#           => 'fllw th yllw brck rd'                                              #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts disemvowel('exterminator')
puts disemvowel('why')
puts disemvowel('wizard672')
puts disemvowel('apple')
puts disemvowel('follow the yellow brick road')

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def disemvowel(string)
  vowels='aeiou'
  new_string=''
  string.each_char do |c|
      new_string+=c if !vowels.include?(c)
  end
  return new_string
end
puts disemvowel('exterminator').inspect
puts disemvowel('why').inspect
puts disemvowel('wizard672').inspect
puts disemvowel('apple').inspect
puts disemvowel('follow the yellow brick road').inspect
  STRING
   answer_string=<<-STRING
'xtrmntr'
'why'
'wzrd672'
'ppl'
'fllw th yllw brck rd'
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# divisible_by_five_pair_sum ========================================================================================#
#====================================================================================================================#

rolling_count+=1
'40'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method divisible_by_five_pair_sum(array), that takes an array of numbers.#
# It should return an array of all the pairs of indices whose sum is a multiple of #
# five.                                                                            #
#                                                                                  #
# Examples:                                                                        #
#           divisible_by_five_pair_sum([1, 5, 2, 0, 4])                            #
#           divisible_by_five_pair_sum([13, 22, 8, -3, 12])                        #
#                                                                                  #
# answers should be:                                                               #
#            => [ [ 0, 4 ], [ 1, 3 ] ]                                             #
#            => [[ 0, 1 ], [ 0, 3 ], [ 0, 4 ], [ 1, 2 ], [ 2, 3 ], [ 2, 4 ]]       #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts divisible_by_five_pair_sum([1, 5, 2, 0, 4])
puts divisible_by_five_pair_sum([13, 22, 8, -3, 12])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: HARD (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def divisible_by_five_pair_sum(array)
  new_array=[]
  array.each_with_index do |num1,index1|
      array.each_with_index do |num2,index2|
          if index2>index1
              new_array<<[index1,index2] if (num1+num2)%5==0
          end
      end
  end
  return new_array
end
puts divisible_by_five_pair_sum([1, 5, 2, 0, 4]).inspect
puts divisible_by_five_pair_sum([13, 22, 8, -3, 12]).inspect
  STRING
  answer_string=<<-STRING
[[0, 4], [1, 3]]
[[0, 1], [0, 3], [0, 4], [1, 2], [2, 3], [2, 4]]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# does_key_exist ====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'41'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method 'does_key_exist(hsh, key)' that takes in a hash and a key and     #
# returns true if the key is inside the hash and false if the key is not inside    #
# the hash.                                                                        #
#                                                                                  #
# Examples:                                                                        #
#            hsh1 = {'bootcamp'=>'App Academy', 'course'=>'Bootcamp Prep'}         #
#            does_key_exist(hsh1, 'course')                                        #
#            does_key_exist(hsh1, 'name')                                          #
#                                                                                  #
#                                                                                  #
# answers should be:                                                               #
#            => true                                                               #
#            => false                                                              #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

hsh1 = {'bootcamp'=>'App Academy', 'course'=>'Bootcamp Prep'}
puts does_key_exist(hsh1, 'course')
puts does_key_exist(hsh1, 'name')

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def does_key_exist(hash,key)
  return hash.has_key?(key)
end
hsh1 = {'bootcamp'=>'App Academy', 'course'=>'Bootcamp Prep'}
puts does_key_exist(hsh1, 'course')
puts does_key_exist(hsh1, 'name')
  STRING
  answer_string=<<-STRING
true
false
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# double_letter_count ===============================================================================================#
#====================================================================================================================#

rolling_count+=1
'42'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method that takes in a string and returns the number of times that the   #
# same letter repeats twice in a row.                                              #
#                                                                                  #
# EXAMPLES:                                                                        #
#           puts double_letter_count("the jeep rolled down the hill")    => 3      #
#           puts double_letter_count("bootcamp")                         => 1      #
#                                                                                  #
# answers should be:                                                               #
#            => 3                                                                  #
#            => 1                                                                  #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts double_letter_count("the jeep rolled down the hill")
puts double_letter_count("bootcamp")

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def double_letter_count(string)
  sum=0
  string.each_char.with_index do |character,index|
      if index>0
          if character==string[index-1]
              sum+=1
          end
      end
  end
  return sum
end
puts double_letter_count("the jeep rolled down the hill")
puts double_letter_count("bootcamp")
  STRING
  answer_string=<<-STRING
3
1
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# doubler ===========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'43'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method doubler(numbers) that takes an array of numbers and returns a new #
# array where every element of the original array is multiplied by 2.              #
#                                                                                  #
# EXAMPLES:                                                                        #
#            puts doubler([1, 2, 3, 4]) # => [2, 4, 6, 8]                          #
#            puts doubler([7, 1, 8])    # => [14, 2, 16]                           #
#                                                                                  #
# answers should be:                                                               #
#            => [2, 4, 6, 8]                                                       #
#            => [14, 2, 16]                                                        #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts doubler([1, 2, 3, 4])
puts doubler([7, 1, 8])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def doubler(numbers)
  new_array=[]
  numbers.each{|item| new_array<<item*2}
  return new_array
end
puts doubler([1, 2, 3, 4]).inspect
puts doubler([7, 1, 8]).inspect
  STRING
  answer_string=<<-STRING
[2, 4, 6, 8]
[14, 2, 16]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# dynamic_fizz_buzz =================================================================================================#
#====================================================================================================================#

rolling_count+=1
'44'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function dynamic_fizz_buzz(max, num1, num2) that returns an array        #
# of numbers up to the max. Each number should be either divisible by num1 or num2,#
# BUT NOT BOTH.                                                                    #
#                                                                                  #
# Examples:                                                                        #
#            dynamic_fizz_buzz(20, 5, 3)           => [3, 5, 6, 9, 10, 12, 18]     #
#            dynamic_fizz_buzz(20, 4, 6)           => [4, 6, 8, 16, 18]            #
#                                                                                  #
# answers should be:                                                               #
#            => [3, 5, 6, 9, 10, 12, 18]                                           #
#            => [4, 6, 8, 16, 18]                                                  #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts dynamic_fizz_buzz(20, 5, 3)
puts dynamic_fizz_buzz(20, 4, 6)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def dynamic_fizz_buzz(max,num1,num2)
  new_array=[]
  (1...max).each do |number|
      new_array<<number if number%num1==0 && number%num2!=0 || number%num1!=0 && number%num2==0
  end
  return new_array
end
puts dynamic_fizz_buzz(20, 5, 3).inspect
puts dynamic_fizz_buzz(20, 4, 6).inspect
  STRING
  answer_string=<<-STRING
[3, 5, 6, 9, 10, 12, 18]
[4, 6, 8, 16, 18]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# echo ==============================================================================================================#
#====================================================================================================================#

rolling_count+=1
'45'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function `echo` that takes in a string and returns that string           #
# "echo-ized".                                                                     #
#                                                                                  #
# Examples:                                                                        #
#           echo("Mom!")            => "MOM! ... Mom! ... mom!"                    #
#           echo("hey")             => "HEY ... hey ... hey"                       #
#           echo("JUMp")            => "JUMP ... JUMp ... jump"                    #
#                                                                                  #
# answers should be:                                                               #
#            => "MOM! ... Mom! ... mom!"                                           #
#            => "HEY ... hey ... hey"                                              #
#            => "JUMP ... JUMp ... jump"                                           #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts echo("Mom!")
puts echo("hey")
puts echo("JUMp")

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY  (FUNCTIONAL PROGRAMMING)                                       #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def echo(string)
  return string.upcase+' ... '+string.capitalize+' ... '+string.downcase
end
puts echo("Mom!").inspect
puts echo("hey").inspect
puts echo("JUMp").inspect
  STRING
  answer_string=<<-STRING
"MOM! ... Mom! ... mom!"
"HEY ... hey ... hey"
"JUMP ... JUMp ... jump"
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# element_count =====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'46'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method element_count that takes in an array and returns a hash           #
# representing the count of each element in the array.                             #
#                                                                                  #
# EXAMPLES:                                                                        #
#           puts element_count(["a", "b", "a", "a", "b"])                          #
#           puts element_count(["red", "red", "blue", "green"])                    #
#                                                                                  #
# answers should be:                                                               #
#            => {"a"=>3, "b"=>2}                                                   #
#            => {"red"=>2, "blue"=>1, "green"=>1}                                  #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts element_count(["a", "b", "a", "a", "b"])
puts element_count(["red", "red", "blue", "green"])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def element_count(arr)
  new_hash=Hash.new{0}
  arr.each do |ele|
    new_hash[ele]+=1
  end
  return new_hash
end
puts element_count(["a", "b", "a", "a", "b"]).inspect
puts element_count(["red", "red", "blue", "green"]).inspect
  STRING
  answer_string=<<-STRING
{"a"=>3, "b"=>2}
{"red"=>2, "blue"=>1, "green"=>1}
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end



#====================================================================================================================#
# element_replace ===================================================================================================#
#====================================================================================================================#

rolling_count+=1
'47'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method element_replace that takes in an array and a hash. The method     #
# should return a new array where elements of the original array are replaced with #
# their corresponding values in the hash. use map.                                 #
#                                                                                  #
# example:                                                                         #
#        arr1 = ["LeBron James", "Lionel Messi", "Serena Williams"]                #
#        hash1 = {"Serena Williams"=>"tennis", "LeBron James"=>"basketball"}       #
#        element_replace(arr1, hash1)                                              #
#                                                                                  #
#        arr2 = ["dog", "cat", "mouse"]                                            #
#        hash2 = {"dog"=>"bork", "cat"=>"meow", "duck"=>"quack"}                   #
#        element_replace(arr2, hash2)                                              #
#                                                                                  #
# answers should be:                                                               #
#            => ["basketball", "Lionel Messi", "tennis"]                           #
#            => ["bark", "meow", "mouse"]                                          #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

arr1 = ["LeBron James", "Lionel Messi", "Serena Williams"]
hash1 = {"Serena Williams"=>"tennis", "LeBron James"=>"basketball"}
arr2 = ["dog", "cat", "mouse"]
hash2 = {"dog"=>"bork", "cat"=>"meow", "duck"=>"quack"}
puts element_replace(arr1, hash1)
puts element_replace(arr2, hash2)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def element_replace(arr,hash)
  new_array=[]
  new_array=arr.map{|key| hash.has_key?(key) ? hash[key] : key}
  return new_array
end
arr1 = ["LeBron James", "Lionel Messi", "Serena Williams"]
hash1 = {"Serena Williams"=>"tennis", "LeBron James"=>"basketball"}
arr2 = ["dog", "cat", "mouse"]
hash2 = {"dog"=>"bork", "cat"=>"meow", "duck"=>"quack"}
puts element_replace(arr1, hash1).inspect
puts element_replace(arr2, hash2).inspect
  STRING
  answer_string=<<-STRING
["basketball", "Lionel Messi", "tennis"]
["bark", "meow", "mouse"]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# element_times_index ===============================================================================================#
#====================================================================================================================#

rolling_count+=1
'48'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method element_times_index(nums) that takes in an array of numbers and   #
# returns a new array containing every number of the original array multiplied with#
# its index.                                                                       #
#                                                                                  #
# EXAMPLES:                                                                        #
#           puts element_times_index([4, 7, 6, 5])       # => [0, 7, 12, 15]       #
#           puts element_times_index([1, 1, 1, 1, 1, 1]) # => [0, 1, 2, 3, 4, 5]   #
#                                                                                  #
# answers should be:                                                               #
#            => [0, 7, 12, 15]                                                     #
#            => [0, 1, 2, 3, 4, 5]                                                 #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts element_times_index([4, 7, 6, 5])
puts element_times_index([1, 1, 1, 1, 1, 1])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def element_times_index(nums)
  nums.each_with_index{|ele,idx|  nums[idx]=ele*idx}
  return nums
end
puts element_times_index([4, 7, 6, 5]).inspect
puts element_times_index([1, 1, 1, 1, 1, 1]).inspect
  STRING
  answer_string=<<-STRING
[0, 7, 12, 15]
[0, 1, 2, 3, 4, 5]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# even_caps =========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'49'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function 'even_caps(sentence)' that takes in a sentence as an argument   #
# and returns the same string with each even index being capitalized. Index 0      #
# counts as even.                                                                  #
#                                                                                  #
# Examples:                                                                        #
#           even_caps("Tom got a small piece of pie")                              #
#           even_caps("the book is in front of the table")                         #
#                                                                                  #
# answers should be:                                                               #
#            => "ToM GoT A SmAlL PiEcE Of pIe"                                     #
#            => "ThE BoOk iS In fRoNt oF ThE TaBlE"                                #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts even_caps("Tom got a small piece of pie")
puts even_caps("the book is in front of the table")

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def even_caps(string)
  string.each_char.with_index do |character,index|
      string[index]=character.upcase if index%2==0
  end
  return string
end
puts even_caps("Tom got a small piece of pie")
puts even_caps("the book is in front of the table")
  STRING
  answer_string=<<-STRING
"ToM GoT A SmAlL PiEcE Of pIe"
"ThE BoOk iS In fRoNt oF ThE TaBlE"
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# even_nums =========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'50'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method even_nums(max) that takes in a number max and returns an array    #
# containing all even numbers from 0 to max                                        #
#                                                                                  #
# EXAMPLES:                                                                        #
#            puts even_nums(10) # => [0, 2, 4, 6, 8, 10]                           #
#            puts even_nums(5)  # => [0, 2, 4]                                     #
#                                                                                  #
# answers should be:                                                               #
#            => [0, 2, 4, 6, 8, 10]                                                #
#            => [0, 2, 4]                                                          #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts even_nums(10)
puts even_nums(5)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def even_nums(max)
  new_array=[]
  (0..max).each{|num| new_array<<num if num%2==0}
  return new_array
end
puts even_nums(10).inspect
puts even_nums(5).inspect
  STRING
  answer_string=<<-STRING
[0, 2, 4, 6, 8, 10]
[0, 2, 4]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# every_other_word ==================================================================================================#
#====================================================================================================================#

rolling_count+=1
'51'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function 'every_other_word(sentence)' that takes in a sentence and       #
# returns an array containing every other word in that sentence.                   #
#                                                                                  #
# Examples:                                                                        #
#           every_other_word('hello how are you doing on this lovely day?')        #
#           every_other_word('the weather is wonderful')                           #
#                                                                                  #
# answers should be:                                                               #
#            => [ 'hello', 'are', 'doing', 'this', 'day?' ]                        #
#            => [ 'the', 'is' ]                                                    #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts every_other_word('hello how are you doing on this lovely day?')
puts every_other_word('the weather is wonderful')

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def every_other_word(string)
  array_of_words=string.split
  array_of_words.each_with_index do |word,index|
      array_of_words[index]=' ' if index%2!=0
  end
  return array_of_words.join(' ').split
end
puts every_other_word('hello how are you doing on this lovely day?').inspect
puts every_other_word('the weather is wonderful').inspect
  STRING
  answer_string=<<-STRING
['hello', 'are', 'doing', 'this', 'day?']
[ 'the', 'is' ]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# factor_array ======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'52'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function `factor_array(array, number)` that takes in an array of numbers #
# and a number and returns an array of all the factors.                            #
#                                                                                  #
# What are Factors? Multiplying two whole numbers gives a product. The numbers     #
# that we multiply are the factors of the product.                                 #
#                                                                                  #
# Examples:                                                                        #
#           factor_array([2,3,4,5,6],20)                  => [2,4,5]               #
#           factor_array([2,3,4,5,6],35)                  => [5]                   #
#           factor_array([10,15,20,25],5)                 => []                    #
#                                                                                  #
# answers should be:                                                               #
#            => [2,4,5]                                                            #
#            => [5]                                                                #
#            => []                                                                 #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts factor_array([2,3,4,5,6],20)
puts factor_array([2,3,4,5,6],35)
puts factor_array([10,15,20,25],5)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def factor_array(array,num)
  new_array=[]
  array.each do |number|
      (2...20).each do |check|
          new_array<<number if number*check==num
      end
  end
  return new_array
end
puts factor_array([2,3,4,5,6],20).inspect
puts factor_array([2,3,4,5,6],35).inspect
puts factor_array([10,15,20,25],5).inspect
  STRING
  answer_string=<<-STRING
[2,4,5]
[5]
[]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# factorial =========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'53'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method 'factorial(n)', that returns the factorial of the number 'n'. For #
# example, the factorial of 4 is '4 * 3 * 2 * 1 = 24'.                             #
#                                                                                  #
# Examples:                                                                        #
#           factorial(1)                       => 1                                #
#           factorial(4)                       => 24                               #
#           factorial(5)                       => 120                              #
#           factorial(10)                      => 3628800                          #
#                                                                                  #
# answers should be:                                                               #
#            => 1                                                                  #
#            => 24                                                                 #
#            => 120                                                                #
#            => 3628800                                                            #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts factorial(1)
puts factorial(4)
puts factorial(5)
puts factorial(10)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def factorial(num)
fact=1
(2..num).each do |number|
    fact*=number
end
return fact
end
puts factorial(1)
puts factorial(4)
puts factorial(5)
puts factorial(10)
  STRING
  answer_string=<<-STRING
1
24
120
3628800
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# factors_of ========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'54'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method factors_of(num) that takes in a num and returns an array of all   #
# positive numbers less than or equal to num that can divide num.                  #
#                                                                                  #
# EXAMPLES:                                                                        #
#          puts factors_of(3)   # => [1, 3]                                        #
#          puts factors_of(4)   # => [1, 2, 4]                                     #
#          puts factors_of(8)   # => [1, 2, 4, 8]                                  #
#                                                                                  #
# answers should be:                                                               #
#            => [1, 3]                                                             #
#            => [1, 2, 4]                                                          #
#            => [1, 2, 4, 8]                                                       #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts factors_of(3)
puts factors_of(4)
puts factors_of(8)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def factors_of(num)
  new_array=[]
  (1..num).each{|n| new_array<<n if num%n==0}
  return new_array
end
puts factors_of(3).inspect
puts factors_of(4).inspect
puts factors_of(8).inspect
  STRING
  answer_string=<<-STRING
[1, 3]
[1, 2, 4]
[1, 2, 4, 8]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# favorite_word =====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'55'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function favorite_word(favoriteLetter, sentence) that takes in a single  #
# letter and a sentence string. The function should return the word in the sentence#
# that contains `favoriteLetter` the most. If there are ties, return               #
# the word that appears first in the sentence.                                     #
#                                                                                  #
# Examples                                                                         #
#           favorite_word('p', 'sinful caesar sipped his snifter')                 #
#           favorite_word('a', 'sinful caesar sipped his snifter')                 #
#           favorite_word('s', 'sinful caesar sipped his snifter')                 #
#           favorite_word('x', 'sinful caesar sipped his snifter')                 #
#                                                                                  #
# answers should be:                                                               #
#            => 'sipped'                                                           #
#            => 'caesar'                                                           #
#            => 'sinful'                                                           #
#            => ''                                                                 #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts favorite_word('p', 'sinful caesar sipped his snifter')
puts favorite_word('a', 'sinful caesar sipped his snifter')
puts favorite_word('s', 'sinful caesar sipped his snifter')
puts favorite_word('x', 'sinful caesar sipped his snifter')

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM  (FUNCTIONAL PROGRAMMING)                                     #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def favorite_word(favorite_letter,sentence)
  most_favorite_letter=0
  favorite_word=''
  array_of_words=sentence.split
  array_of_words.each do |word|
      count=0
      word.each_char do |character|
          count+=1 if favorite_letter==character
      end
      if count>most_favorite_letter
          most_favorite_letter=count
          favorite_word=word
      end
  end
  return favorite_word
end
puts favorite_word('p', 'sinful caesar sipped his snifter').inspect
puts favorite_word('a', 'sinful caesar sipped his snifter').inspect
puts favorite_word('s', 'sinful caesar sipped his snifter').inspect
puts favorite_word('x', 'sinful caesar sipped his snifter').inspect
  STRING
  answer_string=<<-STRING
'sipped'
'caesar'
'sinful'
''
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# fib ===============================================================================================================#
#====================================================================================================================#

rolling_count+=1
'56'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method fib(n) that takes in a number and returns the nth number of the   #
# fibonacci sequence. In the fibonacci sequence, the 1st number is 1 and the 2nd   #
# number is 1. To generate the next number in the sequence, we take the sum of the #
# previous two fibonacci numbers. For example the first 5 numbers of the fibonacci #
# sequence are '1, 1, 2, 3, 5'                                                     #
#                                                                                  #
# Examples:                                                                        #
#           fib(1)   => 1                                                          #
#           fib(2)   => 1                                                          #
#           fib(3)   => 2                                                          #
#           fib(4)   => 3                                                          #
#           fib(5)   => 5                                                          #
#           fib(6)   => 8                                                          #
#           fib(7)   => 13                                                         #
#                                                                                  #
# answers should be:                                                               #
#            => 1                                                                  #
#            => 1                                                                  #
#            => 2                                                                  #
#            => 3                                                                  #
#            => 5                                                                  #
#            => 8                                                                  #
#            => 13                                                                 #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts fib(1)
puts fib(2)
puts fib(3)
puts fib(4)
puts fib(5)
puts fib(6)
puts fib(7)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: HARD (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def fib(num)
  new_array=[]
  (0...num).each do |number|
      if number>1
          new_array<<new_array[number-1]+new_array[number-2]
      else
          new_array<<1
      end
  end
  return new_array[-1]
end
puts fib(1)
puts fib(2)
puts fib(3)
puts fib(4)
puts fib(5)
puts fib(6)
puts fib(7)
  STRING
  answer_string=<<-STRING
1
1
2
3
5
8
13
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# fibonacci =========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'57'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# The fibonacci sequence is a sequence of numbers whose first and second elements  #
# are 1. To generate further elements of the sequence we take the sum of the       #
# previous two elements. For example the first 6 fibonacci numbers are 1, 1, 2,    #
# 3, 5, 8. Write a method fibonacci that takes in a number length and returns the  #
# fibonacci sequence up to the given length.                                       #
#                                                                                  #
# EXAMPLES:                                                                        #
#            puts fibonacci(0)   => []                                             #
#            puts fibonacci(1)   => [1]                                            #
#            puts fibonacci(6)   => [1, 1, 2, 3, 5, 8]                             #
#            puts fibonacci(8)   => [1, 1, 2, 3, 5, 8, 13, 21]                     #
#                                                                                  #
# answers should be:                                                               #
#            => []                                                                 #
#            => [1]                                                                #
#            => [1, 1, 2, 3, 5, 8]                                                 #
#            => [1, 1, 2, 3, 5, 8, 13, 21]                                         #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts fibonacci(0)
puts fibonacci(1)
puts fibonacci(6)
puts fibonacci(8)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def fibonacci(num)
  new_array=[]
  (0...num).each do |number|
      if number>1
          new_array<<new_array[number-1]+new_array[number-2]
      else
          new_array<<1
      end
  end
  return new_array
end
puts fibonacci(0).inspect
puts fibonacci(1).inspect
puts fibonacci(6).inspect
puts fibonacci(8).inspect
  STRING
  answer_string=<<-STRING
[]
[1]
[1, 1, 2, 3, 5, 8]
[1, 1, 2, 3, 5, 8, 13, 21]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# fibonacci_II ======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'58'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method fibonacci_II(n) that takes in a number that represents the        #
# length of a sequence. The method should return the first `n` numbers in the      #
# fibonacci sequence. The first two numbers of the fibonacci sequence are 1 and 1. #
# The next number in the sequence can be found by adding the last two numbers in   #
# the sequence. Solve this without recursion.                                      #
#                                                                                  #
# Examples:                                                                        #
#            fibonacci_II(0)            => []                                      #
#            fibonacci_II(1)            => [ 1 ]                                   #
#            fibonacci_II(2)            => [ 1, 1 ]                                #
#            fibonacci_II(3)            => [ 1, 1, 2 ]                             #
#            fibonacci_II(5)            => [ 1, 1, 2, 3, 5 ]                       #
#            fibonacci_II(10)           => [ 1, 1, 2, 3, 5, 8, 13, 21, 34, 55 ]    #
#                                                                                  #
# answers should be:                                                               #
#            => []                                                                 #
#            => [ 1 ]                                                              #
#            => [ 1, 1 ]                                                           #
#            => [ 1, 1, 2 ]                                                        #
#            => [ 1, 1, 2, 3, 5 ]                                                  #
#            => [ 1, 1, 2, 3, 5, 8, 13, 21, 34, 55 ]                               #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts fibonacci_II(0)
puts fibonacci_II(1)
puts fibonacci_II(2)
puts fibonacci_II(3)
puts fibonacci_II(5)
puts fibonacci_II(10)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def fibonacci_II(num)
  new_array=[]
  while new_array.length<num
      if new_array.length<2
          new_array<<1
      else
          new_array<<new_array[-1]+new_array[-2]
      end
  end
  return new_array
end
puts fibonacci_II(0).inspect
puts fibonacci_II(1).inspect
puts fibonacci_II(2).inspect
puts fibonacci_II(3).inspect
puts fibonacci_II(5).inspect
puts fibonacci_II(10).inspect
  STRING
  answer_string=<<-STRING
[]
[1]
[1, 1]
[1, 1, 2]
[1, 1, 2, 3, 5]
[1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# fibonacci_sequence ================================================================================================#
#====================================================================================================================#

rolling_count+=1
'59'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method fibonacci_sequence(n) that takes in a number and returns the      #
# an array containing the numbers of the fibonacci sequence from 1 to n. For       #
# example the first 5 numbers of the fibonacci sequence are '1, 1, 2, 3, 5'        #
#                                                                                  #
# Examples:                                                                        #
#           fibonacci_sequence(1)   => [1]                                         #
#           fibonacci_sequence(2)   => [1, 1]                                      #
#           fibonacci_sequence(3)   => [1, 1, 2]                                   #
#           fibonacci_sequence(4)   => [1, 1, 2, 3]                                #
#           fibonacci_sequence(5)   => [1, 1, 2, 3, 5]                             #
#           fibonacci_sequence(6)   => [1, 1, 2, 3, 5, 8]                          #
#           fibonacci_sequence(7)   => [1, 1, 2, 3, 5, 8, 13]                      #
#                                                                                  #
# answers should be:                                                               #
#            => [1]                                                                #
#            => [1, 1]                                                             #
#            => [1, 1, 2]                                                          #
#            => [1, 1, 2, 3]                                                       #
#            => [1, 1, 2, 3, 5]                                                    #
#            => [1, 1, 2, 3, 5, 8]                                                 #
#            => [1, 1, 2, 3, 5, 8, 13]                                             #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts fibonacci_sequence(1).inspect
puts fibonacci_sequence(2).inspect
puts fibonacci_sequence(3).inspect
puts fibonacci_sequence(4).inspect
puts fibonacci_sequence(5).inspect
puts fibonacci_sequence(6).inspect
puts fibonacci_sequence(7).inspect

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: HARD (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def fibonacci_sequence(num)
  new_array=[]
  (0...num).each do |number|
      if number>1
          new_array<<new_array[number-1]+new_array[number-2]
      else
          new_array<<1
      end
  end
  return new_array
end
puts fibonacci_sequence(1).inspect
puts fibonacci_sequence(2).inspect
puts fibonacci_sequence(3).inspect
puts fibonacci_sequence(4).inspect
puts fibonacci_sequence(5).inspect
puts fibonacci_sequence(6).inspect
puts fibonacci_sequence(7).inspect
  STRING
  answer_string=<<-STRING
[1]
[1, 1]
[1, 1, 2]
[1, 1, 2, 3]
[1, 1, 2, 3, 5]
[1, 1, 2, 3, 5, 8]
[1, 1, 2, 3, 5, 8, 13]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# first_and_last ====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'60'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method 'first_and_last(array)' that takes in an array of numbers and     #
# returns either:                                                                  #
#             - the sum of the first and last elements of the array if there is an #
#               even number of elements                                            #
#             - the difference between the first and last elements of the array if #
#               there is an odd number of elements.                                #
#                                                                                  #
# You can assume the array contains at least one number.                           #
#                                                                                  #
# Examples:                                                                        #
#             first_and_last([1, 2, 3, 4])              => 5                       #
#             first_and_last([1, 2, 3, 4, 5])           => -4                      #
#             first_and_last([12, 5])                   => 17                      #
#             first_and_last([12])                      => 0                       #
#             first_and_last([7, 11, 3])                => 4                       #
#                                                                                  #
# answers should be:                                                               #
#            => 5                                                                  #
#            => -4                                                                 #
#            => 17                                                                 #
#            => 0                                                                  #
#            => 4                                                                  #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts first_and_last([1, 2, 3, 4])
puts first_and_last([1, 2, 3, 4, 5])
puts first_and_last([12, 5])
puts first_and_last([12])
puts first_and_last([7, 11, 3])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def first_and_last(array)
  if array.length%2==0
      return array.first+array.last
  else
      return array.first-array.last
  end
end
puts first_and_last([1, 2, 3, 4])
puts first_and_last([1, 2, 3, 4, 5])
puts first_and_last([12, 5])
puts first_and_last([12])
puts first_and_last([7, 11, 3])
  STRING
  answer_string=<<-STRING
5
-4
17
0
4
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# first_half ========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'61'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method first_half(array) that takes in an array and returns a new array  #
# containing the first half of the elements in the array. If there is an odd number#
# of elements, return the first half including the middle element.                 #
#                                                                                  #
# EXAMPLES:                                                                        #
#    puts first_half(["Brian", "Abby", "David", "Ommi"]) # => ["Brian", "Abby"]    #
#    puts first_half(["a", "b", "c", "d", "e"])          #=>["a", "b", "c"]        #
#                                                                                  #
# answers should be:                                                               #
#            => ["Brian", "Abby"]                                                  #
#            => ["a", "b", "c"]                                                    #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts first_half(["Brian", "Abby", "David", "Ommi"])
puts first_half(["a", "b", "c", "d", "e"])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def first_half(array)
  return new_array=array[0..((array.length-1)/2.0)]
end
puts first_half(["Brian", "Abby", "David", "Ommi"]).inspect
puts first_half(["a", "b", "c", "d", "e"]).inspect
  STRING
  answer_string=<<-STRING
["Brian", "Abby"]
["a", "b", "c"]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# first_in_array ====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'62'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method first_in_array that takes in an array and two elements, the       #
# method should return the element that appears earlier in the array.              #
#                                                                                  #
# example:                                                                         #
#    first_in_array(["a", "b", "c", "d"], "d", "b")                      => "b"    #
#    first_in_array(["cat", "bird" ,"dog", "mouse" ], "dog", "mouse")    => "dog"  #
#                                                                                  #
# answers should be:                                                               #
#            => "b"                                                                #
#            => "dog"                                                              #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts first_in_array(["a", "b", "c", "d"], "d", "b")
puts first_in_array(["cat", "bird" ,"dog", "mouse" ], "dog", "mouse")

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def first_in_array(array,string1,string2)
  return array.index(string1)<array.index(string2) ? string1 : string2
end
puts first_in_array(["a", "b", "c", "d"], "d", "b")
puts first_in_array(["cat", "bird" ,"dog", "mouse" ], "dog", "mouse")
  STRING
  answer_string=<<-STRING
"b"
"dog"
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# first_last_cap ====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'63'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function `first_last_cap(sentence)` that takes in a sentence and returns #
# a new sentence where the first and last letters of each word is uppercase. All   #
# other characters should be lowercase.                                            #
#                                                                                  #
# Examples:                                                                        #
#           first_last_cap('hello BOOTCAMP PrEp')       =>'HellO BootcamP PreP'    #
#           first_last_cap('what is on the radio')      =>'WhaT IS ON ThE RadiO'   #
#                                                                                  #
# answers should be:                                                               #
#            =>'HellO BootcamP PreP'                                               #
#            =>'WhaT IS ON ThE RadiO'                                              #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts first_last_cap('hello BOOTCAMP PrEp')
puts first_last_cap('what is on the radio')

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def first_last_cap(string)
  array_of_words=string.split
  array_of_words.each_with_index do |word,index|
      array_of_words[index]=word[0].upcase+word[1...-1].downcase+word[-1].upcase
  end
  return array_of_words.join(' ')
end
puts first_last_cap('hello BOOTCAMP PrEp')
puts first_last_cap('what is on the radio')
  STRING
  answer_string=<<-STRING
'HellO BootcamP PreP'
'WhaT IS ON ThE RadiO'
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# first_n_primes ====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'64'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method 'first_n_primes(n)' that returns an array of the first 'n'        #
# prime numbers.                                                                   #
#                                                                                  #
# Examples:                                                                        #
#           first_n_primes(0)          => []                                       #
#           first_n_primes(1)          => [2]                                      #
#           first_n_primes(4)          => [2, 3, 5, 7]                             #
#                                                                                  #
# answers should be:                                                               #
#            => []                                                                 #
#            => [2]                                                                #
#            => [2, 3, 5, 7]                                                       #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts first_n_primes(0).inspect
puts first_n_primes(1).inspect
puts first_n_primes(4).inspect

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def is_a_prime(num)
  (2...num).each do |number|
      return false if num%number==0
  end
  return true
end
def first_n_primes(num)
  new_array=[]
  counter=2
  while new_array.length<num
      if is_a_prime(counter)
          new_array<<counter
      end
      counter+=1
  end
  return new_array
end
puts first_n_primes(0).inspect
puts first_n_primes(1).inspect
puts first_n_primes(4).inspect
  STRING
  answer_string=<<-STRING
[]
[2]
[2, 3, 5, 7]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# fizz_buzz =========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'65'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method fizz_buzz(max) that takes in a number max and returns an array    #
# containing all numbers greater than 0 and less than max that are divisible by    #
# either 4 or 6, but not both.                                                     #
#                                                                                  #
# EXAMPLES:                                                                        #
#          puts fizz_buzz(20) # => [4, 6, 8, 16, 18]                               #
#          puts fizz_buzz(15) # => [4, 6, 8]                                       #
#                                                                                  #
# answers should be:                                                               #
#            => [4, 6, 8, 16, 18]                                                  #
#            => [4, 6, 8]                                                          #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts fizz_buzz(20)
puts fizz_buzz(15)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def fizz_buzz(max)
  new_array=[]
  (1...max).each{|n| new_array<<n if (n%4==0 && n%6!=0)||(n%6==0 && n%4!=0)}
  return new_array
end
puts fizz_buzz(20).inspect
puts fizz_buzz(15).inspect
  STRING
  answer_string=<<-STRING
[4, 6, 8, 16, 18]
[4, 6, 8]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# format_name =======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'66'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method format_name that takes in a name string and returns the name      #
# properly capitalized.                                                            #
#                                                                                  #
# Hint: use str.upcase and str.downcase                                            #
#          "abc".upcase # => "ABC"                                                 #
#                                                                                  #
# example:                                                                         #
#          format_name("chase WILSON")           => "Chase Wilson"                 #
#          format_name("brian CrAwFoRd scoTT")   => "Brian Crawford Scott"         #
#                                                                                  #
# answers should be:                                                               #
#            => "Chase Wilson"                                                     #
#            => "Brian Crawford Scott"                                             #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts format_name("chase WILSON")
puts format_name("brian CrAwFoRd scoTT")

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def format_name(string)
  array_of_names=string.split
  return array_of_names.map{|name| name.capitalize}.join(' ')
end
puts format_name("chase WILSON")
puts format_name("brian CrAwFoRd scoTT")
  STRING
  answer_string=<<-STRING
"Chase Wilson"
"Brian Crawford Scott"
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# frequent_letters ==================================================================================================#
#====================================================================================================================#

rolling_count+=1
'67'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method frequent_letters that takes in a string and returns an array      #
# containing the characters that appeared more than twice in the string.           #
#                                                                                  #
# example:                                                                         #
#          frequent_letters('mississippi')                 => ["i", "s"]           #
#          frequent_letters('bootcamp')                    => []                   #
#                                                                                  #
# answers should be:                                                               #
#            => ["i", "s"]                                                         #
#            => []                                                                 #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts frequent_letters('mississippi')
puts frequent_letters('bootcamp')

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def frequent_letters(string)
  new_array=[]
  array_of_characters=string.chars
  unique_characters=array_of_characters.uniq
  unique_characters.each do |character|
      new_array<<character if array_of_characters.count(character)>2
  end
  return new_array
end
puts frequent_letters('mississippi').inspect
puts frequent_letters('bootcamp').inspect
  STRING
  answer_string=<<-STRING
["i", "s"]
[]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# get_double_age ====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'68'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method 'get_double_age' that takes in a hash and returns twice the "age" #
# value of the hash.                                                               #
#                                                                                  #
# EXAMPLES:                                                                        #
#        puts get_double_age({"name"=>"App Academy", "age"=>5})   => 10            #
#        puts get_double_age({"name"=>"Ruby", "age"=>23})         => 46            #
#                                                                                  #
# answers should be:                                                               #
#            => 10                                                                 #
#            => 46                                                                 #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts get_double_age({"name"=>"App Academy", "age"=>5})
puts get_double_age({"name"=>"Ruby", "age"=>23})

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def get_double_age(hash)
  return hash['age']*2
end
puts get_double_age({"name"=>"App Academy", "age"=>5})
puts get_double_age({"name"=>"Ruby", "age"=>23})
  STRING
  answer_string=<<-STRING
10
46
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# get_full_name =====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'69'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method get_full_name that takes in a hash containing a first, last, and  #
# title. The method should return a string representing the hash's full name       #
#                                                                                  #
# example:                                                                         #
#         hash1 = {"first"=>"Michael", "last"=>"Jordan", "title"=> "GOAT"}         #
#         get_full_name(hash1)                                                     #
#                                                                                  #
#         hash2 = {"first"=>"Fido", "last"=>"McDog", "title"=> "Loyal"}            #
#         puts get_full_name(hash2)                                                #
#                                                                                  #
# answers should be:                                                               #
#            => "Michael Jordan, the GOAT"                                         #
#            => "Fido McDog, the Loyal"                                            #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

hash1 = {"first"=>"Michael", "last"=>"Jordan", "title"=> "GOAT"}
hash2 = {"first"=>"Fido", "last"=>"McDog", "title"=> "Loyal"}
puts get_full_name(hash1)
puts get_full_name(hash2)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def get_full_name(hash)
  return hash['first']+' '+hash['last']+', '+'the '+hash['title']
end
hash1 = {"first"=>"Michael", "last"=>"Jordan", "title"=> "GOAT"}
hash2 = {"first"=>"Fido", "last"=>"McDog", "title"=> "Loyal"}
puts get_full_name(hash1)
puts get_full_name(hash2)
  STRING
  answer_string=<<-STRING
"Michael Jordan, the GOAT"
"Fido McDog, the Loyal"
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# goodbye ===========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'70'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method goodbye(name) that takes in a string name and returns a string    #
# saying bye to that name.                                                         #
#                                                                                  #
# EXAMPLES:                                                                        #
#            puts goodbye("Daniel")   # => "Bye Daniel."                           #
#            puts goodbye("Mark")     # => "Bye Mark."                             #
#            puts goodbye("Beyonce")  # => "Bye Beyonce."                          #
#                                                                                  #
# answers should be:                                                               #
#            => "Bye Daniel."                                                      #
#            => "Bye Mark."                                                        #
#            => "Bye Beyonce."                                                     #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts goodbye("Daniel")
puts goodbye("Mark")
puts goodbye("Beyonce")

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def goodbye(name)
  return "bye \#{name}"
end
puts goodbye("Daniel")
puts goodbye("Mark")
puts goodbye("Beyonce")
  STRING
  answer_string=<<-STRING
"Bye Daniel."
"Bye Mark."
"Bye Beyonce."
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# greatest_common_factor ============================================================================================#
#====================================================================================================================#

rolling_count+=1
'71'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function greatest_common_factor(num1, num2) that returns the greatest    #
# common factor between num1 and num2. This means that the function should return  #
# the largest number that divides both num1 and num2.                              #
#                                                                                  #
# Examples:                                                                        #
#            greatest_common_factor(6, 10)           => 2                          #
#            greatest_common_factor(10, 15)          => 5                          #
#            greatest_common_factor(4, 7)            => 1                          #
#            greatest_common_factor(4, 8)            => 4                          #
#            greatest_common_factor(45, 30)          => 15                         #
#                                                                                  #
# answers should be:                                                               #
#            => 2                                                                  #
#            => 5                                                                  #
#            => 1                                                                  #
#            => 4                                                                  #
#            => 15                                                                 #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts greatest_common_factor(6, 10)
puts greatest_common_factor(10, 15)
puts greatest_common_factor(4, 7)
puts greatest_common_factor(4, 8)
puts greatest_common_factor(45, 30)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def greatest_common_factor(num1,num2)
  greatest=0
  (1..([num1,num2].max)).each do |number|
      if num1%number==0 && num2%number==0
          greatest=number if number>greatest
      end
  end
  return greatest
end
puts greatest_common_factor(6, 10)
puts greatest_common_factor(10, 15)
puts greatest_common_factor(4, 7)
puts greatest_common_factor(4, 8)
puts greatest_common_factor(45, 30)
  STRING
  answer_string=<<-STRING
2
5
1
4
15
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# greatest_factor_array =============================================================================================#
#====================================================================================================================#

rolling_count+=1
'72'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method greatest_factor_array that takes in an array of numbers and       #
# returns a new array where every even number is replaced with it's greatest       #
# factor. A greatest factor is the largest number that divides another with no     #
# remainder. For example the greatest factor of 16 is 8. (For the purpose of this  #
# problem we won't say the greatest factor of 16 is 16, because that would be too  #
# easy, ha)                                                                        #
#                                                                                  #
# EXAMPLES:                                                                        #
#           puts greatest_factor_array([16, 7, 9, 14])                             #
#           puts greatest_factor_array([30, 3, 24, 21, 10])                        #
#                                                                                  #
# answers should be:                                                               #
#            => [8, 7, 9, 7]                                                       #
#            => [15, 3, 12, 21, 5]                                                 #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts greatest_factor_array([16, 7, 9, 14])
puts greatest_factor_array([30, 3, 24, 21, 10])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def get_greatest_factor(num)
  (num-1).downto(2) do |number|
      return number if num%number==0
  end
end
def greatest_factor_array(array)
  new_array=[]
  array.each do |num|
      if num%2==0
          new_array<<get_greatest_factor(num)
      else
          new_array<<num
      end
  end
  return new_array
end
puts greatest_factor_array([16, 7, 9, 14]).inspect
puts greatest_factor_array([30, 3, 24, 21, 10]).inspect
  STRING
  answer_string=<<-STRING
[8, 7, 9, 7]
[15, 3, 12, 21, 5]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# hand_score ========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'73'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method hand_score that takes in a string representing a hand of cards    #
# and returns it's total score. You can assume the letters in the string are only  #
# A, K, Q, J. A is worth 4 points, K is 3 points, Q is 2 points, and J is 1 point. #
# The letters of the input string not necessarily uppercase.                       #
#                                                                                  #
# example:                                                                         #
#          hand_score("AQAJ")         => 11                                        #
#          hand_score("jJka")         => 9                                         #
#                                                                                  #
# answers should be:                                                               #
#            => 11                                                                 #
#            => 9                                                                  #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts hand_score("AQAJ")
puts hand_score("jJka")

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def hand_score(string)
  score=0
  scores={'A'=>4,'K'=>3,'Q'=>2,'J'=>1}
  string=string.upcase
  string.each_char do |character|
      score+=scores[character]
  end
  return score
end
puts hand_score("AQAJ")
puts hand_score("jJka")
  STRING
  answer_string=<<-STRING
11
9
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# has_all_vowels ====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'74'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method 'has_all_vowels(str)' that takes in a string and returns true if  #
# the string contains every vowel (a, e, i, o, u) and false otherwise.             #
#                                                                                  #
# Examples:                                                                        #
#            has_all_vowels('have you gone biking?')                 => true       #
#            has_all_vowels('get out of the way, silly')             => true       #
#            has_all_vowels('bootcamp prep')                         => false      #
#            has_all_vowels('hello world')                           => false      #
#                                                                                  #
# answers should be:                                                               #
#            => true                                                               #
#            => true                                                               #
#            => false                                                              #
#            => false                                                              #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts has_all_vowels('have you gone biking?')
puts has_all_vowels('get out of the way, silly')
puts has_all_vowels('bootcamp prep')
puts has_all_vowels('hello world')

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: HARD (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def has_all_vowels(string)
  vowels='aeiou'
  vowels.each_char do |character|
      return false if !string.include?(character)
  end
  return true
end
puts has_all_vowels('have you gone biking?')
puts has_all_vowels('get out of the way, silly')
puts has_all_vowels('bootcamp prep')
puts has_all_vowels('hello world')
  STRING
  answer_string=<<-STRING
true
true
false
false
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# has_favorite_food =================================================================================================#
#====================================================================================================================#

rolling_count+=1
'75'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method 'has_favorite_food(hsh, food)' that takes in a hash and a food    #
# string. The function should return true if the hash has that favorite food.      #
#                                                                                  #
# answers should be:                                                               #
#            => true                                                               #
#            => false                                                              #
#            => true                                                               #
#            => false                                                              #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

dog = {
'name'=>'Fido',
'favoriteFoods'=>['chicken', 'sausage', 'scooby snacks']
}
person = {
   'name'=>'Al',
   'favoriteFoods'=>['pizza', 'burgers', 'ramen']
  }
puts has_favorite_food(dog, 'sausage')
puts has_favorite_food(dog, 'cat food')
puts has_favorite_food(person, 'burgers')
puts has_favorite_food(person, 'fish')

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def has_favorite_food(hash,food_item)
  foods=hash['favoriteFoods']
  return foods.include?(food_item)
end
dog = {
  'name'=>'Fido',
  'favoriteFoods'=>['chicken', 'sausage', 'scooby snacks']
 }
person = {
     'name'=>'Al',
     'favoriteFoods'=>['pizza', 'burgers', 'ramen']
    }
puts has_favorite_food(dog, 'sausage')
puts has_favorite_food(dog, 'cat food')
puts has_favorite_food(person, 'burgers')
puts has_favorite_food(person, 'fish')
  STRING
  answer_string=<<-STRING
true
false
true
false
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# hash_size =========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'76'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method 'hash_size(hash)' that takes in a hash and returns the number of  #
# key-value pairs in the hash.                                                     #
#                                                                                  #
# Examples:                                                                        #
#            hash1 = {                                                             #
#                         'name'=>'Fido',                                          #
#                         'age'=>'4'                                               #
#                    }                                                             #
#                                                                                  #
#            hash_size(hash1)                                  => 2                #
#                                                                                  #
#            hash2 = {                                                             #
#                         'name'=>'App Academy',                                   #
#                         'course'=>'Bootcamp Prep',                               #
#                         'locations'=>['SF', 'NY']                                #
#                    }                                                             #
#                                                                                  #
#            hash_size(hash2)                                   => 3               #
#                                                                                  #
# answers should be:                                                               #
#            => 2                                                                  #
#            => 3                                                                  #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

hash1 = {
         'name'=>'Fido',
         'age'=>'4'
      }
puts hash_size(hash1)
hash2 = {
         'name'=>'App Academy',
         'course'=>'Bootcamp Prep',
         'locations'=>['SF', 'NY']
      }
puts hash_size(hash2)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def hash_size(hash)
  return hash.length
end
hash1 = {
  'name'=>'Fido',
  'age'=>'4'
}
puts hash_size(hash1)
hash2 = {
  'name'=>'App Academy',
  'course'=>'Bootcamp Prep',
  'locations'=>['SF', 'NY']
}
puts hash_size(hash2)
  STRING
  answer_string=<<-STRING
2
3
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# hash_to_pairs =====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'77'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method hash_to_pairs that takes in a hash and returns a 2D array         #
# representing each key-value pair of the hash.                                    #
#                                                                                  #
# example:                                                                         #
#          hash_to_pairs({"name"=>"skateboard", "wheels"=>4,                       #
#                         "weight"=>"7.5 lbs"})                                    #
#          hash_to_pairs({"kingdom"=>"animalia", "genus"=>"canis",                 #
#                         "breed"=>"German Shepherd"})                             #
#                                                                                  #
# answers should be:                                                               #
#            => [["name", "skateboard"], ["wheels", 4], ["weight", "7.5 lbs"]]     #
#            => [["kingdom", "animalia"], ["genus", "canis"], ["breed",            #
#                 "German Shepherd"]]                                              #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts hash_to_pairs({"name"=>"skateboard", "wheels"=>4, "weight"=>"7.5 lbs"})
puts hash_to_pairs({"kingdom"=>"animalia", "genus"=>"canis", "breed"=>"German Shepherd"})

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def hash_to_pairs(hash)
  new_array=[]
  hash.each_key do |key|
      new_array<<[key,hash[key]]
  end
  return new_array
end
puts hash_to_pairs({"name"=>"skateboard", "wheels"=>4, "weight"=>"7.5 lbs"}).inspect
puts hash_to_pairs({"kingdom"=>"animalia", "genus"=>"canis", "breed"=>"German Shepherd"}).inspect
  STRING
  answer_string=<<-STRING
[["name", "skateboard"], ["wheels", 4], ["weight", "7.5 lbs"]]
[["kingdom", "animalia"], ["genus", "canis"], ["breed", "German Shepherd"]]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# highest_Score =====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'78'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method highest_score(students) that takes in an array of student hashes  #
# as a parameter. It should return a string that corresponds to the student with   #
# the highest score. The string should contain that student's initials concatenated#
# with their id. Assume the array contains at least 1 student object and the       #
# student with the highest score is unique (there are no ties).                    #
#                                                                                  #
# Example:                                                                         #
#          students = [                                                            #
#                        {'name'=>'Alvin Zablan', 'id'=>128, 'score'=>-42},        #
#                        {'name'=>'Eliot Bradshaw', 'id'=>32, 'score'=>57},        #
#                        {'name'=>'Tommy Duek', 'id'=>2, 'score'=>99},             #
#                        {'name'=>'Fred Sladkey', 'id'=>256, 'score'=>94}          #
#                     ]                                                            #
#                                                                                  #
#                     highest_score(students)              => 'TD2'                #
#                                                                                  #
# answers should be:                                                               #
#            => 'TD2'                                                              #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

students = [
           {'name'=>'Alvin Zablan', 'id'=>128, 'score'=>-42},
           {'name'=>'Eliot Bradshaw', 'id'=>32, 'score'=>57},
           {'name'=>'Tommy Duek', 'id'=>2, 'score'=>99},
           {'name'=>'Fred Sladkey', 'id'=>256, 'score'=>94}
         ]
puts highest_score(students)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def highest_score(array)
  highest_points=0
  name=''
  id=0
  initial=''
  array.each do |student|
      name=student['name'].split
      score=student['score']
      id=student['id']
      if score>highest_points
          highest_points=score
          initial=name[0][0]+name[1][0]+id.to_s
      end
  end
  return initial
end
students = [
  {'name'=>'Alvin Zablan', 'id'=>128, 'score'=>-42},
  {'name'=>'Eliot Bradshaw', 'id'=>32, 'score'=>57},
  {'name'=>'Tommy Duek', 'id'=>2, 'score'=>99},
  {'name'=>'Fred Sladkey', 'id'=>256, 'score'=>94}
]
puts highest_score(students)
  STRING
  answer_string=<<-STRING
'TD2'
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# hipsterfy =========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'79'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method 'hipsterfy(sentence)' that takes a string containing several words#
# as input. Remove the last vowel from each word. 'y' is not a vowel.              #
#                                                                                  #
# Examples:                                                                        #
#           hipsterfy("proper")                       => "propr"                   #
#           hipsterfy("proper tonic panther")         => "propr tonc panthr"       #
#           hipsterfy("towel flicker banana")         => "towl flickr banan"       #
#           hipsterfy("runner anaconda")              => "runnr anacond"           #
#           hipsterfy("turtle cheeseburger fries")    => "turtl cheeseburgr fris"  #
#                                                                                  #
# answers should be:                                                               #
#            => "propr"                                                            #
#            => "propr tonc panthr"                                                #
#            => "towl flickr banan"                                                #
#            => "runnr anacond"                                                    #
#            => "turtl cheeseburgr fris"                                           #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts hipsterfy("proper")
puts hipsterfy("proper tonic panther")
puts hipsterfy("towel flicker banana")
puts hipsterfy("runner anaconda")
puts hipsterfy("turtle cheeseburger fries")

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def get_last_vowel_index(word)
  last_index=0
  vowels='aeiou'
  word.each_char.with_index do |character,index|
      last_index=index if vowels.include?(character)
  end
  return last_index
end
def hypsterfycation(word)
  new_string=''
  last_index=get_last_vowel_index(word)
  word.each_char.with_index do |character,index|
      new_string+=character if last_index!=index
  end
  return new_string
end
def hipsterfy(string)
  array_of_words=string.split
  array_of_words.each_with_index do |word,index|
      array_of_words[index]=hypsterfycation(word)
  end
  return array_of_words.join(' ')
end
puts hipsterfy("proper")
puts hipsterfy("proper tonic panther")
puts hipsterfy("towel flicker banana")
puts hipsterfy("runner anaconda")
puts hipsterfy("turtle cheeseburger fries")
  STRING
  answer_string=<<-STRING
"propr"
"propr tonc panthr"
"towl flickr banan"
"runnr anacond"
"turtl cheeseburgr fris"
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# in_all_strings ====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'80'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method 'in_all_strings(long_strings, short_string)' Check if a           #
# 'short_string' is inside of ALL of the strings in the 'longStrings' array.       #
# The method should return 'true' if the 'substring' is inside of every string     #
# of the 'long_strings' array.                                                     #
#                                                                                  #
# answers should be:                                                               #
#           => true                                                                #
#           => false                                                               #
#           => false                                                               #
#           => true                                                                #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts in_all_strings(["thisisaverylongstring", "thisisanotherverylongstring"], "sisa")
puts in_all_strings(["thisisaverylongstring", "thisisanotherverylongstring"], "isan")
puts in_all_strings(["gandalf", "aragorn", "sauron"], "sam")
puts in_all_strings(["axe", "ajax", "axl rose"], "ax")

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def in_all_strings(strings,word)
  return strings.all?{|words| words.include?(word)}
end
puts in_all_strings(["thisisaverylongstring", "thisisanotherverylongstring"], "sisa")
puts in_all_strings(["thisisaverylongstring", "thisisanotherverylongstring"], "isan")
puts in_all_strings(["gandalf", "aragorn", "sauron"], "sam")
puts in_all_strings(["axe", "ajax", "axl rose"], "ax")
  STRING
  answer_string=<<-STRING
true
false
false
true
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# in_pig_latin ======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'81'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method 'in_pig_latin(sentence)' that translates an entire sentence       #
# into pig latin. Any words that were capitalized in the input sentence should     #
# be also capitalized in the new sentence.                                         #
#                                                                                  #
# rules     * if word is less than 3 letters and does not end in a 'y' then        #
#             add a 'yay' at the end                                               #
#           * if word is less than 3 letters and ends with a y then add a 'ay'     #
#             at the end                                                           #
#           * if the word starts with a vowel then add a 'yay' at the end          #
#           * if word does not start with a vowel then take the letters from the   #
#             beginning up to but not including the first vowel and put the letter #
#             at the end of the word and add a 'ay' at the end                     #
#                                                                                  #
# answers should be:                                                               #
#           => 'Anthonyshmay isyay ethay estbay eachertay'                         #
#           => 'etlay usyay Anceday'                                               #
#           => 'isthay isyay ethay imetay ofyay myay ifelay'                       #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts in_pig_latin("Shmanthony is the best teacher")
puts in_pig_latin("let us Dance")
puts in_pig_latin("this is the time of my life")

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def first_vowel_index(word)
  index=0
  vowels='aeiou'
  word.each_char.with_index do |character,index|
      return index if vowels.include?(character)
  end
  return index
end
def pig_latinize(word)
  vowels='aeiou'
  if word.length<3 && word[-1]=='y'
      return word+'ay'
  elsif word.length<3
      return word+'yay'
  elsif vowels.include?(word[0])
      return word+'yay'
  else
      index=first_vowel_index(word)
      return word[index..-1]+word[0...index]+'ay'
  end
end
def in_pig_latin(string)
  array_of_words=string.split
  array_of_words.each_with_index do |word,index|
      if word[0].upcase==word[0]
          word=pig_latinize(word.downcase)
          array_of_words[index]=word.capitalize
      else
          array_of_words[index]=pig_latinize(word)
      end
  end
  return array_of_words.join(' ')
end
puts in_pig_latin("Shmanthony is the best teacher")
puts in_pig_latin("let us Dance")
puts in_pig_latin("this is the time of my life")
  STRING
  answer_string=<<-STRING
'Anthonyshmay isyay ethay estbay eachertay'
'etlay usyay Anceday'
'isthay isyay ethay imetay ofyay myay ifelay'
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# isSorted ==========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'82'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function `is_sorted(array)` that takes in an array of numbers and returns#
# true if the elements of the array are in increasing sorted order and returns     #
# false if the elements are not in increasing order.                               #
#                                                                                  #
# Examples:                                                                        #
#           is_sorted([3, 5, 11, 9, 15, 16])                => false               #
#           is_sorted([3, 5, 11, 13, 15, 16])               => true                #
#           is_sorted([9, 4, 1, 5, 6, 2])                   => false               #
#           is_sorted([1, 2, 4, 5, 6, 9])                   => true                #
#                                                                                  #
# answers should be:                                                               #
#            => false                                                              #
#            => true                                                               #
#            => false                                                              #
#            => true                                                               #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts is_sorted([3, 5, 11, 9, 15, 16])
puts is_sorted([3, 5, 11, 13, 15, 16])
puts is_sorted([9, 4, 1, 5, 6, 2])
puts is_sorted([1, 2, 4, 5, 6, 9])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def is_sorted(array)
  array.each_with_index do |element,index|
      if index>0
          return false if array[index-1]>element
      end
  end
  return true
end
puts is_sorted([3, 5, 11, 9, 15, 16])
puts is_sorted([3, 5, 11, 13, 15, 16])
puts is_sorted([9, 4, 1, 5, 6, 2])
puts is_sorted([1, 2, 4, 5, 6, 9])
  STRING
  answer_string=<<-STRING
false
true
false
true
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# is_anagram_with_dups ==============================================================================================#
#====================================================================================================================#

rolling_count+=1
'83'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# write a method, 'is_anagram_with_dups', that takes two strings and returns       #
# true if they are anagrams or false if they are not. the strings may contain      #
# duplicates characters! do not use sort to sort out the characters                #
#                                                                                  #
# answers should be:                                                               #
#           => true                                                                #
#           => true                                                                #
#           => false                                                               #
#           => false                                                               #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts is_anagram_with_dups("iceman", "cinema")
puts is_anagram_with_dups("bat", "tab")
puts is_anagram_with_dups("leoo", "lleo")
puts is_anagram_with_dups("abab", "abbb")

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: HARD  (FUNCTIONAL PROGRAMMING)                                       #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def is_anagram_with_dups(word1,word2)
  return false if word1.length!=word2.length
  while word1.length>0
      if word2.include?(word1[0])
          word2.slice!(word2.index(word1[0]))
      end
      word1.slice!(0)
  end
  return word1.length==word2.length
end
puts is_anagram_with_dups("iceman", "cinema")
puts is_anagram_with_dups("bat", "tab")
puts is_anagram_with_dups("leoo", "lleo")
puts is_anagram_with_dups("abab", "abbb")
  STRING
  answer_string=<<-STRING
true
true
false
false
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# is_factor_of ======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'84'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Define a function 'is_factor_of(number, factor)' that returns 'true' if 'factor' #
# is a factor of 'number'. 'false' otherwise. A factor is a number that divides    #
# another number without a leftover remainder.                                     #
#                                                                                  #
# answers should be:                                                               #
#            => true                                                               #
#            => true                                                               #
#            => false                                                              #
#            => false                                                              #
#.. CUT AND PASTE .................................................................#

puts is_factor_of(6,2)
puts is_factor_of(-6, 2)
puts is_factor_of(22, 7)
puts is_factor_of(5,0)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def is_factor_of(number,factor)
  if number==0 || factor==0
      return false
  else
      return number%factor==0
  end
end
puts is_factor_of(6,2)
puts is_factor_of(-6, 2)
puts is_factor_of(22, 7)
puts is_factor_of(5,0)
  STRING
  answer_string=<<-STRING
true
true
false
false
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# is_inside =========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'85'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function `is_inside(array, ele)` that returns true if `ele` is an        #
# element inside of the `array`, false otherwise.                                  #
#                                                                                  #
# Example:                                                                         #
#           is_inside(['chase', 'phi', 'eliot'], 'eliot')        => true           #
#           is_inside(['chase', 'phi', 'eliot'], 'fred')         => false          #
#                                                                                  #
# answers should be:                                                               #
#            => true                                                               #
#            => false                                                              #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts is_inside(['chase', 'phi', 'eliot'], 'eliot')
puts is_inside(['chase', 'phi', 'eliot'], 'fred')

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def is_inside(array,string)
  return array.include?(string)
end
puts is_inside(['chase', 'phi', 'eliot'], 'eliot')
puts is_inside(['chase', 'phi', 'eliot'], 'fred')
  STRING
  answer_string=<<-STRING
true
false
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# is_palindrome  ====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'86'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method is_palindrome(sentence) that returns true if the characters of    #
# the sentence string form a palindrome, false otherwise. A palindrome is a word   #
# or phrase that is the same forwards and backwards.                               #
#                                                                                  #
# Examples:                                                                        #
#            is_palindrome('rats live on no evil star')         => true            #
#            is_palindrome('stella won no wallets')             => true            #
#            is_palindrome('racecar')                           => true            #
#            is_palindrome('hello world')                       => false           #
#                                                                                  #
# answers should be:                                                               #
#            => true                                                               #
#            => true                                                               #
#            => true                                                               #
#            => false                                                              #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts is_palindrome('rats live on no evil star')
puts is_palindrome('stella won no wallets')
puts is_palindrome('racecar')
puts is_palindrome('hello world')

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def is_palindrome(string)
  string=string.split(' ').join('')
  string.each_char.with_index do |character,index|
      return false if character!=string[(string.length-1)-index]
  end
  return true
end
puts is_palindrome('rats live on no evil star')
puts is_palindrome('stella won no wallets')
puts is_palindrome('racecar')
puts is_palindrome('hello world')
  STRING
  answer_string=<<-STRING
true
true
true
false
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# is_power_of_two ===================================================================================================#
#====================================================================================================================#

rolling_count+=1
'87'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function `is_power_of_two(num)` that takes in a number and returns a     #
# boolean indicating whether or not the number is a power of two.                  #
#                                                                                  #
# The powers of two are 1, 2, 4, 8, 16, 32, 64, ... etc                            #
#                                                                                  #
# Examples:                                                                        #
#            is_power_of_two(1)         => true                                    #
#            is_power_of_two(32)        => true                                    #
#            is_power_of_two(12)        => false                                   #
#            is_power_of_two(33)        => false                                   #
#            is_power_of_two(-8)        => false                                   #
#                                                                                  #
# answers should be:                                                               #
#            => true                                                               #
#            => true                                                               #
#            => false                                                              #
#            => false                                                              #
#            => false                                                              #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts is_power_of_two(1)
puts is_power_of_two(32)
puts is_power_of_two(12)
puts is_power_of_two(33)
puts is_power_of_two(-8)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def is_power_of_two(num)
  power=1
  while power<=num
      return true if power==num
      power*=2
  end
  false
end
puts is_power_of_two(1)
puts is_power_of_two(32)
puts is_power_of_two(12)
puts is_power_of_two(33)
puts is_power_of_two(-8)
  STRING
  answer_string=<<-STRING
true
true
false
false
false
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# is_prime ==========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'88'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Define a method 'is_prime(number)' that returns 'true' if 'number' is prime.     #
# Otherwise, false. Assume 'number' is a positive integer.                         #
#                                                                                  #
# answers should be:                                                               #
#            => true                                                               #
#            => false                                                              #
#            => true                                                               #
#            => false                                                              #
#            => true                                                               #
#.. CUT AND PASTE .................................................................#

puts is_prime(2)
puts is_prime(10)
puts is_prime(11)
puts is_prime(9)
puts is_prime(2017)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def is_prime(num)
  (2...num).each do |number|
      return false if num%number==0
  end
  return true
end
puts is_prime(2)
puts is_prime(10)
puts is_prime(11)
puts is_prime(9)
puts is_prime(2017)
  STRING
  answer_string=<<-STRING
true
false
true
false
true
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# is_prime_two ======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'89'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method 'is_prime_two(number)' that returns a boolean indicating if       #
# 'number' is prime or not. Assume 'number' is a positive integer.                 #
#                                                                                  #
# Examples:                                                                        #
#           is_prime_two(2)               => true                                  #
#           is_prime_two(1693)            => true                                  #
#           is_prime_two(15)              => false                                 #
#           is_prime_two(303212)          => false                                 #
#                                                                                  #
# answers should be:                                                               #
#            => true                                                               #
#            => true                                                               #
#            => false                                                              #
#            => false                                                              #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts is_prime_two(2)
puts is_prime_two(1693)
puts is_prime_two(15)
puts is_prime_two(303212)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def is_prime_two(num)
return false if num<2
(2...num).each do |number|
    return false if num%number==0
end
return true
end
puts is_prime_two(2)
puts is_prime_two(1693)
puts is_prime_two(15)
puts is_prime_two(303212)
  STRING
  answer_string=<<-STRING
true
true
false
false
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# is_unique_anagram =================================================================================================#
#====================================================================================================================#

rolling_count+=1
'90'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method is_unique_anagram(word1, word2) that takes in two strings. The    #
# method should return true if the strings are anagrams of each other, false       #
# otherwise. Anagrams are strings that contain the same characters, but not        #
# necessarily in the same order. Assume there will be no repeated characters in    #
# each input string.                                                               #
#                                                                                  #
# Examples:                                                                        #
#           is_unique_anagram('iceman', 'cinema')              => true             #
#           is_unique_anagram('abcd', 'adcb')                  => true             #
#           is_unique_anagram('abcd', 'adxb')                  => false            #
#           is_unique_anagram('abcd', 'abcdx')                 => false            #
#                                                                                  #
# answers should be:                                                               #
#            => true                                                               #
#            => true                                                               #
#            => false                                                              #
#            => false                                                              #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts is_unique_anagram('iceman', 'cinema')
puts is_unique_anagram('abcd', 'adcb')
puts is_unique_anagram('abcd', 'adxb')
puts is_unique_anagram('abcd', 'abcdx')

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def is_unique_anagram(word1,word2)
  return false if word1.length!=word2.length
  word1.each_char do |character|
      return false if !word2.include?(character)
  end
  return true
end
puts is_unique_anagram('iceman', 'cinema')
puts is_unique_anagram('abcd', 'adcb')
puts is_unique_anagram('abcd', 'adxb')
puts is_unique_anagram('abcd', 'abcdx')
  STRING
  answer_string=<<-STRING
true
true
false
false
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# is_valid_email ====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'91'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method is_valid_email that takes in a string and returns a boolean       #
# indicating whether or not it is a valid email address.                           #
#                                                                                  #
# For simplicity, we'll consider an email valid when it satisfies all of the       #
# following:                                                                       #
#                - contains exactly one @ symbol                                   #
#                - contains only lowercase alphabetic letters before the @         #
#                - contains exactly one . after the @                              #
#                                                                                  #
# example:                                                                         #
#          is_valid_email("abc@xy.z")           => true                            #
#          is_valid_email("jdoe@gmail.com")     => true                            #
#          is_valid_email("jdoe@g@mail.com")    => false                           #
#          is_valid_email("jdoe42@gmail.com")   => false                           #
#          is_valid_email("jdoegmail.com")      => false                           #
#          is_valid_email("az@email")           => false                           #
#                                                                                  #
# answers should be:                                                               #
#            => true                                                               #
#            => true                                                               #
#            => false                                                              #
#            => false                                                              #
#            => false                                                              #
#            => false                                                              #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts is_valid_email("abc@xy.z")
puts is_valid_email("jdoe@gmail.com")
puts is_valid_email("jdoe@g@mail.com")
puts is_valid_email("jdoe42@gmail.com")
puts is_valid_email("jdoegmail.com")
puts is_valid_email("az@email")

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def is_valid_email(string)
  lower_alpha='abcdefghijklmnopqrstuvwxyz'
  return false if string.chars.count('@')!=1
  user_name=string[0...(string.index('@'))]
  return false if user_name.each_char.any?{|c| !lower_alpha.include?(c)}
  email=string[(string.index('@'))..-1]
  return false if email.chars.count('.')!=1
  return true
end
puts is_valid_email("abc@xy.z")
puts is_valid_email("jdoe@gmail.com")
puts is_valid_email("jdoe@g@mail.com")
puts is_valid_email("jdoe42@gmail.com")
puts is_valid_email("jdoegmail.com")
puts is_valid_email("az@email")
  STRING
  answer_string=<<-STRING
true
true
false
false
false
false
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# is_valid_name =====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'92'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method is_valid_name that takes in a string and returns a boolean        #
# indicating whether or not it is a valid name.                                    #
#                                                                                  #
# A name is valid is if satisfies all of the following:                            #
#         - contains at least a first name and last name, separated by spaces      #
#         - each part of the name should be capitalized                            #
#                                                                                  #
# Hint: use str.upcase or str.downcase                                             #
#         "a".upcase # => "A"                                                      #
#                                                                                  #
# example:                                                                         #
#          is_valid_name("Kush Patel")       # => true                             #
#          is_valid_name("Daniel")           # => false                            #
#          is_valid_name("Robert Downey Jr") # => true                             #
#          is_valid_name("ROBERT DOWNEY JR") # => false                            #
#                                                                                  #
# answers should be:                                                               #
#            => true                                                               #
#            => false                                                              #
#            => true                                                               #
#            => false                                                              #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts is_valid_name("Kush Patel")
puts is_valid_name("Daniel")
puts is_valid_name("Robert Downey Jr")
puts is_valid_name("ROBERT DOWNEY JR")

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def is_valid_name(string)
  array_of_words=string.split
  if (array_of_words.length<2) || (array_of_words.any?{|word| word.capitalize!=word})
     return false
  else
      return true
  end
end
puts is_valid_name("Kush Patel")
puts is_valid_name("Daniel")
puts is_valid_name("Robert Downey Jr")
puts is_valid_name("ROBERT DOWNEY JR")
  STRING
  answer_string=<<-STRING
true
false
true
false
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# isogram_matcher ===================================================================================================#
#====================================================================================================================#

rolling_count+=1
'93'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# An isogram is a word with only unique, non-repeating letters. Given two isograms #
# of the same length, return an array with two numbers indicating matches: the     #
# first number is the number of letters matched in both words at the same position,#
# and the second is the number of letters matched in both words but not in the same#
# position.                                                                        #
#                                                                                  #
# Example:                                                                         #
#                                                                                  #
# isogram_matcher("an", "at")                                => [1, 0]             #
# isogram_matcher("or", "go")                                => [0, 1]             #
# isogram_matcher("cat", "tap")                              => [1, 1]             #
# isogram_matcher("home", "dome")                            => [3, 0]             #
# isogram_matcher("ultrasonic", "ostracized")                => [3, 4]             #
# isogram_matcher("unpredictably", "hydromagnetic")          => [1, 8]             #
#                                                                                  #
# answers should be:                                                               #
#            => [1, 0]                                                             #
#            => [0, 1]                                                             #
#            => [1, 1]                                                             #
#            => [3, 0]                                                             #
#            => [3, 4]                                                             #
#            => [1, 8]                                                             #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts isogram_matcher("an", "at")
puts isogram_matcher("or", "go")
puts isogram_matcher("cat", "tap")
puts isogram_matcher("home", "dome")
puts isogram_matcher("ultrasonic", "ostracized")
puts isogram_matcher("unpredictably", "hydromagnetic")

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: HARD (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def isogram_matcher(word1,word2)
  matched_same_position=0
  matched_different_position=0
  word1.each_char.with_index do |character,w1_index|
      if word2.include?(character)
          w2_index=word2.index(character)
          if w1_index==w2_index
              matched_same_position+=1
          else
              matched_different_position+=1
          end
      end
  end
  return [matched_same_position,matched_different_position]
end
puts isogram_matcher("an", "at").inspect
puts isogram_matcher("or", "go").inspect
puts isogram_matcher("cat", "tap").inspect
puts isogram_matcher("home", "dome").inspect
puts isogram_matcher("ultrasonic", "ostracized").inspect
puts isogram_matcher("unpredictably", "hydromagnetic").inspect
  STRING
  answer_string=<<-STRING
[1, 0]
[0, 1]
[1, 1]
[3, 0]
[3, 4]
[1, 8]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# laligat_array  ====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'94'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method laligat_array(array) that takes in an array of numbers and        #
# returns a new array where each number is replaced with its laligat sum.          #
#                                                                                  #
# A number's laligat sum is the the sum of all the prime numbers less than or      #
# equal to that number.                                                            #
#                                                                                  #
# For example, the laligat sum of 10 is: 2 + 3 + 5 + 7 = 17                        #
#                                                                                  #
# Examples:                                                                        #
#            laligat_array([10, 11, 20, 15])            => [ 17, 28, 77, 41 ]      #
#            laligat_array([1, 2, 3, 4, 5])             => [ 0, 2, 5, 5, 10 ]      #
#                                                                                  #
# answers should be:                                                               #
#            => [ 17, 28, 77, 41 ]                                                 #
#            => [ 0, 2, 5, 5, 10 ]                                                 #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts laligat_array([10, 11, 20, 15])
puts laligat_array([1, 2, 3, 4, 5])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def is_prime?(num)
  return false if num<2
  (2...num).each do |number|
      return false if num%number==0
  end
  return true
end
def get_primes_for_number(number)
  new_array=[]
  (2..number).each do |num|
      new_array<<num if is_prime?(num)
  end
  return new_array
end
def get_laligat_sum(number)
  sum=0
  primes=get_primes_for_number(number)
  primes.each do |prime|
      sum+=prime
  end
  return sum
end
def laligat_array(array)
  array.each_with_index do |num,index|
      array[index]=get_laligat_sum(num)
  end
  return array
end
puts laligat_array([10, 11, 20, 15]).inspect
puts laligat_array([1, 2, 3, 4, 5]).inspect
  STRING
  answer_string=<<-STRING
[17, 28, 77, 41]
[0, 2, 5, 5, 10]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# last_index ========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'95'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method last_index that takes in a string and a character. The method     #
# should return the last index where the character can be found in the string.     #
#                                                                                  #
# EXAMPLES:                                                                        #
#           puts last_index("abca", "a")                 => 3                      #
#           puts last_index("mississipi", "i")           => 9                      #
#           puts last_index("octagon", "o")              => 5                      #
#           puts last_index("programming", "m")          => 7                      #
#                                                                                  #
# answers should be:                                                               #
#            => 3                                                                  #
#            => 9                                                                  #
#            => 5                                                                  #
#            => 7                                                                  #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts last_index("abca", "a")
puts last_index("mississipi", "i")
puts last_index("octagon", "o")
puts last_index("programming", "m")

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def last_index(string,letter)
  idx=0
  string.each_char.with_index do |character,index|
      idx=index if character==letter
  end
  return idx
end
puts last_index("abca", "a")
puts last_index("mississipi", "i")
puts last_index("octagon", "o")
puts last_index("programming", "m")
  STRING
  answer_string=<<-STRING
3
9
5
7
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# lcm ===============================================================================================================#
#====================================================================================================================#

rolling_count+=1
'96'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method 'lcm(num1, num2)' that returns the lowest number which is a       #
# multiple of both num1 and num2.                                                  #
#                                                                                  #
# Examples:                                                                        #
#           lcm(2, 3)                => 6                                          #
#           lcm(6, 10)               => 30                                         #
#           lcm(24, 26)              => 312                                        #
#                                                                                  #
# answers should be:                                                               #
#            => 6                                                                  #
#            => 30                                                                 #
#            => 312                                                                #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts lcm(2, 3)
puts lcm(10, 6)
puts lcm(24, 26)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def lcm(num1,num2)
(2..(num1>num2 ? num1 : num2)).each do |number|
    if (num1*number)%num2==0
        return (num1*number)
    end
end
end
puts lcm(2, 3)
puts lcm(10, 6)
puts lcm(24, 26)
  STRING
  answer_string=<<-STRING
6
30
312
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# letter_count ======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'97'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method, 'letter_count(str)' that takes a string and returns a hash       #
# mapping each letter to its frequency. Do not include spaces.                     #
#                                                                                  #
# answers should be:                                                               #
#           => {"c"=>1, "a"=>1, "t"=>1}                                            #
#           => {"m"=>1, "o"=>2, "n"=>1}                                            #
#           => {"a"=>2, "c"=>1, "e"=>1, "f"=>1, "n"=>1, "r"=>1, "s"=>1, "t"=>1,    #
#               "u"=>1}                                                            #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts letter_count("cat")
puts letter_count("moon")
puts letter_count("cats are fun")

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def letter_count(string)
  new_hash=Hash.new{0}
  string.each_char do |c|
      new_hash[c]+=1 if c!=' '
  end
  return new_hash
end
puts letter_count("cat")
puts letter_count("moon")
puts letter_count("cats are fun").to_a.sort.to_h
  STRING
  answer_string=<<-STRING
{"c"=>1, "a"=>1, "t"=>1}
{"m"=>1, "o"=>2, "n"=>1}
{"a"=>2, "c"=>1, "e"=>1, "f"=>1, "n"=>1, "r"=>1, "s"=>1, "t"=>1, "u"=>1}
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# long_word_count ===================================================================================================#
#====================================================================================================================#

rolling_count+=1
'98'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function `long_word_count(string)` that takes in a string and returns    #
# the number of words longer than 7 characters.                                    #
#                                                                                  #
# Examples:                                                                        #
#            long_word_count("")                                                   #
#            long_word_count("short words only")                                   #
#            long_word_count("one reallylong word")                                #
#            long_word_count("two reallylong words inthisstring")                  #
#            long_word_count("allwordword longwordword wordswordword")             #
#            long_word_count("seventy schfifty five")                              #
#                                                                                  #
# answers should be:                                                               #
#            => 0                                                                  #
#            => 0                                                                  #
#            => 1                                                                  #
#            => 2                                                                  #
#            => 3                                                                  #
#            => 1                                                                  #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts long_word_count("")
puts long_word_count("short words only")
puts long_word_count("one reallylong word")
puts long_word_count("two reallylong words inthisstring")
puts long_word_count("allwordword longwordword wordswordword")
puts long_word_count("seventy schfifty five")

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def long_word_count(string)
  count=0
  array_of_words=string.split
  array_of_words.each do |word|
      count+=1 if word.length>7
  end
  return count
end
puts long_word_count("")
puts long_word_count("short words only")
puts long_word_count("one reallylong word")
puts long_word_count("two reallylong words inthisstring")
puts long_word_count("allwordword longwordword wordswordword")
puts long_word_count("seventy schfifty five")
  STRING
  answer_string=<<-STRING
0
0
1
2
3
1
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# longest_bigram ====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'99'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method longest_bigram(sentence) that takes in a sentence string and      #
# returns the longest bigram in the sentence. A bigram is a pair of consecutive    #
# words. When returning the bigram, include the space between the words. Assume    #
# there will be no punctuation. In the case of a tie, return the earlier bigram.   #
#                                                                                  #
# Examples:                                                                        #
#           longest_bigram('measure twice cut once')                               #
#           longest_bigram("One must have a mind of winter")                       #
#           longest_bigram("go home to eat")                                       #
#           longest_bigram("his last assessment is fun")                           #
#                                                                                  #
# answers should be:                                                               #
#           => 'measure twice'                                                     #
#           => 'must have'                                                         #
#           => 'go home'                                                           #
#           => 'last assessment'                                                   #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts longest_bigram('measure twice cut once')
puts longest_bigram("One must have a mind of winter")
puts longest_bigram("go home to eat")
puts longest_bigram("his last assessment is fun")

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: HARD (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def longest_bigram(string)
  new_string=''
  space=1
  longest=0
  array_of_words=string.split
  array_of_words.each_with_index do |word,index|
      if index>0
          if (word.length+array_of_words[index-1].length+space)>longest
              longest=(word.length+array_of_words[index-1].length+1)
              new_string=array_of_words[index-1]+' '+word
          end
      end
  end
  return new_string
end
puts longest_bigram('measure twice cut once').inspect
puts longest_bigram("One must have a mind of winter").inspect
puts longest_bigram("go home to eat").inspect
puts longest_bigram("his last assessment is fun").inspect
  STRING
  answer_string=<<-STRING
'measure twice'
'must have'
'go home'
'last assessment'
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# longest_letter_streak =============================================================================================#
#====================================================================================================================#

rolling_count+=1
'100'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method longest_letter_streak(str, search_letters) that takes in 2        #
# arguments:                                                                       #
#                    - str: A string of uppercase characters.                      #
#                    - searchLetters: An array of uppercase single-character       #
#                      strings (i.e ["A", "F", "K"])                               #
#                                                                                  #
# The method should return the length of the longest streak of letters             #
# (consecutive letters) in the `str` that are in the `searchLetters`.              #
#                                                                                  #
# Note that a streak does not have to consist of the same letter repeated, a streak#
# just needs to contain letters from the `searchLetters` array.                    #
#                                                                                  #
# Examples:                                                                        #
#            longest_letter_streak("ACCA", ["C"])                    => 2          #
#            longest_letter_streak("YACCADCA", ["C", "A"])           => 4          #
#            longest_letter_streak("ZTKZQRKKZ", ["Z", "K", "Y"])     => 3          #
#            longest_letter_streak("YYYYY", ["Z", "K", "Y"])         => 5          #
#                                                                                  #
# answers should be:                                                               #
#            => 2                                                                  #
#            => 4                                                                  #
#            => 3                                                                  #
#            => 5                                                                  #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts longest_letter_streak("ACCA", ["C"])
puts longest_letter_streak("YACCADCA", ["C", "A"])
puts longest_letter_streak("ZTKZQRKKZ", ["Z", "K", "Y"])
puts longest_letter_streak("YYYYY", ["Z", "K", "Y"])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: HARD (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def longest_letter_streak(string,letters)
  longest_streak=0
  count=1
  string.each_char.with_index do |character,index|
      if index>0
          if letters.include?(character) && letters.include?(string[index-1])
              count+=1
          else
              longest_streak=count if count>longest_streak
              count=1
          end
      end
  end
  longest_streak=count if count>longest_streak
  return longest_streak
end
puts longest_letter_streak("ACCA", ["C"])
puts longest_letter_streak("YACCADCA", ["C", "A"])
puts longest_letter_streak("ZTKZQRKKZ", ["Z", "K", "Y"])
puts longest_letter_streak("YYYYY", ["Z", "K", "Y"])
  STRING
  answer_string=<<-STRING
2
4
3
5
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# longest_word ======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'101'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function longest_word(sentence) that returns the longest word of a       #
# sentence. If there are ties, the function should return the later word.          #
#                                                                                  #
# Examples:                                                                        #
#            longest_word('app academy is cool')                 => 'academy'      #
#            longest_word('hate having hungry hippos')           => 'hippos'       #
#            longest_word('bootcamp')                            => 'bootcamp'     #
#            longest_word('')                                    => ''             #
#                                                                                  #
# answers should be:                                                               #
#            => 'academy'                                                          #
#            => 'hippos'                                                           #
#            => 'bootcamp'                                                         #
#            => ''                                                                 #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts longest_word('app academy is cool')
puts longest_word('hate having hungry hippos')
puts longest_word('bootcamp')
puts longest_word('')

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def longest_word(string)
  longest=0
  saved_word=''
  array_of_words=string.split
  array_of_words.each do |word|
      if word.length>=longest
          longest=word.length
          saved_word=word
      end
  end
  return saved_word
end
puts longest_word('app academy is cool').inspect
puts longest_word('hate having hungry hippos').inspect
puts longest_word('bootcamp').inspect
puts longest_word('').inspect
  STRING
  answer_string=<<-STRING
'academy'
'hippos'
'bootcamp'
''
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# lucky_sevens ======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'102'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method 'lucky_sevens(arr)', which takes in an array of integers and      #
# returns true if any three consecutive elements sum to 7. Make sure your code     #
# correctly checks for edge cases, Example: the first and last element of the      #
# array.                                                                           #
#                                                                                  #
# answers should be:                                                               #
#           => lucky_sevens([2,1,5,1,0]) == true                                   #
#           => lucky_sevens([0,-2,1,8])  == true                                   #
#           => lucky_sevens([7,7,7,7])   == false                                  #
#           => lucky_sevens([3,4,3,4])   == false                                  #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts 'lucky_sevens([2,1,5,1,0]) == '<<lucky_sevens([2,1,5,1,0])
puts 'lucky_sevens([0,-2,1,8])  == '<<lucky_sevens([0,-2,1,8])
puts 'lucky_sevens([7,7,7,7])   == '<<lucky_sevens([7,7,7,7])
puts 'lucky_sevens([3,4,3,4])   == '<<lucky_sevens([3,4,3,4])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def lucky_sevens(arr)
  arr.each_with_index do |number,index|
      if index>1
          return true if arr[index-2]+arr[index-1]+number==7
      end
  end
  return false
end
puts 'lucky_sevens([2,1,5,1,0]) == '+lucky_sevens([2,1,5,1,0]).to_s
puts 'lucky_sevens([0,-2,1,8])  == '+lucky_sevens([0,-2,1,8]).to_s
puts 'lucky_sevens([7,7,7,7])   == '+lucky_sevens([7,7,7,7]).to_s
puts 'lucky_sevens([3,4,3,4])   == '+lucky_sevens([3,4,3,4]).to_s
  STRING
  answer_string=<<-STRING
lucky_sevens([2,1,5,1,0]) == true
lucky_sevens([0,-2,1,8]) == true
lucky_sevens([7,7,7,7]) == false
lucky_sevens([3,4,3,4]) == false
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# magic_cipher ======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'103'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function magic_cipher(sentence, cipher) that takes in an string          #
# (sentence) and an object(cipher). Return a string where every character is       #
# replaced with its corresponding value in the cipher. If the character doesn't    #
# exist in the cipher, use the character.                                          #
#                                                                                  #
# Examples:                                                                        #
#            magic_cipher("add me on facebook" , { 'a'=>"c", 'd'=>"q"})            #
#            magic_cipher("where are you?" , { 'v'=>"l", '?'=>"!"})                #
#            magic_cipher("twmce" , { 'm'=>"n", 't'=>"d", 'w'=>"a"})               #
#                                                                                  #
# answers should be:                                                               #
#            => "cqq me on fccebook"                                               #
#            => "where are you!"                                                   #
#            => "dance"                                                            #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts magic_cipher("add me on facebook" , { 'a'=>"c", 'd'=>"q"})
puts magic_cipher("where are you?" , { 'v'=>"l", '?'=>"!"})
puts magic_cipher("twmce" , { 'm'=>"n", 't'=>"d", 'w'=>"a"})

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def magic_cipher(string,cipher)
  array_of_words=string.split
  array_of_words.each_with_index do |word,index|
      string=''
      word.each_char do |character|
          if cipher.has_key?(character)
              string+=cipher[character]
          else
              string+=character
          end
      end
      array_of_words[index]=string
  end
  return array_of_words.join(' ')
end
puts magic_cipher("add me on facebook" , { 'a'=>"c", 'd'=>"q"})
puts magic_cipher("where are you?" , { 'v'=>"l", '?'=>"!"})
puts magic_cipher("twmce" , { 'm'=>"n", 't'=>"d", 'w'=>"a"})
  STRING
  answer_string=<<-STRING
"cqq me on fccebook"
"where are you!"
"dance"
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# magic_numbers =====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'104'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method 'magic_numbers(max)' that returns an array of numbers up to the   #
# max (exclusive). Each number should be either divisible by 4 or 6, BUT NOT BOTH. #
#                                                                                  #
# Example:                                                                         #
#           magic_numbers(20)        => [4, 6, 8, 16, 18]                          #
#                                                                                  #
# answers should be:                                                               #
#            => [4, 6, 8, 16, 18]                                                  #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts magic_numbers(20)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def magic_numbers(num)
  new_array=[]
  (1...num).each do |number|
      new_array<<number if number%4==0 && number%6!=0 || number%4!=0 && number%6==0
  end
  return new_array
end
puts magic_numbers(20).inspect
  STRING
  answer_string=<<-STRING
[4, 6, 8, 16, 18]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# map_by_key ========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'105'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method map_by_key that takes in an array of hashes and a key string.     #
# The method should returns a new array containing the values from each hash for   #
# the given key.                                                                   #
#                                                                                  #
# EXAMPLES:                                                                        #
#   locations = [                                                                  #
#                {"city"=>"New York City", "state"=>"New York", "coast"=>"East"},  #
#                {"city"=>"San Francisco", "state"=>"California", "coast"=>"West"},#
#                {"city"=>"Portland", "state"=>"Oregon", "coast"=>"West"},         #
#               ]                                                                  #
#   puts map_by_key(locations, "state")                                            #
#   puts map_by_key(locations, "city")                                             #
#                                                                                  #
# answers should be:                                                               #
#            => ["New York", "California", "Oregon"]                               #
#            => ["New York City", "San Francisco", "Portland"]                     #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

locations = [
           {"city"=>"New York City", "state"=>"New York", "coast"=>"East"},
           {"city"=>"San Francisco", "state"=>"California", "coast"=>"West"},
           {"city"=>"Portland", "state"=>"Oregon", "coast"=>"West"},
          ]
puts map_by_key(locations, "state")
puts map_by_key(locations, "city")

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def map_by_key(arrhsh,key)
  new_array=arrhsh.map do |hsh|
     hsh[key]
  end
  return new_array
end
locations = [
            {"city"=>"New York City", "state"=>"New York", "coast"=>"East"},
            {"city"=>"San Francisco", "state"=>"California", "coast"=>"West"},
            {"city"=>"Portland", "state"=>"Oregon", "coast"=>"West"},
          ]
puts map_by_key(locations, "state").inspect
puts map_by_key(locations, "city").inspect
  STRING
  answer_string=<<-STRING
["New York", "California", "Oregon"]
["New York City", "San Francisco", "Portland"]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# map_by_name =======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'106'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method map_by_name  that takes in an array of hashes and returns a new   #
# array containing the names of each hash. use map                                 #
#                                                                                  #
# pets = [                                                                         #
#          {"type"=>"dog", "name"=>"Rolo"},                                        #
#          {"type"=>"cat", "name"=>"Sunny"},                                       #
#          {"type"=>"rat", "name"=>"Saki"},                                        #
#          {"type"=>"dog", "name"=>"Finn"},                                        #
#          {"type"=>"cat", "name"=>"Buffy"}                                        #
#        ]                                                                         #
# map_by_name(pets)                                                                #
#                                                                                  #
# countries = [                                                                    #
#                {"name"=>"Japan", "continent"=>"Asia"},                           #
#                {"name"=>"Hungary", "continent"=>"Europe"},                       #
#                {"name"=>"Kenya", "continent"=>"Africa"},                         #
#             ]                                                                    #
# map_by_name(countries)                                                           #
#                                                                                  #
# answers should be:                                                               #
#            => ["Rolo", "Sunny", "Saki", "Finn", "Buffy"]                         #
#            => ["Japan", "Hungary", "Kenya"]                                      #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

pets = [
       {"type"=>"dog", "name"=>"Rolo"},
       {"type"=>"cat", "name"=>"Sunny"},
       {"type"=>"rat", "name"=>"Saki"},
       {"type"=>"dog", "name"=>"Finn"},
       {"type"=>"cat", "name"=>"Buffy"}
     ]
countries = [
            {"name"=>"Japan", "continent"=>"Asia"},
            {"name"=>"Hungary", "continent"=>"Europe"},
            {"name"=>"Kenya", "continent"=>"Africa"},
          ]
puts map_by_name(pets)
puts map_by_name(countries)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def map_by_name(array)
  new_array=[]
  new_array=array.map{|hash| hash['name']}
  return new_array
end
pets = [
  {"type"=>"dog", "name"=>"Rolo"},
  {"type"=>"cat", "name"=>"Sunny"},
  {"type"=>"rat", "name"=>"Saki"},
  {"type"=>"dog", "name"=>"Finn"},
  {"type"=>"cat", "name"=>"Buffy"}
]
countries = [
       {"name"=>"Japan", "continent"=>"Asia"},
       {"name"=>"Hungary", "continent"=>"Europe"},
       {"name"=>"Kenya", "continent"=>"Africa"},
     ]
puts map_by_name(pets).inspect
puts map_by_name(countries).inspect
  STRING
  answer_string=<<-STRING
["Rolo", "Sunny", "Saki", "Finn", "Buffy"]
["Japan", "Hungary", "Kenya"]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# max_adjacent_sum ==================================================================================================#
#====================================================================================================================#

rolling_count+=1
'107'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method `max_adjacent_sum(array)` that takes in an array of numbers and   #
# returns the maximum sum of adjacent numbers in the array. HINT: First think how  #
# we can find adjacent elements in an array!                                       #
#                                                                                  #
# Examples:                                                                        #
#            arr1 = [5, 6, 11, 3]                                                  #
#            max_adjacent_sum(arr1)                   => 17                        #
#            arr2 = [3, 2, 13, 5, 4, 7]                                            #
#            max_adjacent_sum(arr2)                   => 18                        #
#                                                                                  #
# answers should be:                                                               #
#            => 17                                                                 #
#            => 18                                                                 #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

arr1 = [5, 6, 11, 3]
puts max_adjacent_sum(arr1)
arr2 = [3, 2, 13, 5, 4, 7]
puts max_adjacent_sum(arr2)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def max_adjacent_sum(array)
  max=0
  array.each_with_index do |num,index|
      if index>0
          max=(num+array[index-1]) if (num+array[index-1])>max
      end
  end
  return max
end
arr1 = [5, 6, 11, 3]
puts max_adjacent_sum(arr1)
arr2 = [3, 2, 13, 5, 4, 7]
puts max_adjacent_sum(arr2)
  STRING
  answer_string=<<-STRING
17
18
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# max_pair_product ==================================================================================================#
#====================================================================================================================#

rolling_count+=1
'108'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method 'max_pair_product(array)' that takes in an array of numbers       #
# and returns the largest product of any pair of numbers from the array.           #
#                                                                                  #
# answers should be:                                                               #
#           => 63                                                                  #
#           => 30                                                                  #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts max_pair_product([5, 7, 6, 9, 3])
puts max_pair_product([4, 2, 5, 6])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def max_pair_product(arr)
max_product=0
arr.each_with_index do |num1,index1|
  arr.each_with_index do |num2,index2|
    if index2>index1
       max_product=(num1*num2) if (num1*num2)>max_product
    end
  end
end
return max_product
end
puts max_pair_product([5, 7, 6, 9, 3])
puts max_pair_product([4, 2, 5, 6])
  STRING
  answer_string=<<-STRING
63
30
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# max_value =========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'109'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function `max_value(array)` that returns the largest value in `array`.   #
# Assume `array` is an array of numbers.                                           #
#                                                                                  #
# Examples:                                                                        #
#           max_value([12, 6, 43, 2])              => 43                           #
#           max_value([])                          => 0                            #
#           max_value([-4, -10, 0.43])             => 0.43                         #
#                                                                                  #
# answers should be:                                                               #
#           => 43                                                                  #
#           => 0                                                                   #
#           => 0.43                                                                #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts max_value([12, 6, 43, 2])
puts max_value([])
puts max_value([-4, -10, 0.43])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def max_value(array)
  max=0
  array.each do |value|
      if value>max
          max=value
      end
  end
  return max
end
puts max_value([12, 6, 43, 2])
puts max_value([])
puts max_value([-4, -10, 0.43])
  STRING
  answer_string=<<-STRING
43
0
0.43
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# min_max_difference ================================================================================================#
#====================================================================================================================#

rolling_count+=1
'110'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method `min_max_difference(array)` that returns the difference between   #
# the largest value and the smallest value in the array. Assume `array` is an      #
# array of numbers. Assume an array of at least two numbers.                       #
#                                                                                  #
# Examples:                                                                        #
#            min_max_difference([1,2,3,4,5])             => 4                      #
#            min_max_difference([5,4,3,2,1])             => 4                      #
#            min_max_difference([4,2,5,1,-5])            => 10                     #
#                                                                                  #
# answers should be:                                                               #
#            => 4                                                                  #
#            => 4                                                                  #
#            => 10                                                                 #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts min_max_difference([1,2,3,4,5])
puts min_max_difference([5,4,3,2,1])
puts min_max_difference([4,2,5,1,-5])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def smallest(array)
  smallest=array.length
  array.each do |number|
      smallest=number if number<smallest
  end
  return smallest
end
def largest(array)
  largest=0
  array.each do |number|
      largest=number if number>largest
  end
  return largest
end
def min_max_difference(array)
  return largest(array)-smallest(array)
end
puts min_max_difference([1,2,3,4,5])
puts min_max_difference([5,4,3,2,1])
puts min_max_difference([4,2,5,1,-5])
  STRING
  answer_string=<<-STRING
4
4
10
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# mind_Ps_and_Qs ====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'111'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function mind_Ps_and_Qs(str) that accepts a string of uppercase letters. #
# The function should return the length of the longest consecutive streak of the   #
# letters 'P' and 'Q'. Hint: Use two variables. One to track the length of the     #
# current streak and another to track the length of the longest streak so far.     #
# Think of using a strategy similar to maxValue. This can also be solved using a   #
# single loop! Nested loops not needed!                                            #
#                                                                                  #
# Examples:                                                                        #
#            mind_Ps_and_Qs('BOOTCAMP')                    => 1                    #
#            mind_Ps_and_Qs('APCDQQPPC')                   => 4                    #
#            mind_Ps_and_Qs('PQPQ')                        => 4                    #
#            mind_Ps_and_Qs('PPPXQPPPQ')                   => 5                    #
#                                                                                  #
# answers should be:                                                               #
#            => 1                                                                  #
#            => 4                                                                  #
#            => 4                                                                  #
#            => 5                                                                  #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts mind_Ps_and_Qs('BOOTCAMP')
puts mind_Ps_and_Qs('APCDQQPPC')
puts mind_Ps_and_Qs('PQPQ')
puts mind_Ps_and_Qs('PPPXQPPPQ')

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM  (FUNCTIONAL PROGRAMMING)                                     #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def mind_Ps_and_Qs(string)
  largest_count=0
  count=0
  target='PQ'
  string.each_char.with_index do |character,index|
      if !target.include?(character) || index==string.length-1
          count+=1 if target.include?(character)
          largest_count=count if count>largest_count
          count=0
      elsif target.include?(character)
          count+=1
      end
  end
  return largest_count
end
puts mind_Ps_and_Qs('BOOTCAMP')
puts mind_Ps_and_Qs('APCDQQPPC')
puts mind_Ps_and_Qs('PQPQ')
puts mind_Ps_and_Qs('PPPXQPPPQ')
  STRING
  answer_string=<<-STRING
1
4
4
5
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# mirror_array ======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'112'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function `mirror_array(array)` that takes in an array as an argument and #
# returns a new array "mirrored" as shown in the examples                          #
#                                                                                  #
# Examples:                                                                        #
#           mirror_array([1,2,3])                                                  #
#           mirror_array(['a', 'b', 'c', 'd'])                                     #
#                                                                                  #
# answers should be:                                                               #
#            => [ 1, 2, 3, 3, 2, 1 ]                                               #
#            => [ 'a', 'b', 'c', 'd', 'd', 'c', 'b', 'a' ]                         #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts mirror_array([1,2,3])
puts mirror_array(['a', 'b', 'c', 'd'])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: HARD (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def mirror_array(array)
  temp_array=array.clone
  temp_array.each_index do |index|
      array<<temp_array[(temp_array.length-1)-index]
  end
  return array
end
puts mirror_array([1,2,3]).inspect
puts mirror_array(['a', 'b', 'c', 'd']).inspect
  STRING
  answer_string=<<-STRING
[1, 2, 3, 3, 2, 1]
['a', 'b', 'c', 'd', 'd', 'c', 'b', 'a']
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# more_dot_less_dash ================================================================================================#
#====================================================================================================================#

rolling_count+=1
'113'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method `more_dot_less_dash(str)` that takes in a string and returns true #
# if the string contains more dots ('.') than dashes ('-'), false otherwise.       #
#                                                                                  #
# Examples:                                                                        #
#           more_dot_less_dash('2-D arrays are fun. I think.')          => true    #
#           more_dot_less_dash('.-.-.')                                 => true    #
#           more_dot_less_dash('.-')                                    => false   #
#           more_dot_less_dash('..--')                                  => false   #
#                                                                                  #
# answers should be:                                                               #
#            => true                                                               #
#            => true                                                               #
#            => false                                                              #
#            => false                                                              #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts more_dot_less_dash('2-D arrays are fun. I think.')
puts more_dot_less_dash('.-.-.')
puts more_dot_less_dash('.-')
puts more_dot_less_dash('..--')

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def more_dot_less_dash(string)
  dot_count=0
  dash_count=0
  string.each_char do |character|
      if character=='.'
          dot_count+=1
      elsif character=='-'
          dash_count+=1
      end
  end
  return dot_count>dash_count
end
puts more_dot_less_dash('2-D arrays are fun. I think.')
puts more_dot_less_dash('.-.-.')
puts more_dot_less_dash('.-')
puts more_dot_less_dash('..--')
  STRING
  answer_string=<<-STRING
true
true
false
false
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# morse_code ========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'114'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Build a method, 'morse_encode(str)' that takes in a string (no numbers or        #
# punctuation) and outputs the morse code for it. Put two spaces between words     #
# and one space between letters.                                                   #
#                                                                                  #
# answers should be:                                                               #
#           => "--.-"                                                              #
#           => "-.-. .- -"                                                         #
#           => "-.-. .- -  .. -.  .... .- -"                                       #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

morse={'a'=>'.-','b'=>'-...','c'=>'-.-.','d'=>'-..','e'=>'.','f'=>'..-.','g'=>'--.',
     'h'=>'....','i'=>'..','j'=>'.---','k'=>'-.-','l'=>'.-..','m'=>'--','n'=>'-.',
     'o'=>'---','p'=>'.--.','q'=>'--.-','r'=>'.-.','s'=>'...','t'=>'-','u'=>'..-',
     'v'=>'...-','w'=>'.--','x'=>'-..-','y'=>'-.--','z'=>'--..'}
puts morse_encode("q")
puts morse_encode("cat")
puts morse_encode("cat in hat")

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def get_morse(word)
  array_of_characters=word.chars
  morse={'a'=>'.-','b'=>'-...','c'=>'-.-.','d'=>'-..','e'=>'.','f'=>'..-.','g'=>'--.',
      'h'=>'....','i'=>'..','j'=>'.---','k'=>'-.-','l'=>'.-..','m'=>'--','n'=>'-.',
      'o'=>'---','p'=>'.--.','q'=>'--.-','r'=>'.-.','s'=>'...','t'=>'-','u'=>'..-',
      'v'=>'...-','w'=>'.--','x'=>'-..-','y'=>'-.--','z'=>'--..'}
  array_of_characters.each_with_index do |character,index|
      array_of_characters[index]=morse[character]
  end
  return array_of_characters.join(' ')
end
def morse_encode(string)
  array_of_words=string.split
  array_of_words.each_with_index do |word,index|
      array_of_words[index]=get_morse(word)
  end
  return array_of_words.join('  ')
end
puts morse_encode("q")
puts morse_encode("cat")
puts morse_encode("cat in hat")
  STRING
  answer_string=<<-STRING
"--.-"
"-.-. .- -"
"-.-. .- -  .. -.  .... .- -"
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# most_vowels =======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'115'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method most_vowels that takes in a sentence string and returns the word  #
# of the sentence that contains the most vowels.                                   #
#                                                                                  #
# EXAMPLES:                                                                        #
#          puts most_vowels("what a wonderful life") #=> "wonderful"               #
#                                                                                  #
# answers should be:                                                               #
#            => "wonderful"                                                        #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts most_vowels("what a wonderful life")

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def most_vowels(string)
  vowels='aeiou'
  word_with_most_vowels=''
  vowel_count=0
  array_of_words=string.split
  array_of_words.each do |word|
      counter=0
      word.each_char do |character|
          counter+=1 if vowels.include?(character)
      end
      if counter>vowel_count
          vowel_count=counter
          word_with_most_vowels=word
      end
  end
  return word_with_most_vowels
end
puts most_vowels("what a wonderful life")
  STRING
  answer_string=<<-STRING
"wonderful"
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# my_index ==========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'116'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method my_index(array, ele) that takes an array and an element.          #
# Return the index of the element in the array, or nil if it doesn't exist. Assume #
# the `ele` will be a primitive data type (no arrays or objects). DO NOT USE       #
# THE BUILT-IN `index` METHOD IN YOUR SOLUTION!                                    #
#                                                                                  #
# Examples:                                                                        #
#            my_index([1,2,3,4,5], 5)                  => 4                        #
#            my_index(["a", "b", "c"], "a")            => 0                        #
#            my_index(["a", "b", "c"], "d")            => nil                      #
#                                                                                  #
# answers should be:                                                               #
#            => 4                                                                  #
#            => 0                                                                  #
#            => nil                                                                #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts my_index([1,2,3,4,5], 5)
puts my_index(["a", "b", "c"], "a")
puts my_index(["a", "b", "c"], "d")

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def my_index(array,item)
  array.each_with_index do |element,index|
      return index if element==item
  end
  return nil
end
puts my_index([1,2,3,4,5], 5).inspect
puts my_index(["a", "b", "c"], "a").inspect
puts my_index(["a", "b", "c"], "d").inspect
  STRING
  answer_string=<<-STRING
4
0
nil
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# my_transpose ======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'117'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method, 'my_transpose(array)' which will convert between the row-        #
# oriented to a column oriented representation of the array.                       #
#                                                                                  #
# example:                                                                         #
#         rows = [                                                                 #
#                   [0, 1, 2],                                                     #
#                   [3, 4, 5],                                                     #
#                   [6, 7, 8]                                                      #
#                ]                                                                 #
#   =>    cols = [                                                                 #
#                   [0, 3, 6],                                                     #
#                   [1, 4, 7],                                                     #
#                   [2, 5, 8]                                                      #
#                ]                                                                 #
#                                                                                  #
# answers should be:                                                               #
#             =>    cols = [[0, 3, 6],[1, 4, 7],[2, 5, 8]]                         #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

rows = [[0, 1, 2],[3, 4, 5],[6, 7, 8]]
puts my_transpose(rows)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: HARD (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def my_transpose(array)
new_array=Array.new(array.length){Array.new}
array.each do |subarray|
  subarray.each_with_index do |item,index|
    new_array[index]<<item
  end
end
return new_array
end
rows = [[0, 1, 2],[3, 4, 5],[6, 7, 8]]
puts my_transpose(rows).inspect
  STRING
  answer_string=<<-STRING
cols = [[0, 3, 6],[1, 4, 7],[2, 5, 8]]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# my_unique =========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'118'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# write a method, 'my_unique(arr)', that takes in an array and returns a new       #
# array with all the duplicates removed.                                           #
#                                                                                  #
# answers should be:                                                               #
#           => [1, 3, 2, 5, 6]                                                     #
#           => []                                                                  #
#           => [1, 2, 3, 4, 5, 6, 7, 8, 9]                                         #
#           => [1]                                                                 #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts my_unique([1,3,2,1,2,5,6,6])
puts my_unique([])
puts my_unique([1,2,3,4,5,6,7,8,9])
puts my_unique([1,1,1,1,1,1,1,1,1])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def my_unique(arr)
  new_array=[]
  arr.each do |item|
      new_array<<item if !new_array.include?(item)
  end
  return new_array
end
puts my_unique([1,3,2,1,2,5,6,6]).inspect
puts my_unique([]).inspect
puts my_unique([1,2,3,4,5,6,7,8,9]).inspect
puts my_unique([1,1,1,1,1,1,1,1,1]).inspect
  STRING
  answer_string=<<-STRING
[1, 3, 2, 5, 6]
[]
[1, 2, 3, 4, 5, 6, 7, 8, 9]
[1]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# nearest_larger ====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'119'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method, 'nearest_larger(arr, i)' which takes an array and an index.      #
# The method should return another index, 'j': this should satisfy:                #
#                                                                                  #
# (a) 'arr[i] < arr[j]', AND                                                       #
# (b) there is no 'j2' closer to 'i' than 'j' where 'arr[i] < arr[j2]'.            #
#                                                                                  #
# In case of ties (see example below), choose the earliest (left-most)             #
# of the two indices. If no number in 'arr' is larger than 'arr[i]',               #
# return 'nil'.                                                                    #
#                                                                                  #
# answers should be:                                                               #
#           => nearest_larger([2,3,4,8],2)   == 3                                  #
#           => nearest_larger([2,8,4,3],2)   == 1                                  #
#           => nearest_larger([2,6,4,8],2)   == 1                                  #
#           => nearest_larger([2,6,4,6],2)   == 1                                  #
#           => nearest_larger([8,2,4,3],2)   == 0                                  #
#           => nearest_larger([2,4,3,8],1)   == 3                                  #
#           => nearest_larger([2,6,4,8],3)   == nil                                #
#           => nearest_larger([2,6,9,4,8],3) == 2                                  #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts 'nearest_larger([2,3,4,8],2)   == '+nearest_larger([2,3,4,8],2)
puts 'nearest_larger([2,8,4,3],2)   == '+nearest_larger([2,8,4,3],2)
puts 'nearest_larger([2,6,4,8],2)   == '+nearest_larger([2,6,4,8],2)
puts 'nearest_larger([2,6,4,6],2)   == '+nearest_larger([2,6,4,6],2)
puts 'nearest_larger([8,2,4,3],2)   == '+nearest_larger([8,2,4,3],2)
puts 'nearest_larger([2,4,3,8],1)   == '+nearest_larger([2,4,3,8],1)
puts 'nearest_larger([2,6,4,8],3)   == '+nearest_larger([2,6,4,8],3)
puts 'nearest_larger([2,6,9,4,8],3) == '+nearest_larger([2,6,9,4,8],3)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: HARD (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def nearest_larger(arr,index)
  saved_distance=arr.length
  current_distance=arr.length
  saved_index=0
  return nil if arr.max==arr[index]
  arr.each_with_index do |arr_num,arr_index|
      if arr_num>arr[index]
          current_distance=[arr_index,index].max-[arr_index,index].min
          if current_distance<saved_distance
              saved_distance=current_distance
              saved_index=arr_index
          end
      end
  end
  return saved_index
end
puts 'nearest_larger([2,3,4,8],2)   == '+nearest_larger([2,3,4,8],2).inspect
puts 'nearest_larger([2,8,4,3],2)   == '+nearest_larger([2,8,4,3],2).inspect
puts 'nearest_larger([2,6,4,8],2)   == '+nearest_larger([2,6,4,8],2).inspect
puts 'nearest_larger([2,6,4,6],2)   == '+nearest_larger([2,6,4,6],2).inspect
puts 'nearest_larger([8,2,4,3],2)   == '+nearest_larger([8,2,4,3],2).inspect
puts 'nearest_larger([2,4,3,8],1)   == '+nearest_larger([2,4,3,8],1).inspect
puts 'nearest_larger([2,6,4,8],3)   == '+nearest_larger([2,6,4,8],3).inspect
puts 'nearest_larger([2,6,9,4,8],3) == '+nearest_larger([2,6,9,4,8],3).inspect
STRING
  answer_string=<<-STRING
nearest_larger([2,3,4,8],2) == 3
nearest_larger([2,8,4,3],2) == 1
nearest_larger([2,6,4,8],2) == 1
nearest_larger([2,6,4,6],2) == 1
nearest_larger([8,2,4,3],2) == 0
nearest_larger([2,4,3,8],1) == 3
nearest_larger([2,6,4,8],3) == nil
nearest_larger([2,6,9,4,8],3) == 2
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# negative_sum ======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'120'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function `negative_sum` that takes in an array of numbers and returns a  #
# number representing the sum of all negative numbers in the given array.          #
#                                                                                  #
# Examples:                                                                        #
#            negative_sum([-3, 12, -5, -2, 3])       => -10                        #
#            negative_sum([2, 1, 7])                 => 0                          #
#                                                                                  #
# answers should be:                                                               #
#            => -10                                                                #
#            => 0                                                                  #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts negative_sum([-3, 12, -5, -2, 3])
puts negative_sum([2, 1, 7])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def negative_sum(array)
  sum=0
  array.each do |number|
      sum+=number if number<0
  end
  return sum
end
puts negative_sum([-3, 12, -5, -2, 3])
puts negative_sum([2, 1, 7])
  STRING
  answer_string=<<-STRING
-10
0
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# next_two_primes ===================================================================================================#
#====================================================================================================================#

rolling_count+=1
'121'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method 'next_two_primes(num)' that takes in a number 'num' and returns   #
# the next two prime numbers greater than 'num'.                                   #
#                                                                                  #
# Examples:                                                                        #
#           next_two_primes(2)                       => [ 3, 5 ]                   #
#           next_two_primes(3)                       => [ 5, 7 ]                   #
#           next_two_primes(7)                       => [ 11, 13 ]                 #
#           next_two_primes(8)                       => [ 11, 13 ]                 #
#           next_two_primes(20)                      => [ 23, 29 ]                 #
#           next_two_primes(97)                      => [ 101, 103 ]               #
#                                                                                  #
# answers should be:                                                               #
#            => [ 3, 5 ]                                                           #
#            => [ 5, 7 ]                                                           #
#            => [ 11, 13 ]                                                         #
#            => [ 11, 13 ]                                                         #
#            => [ 23, 29 ]                                                         #
#            => [ 101, 103 ]                                                       #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts next_two_primes(2)
puts next_two_primes(3)
puts next_two_primes(7)
puts next_two_primes(8)
puts next_two_primes(20)
puts next_two_primes(97)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: HARD (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def is_prime?(num)
  (2...num).each do |number|
      return false if num%number==0
  end
  return true
end
def next_two_primes(num)
  new_array=[]
  counter=num+1
  while new_array.length<2
      new_array<<counter if is_prime?(counter)
      counter+=1
  end
  return new_array
end
puts next_two_primes(2).inspect
puts next_two_primes(3).inspect
puts next_two_primes(7).inspect
puts next_two_primes(8).inspect
puts next_two_primes(20).inspect
puts next_two_primes(97).inspect
  STRING
  answer_string=<<-STRING
[3, 5]
[5, 7]
[11, 13]
[11, 13]
[23, 29]
[101, 103]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# nick_name =========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'122'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function nick_name(name) that takes in a name string and returns a       #
# string representing their nickname. A nickname is the name up to the second      #
# vowel repeated twice. See the examples.                                          #
#                                                                                  #
# Examples:                                                                        #
#            nick_name('manuel')              => 'MANU-MANU'                       #
#            nick_name('pikachu')             => 'PIKA-PIKA'                       #
#            nick_name('bootcamp')            => 'BOO-BOO'                         #
#            nick_name('bob')                 => 'BOB-BOB'                         #
#                                                                                  #
# answers should be:                                                               #
#            => 'MANU-MANU'                                                        #
#            => 'PIKA-PIKA'                                                        #
#            => 'BOO-BOO'                                                          #
#            => 'BOB-BOB'                                                          #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts nick_name('manuel')
puts nick_name('pikachu')
puts nick_name('bootcamp')
puts nick_name('bob')

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def get_index_of_second_vowel(name)
  vowels='aeiou'
  vowel_count=0
  index=0
  name.each_char.with_index do |character,index|
      vowel_count+=1 if vowels.include?(character)
      return index if vowel_count==2
  end
  return index
end
def nick_name(name)
  idx=get_index_of_second_vowel(name)
  if idx>0
      return name[0..idx].upcase+'-'+name[0..idx].upcase
  else
      return name.upcase+'-'+name.upcase
  end
end
puts nick_name('manuel')
puts nick_name('pikachu')
puts nick_name('bootcamp')
puts nick_name('bob')
  STRING
  answer_string=<<-STRING
'MANU-MANU'
'PIKA-PIKA'
'BOO-BOO'
'BOB-BOB'
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# no_numerals  ======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'123'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# write a method, 'no_numberals(string)' that takes in a sentence with numbers in  #
# it. numbers from 1 to 10 are to be replaced with their word equivalent.          #
#                                                                                  #
# Example:                                                                         #
#     no_numerals('i need 2 pumpkins and 3 apples')                                #
#              => 'i need two pumpkins and three apples'                           #
#     no_numerals('now for 10 bat lips and 1 eye of newt')                         #
#              => 'now for ten bats lips and one eye of newt'                      #
#     no_numerals('there are 4 wise men in the story')                             #
#              => 'there are four wise men in the story'                           #
#                                                                                  #
# answers should be:                                                               #
#             => 'i need two pumpkins and three apples'                            #
#             => 'now for ten bat lips and one eye of newt'                        #
#             => 'there are four wise men in the story'                            #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

numbers={'1'=>'one','2'=>'two','3'=>'three','4'=>'four','5'=>'five','6'=>'six',
  '7'=>'seven','8'=>'eight','9'=>'nine','10'=>'ten'}
puts no_numerals('i need 2 pumpkins and 3 apples')
puts no_numerals('now for 10 bat lips and 1 eye of newt')
puts no_numerals('there are 4 wise men in the story')

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def no_numerals(string)
  numbers={'1'=>'one', '2'=>'two', '3'=>'three', '4'=>'four', '5'=>'five', '6'=>'six',
           '7'=>'seven', '8'=>'eight', '9'=>'nine', '10'=>'ten'}
  array_of_words=string.split
  array_of_words.each_with_index do |word,index|
      if numbers.has_key?(word)
          array_of_words[index]=numbers[word]
      end
  end
  return array_of_words.join(' ')
end
puts no_numerals('i need 2 pumpkins and 3 apples')
puts no_numerals('now for 10 bat lips and 1 eye of newt')
puts no_numerals('there are 4 wise men in the story')
  STRING
  answer_string=<<-STRING
'i need two pumpkins and three apples'
'now for ten bat lips and one eye of newt'
'there are four wise men in the story'
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# no_repeats ========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'124'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function, 'no_repeats(year_start, year_end)', which takes a range of     #
# years and outputs those years which do not have any repeated digits.             #
#                                                                                  #
# You should probably write a helper function, 'no_repeat?(year)' which            #
# returns true/false if a single year doesn't have a repeat.                       #
#                                                                                  #
# answers should be:                                                               #
#           => no_repeats(1234, 1234) == [1234]                                    #
#           => no_repeats(1123, 1123) == []                                        #
#           => no_repeats(1980, 1987) == [1980,1982,1983,1984,1985,1986,1987]      #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts no_repeats(1234, 1234)
puts no_repeats(1123, 1123)
puts no_repeats(1980, 1987)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def is_unique?(number)
  arr_string_digits=number.to_s.split('')
  new_array=[]
  arr_string_digits.each do |string_digit|
      if !new_array.include?(string_digit)
          new_array<<string_digit
      else
          return false
      end
  end
  return true
end
def no_repeats(starting,ending)
  new_array=[]
  (starting..ending).each do |number|
      new_array<<number if is_unique?(number)
  end
  return new_array
end
puts no_repeats(1234, 1234).inspect
puts no_repeats(1123, 1123).inspect
puts no_repeats(1980, 1987).inspect
  STRING
  answer_string=<<-STRING
no_repeats(1234, 1234) == [1234]
no_repeats(1123, 1123) == []
no_repeats(1980, 1987) == [1980,1982,1983,1984,1985,1986,1987]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end



#====================================================================================================================#
# number_primes =====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'125'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method number_primes(n) that takes in a number, `n`. The method should   #
# return the number of prime numbers less than or equal to `n`. For example, there #
# are 4 prime numbers less than or equal to 10: 2, 3, 5, 7.                        #
#                                                                                  #
# Examples:                                                                        #
#             number_primes(10)               => 4                                 #
#             number_primes(12)               => 5                                 #
#             number_primes(20)               => 8                                 #
#             number_primes(100)              => 25                                #
#                                                                                  #
# answers should be:                                                               #
#            => 4                                                                  #
#            => 5                                                                  #
#            => 8                                                                  #
#            => 25                                                                 #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts number_primes(10)
puts number_primes(12)
puts number_primes(20)
puts number_primes(100)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: HARD (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def is_prime?(num)
  (2...num).each do |number|
      return false if num%number==0
  end
  return true
end
def number_primes(num)
  primes_count=0
  (2..num).each do |number|
      primes_count+=1 if is_prime?(number)
  end
  return primes_count
end
puts number_primes(10)
puts number_primes(12)
puts number_primes(20)
puts number_primes(100)
  STRING
  answer_string=<<-STRING
4
5
8
25
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# o_words ===========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'126'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method o_words that takes in a sentence string and returns an array of   #
# the words that contain an "o". Use select in your solution!                      #
#                                                                                  #
#             o_words("How did you do that?")                                      #
#                                                                                  #
# answers should be:                                                               #
#            => ["How", "you", "do"]                                               #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts o_words("How did you do that?")

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def o_words(string)
  new_array=[]
  array_of_words=string.split
  new_array=array_of_words.select{|word| word.include?('o')}
  return new_array
end
puts o_words("How did you do that?").inspect
  STRING
  answer_string=<<-STRING
["How", "you", "do"]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# odd_ones_out ======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'127'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function odd_ones_out(array) that takes in an array of strings and       #
# returns a new array containing only elements that appeared an even number        #
# of times in the input array.                                                     #
#                                                                                  #
# Examples:                                                                        #
#            arr1 = ['a', 'b', 'b', 'c', 'd', 'c', 'c', 'd']                       #
#            odd_ones_out(arr1)                                                    #
#            arr2 = ['fish', 'fish', 'dog', 'cat', 'dog', 'dog']                   #
#            odd_ones_out(arr2)                                                    #
#                                                                                  #
# answers should be:                                                               #
#            => [ 'b', 'd' ]                                                       #
#            => [ 'fish' ]                                                         #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

arr1 = ['a', 'b', 'b', 'c', 'd', 'c', 'c', 'd']
puts odd_ones_out(arr1)
arr2 = ['fish', 'fish', 'dog', 'cat', 'dog', 'dog']
puts odd_ones_out(arr2)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def get_element_count(array)
  new_hash=Hash.new{0}
  array.each do |element|
      new_hash[element]+=1
  end
  return new_hash
end
def odd_ones_out(array)
  new_array=[]
  count=get_element_count(array)
  count.each_key do |key|
      new_array<<key if count[key]%2==0
  end
  return new_array
end
arr1 = ['a', 'b', 'b', 'c', 'd', 'c', 'c', 'd']
puts odd_ones_out(arr1).inspect
arr2 = ['fish', 'fish', 'dog', 'cat', 'dog', 'dog']
puts odd_ones_out(arr2).inspect
  STRING
  answer_string=<<-STRING
['b', 'd']
['fish']
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# odd_range =========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'128'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method odd_range(min, max) that takes in two numbers min and max. The    #
# method should return an array containing all odd numbers from min to max         #
# (inclusive).                                                                     #
#                                                                                  #
# EXAMPLES:                                                                        #
#           puts odd_range(11, 18) # => [11, 13, 15, 17]                           #
#           puts odd_range(3, 7)   # => [3, 5, 7]                                  #
#                                                                                  #
# answers should be:                                                               #
#            => [11, 13, 15, 17]                                                   #
#            => [3, 5, 7]                                                          #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts odd_range(11, 18)
puts odd_range(3, 7)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def odd_range(min,max)
  new_array=[]
  (min..max).each{|num| new_array<<num if num%2!=0}
  return new_array
end
puts odd_range(11, 18).inspect
puts odd_range(3, 7).inspect
  STRING
  answer_string=<<-STRING
[11, 13, 15, 17]
[3, 5, 7]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# odd_words_out =====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'129'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function odd_words_out(sentence) that takes in a sentence string and     #
# returns the sentence where words with an odd number of characters are removed.   #
#                                                                                  #
# Examples:                                                                        #
#            odd_words_out('go to the store and buy milk')                         #
#            odd_words_out('what is the answer')                                   #
#                                                                                  #
# answers should be:                                                               #
#            => 'go to milk'                                                       #
#            => 'what is answer'                                                   #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts odd_words_out('go to the store and buy milk')
puts odd_words_out('what is the answer')

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def odd_words_out(string)
  new_array=[]
  array_of_words=string.split
  array_of_words.each do |word|
      new_array<<word if word.length%2==0
  end
  return new_array.join(' ')
end
puts odd_words_out('go to the store and buy milk')
puts odd_words_out('what is the answer')
  STRING
  answer_string=<<-STRING
'go to milk'
'what is answer'
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# oddball_sum =======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'130'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method, 'oddball_sum(arr)', which takes in an array of integers and      #
# returns the sum of all the odd elements.                                         #
#                                                                                  #
# answers should be:                                                               #
#           => 25                                                                  #
#           => 0                                                                   #
#           => 20                                                                  #
#           => 0                                                                   #
#           => 5                                                                   #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts oddball_sum([1,2,3,4,5,6,7,8,9])
puts oddball_sum([2,4,6,8,10])
puts oddball_sum([0,22,13,7])
puts oddball_sum([])
puts oddball_sum([5])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def oddball_sum(arr)
  sum=0
  arr.each do |number|
      sum+=number if number%2!=0
  end
  return sum
end
puts oddball_sum([1,2,3,4,5,6,7,8,9])
puts oddball_sum([2,4,6,8,10])
puts oddball_sum([0,22,13,7])
puts oddball_sum([])
puts oddball_sum([5])
  STRING
  answer_string=<<-STRING
25
0
20
0
5
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# opposing_sums =====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'131'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method `opposing_sums(array)` that takes in an array of numbers and      #
# returns a new array containing half the number of elements. Assume the `array`   #
# contains an even number of elements. The first element of the new array should   #
# be the sum between the 1st and last element of the original `array`. The second  #
# element of the new array should be the sum between the 2nd and 2nd to last       #
# element. The third element of the new array should be the sum between the 3rd    #
# and 3rd to last element... etc.                                                  #
#                                                                                  #
# Examples:                                                                        #
#            arr1 = [3, 2, 11, 4, 7, 9]                                            #
#            opposing_sum(arr1)                     => [ 12, 9, 15 ]               #
#            arr2 = [1, 2, 3, 4]                                                   #
#            opposing_sum(arr2)                     => [ 5, 5 ]                    #
#                                                                                  #
# answers should be:                                                               #
#            => [ 12, 9, 15 ]                                                      #
#            => [ 5, 5 ]                                                           #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

arr1 = [3, 2, 11, 4, 7, 9]
puts opposing_sum(arr1)
arr2 = [1, 2, 3, 4]
puts opposing_sum(arr2)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: HARD (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def opposing_sum(array)
  new_array=[]
  size=(array.length/2)-1
  (0..size).each do |index|
      new_array<<array[index]+array[(array.length-1)-index]
  end
  return new_array
end
arr1 = [3, 2, 11, 4, 7, 9]
puts opposing_sum(arr1).inspect
arr2 = [1, 2, 3, 4]
puts opposing_sum(arr2).inspect
  STRING
  answer_string=<<-STRING
[12, 9, 15]
[5, 5]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# opposite_count ====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'132'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method opposite_count that takes in an array of unique numbers. The      #
# method should return the number of pairs of elements that sum to 0.              #
#                                                                                  #
# example:                                                                         #
#          opposite_count([ 2, 5, 11, -5, -2, 7 ])   => 2                          #
#          opposite_count([ 21, -23, 24 -12, 23 ])   => 1                          #
#                                                                                  #
# answers should be:                                                               #
#            => 2                                                                  #
#            => 1                                                                  #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts opposite_count([ 2, 5, 11, -5, -2, 7 ])
puts opposite_count([ 21, -23, 24 -12, 23 ])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def opposite_count(array)
  zero_sum_count=0
  array.each_with_index do |num1,index1|
      array.each_with_index do |num2,index2|
          if index2>index1
              zero_sum_count+=1 if num1+num2==0
          end
      end
  end
  return zero_sum_count
end
puts opposite_count([ 2, 5, 11, -5, -2, 7 ])
puts opposite_count([ 21, -23, 24 -12, 23 ])
  STRING
  answer_string=<<-STRING
2
1
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# ordered_vowels ====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'133'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method, 'ordered_vowel_words(str)' that takes a string of lowercase      #
# words and returns a string with just the words containing all their vowels       #
# (excluding "y") in alphabetical order. Vowels may be repeated ("afoot" is an     #
# ordered vowel word).                                                             #
#                                                                                  #
# You will probably want a helper method, 'ordered_vowel_word?(word)' which returns#
# true/false if a word's vowels are ordered.                                       #
#                                                                                  #
# answers should be:                                                               #
#           => "amends"                                                            #
#           => ""                                                                  #
#           => "afoot"                                                             #
#           => "ham"                                                               #
#           => "crypt"                                                             #
#           => "o"                                                                 #
#           => "tamely"                                                            #
#           => "this is a test of the system"                                      #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

phrase = "this is a test of the vowel ordering system"
puts ordered_vowel_words("amends")
puts ordered_vowel_words("complicated")
puts ordered_vowel_words("afoot")
puts ordered_vowel_words("ham")
puts ordered_vowel_words("crypt")
puts ordered_vowel_words("o")
puts ordered_vowel_words("tamely")
puts ordered_vowel_words(phrase)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def get_vowels(str)
  new_string=''
  vowels='aeiou'
  str.each_char do |c|
      new_string+=c if vowels.include?(c)
  end
  return new_string
end
def is_ordered?(str)
  vowel_string=get_vowels(str)
  vowel_string.each_char.with_index do |character,index|
      if index>0
          return false if vowel_string[index-1]>character
      end
  end
  return true
end
def ordered_vowel_words(str)
  array_of_words=str.split
  new_array=[]
  array_of_words.each do |word|
      new_array<<word if is_ordered?(word)
  end
  return new_array.join(' ')
end
phrase = "this is a test of the vowel ordering system"
puts ordered_vowel_words("amends").inspect
puts ordered_vowel_words("complicated").inspect
puts ordered_vowel_words("afoot").inspect
puts ordered_vowel_words("ham").inspect
puts ordered_vowel_words("crypt").inspect
puts ordered_vowel_words("o").inspect
puts ordered_vowel_words("tamely").inspect
puts ordered_vowel_words(phrase).inspect
  STRING
  answer_string=<<-STRING
"amends"
""
"afoot"
"ham"
"crypt"
"o"
"tamely"
"this is a test of the system"
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# pair_product ======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'134'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method 'pair_product(arr, num)' that accepts an array of numbers (arr)   #
# and a target number (num). It should return pairs of indices whose elements      #
# multiply to 'num'. No pair should appear twice in the result.                    #
#                                                                                  #
# Examples:                                                                        #
#           pair_product([1,2,3,4,5], 4)            => [ [ 0, 3 ] ]                #
#           pair_product([1,2,3,4,5], 8)            => [ [ 1, 3 ] ]                #
#           pair_product([1, 2, 3, 12, 8], 24)      => [ [ 1, 3 ], [ 2, 4 ] ]      #
#                                                                                  #
#                                                                                  #
# answers should be:                                                               #
#            => [ [ 0, 3 ] ]                                                       #
#            => [ [ 1, 3 ] ]                                                       #
#            => [ [ 1, 3 ], [ 2, 4 ] ]                                             #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts pair_product([1,2,3,4,5], 4)
puts pair_product([1,2,3,4,5], 8)
puts pair_product([1, 2, 3, 12, 8], 24)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def pair_product(array,num)
  new_array=[]
  array.each_with_index do |num1,index1|
      array.each_with_index do |num2,index2|
          if index2>index1
              new_array<<[index1,index2] if num1*num2==num
          end
      end
  end
  return new_array
end
puts pair_product([1,2,3,4,5], 4).inspect
puts pair_product([1,2,3,4,5], 8).inspect
puts pair_product([1, 2, 3, 12, 8], 24).inspect
  STRING
  answer_string=<<-STRING
[[0, 3]]
[[1, 3]]
[[1, 3], [2, 4]]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# pairs_to_string ===================================================================================================#
#====================================================================================================================#

rolling_count+=1
'135'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method 'pairs_to_string(arr)' that takes in an array of pairs. The       #
# method should return a string corresponding to the pairs.                        #
#                                                                                  #
# Examples:                                                                        #
#            array1 = [                                                            #
#                        ['a', 3],                                                 #
#                        ['b', 1],                                                 #
#                        ['c', 2]                                                  #
#                     ]                                                            #
#            pairs_to_string(array1)                    # => 'aaabcc'              #
#            array2 = [                                                            #
#                        ['f', 1],                                                 #
#                        ['o', 2],                                                 #
#                        ['d', 1],                                                 #
#                        ['!', 1]                                                  #
#                     ]                                                            #
#            pairs_to_string(array2)                    # => 'food!'               #
#                                                                                  #
# answers should be:                                                               #
#            => 'aaabcc'                                                           #
#            => 'food!'                                                            #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

array1 = [
         ['a', 3],
         ['b', 1],
         ['c', 2]
       ]
array2 = [
         ['f', 1],
         ['o', 2],
         ['d', 1],
         ['!', 1]
       ]
puts pairs_to_string(array1)
puts pairs_to_string(array2)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM  (FUNCTIONAL PROGRAMMING)                                     #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def pairs_to_string(array)
  new_string=''
  array.each do |subarray|
      new_string+=subarray[0]*subarray[1]
  end
  return new_string
end
array1 = [
  ['a', 3],
  ['b', 1],
  ['c', 2]
]
array2 = [
  ['f', 1],
  ['o', 2],
  ['d', 1],
  ['!', 1]
]
puts pairs_to_string(array1)
puts pairs_to_string(array2)
  STRING
  answer_string=<<-STRING
'aaabcc'
'food!'
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# passing_students  =================================================================================================#
#====================================================================================================================#

rolling_count+=1
'136'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method passing_students(students) that accepts an array of student       #
# hashes. It should iterate through the list of students and return an array of    #
# the names of all the students who have an average grade of at least 70.          #
#                                                                                  #
# Example:                                                                         #
#      var students = [                                                            #
#                       {                                                          #
#                        "name"=>"Kush",                                           #
#                        "id"=>12345,                                              #
#                         "grades"=>[{"id"=>0, "score"=>65},                       #
#                                    {"id"=>1, "score"=>75},                       #
#                                    {"id"=>2, "score"=>85}]                       #
#                       },                                                         #
#                       {                                                          #
#                        "name"=>"Ned",                                            #
#                        "id"=>55555,                                              #
#                        "grades"=>[{"id"=>0, "score"=>100},                       #
#                                   {"id"=>1, "score"=>100},                       #
#                                   {"id"=>2, "score"=>100}]                       #
#                       },                                                         #
#                       {                                                          #
#                        "name"=>"Haseeb",                                         #
#                        "id"=>94110,                                              #
#                        "grades"=>[{"id"=>0, "score"=>65},                        #
#                                   {"id"=>1, "score"=>60},                        #
#                                   {"id"=>2, "score"=>65}]                        #
#                       }                                                          #
#                      ]                                                           #
#                                                                                  #
#                                                                                  #
# answers should be:                                                               #
#            => ['Kush', 'Ned' ]                                                   #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

students = [
  {
   "name"=>"Kush",
   "id"=>12345,
   "grades"=>[{"id"=>0, "score"=>65},
              {"id"=>1, "score"=>75},
              {"id"=>2, "score"=>85}]
  },
  {
   "name"=>"Ned",
   "id"=>55555,
   "grades"=>[{"id"=>0, "score"=>100},
              {"id"=>1, "score"=>100},
              {"id"=>2, "score"=>100}]
  },
  {
   "name"=>"Haseeb",
   "id"=>94110,
   "grades"=>[{"id"=>0, "score"=>65},
              {"id"=>1, "score"=>60},
              {"id"=>2, "score"=>65}]
  }
          ]
puts passing_students(students)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def average(scores)
  sum=0.0
  scores.each do |score|
      sum+=score
  end
  return sum/scores.length
end
def passing_students(students)
  new_array=[]
  students.each do |student|
      name=student['name']
      grades=student['grades']
      scores_array=[]
      grades.each do |grade|
          scores_array<<grade['score']
      end
      if average(scores_array)>=70
          new_array<<name
      end
  end
  return new_array
end
students = [
  {
   "name"=>"Kush",
   "id"=>12345,
   "grades"=>[{"id"=>0, "score"=>65},
              {"id"=>1, "score"=>75},
              {"id"=>2, "score"=>85}]
  },
  {
   "name"=>"Ned",
   "id"=>55555,
   "grades"=>[{"id"=>0, "score"=>100},
              {"id"=>1, "score"=>100},
              {"id"=>2, "score"=>100}]
  },
  {
   "name"=>"Haseeb",
   "id"=>94110,
   "grades"=>[{"id"=>0, "score"=>65},
              {"id"=>1, "score"=>60},
              {"id"=>2, "score"=>65}]
  }
          ]
puts passing_students(students).inspect
  STRING
  answer_string=<<-STRING
['Kush', 'Ned']
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# peak_finder =======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'137'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function `peak_finder(array)` that takes in an array of numbers. It      #
# should return an array containing the indices of all the peaks. A peak is an     #
# element that is greater than both of its neighbors. If it is the first or last   #
# element, it is a peak if it is greater than its one neighbor. Assume the array   #
# has a length of at least 2.                                                      #
#                                                                                  #
# Hint: this can be solved using a single loop                                     #
#                                                                                  #
# Examples:                                                                        #
#           peak_finder([1, 2, 3, 2, 1])                     => [2]                #
#           peak_finder([2, 1, 2, 3, 4, 5])                  => [0, 5]             #
#           peak_finder([4, 6, 9, 4, 2, -7, 2, -4, 5])       => [2, 6, 8]          #
#                                                                                  #
# answers should be:                                                               #
#            => [2]                                                                #
#            => [0, 5]                                                             #
#            => [2, 6, 8]                                                          #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts peak_finder([1, 2, 3, 2, 1])
puts peak_finder([2, 1, 2, 3, 4, 5])
puts peak_finder([4, 6, 9, 4, 2, -7, 2, -4, 5])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: HARD (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def peak_finder(array)
  new_array=[]
  array.each_with_index do |num,index|
      if index==0 && num>array[index+1]
          new_array<<index
      elsif index==array.length-1 && num>array[index-1]
          new_array<<index
      elsif num>array[index-1] && num>array[index+1]
          new_array<<index
      end
  end
  return new_array
end
puts peak_finder([1, 2, 3, 2, 1]).inspect
puts peak_finder([2, 1, 2, 3, 4, 5]).inspect
puts peak_finder([4, 6, 9, 4, 2, -7, 2, -4, 5]).inspect
  STRING
  answer_string=<<-STRING
[2]
[0, 5]
[2, 6, 8]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# perfect_square? ===================================================================================================#
#====================================================================================================================#

rolling_count+=1
'138'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method perfect_square? that takes in a number and returns a boolean      #
# indicating whether it is a perfect square. A perfect square is a number that     #
# results from multiplying a number by itself. For example, 9 is a perfect square  #
# because 3  3 = 9, 25 is a perfect square because 5  5 = 25.                      #
#                                                                                  #
# EXAMPLES:                                                                        #
#           puts perfect_square?(5)    => false                                    #
#           puts perfect_square?(12)   => false                                    #
#           puts perfect_square?(30)   => false                                    #
#           puts perfect_square?(9)    => true                                     #
#           puts perfect_square?(25)   => true                                     #
#                                                                                  #
# answers should be:                                                               #
#            => false                                                              #
#            => false                                                              #
#            => false                                                              #
#            => true                                                               #
#            => true                                                               #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts perfect_square?(5)
puts perfect_square?(12)
puts perfect_square?(30)
puts perfect_square?(9)
puts perfect_square?(25)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def perfect_square?(num)
  (2..num).each do |number|
      return true if number*number==num
  end
  return false
end
puts perfect_square?(5)
puts perfect_square?(12)
puts perfect_square?(30)
puts perfect_square?(9)
puts perfect_square?(25)
  STRING
  answer_string=<<-STRING
false
false
false
true
true
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# pick_primes =======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'139'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method pick_primes that takes in an array of numbers and returns a new   #
# array containing only the prime numbers.                                         #
#                                                                                  #
# EXAMPLES:                                                                        #
#           puts pick_primes([2, 3, 4, 5, 6])                #=> [2, 3, 5]         #
#           puts pick_primes([101, 20, 103, 2017])           #=> [101, 103, 2017]  #
#                                                                                  #
# answers should be:                                                               #
#            => [2, 3, 5]                                                          #
#            => [101, 103, 2017]                                                   #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts pick_primes([2, 3, 4, 5, 6])
puts pick_primes([101, 20, 103, 2017])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def is_prime?(num)
  return false if num<2
  (2...num).each do |number|
      return false if num%number==0
  end
  return true
end

def pick_primes(array)
  new_array=[]
  array.each do |num|
      new_array<<num if is_prime?(num)
  end
  return new_array
end
puts pick_primes([2, 3, 4, 5, 6]).inspect
puts pick_primes([101, 20, 103, 2017]).inspect
  STRING
  answer_string=<<-STRING
[2, 3, 5]
[101, 103, 2017]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# pig_latin_word ====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'140'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method pig_latin_word that takes in a word string and translates the     #
# word into pig latin.                                                             #
#                                                                                  #
# Pig latin translation uses the following rules:                                  #
#             - for words that start with a vowel, add 'yay' to the end            #
#             - for words that start with a nonvowel, move all letters before      #
#               the first vowel to the end of the word and add 'ay'                #
#                                                                                  #
# example:                                                                         #
#            pig_latin_word("apple")      => "appleyay"                            #
#            pig_latin_word("eat")        => "eatyay"                              #
#            pig_latin_word("banana")     => "ananabay"                            #
#            pig_latin_word("trash")      => "ashtray"                             #
#                                                                                  #
# answers should be:                                                               #
#            => "appleyay"                                                         #
#            => "eatyay"                                                           #
#            => "ananabay"                                                         #
#            => "ashtray"                                                          #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts pig_latin_word("apple")
puts pig_latin_word("eat")
puts pig_latin_word("banana")
puts pig_latin_word("trash")

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def pig_latin_word(word)
  idx=0
  vowels='aeiou'
  if vowels.include?(word[0])
      return word+'yay'
  else
      word.each_char.with_index do |character,index|
          if vowels.include?(character)
              idx=index
              break
          end
      end
      return word[idx..-1]+word[0...idx]+'ay'
  end
end
puts pig_latin_word("apple")
puts pig_latin_word("eat")
puts pig_latin_word("banana")
puts pig_latin_word("trash")
  STRING
  answer_string=<<-STRING
"appleyay"
"eatyay"
"ananabay"
"ashtray"
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# pig_latinize ======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'141'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method 'pig_latinize(word)' that translates a single word into its pig   #
# latin equivalent. The rules for the translation are as follows:                  #
#                                                                                  #
# 1) For words less than 3 characters long, add "ay" at the end                    #
# 2) For words that begin with a non-vowel, all letters before the initial vowel   #
#    are placed at the end of the word sequence. Then, "ay" is added to the end.   #
# 3) For words that begin with vowel sounds, just adds "yay" to the end            #
#                                                                                  #
# Note: y should not be considered a vowel                                         #
#                                                                                  #
# answers should be:                                                               #
#           => "eachertay"                                                         #
#           => "ashtray"                                                           #
#           => "eatyay"                                                            #
#           => "orangeyay"                                                         #
#           => "myay"                                                              #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts pig_latinize("teacher")
puts pig_latinize("trash")
puts pig_latinize("eat")
puts pig_latinize("orange")
puts pig_latinize("my")

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def find_first_vowel_index(string)
  vowels='aeiou'
  string.each_char.with_index do |character,index|
      return index if vowels.include?(character)
  end
end

def pig_latinize(string)
  vowels='aeiou'
  if string.length<3
      return string+'ay'
  elsif vowels.include?(string[0])
      return string+'yay'
  else
      index=find_first_vowel_index(string)
      return string[index..-1]+string[0...index]+'ay'
  end
end
puts pig_latinize("teacher")
puts pig_latinize("trash")
puts pig_latinize("eat")
puts pig_latinize("orange")
puts pig_latinize("my")
  STRING
  answer_string=<<-STRING
"eachertay"
"ashtray"
"eatyay"
"orangeyay"
"myay"
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# potent_product ====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'142'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method potent_product that accepts an array of numbers and a product as  #
# arguments. The method should return a boolean indicating whether or not a pair   #
# of distinct elements in the array result in the product when multiplied together.#
#                                                                                  #
# answers should be:                                                               #
#           true                                                                   #
#           true                                                                   #
#           true                                                                   #
#           true                                                                   #
#           false                                                                  #
#           false                                                                  #
#           false                                                                  #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts potent_product([4, 2, 5, 8], 16)
puts potent_product([8, 1, 9, 3], 8)
puts potent_product([3, 4], 12)
puts potent_product([3, 4, 6, 2, 5], 12)
puts potent_product([4, 2, 5, 7], 16)
puts potent_product([8, 4, 9, 3], 8)
puts potent_product([3], 12)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def potent_product(arr, n)
  arr.each_with_index do |num1,index1|
      arr.each_with_index do |num2,index2|
          if index2>index1
              return true if num1*num2==n
          end
      end
  end
  return false
end
puts potent_product([4, 2, 5, 8], 16)
puts potent_product([8, 1, 9, 3], 8)
puts potent_product([3, 4], 12)
puts potent_product([3, 4, 6, 2, 5], 12)
puts potent_product([4, 2, 5, 7], 16)
puts potent_product([8, 4, 9, 3], 8)
puts potent_product([3], 12)
  STRING
  answer_string=<<-STRING
true
true
true
true
false
false
false
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# power_sequence ====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'143'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method 'power_sequence(base, length)' that takes in two numbers, `base`  #
# and `length`. The function should return an array containing a power sequence    #
# with the given `length`. Assume that the `length` is at least 1. The first number#
# of a power sequence begins with `base`. The second number of the sequence is the #
# product between the first number and the base. The third number of the sequence  #
# is the product between the second number and the base...                         #
#                                                                                  #
# Examples:                                                                        #
#           power_sequence(3, 4)         => [ 3, 9, 27, 81 ]                       #
#           power_sequence(2, 6)         => [ 2, 4, 8, 16, 32, 64 ]                #
#           power_sequence(8, 3)         => [ 8, 64, 512 ]                         #
#                                                                                  #
# answers should be:                                                               #
#           => [ 3, 9, 27, 81 ]                                                    #
#           => [ 2, 4, 8, 16, 32, 64 ]                                             #
#           => [ 8, 64, 512 ]                                                      #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts power_sequence(3, 4)
puts power_sequence(2, 6)
puts power_sequence(8, 3)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def power_sequence(base,length)
  new_array=[]
  counter=0
  while new_array.length<length
      if counter>0
          new_array<<base*new_array[counter-1]
      else
          new_array<<base
      end
      counter+=1
  end
  return new_array
end
puts power_sequence(3, 4).inspect
puts power_sequence(2, 6).inspect
puts power_sequence(8, 3).inspect
  STRING
  answer_string=<<-STRING
[3, 9, 27, 81]
[2, 4, 8, 16, 32, 64]
[8, 64, 512]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# previous_prime_array ==============================================================================================#
#====================================================================================================================#

rolling_count+=1
'144'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method previous_prime_array(array) that takes in an array of numbers.    #
# The method should return a new array where each prime number is replaced with    #
# the prime number that comes before it. For example the prime number that comes   #
# before 7 is 5.                                                                   #
#                                                                                  #
# Examples:                                                                        #
#            previous_prime_array([10, 12, 11, 7, 16])                             #
#            previous_prime_array([17, 24, 29, 5, 2, 4])                           #
#                                                                                  #
# answers should be:                                                               #
#            => [ 10, 12, 7, 5, 16 ]                                               #
#            => [ 13, 24, 23, 3, nil, 4 ]                                          #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts previous_prime_array([10, 12, 11, 7, 16])
puts previous_prime_array([17, 24, 29, 5, 2, 4])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: HARD (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def is_prime?(number)
  (2...number).each do |num|
      return false if number%num==0
  end
  return true
end
def previous_prime(number)
  return nil if number==2
  prime=0
  previous_prime=0
  (2..number).each do |num|
      if is_prime?(num)
          previous_prime,prime=prime,num
      end
  end
  return previous_prime
end
def previous_prime_array(array)
  array.each_with_index do |number,index|
      array[index]=previous_prime(number) if is_prime?(number)
  end
  return array
end
puts previous_prime_array([10, 12, 11, 7, 16]).inspect
puts previous_prime_array([17, 24, 29, 5, 2, 4]).inspect
  STRING
  answer_string=<<-STRING
[10, 12, 7, 5, 16]
[13, 24, 23, 3, nil, 4]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# prime? ============================================================================================================#
#====================================================================================================================#

rolling_count+=1
'145'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method prime? that takes in a number and returns a boolean, indicating   #
# whether the number is prime. A prime number is only divisible by 1 and itself.   #
#                                                                                  #
# EXAMPLES:                                                                        #
#            puts prime?(2)   => true                                              #
#            puts prime?(5)   => true                                              #
#            puts prime?(11)  => true                                              #
#            puts prime?(4)   => false                                             #
#            puts prime?(9)   => false                                             #
#            puts prime?(-5)  => false                                             #
#                                                                                  #
# answers should be:                                                               #
#            => true                                                               #
#            => true                                                               #
#            => true                                                               #
#            => false                                                              #
#            => false                                                              #
#            => false                                                              #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts prime?(2)
puts prime?(5)
puts prime?(11)
puts prime?(4)
puts prime?(9)
puts prime?(-5)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def prime?(num)
  return false if num<2
  (2...num).each do |number|
      return false if num%number==0
  end
  return true
end
puts prime?(2)
puts prime?(5)
puts prime?(11)
puts prime?(4)
puts prime?(9)
puts prime?(-5)
  STRING
  answer_string=<<-STRING
true
true
true
false
false
false
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# prime_factors =====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'146'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method prime_factors that takes in a number and returns an array         #
# containing all of the prime factors of the given number.                         #
#                                                                                  #
# EXAMPLES:                                                                        #
#           puts prime_factors(24)               #=> [2, 3]                        #
#           puts prime_factors(60)               #=> [2, 3, 5]                     #
#                                                                                  #
# answers should be:                                                               #
#            => [2, 3]                                                             #
#            => [2, 3, 5]                                                          #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts prime_factors(24)
puts prime_factors(60)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def is_prime?(num)
  return false if num<2
  (2...num).each do |number|
      return false if num%number==0
  end
  return true
end
def prime_factors(num)
  new_array=[]
  (2..num).each do |number|
      if num%number==0
          new_array<<number if is_prime?(number)
      end
  end
  return new_array
end
puts prime_factors(24).inspect
puts prime_factors(60).inspect
  STRING
  answer_string=<<-STRING
[2, 3]
[2, 3, 5]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# print_reverse =====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'147'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method 'print_reverse(min, max)' that prints out all numbers from max to #
# min (exclusive), in reverse order. Note: print the numbers in the function       #
#                                                                                  #
# Examples                                                                         #
#          print_reverse(13, 18)                                                   #
#                               =>  17                                             #
#                               =>  16                                             #
#                               =>  15                                             #
#                               =>  14                                             #
#                                                                                  #
#          print_reverse(90, 94)                                                   #
#                               =>  93                                             #
#                               =>  92                                             #
#                               =>  91                                             #
#                                                                                  #
# answers should be:                                                               #
#            =>  17                                                                #
#            =>  16                                                                #
#            =>  15                                                                #
#            =>  14                                                                #
#            =>  93                                                                #
#            =>  92                                                                #
#            =>  91                                                                #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

print_reverse(13, 18)
print_reverse(90, 94)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def print_reverse(min,max)
  start=max-1
  stop=min+1
  while start>=stop
      puts start
      start-=1
  end
end
print_reverse(13, 18)
print_reverse(90, 94)
  STRING
  answer_string=<<-STRING
17
16
15
14
93
92
91
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# pyramid_scheme ====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'148'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method 'pyramid_scheme(base)' that takes in an array of numbers          #
# representing the base of a pyramid. The function should return a two-            #
# dimensional array representing the completed pyramid. To generate an element     #
# of the next level of the pyramid, we sum the elements below and to the left      #
# and below and to the right.                                                      #
#                                                                                  #
# For example, given 2, 3, 7, 5, 9 as the base, we should construct this pyramid:  #
#                                                                                  #
# 85                                                                               #
# 37  48                                                                           #
# 15  22  26                                                                       #
# 5   10   12   14                                                                 #
# 2   3    7    5    9                                                             #
#                                                                                  #
# answers should be:                                                               #
#           => [[85], [37, 48], [15, 22, 26], [5, 10, 12, 14], [2, 3, 7, 5, 9]]    #
#           => [[16], [8, 8], [4, 4, 4], [2, 2, 2, 2]]                             #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts pyramid_scheme([2, 3, 7, 5, 9])
puts pyramid_scheme([2, 2, 2, 2])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def pyramid_scheme(arr)
  new_array=[]
  new_array<<arr
  while new_array[0].length>1
      temp_array=[]
      new_array[0].each_with_index do |number,index|
          if index>0
              temp_array<<number+new_array[0][index-1]
          end
      end
      new_array.unshift(temp_array)
  end
  return new_array
end
p pyramid_scheme([2, 3, 7, 5, 9])
p pyramid_scheme([2, 2, 2, 2])
  STRING
  answer_string=<<-STRING
[[85], [37, 48], [15, 22, 26], [5, 10, 12, 14], [2, 3, 7, 5, 9]]
[[16], [8, 8], [4, 4, 4], [2, 2, 2, 2]]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# pyramid_sum =======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'149'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method pyramid_sum that takes in an array of numbers representing the    #
# base of a pyramid. The function should return a 2D array representing a complete #
# pyramid with the given base. To construct a level of the pyramid, we take the    #
# sum of adjacent elements of the level below.                                     #
#                                                                                  #
# HINT:                                                                            #
#        For example, the base [1, 4, 6] gives us the following pyramid            #
#                         15                                                       #
#                       5   10                                                     #
#                     1   4    6                                                   #
# EXAMPLES:                                                                        #
#           puts pyramid_sum([1, 4, 6])                                            #
#           puts pyramid_sum([3, 7, 2, 11])                                        #
#                                                                                  #
# answers should be:                                                               #
#            => [[15],[5,10],[1,4,6]]                                              #
#            => [ [41],[19,22],[10,9,13],[3,7,2,11]]                               #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts pyramid_sum([1, 4, 6])
puts pyramid_sum([3, 7, 2, 11])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def pyramid_sum(array_of_numbers)
  new_array=[]
  new_array<<array_of_numbers
  while new_array[0].length>1
      temp_array=[]
      new_array[0].each_with_index do |number,index|
          if index>0
              temp_array<<number+new_array[0][index-1]
          end
      end
      new_array.unshift(temp_array)
  end
  return new_array
end
puts pyramid_sum([1, 4, 6]).inspect
puts pyramid_sum([3, 7, 2, 11]).inspect
  STRING
  answer_string=<<-STRING
[[15],[5,10],[1,4,6]]
[[41],[19,22],[10,9,13],[3,7,2,11]]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# range =============================================================================================================#
#====================================================================================================================#

rolling_count+=1
'150'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method range(min, max) that takes in two numbers min and max. The method #
# should return an array containing all numbers from min to max inclusive.         #
#                                                                                  #
# EXAMPLES:                                                                        #
#           puts range(2, 7)   # => [2, 3, 4, 5, 6, 7]                             #
#           puts range(13, 20) # => [13, 14, 15, 16, 17, 18, 19, 20]               #
#                                                                                  #
# answers should be:                                                               #
#            => [2, 3, 4, 5, 6, 7]                                                 #
#            => [13, 14, 15, 16, 17, 18, 19, 20]                                   #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts range(2, 7)
puts range(13, 20)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def range(min,max)
  new_array=[]
  (min..max).each{|num| new_array<<num}
  return new_array
end
puts range(2, 7).inspect
puts range(13, 20).inspect
  STRING
  answer_string=<<-STRING
[2, 3, 4, 5, 6, 7]
[13, 14, 15, 16, 17, 18, 19, 20]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# remove_nth_letter =================================================================================================#
#====================================================================================================================#

rolling_count+=1
'151'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function remove_nth_letter(word, n) that takes in a string and an index  #
# `n`. The function should return that word with the character at index `n`        #
# removed.                                                                         #
#                                                                                  #
# Examples:                                                                        #
#           remove_nth_letter('bootcamp', 0)          => 'ootcamp'                 #
#           remove_nth_letter('bootcamp', 6)          => 'bootcap'                 #
#           remove_nth_letter('bootcamp', 4)          => 'bootamp'                 #
#           remove_nth_letter('computer', 3)          => 'comuter'                 #
#                                                                                  #
# answers should be:                                                               #
#            => 'ootcamp'                                                          #
#            => 'bootcap'                                                          #
#            => 'bootamp'                                                          #
#            => 'comuter'                                                          #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts remove_nth_letter('bootcamp', 0)
puts remove_nth_letter('bootcamp', 6)
puts remove_nth_letter('bootcamp', 4)
puts remove_nth_letter('computer', 3)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def remove_nth_letter(string, nth)
  array_of_chars=string.chars
  array_of_chars[nth]=''
  return array_of_chars.join('')
end
puts remove_nth_letter('bootcamp', 0)
puts remove_nth_letter('bootcamp', 6)
puts remove_nth_letter('bootcamp', 4)
puts remove_nth_letter('computer', 3)
  STRING
  answer_string=<<-STRING
'ootcamp'
'bootcap'
'bootamp'
'comuter'
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# repeated_chars ====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'152'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method 'repeated_chars(word)' which takes a string and returns an        #
# array of all the characters in the word that appear in a streak (i.e. more       #
# than once consecutively). This should be case-sensitive.                         #
#                                                                                  #
# answers should be:                                                               #
#           => ["a", "a"]                                                          #
#           => ["s", "s", "p"]                                                     #
#           => ["S", "s", "S"]                                                     #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts repeated_chars("aaabaa").inspect
puts repeated_chars("mississippi").inspect
puts repeated_chars("SSassSS").inspect

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def repeated_chars(word)
  new_array=[]
  word.each_char.with_index do |item,index|
      if index>0
         if item==word[index-1] && item!=word[index+1]
             new_array<<item
         end
      end
  end
  return new_array
end
puts repeated_chars("aaabaa").inspect
puts repeated_chars("mississippi").inspect
puts repeated_chars("SSassSS").inspect
  STRING
  answer_string=<<-STRING
["a", "a"]
["s", "s", "p"]
["S", "s", "S"]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# retrieve_values ===================================================================================================#
#====================================================================================================================#

rolling_count+=1
'153'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method retrieve_values that takes in two hashes and a key. The method    #
# should return an array containing the values from the two hashes that correspond #
# with the given key.                                                              #
#                                                                                  #
# example:                                                                         #
#         dog1 = {"name"=>"Fido", "color"=>"brown"}                                #
#         dog2 = {"name"=>"Spot", "color"=> "white"}                               #
#         retrieve_values(dog1, dog2, "name")              => ["Fido", "Spot"]     #
#         retrieve_values(dog1, dog2, "color")             => ["brown", "white"]   #
#                                                                                  #
# answers should be:                                                               #
#            => ["Fido", "Spot"]                                                   #
#            => ["brown", "white"]                                                 #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

dog1 = {"name"=>"Fido", "color"=>"brown"}
dog2 = {"name"=>"Spot", "color"=> "white"}
puts retrieve_values(dog1, dog2, "name")
puts retrieve_values(dog1, dog2, "color")

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def retrieve_values(hash1,hash2,key)
  return [hash1[key],hash2[key]]
end
dog1 = {"name"=>"Fido", "color"=>"brown"}
dog2 = {"name"=>"Spot", "color"=> "white"}
puts retrieve_values(dog1, dog2, "name").inspect
puts retrieve_values(dog1, dog2, "color").inspect
  STRING
  answer_string=<<-STRING
["Fido", "Spot"]
["brown", "white"]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# reverb ============================================================================================================#
#====================================================================================================================#

rolling_count+=1
'154'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method `reverb(word)` that takes in a word string and returns the word   #
# with all characters after the last vowel repeated.                               #
#                                                                                  #
# Examples:                                                                        #
#           reverb('running')                    => 'runninging'                   #
#           reverb('wild')                       => 'wildild'                      #
#           reverb('debugged')                   => 'debuggeded'                   #
#           reverb('my')                         => 'my'                           #
#                                                                                  #
# answers should be:                                                               #
#            => 'runninging'                                                       #
#            => 'wildild'                                                          #
#            => 'debuggeded'                                                       #
#            => 'my'                                                               #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts reverb('running')
puts reverb('wild')
puts reverb('debugged')
puts reverb('my')

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def get_last_vowel_index(word)
  last_index=0
  vowels='aeiou'
  word.each_char.with_index do |character,index|
      last_index=index if vowels.include?(character)
  end
  return last_index
end
def reverb(string)
  last_index=get_last_vowel_index(string)
  if last_index==0
      return string
  else
      return string+string[last_index..-1]
  end
end
puts reverb('running').inspect
puts reverb('wild').inspect
puts reverb('debugged').inspect
puts reverb('my').inspect
  STRING
  answer_string=<<-STRING
'runninging'
'wildild'
'debuggeded'
'my'
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# reverse_hipsterfy =================================================================================================#
#====================================================================================================================#

rolling_count+=1
'155'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method `reverse_hipsterfy(sentence)` that takes in a sentence and        #
# removes all vowels, except the last vowels of every word.                        #
#                                                                                  #
# Examples:                                                                        #
#            reverse_hipsterfy("proper")                                           #
#            reverse_hipsterfy("proper tonic panther")                             #
#            reverse_hipsterfy("bootcamp prep")                                    #
#            reverse_hipsterfy("towel flicker banana")                             #
#            reverse_hipsterfy("runner anaconda")                                  #
#            reverse_hipsterfy("turtle cheeseburger fries")                        #
#                                                                                  #
# answers should be:                                                               #
#            => 'prper'                                                            #
#            => 'prper tnic pnther'                                                #
#            => 'btcamp prep'                                                      #
#            => 'twel flcker bnna'                                                 #
#            => 'rnner ncnda'                                                      #
#            => 'trtle chsbrger fres'                                              #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts reverse_hipsterfy("proper")
puts reverse_hipsterfy("proper tonic panther")
puts reverse_hipsterfy("bootcamp prep")
puts reverse_hipsterfy("towel flicker banana")
puts reverse_hipsterfy("runner anaconda")
puts reverse_hipsterfy("turtle cheeseburger fries")

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def get_last_vowel_index(word)
  saved_index=0
  vowels='aeiou'
  word.each_char.with_index do |character,index|
      saved_index=index if vowels.include?(character)
  end
  return saved_index
end
def hipsterfication(word)
  new_string=''
  vowels='aeiou'
  last_vowel_index=get_last_vowel_index(word)
  word.each_char.with_index do |character,index|
      new_string+=character if !vowels.include?(character) || last_vowel_index==index
  end
  return new_string
end
def reverse_hipsterfy(string)
  array_of_words=string.split
  array_of_words.each_with_index do |word,index|
      array_of_words[index]=hipsterfication(word)
  end
  return array_of_words.join(' ')
end
puts reverse_hipsterfy("proper")
puts reverse_hipsterfy("proper tonic panther")
puts reverse_hipsterfy("bootcamp prep")
puts reverse_hipsterfy("towel flicker banana")
puts reverse_hipsterfy("runner anaconda")
puts reverse_hipsterfy("turtle cheeseburger fries")
  STRING
  answer_string=<<-STRING
'prper'
'prper tnic pnther'
'btcamp prep'
'twel flcker bnna'
'rnner ncnda'
'trtle chsbrger fres'
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# reverse_range =====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'156'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method reverse_range(min, max) that takes in two numbers min and max.    #
# The function should return an array containing all numbers from min to max in    #
# reverse order. The min and max should be excluded from the array.                #
#                                                                                  #
# EXAMPLES:                                                                        #
#           puts reverse_range(10, 17) # => [16, 15, 14, 13, 12, 11]               #
#           puts reverse_range(1, 7)   # => [6, 5, 4, 3, 2]                        #
#                                                                                  #
# answers should be:                                                               #
#            => [16, 15, 14, 13, 12, 11]                                           #
#            => [6, 5, 4, 3, 2]                                                    #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts reverse_range(10, 17)
puts reverse_range(1, 7)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def reverse_range(min,max)
  new_array=[]
  (min..max).each{|num| new_array.unshift(num) if num>min && num<max}
  return new_array
end
puts reverse_range(10, 17).inspect
puts reverse_range(1, 7).inspect
  STRING
  answer_string=<<-STRING
[16, 15, 14, 13, 12, 11]
[6, 5, 4, 3, 2]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# reverse_sentence ==================================================================================================#
#====================================================================================================================#

rolling_count+=1
'157'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function reverse_sentence(sentence) that returns a string where all the  #
# words in the input sentence are reversed. Don't use 'reverse' method.            #
#                                                                                  #
# Examples:                                                                        #
#            reverse_sentence("Go to the store")                                   #
#            reverse_sentence("Jump, jump for joy")                                #
#                                                                                  #
# answers should be:                                                               #
#            => "store the to Go"                                                  #
#            => "joy for jump Jump,"                                               #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts reverse_sentence("Go to the store")
puts reverse_sentence("Jump, jump for joy")

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def reverse_sentence(string)
  new_array=[]
  array_of_words=string.split
  array_of_words.each do |word|
      new_array.unshift(word)
  end
  return new_array.join(' ')
end
puts reverse_sentence("Go to the store").inspect
puts reverse_sentence("Jump, jump for joy").inspect
  STRING
  answer_string=<<-STRING
"store the to Go"
"joy for jump Jump,"
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# reverse_string ====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'158'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method 'reverse_string(str)' that takes in a string and returns the      #
# given string with its characters in reverse order.                               #
#                                                                                  #
# Examples:                                                                        #
#            reverse_string('taco')            => 'ocat'                           #
#            reverse_string('hello world')     => 'dlrow olleh'                    #
#                                                                                  #
# answers should be:                                                               #
#            => 'ocat'                                                             #
#            => 'dlrow olleh'                                                      #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts reverse_string('taco')
puts reverse_string('hello world')

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def reverse_string(string)
  new_string=''
  string.each_char do |character|
      new_string=character+new_string
  end
  return new_string
end
puts reverse_string('taco')
puts reverse_string('hello world')
  STRING
  answer_string=<<-STRING
'ocat'
'dlrow olleh'
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# reverse_words =====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'159'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method reverse_words that takes in a sentence string and returns the     #
# sentence with the order of the characters in each word reversed. Note that we    #
# need to reverse the order of characters in the words, do not reverse the order   #
# of words in the sentence.                                                        #
#                                                                                  #
# example:                                                                         #
#        reverse_words('keep coding')                                              #
#        reverse_words('simplicity is prerequisite for reliability')               #
#                                                                                  #
# answers should be:                                                               #
#            => 'peek gnidoc'                                                      #
#            => 'yticilpmis si etisiuqererp rof ytilibailer'                       #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts reverse_words('keep coding')
puts reverse_words('simplicity is prerequisite for reliability')

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def reverse_words(string)
  array_of_words=string.split
  array_of_words.each_with_index do |word,index|
      new_string=''
      word.each_char do |character|
          new_string=character+new_string
      end
      array_of_words[index]=new_string
  end
  return array_of_words.join(' ')
end
puts reverse_words('keep coding')
puts reverse_words('simplicity is prerequisite for reliability')
  STRING
  answer_string=<<-STRING
'peek gnidoc'
'yticilpmis si etisiuqererp rof ytilibailer'
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# rotate_array ======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'160'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method rotate_array that takes in an array and a number. The method      #
# should return the array after rotating the elements the specified number of      #
# times. A single rotation takes the last element of the array and moves it to the #
# front.                                                                           #
#                                                                                  #
# example:                                                                         #
#         rotate_array([ "Matt", "Danny", "Mashu", "Matthias" ], 1)                #
#         rotate_array([ "a", "b", "c", "d" ], 2)                                  #
#                                                                                  #
# answers should be:                                                               #
#            => [ "Matthias", "Matt", "Danny", "Mashu" ]                           #
#            => [ "c", "d", "a", "b" ]                                             #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts rotate_array([ "Matt", "Danny", "Mashu", "Matthias" ], 1)
print rotate_array([ "a", "b", "c", "d" ], 2)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def rotate_array(array,times)
  (1..times).each do
      item=array.pop
      array.unshift(item)
  end
  return array
end
puts rotate_array([ "Matt", "Danny", "Mashu", "Matthias" ], 1).inspect
print rotate_array([ "a", "b", "c", "d" ], 2).inspect
  STRING
  answer_string=<<-STRING
["Matthias", "Matt", "Danny", "Mashu"]
["c", "d", "a", "b"]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# royal_we ==========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'161'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function royal_we(sentence,royal) that returns a string where every word #
# 'I' is replaced with 'we', every word 'mine' is replaced with 'ours', every word #
# 'my' is replaced with 'our', and every word 'me' is replaced with "us"           #
#                                                                                  #
# Examples:                                                                        #
#            royal_we("I want to go to the store",royal)                           #
#            royal_we("This is my house and you will respect me",royal)            #
#            royal_we("This is mine",royal)                                        #
#            royal_we("Jump for my love"royal)                                     #
#                                                                                  #
# answers should be:                                                               #
#            => "we want to go to the store"                                       #
#            => "This is our house and you will respect us"                        #
#            => "This is ours"                                                     #
#            => "Jump for our love"                                                #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

royal={'I'=>'we', 'mine'=>'ours', 'my'=>'our', 'me'=>'us'}
puts royal_we("I want to go to the store",royal)
puts royal_we("This is my house and you will respect me",royal)
puts royal_we("This is mine",royal)
puts royal_we("Jump for my love",royal)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def royal_we(string,royal)
  array_of_words=string.split
  array_of_words.each_with_index do |word,index|
      if royal.has_key?(word)
          array_of_words[index]=royal[word]
      end
  end
  return array_of_words.join(' ')
end
royal={'I'=>'we', 'mine'=>'ours', 'my'=>'our', 'me'=>'us'}
puts royal_we("I want to go to the store",royal)
puts royal_we("This is my house and you will respect me",royal)
puts royal_we("This is mine",royal)
puts royal_we("Jump for my love",royal)
  STRING
  answer_string=<<-STRING
"we want to go to the store"
"This is our house and you will respect us"
"This is ours"
"Jump for our love"
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# safe_speed_change =================================================================================================#
#====================================================================================================================#

rolling_count+=1
'162'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method safe_speed_change(speeds) that takes in an array of speed         #
# numbers. The method should return true if consecutive speeds in the array differ #
# by no more than 5, false otherwise.                                              #
#                                                                                  #
# Examples:                                                                        #
#           safe_speed_change([3, 3, 2, 6, 8, 7])                 => true          #
#           safe_speed_change([3, 3, 2, 6, 12, 10])               => false         #
#           safe_speed_change([8, 10, 4, 3, 2])                   => false         #
#                                                                                  #
# answers should be:                                                               #
#            => true                                                               #
#            => false                                                              #
#            => false                                                              #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts safe_speed_change([3, 3, 2, 6, 8, 7])
puts safe_speed_change([3, 3, 2, 6, 12, 10])
puts safe_speed_change([8, 10, 4, 3, 2])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def safe_speed_change(array)
  array.each_with_index do |speed,index|
      if index>0
          return false if ([array[index-1],speed].max-[array[index-1],speed].min)>5
      end
  end
  return true
end
puts safe_speed_change([3, 3, 2, 6, 8, 7])
puts safe_speed_change([3, 3, 2, 6, 12, 10])
puts safe_speed_change([8, 10, 4, 3, 2])
  STRING
  answer_string=<<-STRING
true
false
false
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# same_char_collapse ================================================================================================#
#====================================================================================================================#

rolling_count+=1
'163'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method same_char_collapse that takes in a string and returns a collapsed #
# version of the string. To collapse the string, we repeatedly delete 2 adjacent   #
# characters that are the same until there are no such adjacent characters. If     #
# there are multiple pairs that can be collapsed, delete the leftmost pair. For    #
# example, we take the following steps to collapse                                 #
# "zzzxaaxy": zzzxaaxy -> zxaaxy -> zxxy -> zy                                     #
#                                                                                  #
# EXAMPLES:                                                                        #
#           puts same_char_collapse("zzzxaaxy")                      => "zy"       #
#           because zzzxaaxy -> zxaaxy -> zxxy -> zy                               #
#                                                                                  #
#                                                                                  #
#           puts same_char_collapse("uqrssrqvtt")                    => "uv"       #
#           because uqrssrqvtt -> uqrrqvtt -> uqqvtt -> uvtt -> uv                 #
#                                                                                  #
# answers should be:                                                               #
#            => "zy"                                                               #
#            => "uv"                                                               #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts same_char_collapse("zzzxaaxy")
puts same_char_collapse("uqrssrqvtt")

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def same_char_collapse(string)
  collapse=1
  new_string=''
  while collapse>0
      collapse=0
      new_string=''
      string.each_char.with_index do |character,index|
          if character!=string[index+1]
              new_string+=character
          else
              new_string+=string[index+2..-1]
              collapse+=1
              break
          end
      end
      string=new_string
  end
  return string
end
puts same_char_collapse("zzzxaaxy")
puts same_char_collapse("uqrssrqvtt")
  STRING
  answer_string=<<-STRING
"zy"
"uv"
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# second_largest ====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'164'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method `second_largest(array)` that takes in an array of positive        #
# numbers and returns the second largest number in the array. Assume that there    #
# are no duplicate elements in the array. If there is no second largest number,    #
# the function should return -1.                                                   #
#                                                                                  #
# Examples:                                                                        #
#            second_largest([3, 1, 5, 4, 7])     => 5                              #
#            second_largest([10, 7])             => 7                              #
#            second_largest([10])                => -1                             #
#            second_largest([])                  => -1                             #
#                                                                                  #
# answers should be:                                                               #
#            => 5                                                                  #
#            => 7                                                                  #
#            => -1                                                                 #
#            => -1                                                                 #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts second_largest([3, 1, 5, 4, 7])
puts second_largest([10, 7])
puts second_largest([10])
puts second_largest([])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: HARD (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def second_largest(array)
  return -1 if array.length<2
  largest=0
  second_largest=0
  array.each do |number|
      if number>largest
          second_largest,largest=largest,number
      elsif number>second_largest
          second_largest=number
      end
  end
  return second_largest
end
puts second_largest([3, 1, 5, 4, 7])
puts second_largest([10, 7])
puts second_largest([10])
puts second_largest([])
  STRING
  answer_string=<<-STRING
5
7
-1
-1
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# select_long_words =================================================================================================#
#====================================================================================================================#

rolling_count+=1
'165'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method select_long_words(words) that takes in an array of words and      #
# returns a new array containing all of the words of the original array that are   #
# longer than 4 characters.                                                        #
#                                                                                  #
# EXAMPLES:                                                                        #
#         puts select_long_words(["what", "are", "we", "eating", "for", "dinner"]) #
#         puts select_long_words(["keep", "coding"])                               #
#                                                                                  #
# answers should be:                                                               #
#            => ["eating", "dinner"]                                               #
#            => ["coding"]                                                         #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts select_long_words(["what", "are", "we", "eating", "for", "dinner"])
puts select_long_words(["keep", "coding"])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def select_long_words(words)
  new_array=[]
  words.each{|word| new_array<<word if word.length>4}
  return new_array
end
puts select_long_words(["what", "are", "we", "eating", "for", "dinner"]).inspect
puts select_long_words(["keep", "coding"]).inspect
  STRING
  answer_string=<<-STRING
["eating", "dinner"]
["coding"]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# select_odds =======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'166'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method select_odds(numbers) that takes in an array of numbers and returns#
# a new array containing the odd numbers of the original array.                    #
#                                                                                  #
# EXAMPLES:                                                                        #
#           puts select_odds([13, 4, 3, 7, 6, 11])   => [13, 3, 7, 11]             #
#           puts select_odds([2, 4, 6])              => []                         #
#                                                                                  #
# answers should be:                                                               #
#            => [13, 3, 7, 11]                                                     #
#            => []                                                                 #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts select_odds([13, 4, 3, 7, 6, 11])
puts select_odds([2, 4, 6])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def select_odds(numbers)
  new_array=[]
  numbers.each{|n| new_array<<n if n%2!=0}
  return new_array
end
puts select_odds([13, 4, 3, 7, 6, 11]).inspect
puts select_odds([2, 4, 6]).inspect
  STRING
  answer_string=<<-STRING
[13, 3, 7, 11]
[]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# select_upcase_keys   ==============================================================================================#
#====================================================================================================================#

rolling_count+=1
'167'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method select_upcase_keys that takes in a hash and returns a new hash    #
# containing key-value pairs of the original hash that had uppercase keys. You can #
# assume that the keys will always be strings                                      #
#                                                                                  #
# example:                                                                         #
#          select_upcase_keys({"make"=> "Tesla", "MODEL"=> "S",                    #
#                              "Year"=> 2018, "SEATS"=> 4})                        #
#          select_upcase_keys({"DATE"=>"July 4th",                                 #
#                              "holiday"=> "Independence Day",                     #
#                              "type"=>"Federal"})                                 #
#                                                                                  #
# answers should be:                                                               #
#            => {"MODEL"=>"S", "SEATS"=>4}                                         #
#            => {"DATE"=>"July 4th"}                                               #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts select_upcase_keys({"make"=> "Tesla", "MODEL"=> "S", "Year"=> 2018, "SEATS"=> 4})
puts select_upcase_keys({"DATE"=>"July 4th","holiday"=> "Independence Day", "type"=>"Federal"})

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def select_upcase_keys(hash)
  new_hash={}
  hash.each_key do |key|
      new_hash[key]=hash[key] if key.upcase==key
  end
  return new_hash
end
puts select_upcase_keys({"make"=> "Tesla", "MODEL"=> "S", "Year"=> 2018, "SEATS"=> 4})
puts select_upcase_keys({"DATE"=>"July 4th","holiday"=> "Independence Day", "type"=>"Federal"})
  STRING
  answer_string=<<-STRING
{"MODEL"=>"S", "SEATS"=>4}
{"DATE"=>"July 4th"}
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# shift_chars =======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'168'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method shift_chars(word, num) that takes in a lowercase string and a     #
# number. The method should return a string where every character of the word is   #
# shifted `num` times in the alphabet. Use either an alphabet array or an alphabet #
# string.                                                                          #
#                                                                                  #
# Examples:                                                                        #
#            shift_chars('able', 1)               => 'bcmf'                        #
#            shift_chars('apple', 2)              => 'crrng'                       #
#            shift_chars('bootcamp', 3)           => 'errwfdps'                    #
#            shift_chars('zebra', 5)              => 'ejgwf'                       #
#                                                                                  #
#                                                                                  #
# answers should be:                                                               #
#            => 'bcmf'                                                             #
#            => 'crrng'                                                            #
#            => 'errwfdps'                                                         #
#            => 'ejgwf'                                                            #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

alphabet = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r',
  's','t','u','v','w','x','y','z']
puts shift_chars('able', 1, alphabet)
puts shift_chars('apple', 2, alphabet)
puts shift_chars('bootcamp', 3, alphabet)
puts shift_chars('zebra', 5, alphabet)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def shift_chars(string,shift,alphabet)
  string.each_char.with_index do |character,index|
      string[index]=alphabet[(alphabet.index(character)+shift)%alphabet.length]
  end
  return string
end
alphabet = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r',
  's','t','u','v','w','x','y','z']
puts shift_chars('able', 1, alphabet)
puts shift_chars('apple', 2, alphabet)
puts shift_chars('bootcamp', 3, alphabet)
puts shift_chars('zebra', 5, alphabet)
  STRING
  answer_string=<<-STRING
'bcmf'
'crrng'
'errwfdps'
'ejgwf'
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# shopping_cart_cost ================================================================================================#
#====================================================================================================================#

rolling_count+=1
'169'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method 'shopping_cart_cost(cart, prices)' that takes in two objects:     #
#                    - an object representing items and their quantities in a      #
#                      shopping cart                                               #
#                    - an object representing items and their prices               #
#                                                                                  #
# The function should return the total cost of items in the shopping cart.         #
#                                                                                  #
# answers should be:                                                               #
#           => 18                                                                  #
#           => 11                                                                  #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

prices = {'bread'=>4, 'butter'=>6, 'milk'=>3, 'eggs'=>7, 'celery'=>1}
cart1 = {'bread'=>2, 'milk'=>1, 'eggs'=>1}
cart2 = {'milk'=>2, 'celery'=>5}
puts shopping_cart_cost(cart1, prices)
puts shopping_cart_cost(cart2, prices)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def shopping_cart_cost(cart,prices)
  cart_total=0
  cart.each_key do |item|
      cart_total+=(cart[item]*prices[item])
  end
  return cart_total
end
prices = {'bread'=>4, 'butter'=>6, 'milk'=>3, 'eggs'=>7, 'celery'=>1}
cart1 = {'bread'=>2, 'milk'=>1, 'eggs'=>1}
cart2 = {'milk'=>2, 'celery'=>5}
puts shopping_cart_cost(cart1, prices)
puts shopping_cart_cost(cart2, prices)
  STRING
  answer_string=<<-STRING
18
11
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# sign_flip_count ===================================================================================================#
#====================================================================================================================#

rolling_count+=1
'170'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method 'sign_flip_count' that takes in an array of numbers as arguments. #
# The function should return the number of times adjacent numbers in the array     #
# switch signs from positive to negative or vice versa. The number 0 is neither    #
# positive nor negative. For more of a challenge, do not use the min or max methods#
#                                                                                  #
# Examples:                                                                        #
#           sign_flip_count([5, 6, 10, 3])                  => 0                   #
#           sign_flip_count([-12, 0, -3, -5])               => 0                   #
#           sign_flip_count([-12, 10, -3, -5])              => 2                   #
#           sign_flip_count([1, -2, -3, -4])                => 1                   #
#           sign_flip_count([-1, 11.3, -3, 100])            => 3                   #
#                                                                                  #
# answers should be:                                                               #
#            => 0                                                                  #
#            => 0                                                                  #
#            => 2                                                                  #
#            => 1                                                                  #
#            => 3                                                                  #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts sign_flip_count([5, 6, 10, 3])
puts sign_flip_count([-12, 0, -3, -5])
puts sign_flip_count([-12, 10, -3, -5])
puts sign_flip_count([1, -2, -3, -4])
puts sign_flip_count([-1, 11.3, -3, 100])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: HARD (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def sign_flip_count(arr)
  sign_switch_count=0
  arr.each_with_index do |number,index|
      if index>0
          if number>0 && arr[index-1]<0 || number<0 && arr[index-1]>0
              sign_switch_count+=1
          end
      end
  end
  return sign_switch_count
end
puts sign_flip_count([5, 6, 10, 3])
puts sign_flip_count([-12, 0, -3, -5])
puts sign_flip_count([-12, 10, -3, -5])
puts sign_flip_count([1, -2, -3, -4])
puts sign_flip_count([-1, 11.3, -3, 100])
  STRING
  answer_string=<<-STRING
0
0
2
1
3
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# silly_cipher ======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'171'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function silly_cipher(sentence, cipher) that takes in an string          #
# (sentence) and an object (cipher). Return a string where every character is      #
# replaced with its corresponding value in the cipher. If the character doesn't    #
# exist in the cipher, use a dot (.)                                               #
#                                                                                  #
# Examples:                                                                        #
#            silly_cipher("apple" , { 'a'=>"c", 'p'=>"x", 'l'=>"r", 'e'=>"o"})     #
#            silly_cipher("apple", { 'a'=>"c", 'p'=>"x"})                          #
#            silly_cipher("bootcamp prep?", { 'o'=>"e", 'p'=>"q" , "?"=>"!"})      #
#            silly_cipher("twmce", { 'm'=>"n", 't'=>"d", 'w'=>"a"})                #
#                                                                                  #
# answers should be:                                                               #
#            => 'cxxro'                                                            #
#            => 'cxx..'                                                            #
#            => '.ee....q.q..q!'                                                   #
#            => 'dan..''                                                           #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts silly_cipher("apple" , { 'a'=>"c", 'p'=>"x", 'l'=>"r", 'e'=>"o"})
puts silly_cipher("apple", { 'a'=>"c", 'p'=>"x"})
puts silly_cipher("bootcamp prep?", { 'o'=>"e", 'p'=>"q" , "?"=>"!"})
puts silly_cipher("twmce", { 'm'=>"n", 't'=>"d", 'w'=>"a"})

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def silly_cipher(string,cipher)
  string.each_char.with_index do |character,index|
      if cipher.has_key?(character)
          string[index]=cipher[character]
      else
          string[index]='.'
      end
  end
  return string
end
puts silly_cipher("apple" , { 'a'=>"c", 'p'=>"x", 'l'=>"r", 'e'=>"o"})
puts silly_cipher("apple", { 'a'=>"c", 'p'=>"x"})
puts silly_cipher("bootcamp prep?", { 'o'=>"e", 'p'=>"q" , "?"=>"!"})
puts silly_cipher("twmce", { 'm'=>"n", 't'=>"d", 'w'=>"a"})
  STRING
  answer_string=<<-STRING
'cxxro'
'cxx..'
'.ee....q.q..q!'
'dan..''
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# smallest_Prime ====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'172'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function `smallest_prime(array)` that takes in an array of numbers and   #
# returns the smallest prime number in the array.                                  #
#                                                                                  #
# HINTS:                                                                           #
#          - start by creating an `is_prime` helper function                       #
#          - the smallest prime number is 2                                        #
#                                                                                  #
# Examples:                                                                        #
#           arr1 = [ 6, 7, 12, 11, 5, 4 ]                                          #
#           smallest_prime(arr1)                            => 5                   #
#           arr2 = [11, -7, 7, 8, 6, 10]                                           #
#           smallest_prime(arr2)                            => 7                   #
#           arr3 = []                                                              #
#           smallest_prime(arr3)                            => nil                 #
#           arr4 = [4, 6, 8, 10]                                                   #
#           smallest_prime(arr4)                            => nil                 #
#                                                                                  #
# answers should be:                                                               #
#            => 5                                                                  #
#            => 7                                                                  #
#            => nil                                                                #
#            => nil                                                                #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

arr1 = [ 6, 7, 12, 11, 5, 4 ]
puts smallest_prime(arr1)
arr2 = [11, -7, 7, 8, 6, 10]
puts smallest_prime(arr2)
arr3 = []
puts smallest_prime(arr3)
arr4 = [4, 6, 8, 10]
puts smallest_prime(arr4)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def is_prime?(num)
return false if num<2
(2...num).each do |number|
  return false if num%number==0
end
return true
end
def smallest_prime(array)
smallest=0
array.each do |number|
  if is_prime?(number) && smallest==0
    smallest=number
  elsif is_prime?(number) && number<smallest
    smallest=number
  end
end
if smallest==0
  return nil
else
  return smallest
end
end
arr1 = [ 6, 7, 12, 11, 5, 4 ]
puts smallest_prime(arr1).inspect
arr2 = [11, -7, 7, 8, 6, 10]
puts smallest_prime(arr2).inspect
arr3 = []
puts smallest_prime(arr3).inspect
arr4 = [4, 6, 8, 10]
puts smallest_prime(arr4).inspect
  STRING
  answer_string=<<-STRING
5
7
nil
nil
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# snake_to_camel ====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'173'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method snake_to_camel(str) that takes in a snake_cased string and        #
# returns the string CamelCased. snake_case is a string where each word is         #
# separated with underscores (_). CamelCase is a string where the first char of    #
# each word is capitalized, all other characters lowercase.                        #
#                                                                                  #
# Examples:                                                                        #
#            snake_to_camel('snakes_go_hiss')                                      #
#            snake_to_camel('say_hello_world')                                     #
#            snake_to_camel('bootcamp_prep_is_cool')                               #
#            snake_to_camel('BOOtcamp_PREP_iS_cOol')                               #
#                                                                                  #
# answers should be:                                                               #
#            => 'SnakesGoHiss'                                                     #
#            => 'SayHelloWorld'                                                    #
#            => 'BootcampPrepIsCool'                                               #
#            => 'BootcampPrepIsCool'                                               #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts snake_to_camel('snakes_go_hiss')
puts snake_to_camel('say_hello_world')
puts snake_to_camel('bootcamp_prep_is_cool')
puts snake_to_camel('BOOtcamp_PREP_iS_cOol')

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def snake_to_camel(string)
  array_of_strings=string.split('_')
  array_of_strings.each_with_index do |word,index|
      array_of_strings[index]=word.capitalize
  end
  return array_of_strings.join('')
end
puts snake_to_camel('snakes_go_hiss')
puts snake_to_camel('say_hello_world')
puts snake_to_camel('bootcamp_prep_is_cool')
puts snake_to_camel('BOOtcamp_PREP_iS_cOol')
  STRING
  answer_string=<<-STRING
'SnakesGoHiss'
'SayHelloWorld'
'BootcampPrepIsCool'
'BootcampPrepIsCool'
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# sneaky_sentence ===================================================================================================#
#====================================================================================================================#

rolling_count+=1
'174'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method sneaky_sentence that accepts a sentence and a hash as             #
# arguments. The method should return a new sentence where every word is           #
# replaced with its corresponding value in the hash. If a word does not exist      #
# as a key of the hash, then it should remain unchanged.                           #
#                                                                                  #
# answers should be                                                                #
#           => "nothing you shall drink I shall drink"                             #
#           => "make a happy ad"                                                   #
#           => "keep running okay"                                                 #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts sneaky_sentence('anything you can do I can do', {'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'})
puts sneaky_sentence('what a sad ad', {'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'})
puts sneaky_sentence('keep coding okay', {'coding'=>'running', 'kay'=>'pen'})

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def sneaky_sentence(string,hash)
  array_of_strings=string.split
  array_of_strings.each_with_index do |word,index|
      if hash.has_key?(word)
          array_of_strings[index]=hash[word]
      end
  end
  return array_of_strings.join(' ')
end
puts sneaky_sentence('anything you can do I can do', {'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'})
puts sneaky_sentence('what a sad ad', {'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'})
puts sneaky_sentence('keep coding okay', {'coding'=>'running', 'kay'=>'pen'})
  STRING
  answer_string=<<-STRING
"nothing you shall drink I shall drink"
"make a happy ad"
"keep running okay"
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# split_half_array  =================================================================================================#
#====================================================================================================================#

rolling_count+=1
'175'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method 'split_half_array(array)' that takes in an array as an argument   #
# and returns two halves of that array split in the middle. If the array has an    #
# odd number of elements, then the middle element should be excluded.              #
#                                                                                  #
# example:                                                                         #
#      split_half_array([1, 2, 3, 4, 5])                                           #
#      split_half_array(['a', 'b', 'c', 'd', 'e', 'f'])                            #
#                                                                                  #
# answers should be:                                                               #
#             => [ [ 1, 2 ], [ 4, 5 ] ]                                            #
#             => [ [ 'a', 'b', 'c' ], [ 'd', 'e', 'f' ] ]                          #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts split_half_array([1, 2, 3, 4, 5])
puts split_half_array(['a', 'b', 'c', 'd', 'e', 'f'])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: HARD  (FUNCTIONAL PROGRAMMING)                                       #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def split_half_array(array)
new_array=[]
array.slice!(array.length/2) if array.length%2!=0
array.each_slice(array.length/2){|arr| new_array<<arr}
return new_array
end
puts split_half_array([1, 2, 3, 4, 5]).inspect
puts split_half_array(['a', 'b', 'c', 'd', 'e', 'f']).inspect
  STRING
  answer_string=<<-STRING
[[1, 2], [4, 5]]
[['a', 'b', 'c'], ['d', 'e', 'f']]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# stock_picker ======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'176'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Implement a method, stock_picker that takes in an array of stock prices, one for #
# each hypothetical day. It should return a pair of days representing the best day #
# to buy and the best day to sell. Days start at 0.                                #
#                                                                                  #
# example:                                                                         #
#         stock_picker([17,3,6,9,15,8,6,1,10])                                     #
#         => [1,4]  # for a profit of $15 - $3 == $12                              #
#                                                                                  #
# Quick Tips:                                                                      #
#         You need to buy before you can sell Pay attention to edge cases like     #
#         when the lowest day is the last day or the highest day is the first      #
#         day.                                                                     #
#                                                                                  #
# answers should be:                                                               #
#            => [1,4]                                                              #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts stock_picker([17,3,6,9,15,8,6,1,10])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def stock_picker(array)
  highest_profit=0
  best_day_to_buy=0
  best_day_to_sell=0
  array.each_with_index do |num1,index1|
      array.each_with_index do |num2,index2|
          if index2>index1
              if (num2-num1)>highest_profit
                  highest_profit=(num2-num1)
                  best_day_to_buy=index1
                  best_day_to_sell=index2
              end
          end
      end
  end
  return [best_day_to_buy,best_day_to_sell]
end
puts stock_picker([17,3,6,9,15,8,6,1,10]).inspect
  STRING
  answer_string=<<-STRING
[1,4]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# string_Range ======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'177'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function string_range(min, max, step) that takes in 3 numbers as         #
# parameters The function should return a string containing all numbers between    #
# `min` and `max` at `step` intervals concatenated together.                       #
#                                                                                  #
# Examples:                                                                        #
#            string_range(0, 12, 2)         => '024681012'                         #
#            string_range(3, 20, 5)         => '381318'                            #
#                                                                                  #
# answers should be:                                                               #
#            => '024681012'                                                        #
#            => '381318'                                                           #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts string_range(0, 12, 2)
puts string_range(3, 20, 5)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def string_range(min,max,step)
  new_string=''
  counter=min
  while counter<=max
      new_string+=counter.to_s
      counter+=step
  end
  return new_string
end
puts string_range(0, 12, 2)
puts string_range(3, 20, 5)
  STRING
  answer_string=<<-STRING
'024681012'
'381318'
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# sum_2d_array ======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'178'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method sum_2d_array(array) that takes in a 2-Dimensional array of        #
# numbers. The method should return the total sum of all numbers in the 2D array.  #
#                                                                                  #
# Examples:                                                                        #
#            arr1 = [                                                              #
#                      [1,2,3],                                                    #
#                      [4,5],                                                      #
#                      [6],                                                        #
#                   ]                                                              #
#            sum_2d_array(arr1)                      => 21                         #
#                                                                                  #
#            arr2 = [                                                              #
#                      [-10, 2, 3],                                                #
#                      [1],                                                        #
#                      [10, -5],                                                   #
#                      [2]                                                         #
#                   ]                                                              #
#            sum_2d_array(arr2)                      => 3                          #
#                                                                                  #
# answers should be:                                                               #
#            => 21                                                                 #
#            => 3                                                                  #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

arr1 = [
      [1,2,3],
      [4,5],
      [6],
     ]
puts sum_2d_array(arr1)

arr2 = [
      [-10, 2, 3],
      [1],
      [10, -5],
      [2]
     ]
puts sum_2d_array(arr2)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def sum_2d_array(array)
  sum=0
  array.each do |subarray|
      subarray.each do |element|
          sum+=element
      end
  end
  return sum
end
arr1 = [
  [1,2,3],
  [4,5],
  [6],
 ]
puts sum_2d_array(arr1)

arr2 = [
  [-10, 2, 3],
  [1],
  [10, -5],
  [2]
 ]
puts sum_2d_array(arr2)
  STRING
  answer_string=<<-STRING
21
3
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# sum_elements ======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'179'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method sum_elements(arr1, arr2) that takes in two arrays. The method     #
# should return a new array containing the results of adding together corresponding#
# elements of the original arrays. You can assume the arrays have the same length. #
#                                                                                  #
# EXAMPLES:                                                                        #
#          puts sum_elements([7, 4, 4], [3, 2, 11])                                #
#          puts sum_elements(["cat", "pizza", "boot"], ["dog", "pie", "camp"])     #
#                                                                                  #
# answers should be:                                                               #
#            => [10, 6, 15]                                                        #
#            => ["catdog", "pizzapie", "bootcamp"]                                 #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts sum_elements([7, 4, 4], [3, 2, 11])
puts sum_elements(["cat", "pizza", "boot"], ["dog", "pie", "camp"])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def sum_elements(arr1,arr2)
  new_array=[]
  arr1.each_with_index{|item,index| new_array.push(item+arr2[index])}
  return new_array
end
puts sum_elements([7, 4, 4], [3, 2, 11]).inspect
puts sum_elements(["cat", "pizza", "boot"], ["dog", "pie", "camp"]).inspect
  STRING
  answer_string=<<-STRING
[10, 6, 15]
["catdog", "pizzapie", "bootcamp"]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# sum_of_n_primes ===================================================================================================#
#====================================================================================================================#

rolling_count+=1
'180'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method 'sum_of_n_primes(n)' that returns the sum of the first `n` prime  #
# numbers.                                                                         #
#                                                                                  #
# Examples:                                                                        #
#           sum_of_n_primes(0)       => 0                                          #
#           sum_of_n_primes(1)       => 2                                          #
#           sum_of_n_primes(4)       => 17                                         #
#                                                                                  #
# answers should be:                                                               #
#            => 0                                                                  #
#            => 2                                                                  #
#            => 17                                                                 #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts sum_of_n_primes(0)
puts sum_of_n_primes(1)
puts sum_of_n_primes(4)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def is_prime(num)
  (2...num).each do |number|
      return false if num%number==0
  end
  return true
end
def get_first_n_primes(num)
  new_array=[]
  counter=2
  while new_array.length<num
      if is_prime(counter)
          new_array<<counter
      end
      counter+=1
  end
  return new_array
end
def sum_of_n_primes(num)
  prime_sum=0
  first_n_primes=get_first_n_primes(num)
  first_n_primes.each do |number|
      prime_sum+=number
  end
  return prime_sum
end
puts sum_of_n_primes(0)
puts sum_of_n_primes(1)
puts sum_of_n_primes(4)
  STRING
  answer_string=<<-STRING
0
2
17
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# summation_sequence  ===============================================================================================#
#====================================================================================================================#

rolling_count+=1
'181'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# A number's summation is the sum of all positive numbers less than or equal to    #
# the number. For example: the summation of 3 is 6 because 1 + 2 + 3 = 6, the      #
# summation of 6 is 21 because 1 + 2 + 3 + 4 + 5 + 6 = 21. Write a method          #
# summation_sequence that takes in two numbers: start and length. The method       #
# should return an array containing length total elements. The first number of the #
# sequence should be the start number. At any point, to generate the next element  #
# of the sequence we take the summation of the previous element. You can assume    #
# that length is not zero.                                                         #
#                                                                                  #
# EXAMPLE:                                                                         #
#           puts summation_sequence(3, 4)               # => [3, 6, 21, 231]       #
#           puts summation_sequence(5, 3)               # => [5, 15, 120]          #
#                                                                                  #
# answers should be:                                                               #
#            => [3, 6, 21, 231]                                                    #
#            => [5, 15, 120]                                                       #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts summation_sequence(3, 4)
puts summation_sequence(5, 3)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def summation(num)
  sum=0
  (1..num).each do |number|
      sum+=number
  end
  return sum
end
def summation_sequence(start,length)
  new_array=[]
  while new_array.length<length
      if new_array.empty?
          new_array<<start
      else
          new_array<<summation(new_array[-1])
      end
  end
  return new_array
end
puts summation_sequence(3, 4).inspect
puts summation_sequence(5, 3).inspect
  STRING
  answer_string=<<-STRING
[3, 6, 21, 231]
[5, 15, 120]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# tally_count =======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'182'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function tally_count(array) that takes in an array of strings. The       #
# function should return an object containing a tally count of the strings in the  #
# array.                                                                           #
#                                                                                  #
# Examples:                                                                        #
#            arr1 = ['cat', 'dog', 'cat', 'cat', 'fish', 'dog', 'squirrel']        #
#            tally_count(arr1)                                                     #
#            arr2 = ['x', 'x', 'y', 'z', 'y', 'x']                                 #
#            tally_count(arr2)                                                     #
#                                                                                  #
# answers should be:                                                               #
#            => { cat: 'III', dog: 'II', fish: 'I', squirrel: 'I' }                #
#            => { x: 'III', y: 'II', z: 'I' }                                      #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

arr1 = ['cat', 'dog', 'cat', 'cat', 'fish', 'dog', 'squirrel']
puts tally_count(arr1)
arr2 = ['x', 'x', 'y', 'z', 'y', 'x']
puts tally_count(arr2)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def tally_count(array)
  new_hash=Hash.new{''}
  array.each do |element|
      new_hash[element]+='I'
  end
  return new_hash
end
arr1 = ['cat', 'dog', 'cat', 'cat', 'fish', 'dog', 'squirrel']
puts tally_count(arr1)
arr2 = ['x', 'x', 'y', 'z', 'y', 'x']
puts tally_count(arr2)
  STRING
  answer_string=<<-STRING
{cat:'III', dog:'II', fish:'I', squirrel:'I'}
{x:'III', y:'II', z:'I'}
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# three_in_a_row ====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'183'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method `three_in_a_row(arr)` that takes in an array of numbers and       #
# returns true if the array contains 3 of the same numbers consecutively. The      #
# function should return false otherwise.                                          #
#                                                                                  #
# Examples:                                                                        #
#           three_in_a_row([4, 3, 7, 7, 7, 13, 8])                => true          #
#           three_in_a_row([10, 9, 20, 33, 3, 3])                 => false         #
#                                                                                  #
# answers should be:                                                               #
#            => true                                                               #
#            => false                                                              #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts three_in_a_row([4, 3, 7, 7, 7, 13, 8])
puts three_in_a_row([10, 9, 20, 33, 3, 3])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def three_in_a_row(array)
  array.each_with_index do |num,index|
      if index>1
          return true if num==array[index-1] && num==array[index-2]
      end
  end
  return false
end
puts three_in_a_row([4, 3, 7, 7, 7, 13, 8])
puts three_in_a_row([10, 9, 20, 33, 3, 3])
  STRING
  answer_string=<<-STRING
true
false
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# three_increasing ==================================================================================================#
#====================================================================================================================#

rolling_count+=1
'184'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method `three_increasing(arr)` that takes in an array of numbers and     #
# returns true if the array contains 3 consecutive numbers in increasing order.    #
# The function should return false otherwise.                                      #
#                                                                                  #
# Note that the 3 consecutive numbers should be increasing by 1, so the the second #
# number is 1 greater than the first, and the third number is 1 greater  than the  #
# second.                                                                          #
#                                                                                  #
# Example:                                                                         #
#           puts three_increasing([9,8,7,6,5,4,3,2,1])     => false                #
#           puts three_increasing([1,2,4,6,8,9,7,3,5])     => false                #
#           puts three_increasing([9,8,7,1,2,3,5,4,6])     => true                 #
#                                                                                  #
# answers should be:                                                               #
#            => false                                                              #
#            => false                                                              #
#            => true                                                               #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts three_increasing([9,8,7,6,5,4,3,2,1])
puts three_increasing([1,2,4,6,8,9,7,3,5])
puts three_increasing([9,8,7,1,2,3,5,4,6])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def three_increasing(array)
  array.each_with_index do |num,index|
      if index>1
          return true if array[index-2]+1==array[index-1] && array[index-1]+1==num
      end
  end
  return false
end
puts three_increasing([9,8,7,6,5,4,3,2,1])
puts three_increasing([1,2,4,6,8,9,7,3,5])
puts three_increasing([9,8,7,1,2,3,5,4,6])
  STRING
  answer_string=<<-STRING
false
false
true
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# three_unique_vowels ===============================================================================================#
#====================================================================================================================#

rolling_count+=1
'185'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function three_unique_vowels(string) that takes in a string and returns  #
# true if the string contains at least three different vowels. Vowels are a, e, i, #
# o, u                                                                             #
#                                                                                  #
# Examples:                                                                        #
#            three_unique_vowels('delicious')             => true                  #
#            three_unique_vowels('bootcamp prep')         => true                  #
#            three_unique_vowels('bootcamp')              => false                 #
#            three_unique_vowels('dog')                   => false                 #
#            three_unique_vowels('go home')               => false                 #
#                                                                                  #
# answers should be:                                                               #
#            => true                                                               #
#            => true                                                               #
#            => false                                                              #
#            => false                                                              #
#            => false                                                              #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts three_unique_vowels('delicious')
puts three_unique_vowels('bootcamp prep')
puts three_unique_vowels('bootcamp')
puts three_unique_vowels('dog')
puts three_unique_vowels('go home')

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: HARD (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def three_unique_vowels(string)
  vowels='aeiou'
  string.each_char do |character|
      return true if vowels.length==2
      if vowels.include?(character)
          vowels=vowels.split(character).join('')
      end
  end
  return false
end
puts three_unique_vowels('delicious')
puts three_unique_vowels('bootcamp prep')
puts three_unique_vowels('bootcamp')
puts three_unique_vowels('dog')
puts three_unique_vowels('go home')
  STRING
  answer_string=<<-STRING
true
true
false
false
false
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# titleize ==========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'186'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method 'titleize(title, stop_words)' that takes in a string 'title' and  #
# an array of strings 'stop_words'. Return the 'title' where every word that does  #
# not exist in the 'stop_words' array is capitalized; all others lowercase.        #
#                                                                                  #
# Hints: Decompose this problem into helper functions. Perhaps create these:       #
#     - remove_punctuation(word)                                                   #
#     - is_stop_word(word, stop_words)                                             #
#     - Test after you write every function of this decomposition!                 #
#     - First write a function remove_punctuation(word) that takes in a single     #
#           word and returns that same word without any punctuation at the end.    #
#     - Second, write a function is_stop_word(word, stop_words) that takes in a    #
#       single word and returns true if it is a stop word. The check will vary     #
#       depending on if the word contains punctuation or not, so use your          #
#       remove_punctuation function before checking.                               #
#                                                                                  #
#                                                                                  #
# Examples:                                                                        #
#      titleize("forest gump, the runner", ["the"])   => "Forest Gump, the Runner" #
#      titleize("MASTER AND COMMANDER", ["and"])      => "Master and Commander"    #
#      titleize("i LOVE; lover of mine", ["love", "of"]) => "I love; Lover of Mine"#
#      titleize("shall we dance?", ["dance"])            => "Shall We dance?"      #
#                                                                                  #
# answers should be:                                                               #
#            => "Forest Gump, the Runner"                                          #
#            => "Master and Commander"                                             #
#            => "I love; Lover of Mine"                                            #
#            => "Shall We dance?"                                                  #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

punctuation=';!.?,-'
puts titleize("forest gump, the runner", ["the"])
puts titleize("MASTER AND COMMANDER", ["and"])
puts titleize("i LOVE; lover of mine", ["love", "of"])
puts titleize("shall we dance?", ["dance"])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: HARD (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def remove_punctuation(word)
  return word[0..-2]
end
def is_stop_word?(word,stop_words)
  punctuation=';!.?,-'
  return punctuation.include?(word[-1]) ? stop_words.include?(remove_punctuation(word.downcase)) : stop_words.include?(word.downcase)
end
def titleize(string,stop_words)
  array_of_words=string.split
  array_of_words.each_with_index do |word,index|
      array_of_words[index]= is_stop_word?(word,stop_words) ? word.downcase : word.capitalize
  end
  return array_of_words.join(' ')
end
puts titleize("forest gump, the runner", ["the"])
puts titleize("MASTER AND COMMANDER", ["and"])
puts titleize("i LOVE; lover of mine", ["love", "of"])
puts titleize("shall we dance?", ["dance"])
  STRING
  answer_string=<<-STRING
"Forest Gump, the Runner"
"Master and Commander"
"I love; Lover of Mine"
"Shall We dance?"
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# to_feet ===========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'187'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function `to_feet(distances)` that takes in an array of distance strings.#
# The given distances will either be in `feet` or `yards`. The function should     #
# return a new array where all the distances are converted to feet. There are 3    #
# feet in 1 yard.                                                                  #
#                                                                                  #
# Examples:                                                                        #
#           arr1 = ['10 feet', '3 yards', '5 yards', '3 feet']                     #
#           to_feet(arr1)                                                          #
#           arr2 = ['2 yards', '3 feet', '10 yards']                               #
#           to_feet(arr2)                                                          #
#                                                                                  #
#                                                                                  #
# answers should be:                                                               #
#            => [ '10 feet', '9 feet', '15 feet', '3 feet' ]                       #
#            => [ '6 feet', '3 feet', '30 feet' ]                                  #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

arr1 = ['10 feet', '3 yards', '5 yards', '3 feet']
puts to_feet(arr1)
arr2 = ['2 yards', '3 feet', '10 yards']
puts to_feet(arr2)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def to_feet(array)
  new_array=[]
  array.each do |items|
      if !items.include?('feet')
          item=items.split
          new_array<<(item[0].to_i*3).to_s+' feet'
      else
          new_array<<items
      end
  end
  return new_array
end
arr1 = ['10 feet', '3 yards', '5 yards', '3 feet']
puts to_feet(arr1).inspect
arr2 = ['2 yards', '3 feet', '10 yards']
puts to_feet(arr2).inspect
  STRING
  answer_string=<<-STRING
['10 feet', '9 feet', '15 feet', '3 feet']
['6 feet', '3 feet', '30 feet']
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# to_initials =======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'188'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method to_initials that takes in a person's name string and returns a    #
# string representing their initials.                                              #
#                                                                                  #
# example:                                                                         #
#             to_initials("Kelvin Bridges")      => "KB"                           #
#             to_initials("Michaela Yamamoto")   => "MY"                           #
#             to_initials("Mary La Grange")      => "MLG"                          #
#                                                                                  #
# answers should be:                                                               #
#            => "KB"                                                               #
#            => "MY"                                                               #
#            => "MLG"                                                              #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts to_initials("Kelvin Bridges")
puts to_initials("Michaela Yamamoto")
puts to_initials("Mary La Grange")

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def to_initials(string)
  new_string=''
  array_of_names=string.split
  array_of_names.each do |name|
      new_string+=name[0]
  end
  return new_string
end
puts to_initials("Kelvin Bridges")
puts to_initials("Michaela Yamamoto")
puts to_initials("Mary La Grange")
  STRING
  answer_string=<<-STRING
"KB"
"MY"
"MLG"
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# trifling_triplet ==================================================================================================#
#====================================================================================================================#

rolling_count+=1
'189'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method trifling_triplet that accepts a string as an argument and         #
# returns a boolean indicating whether or not the string contains three of the     #
# same character consecutively.                                                    #
#                                                                                  #
# answers should be:                                                               #
#           => true                                                                #
#           => true                                                                #
#           => true                                                                #
#           => false                                                               #
#           => false                                                               #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts trifling_triplet('caaabb')
puts trifling_triplet('terrrrrible')
puts trifling_triplet('runninggg')
puts trifling_triplet('bootcamp')
puts trifling_triplet('e')

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def trifling_triplet(string)
  string.each_char.with_index do |character,index|
      if index>1
          return true if character==string[index-1] && character==string[index-2] && character!=string[index+1]
      end
  end
  return false
end
puts trifling_triplet('caaabb')
puts trifling_triplet('terrrrrible')
puts trifling_triplet('runninggg')
puts trifling_triplet('bootcamp')
puts trifling_triplet('e')
  STRING
  answer_string=<<-STRING
true
true
true
false
false
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# triple_sequence ===================================================================================================#
#====================================================================================================================#

rolling_count+=1
'190'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method triple_sequence that takes in two numbers, start and length. The  #
# method should return an array representing a sequence that begins with start and #
# is length elements long. In the sequence, every element should be 3 times the    #
# previous element. Assume that the length is at least 1.                          #
#                                                                                  #
# EXAMPLES:                                                                        #
#            puts triple_sequence(2, 4)               => [2, 6, 18, 54]            #
#            puts triple_sequence(4, 5)               => [4, 12, 36, 108, 324]     #
#                                                                                  #
# answers should be:                                                               #
#            => [2, 6, 18, 54]                                                     #
#            => [4, 12, 36, 108, 324]                                              #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts triple_sequence(2, 4)
puts triple_sequence(4, 5)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def triple_sequence(start,length)
  new_array=[]
  while new_array.length<length
      if new_array.empty?
          new_array<<start
      else
          new_array<<new_array[-1]*3
      end
  end
  return new_array
end
puts triple_sequence(2, 4).inspect
puts triple_sequence(4, 5).inspect
  STRING
  answer_string=<<-STRING
[2, 6, 18, 54]
[4, 12, 36, 108, 324]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# triplet_sum =======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'191'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function `triplet_sum(array, sum)` that takes in an array of numbers     #
# (array) and a number (sum). The function should return an array containing       #
# unique triplets of numbers from the array that equal `sum` when added together.  #
# You can assume that the input array contains no repeated numbers.                #
#                                                                                  #
# Example:                                                                         #
#           arr1 = [1, 3, 5, 2, 4]                                                 #
#           triplet_sum(arr1, 8)           => [ [ 1, 3, 4 ], [ 1, 5, 2 ] ]         #
#           triplet_sum(arr1, 10)          => [ [ 1, 5, 4 ], [ 3, 5, 2 ] ]         #
#           triplet_sum(arr1, 11)          => [ [ 5, 2, 4 ] ]                      #
#                                                                                  #
# answers should be:                                                               #
#            => [ [ 1, 3, 4 ], [ 1, 5, 2 ] ]                                       #
#            => [ [ 1, 5, 4 ], [ 3, 5, 2 ] ]                                       #
#            => [ [ 5, 2, 4 ] ]                                                    #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

arr1 = [1, 3, 5, 2, 4]
puts triplet_sum(arr1, 8)
puts triplet_sum(arr1, 10)
puts triplet_sum(arr1, 11)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: HARD (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def triplet_sum(array,sum)
  new_array=[]
  array.each_with_index do |num1,index1|
      array.each_with_index do |num2,index2|
          array.each_with_index do |num3,index3|
              if index2>index1 && index3>index2
                  new_array<<[num1,num2,num3] if num1+num2+num3==sum
              end
          end
      end
  end
  return new_array
end
arr1 = [1, 3, 5, 2, 4]
puts triplet_sum(arr1, 8).inspect
puts triplet_sum(arr1, 10).inspect
puts triplet_sum(arr1, 11).inspect
  STRING
  answer_string=<<-STRING
[[1, 3, 4], [1, 5, 2]]
[[1, 5, 4], [3, 5, 2]]
[[5, 2, 4]]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# troublesome_translate =============================================================================================#
#====================================================================================================================#

rolling_count+=1
'192'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method troublesome_translate that accepts a sentence as an argument.     #
# The method should translate the sentence according to the following rules:       #
#                  - words that are shorter than 3 characters are unchanged.       #
#                  - words that are 3 characters or longer are translated          #
#                    according to the following rules:                             #
#                        - if the word ends with a vowel, simply repeat the word   #
#                          twice (example: 'like'->'likelike')                     #
#                        - if the word ends with a non-vowel, repeat all letters   #
#                          that come after the word's last vowel, including the    #
#                          last vowel itself (example: 'trash'->'trashash')        #
#                        - if words are capitalized in the original sentence,      #
#                          they should remain capitalized in the translated        #
#                          sentence.                                               #
#                                                                                  #
# Examples:                                                                        #
#          troublesome_translate('We like to go running fast')                     #
#          troublesome_translate('He cannot find the trash')                       #
#          troublesome_translate('Pasta is my favorite dish')                      #
#          troublesome_translate('Her family flew to France')                      #
#                                                                                  #
# answers should be:                                                               #
#            => "We likelike to go runninging fastast"                             #
#            => "He cannotot findind thethe trashash"                              #
#            => "Pastapasta is my favoritefavorite dishish"                        #
#            => "Herer familyily flewew to Francefrance"                           #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts troublesome_translate('We like to go running fast')
puts troublesome_translate('He cannot find the trash')
puts troublesome_translate('Pasta is my favorite dish')
puts troublesome_translate('Her family flew to France')

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def get_last_index(word)
  last_index=0
  vowels='aeiou'
  word.each_char.with_index do |character,index|
      last_index=index if vowels.include?(character)
  end
  return last_index
end
def translate(word)
  vowels='aeiou'
  if word.length<3
      return word
  elsif vowels.include?(word[-1])
      return word+word.downcase
  else
      last_index=get_last_index(word)
      return word+word[last_index..-1].downcase
  end
end
def troublesome_translate(string)
  array_of_words=string.split
  array_of_words.each_with_index do |word,index|
      array_of_words[index]=translate(word)
  end
  return array_of_words.join(' ')
end
puts troublesome_translate('We like to go running fast')
puts troublesome_translate('He cannot find the trash')
puts troublesome_translate('Pasta is my favorite dish')
puts troublesome_translate('Her family flew to France')
  STRING
  answer_string=<<-STRING
"We likelike to go runninging fastast"
"He cannotot findind thethe trashash"
"Pastapasta is my favoritefavorite dishish"
"Herer familyily flewew to Francefrance
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# two_d_sum =========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'193'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method two_d_sum that takes in a two dimensional array and returns the   #
# sum of all elements in the array.                                                #
#                                                                                  #
# EXAMPLES:                                                                        #
#           array_1 = [                                                            #
#                       [4, 5],                                                    #
#                       [1, 3, 7, 1]                                               #
#                     ]                                                            #
#           puts two_d_sum(array_1)    # => 21                                     #
#           array_2 = [                                                            #
#                       [3, 3],                                                    #
#                       [2],                                                       #
#                       [2, 5]                                                     #
#                     ]                                                            #
#           puts two_d_sum(array_2)    # => 15                                     #
#                                                                                  #
# answers should be:                                                               #
#            => 21                                                                 #
#            => 15                                                                 #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

array_1 = [
         [4, 5],
         [1, 3, 7, 1]
        ]
puts two_d_sum(array_1)
array_2 = [
         [3, 3],
         [2],
         [2, 5]
        ]
puts two_d_sum(array_2)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def two_d_sum(arr)
  sum=0
  arr.each do |sub_arr|
    sub_arr.each{|num| sum+=num}
  end
  return sum
end
array_1 = [
         [4, 5],
         [1, 3, 7, 1]
          ]
puts two_d_sum(array_1)
array_2 = [
         [3, 3],
         [2],
         [2, 5]
        ]
puts two_d_sum(array_2)
  STRING
  answer_string=<<-STRING
21
15
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# two_d_translate ===================================================================================================#
#====================================================================================================================#

rolling_count+=1
'194'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method two_d_translate that takes in a 2 dimensional array and translates#
# it into a 1 dimensional array. You can assume that the inner arrays always have  #
# 2 elements. See the examples.                                                    #
#                                                                                  #
# EXAMPLES:                                                                        #
#     arr_1 = [                                                                    #
#               ['boot', 3],                                                       #
#               ['camp', 2],                                                       #
#               ['program', 0]                                                     #
#             ]                                                                    #
#     puts two_d_translate(arr_1) # => [ 'boot', 'boot', 'boot', 'camp', 'camp' ]  #
#     arr_2 = [                                                                    #
#               ['red', 1],                                                        #
#               ['blue', 4]                                                        #
#             ]                                                                    #
#     puts two_d_translate(arr_2) # => [ 'red', 'blue', 'blue', 'blue', 'blue' ]   #
#                                                                                  #
# answers should be:                                                               #
#            => [ 'boot', 'boot', 'boot', 'camp', 'camp' ]                         #
#            => [ 'red', 'blue', 'blue', 'blue', 'blue' ]                          #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

arr_1 = [
       ['boot', 3],
       ['camp', 2],
       ['program', 0]
      ]
puts two_d_translate(arr_1)
arr_2 = [
       ['red', 1],
       ['blue', 4]
      ]
puts two_d_translate(arr_2)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def two_d_translate(arr)
  new_array=[]
  arr.each do |subarray|
     word=subarray[0]
     number=subarray[1]
     number.times{new_array<<word}
  end
  return new_array
end
arr_1 = [
          ['boot', 3],
          ['camp', 2],
          ['program', 0]
        ]
puts two_d_translate(arr_1).inspect
arr_2 = [
          ['red', 1],
          ['blue', 4]
        ]
puts two_d_translate(arr_2).inspect
  STRING
  answer_string=<<-STRING
['boot', 'boot', 'boot', 'camp', 'camp']
['red', 'blue', 'blue', 'blue', 'blue']
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# two_diff ==========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'195'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function `two_diff(array)`, given an array of numbers, return a 2-D      #
# array, where each of the sub array are indices of the two numbers such that      #
# their difference is 2. If there are no such numbers, return an empty array.      #
#                                                                                  #
# NOTE: The pairs are unique.                                                      #
#                                                                                  #
# HINT: Account for negative difference too!                                       #
#                                                                                  #
# Example:                                                                         #
#          two_diff([2, 3, 4, 6, 1, 7])      => [[0, 2], [1, 4], [2, 3]]           #
#          two_diff([0, 2, 4, 3, 5])         => [[0, 1], [1, 2], [3,4]]            #
#          two_diff([])                      => []                                 #
#                                                                                  #
# answers should be:                                                               #
#            => [[0, 2], [1, 4], [2, 3]]                                           #
#            => [[0, 1], [1, 2], [3,4]]                                            #
#            => []                                                                 #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts two_diff([2, 3, 4, 6, 1, 7])
puts two_diff([0, 2, 4, 3, 5])
puts two_diff([])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def smallest(num1,num2)
  return num1<num2 ? num1 : num2
end
def largest(num1,num2)
  return num1>num2 ? num1 : num2
end
def two_diff(array)
  new_array=[]
  array.each_with_index do |num1,index1|
      array.each_with_index do |num2,index2|
          if index2>index1
              new_array<<[index1,index2] if largest(num1,num2)-smallest(num1,num2)==2
          end
      end
  end
  return new_array
end
puts two_diff([2, 3, 4, 6, 1, 7]).inspect
puts two_diff([0, 2, 4, 3, 5]).inspect
puts two_diff([]).inspect
  STRING
  answer_string=<<-STRING
[[0, 2], [1, 4], [2, 3]]
[[0, 1], [1, 2], [3,4]]
[]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# two_dimensional_size ==============================================================================================#
#====================================================================================================================#

rolling_count+=1
'196'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method 'two_dimensional_size(array)' that takes in a 2D-array as an      #
# argument. The method should return the total number of elements in the 2D-array. #
#                                                                                  #
# Examples:                                                                        #
#           arr1 = [                                                               #
#                    [1, 2, 3],                                                    #
#                    [4, 5],                                                       #
#                    [6, 7, 8, 9]                                                  #
#                  ]                                                               #
#                                                                                  #
#           two_dimensional_size(arr1)                    => 9                     #
#                                                                                  #
#           arr2 = [                                                               #
#                    ['a'],                                                        #
#                    ['b', 'c', 'd', 'e']                                          #
#                  ]                                                               #
#                                                                                  #
#          two_dimensional_size(arr2)                     => 5                     #
#                                                                                  #
# answers should be:                                                               #
#            => 9                                                                  #
#            => 5                                                                  #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

arr1 = [
       [1, 2, 3],
       [4, 5],
       [6, 7, 8, 9]
     ]
puts two_dimensional_size(arr1)
arr2 = [
       ['a'],
       ['b', 'c', 'd', 'e']
     ]
puts two_dimensional_size(arr2)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def my_flatten(array)
  new_array=[]
  array.each do |subarray|
      subarray.each do |item|
          new_array<<item
      end
  end
  return new_array
end
def two_dimensional_size(array)
  return my_flatten(array).length
end
arr1 = [
  [1, 2, 3],
  [4, 5],
  [6, 7, 8, 9]
]
puts two_dimensional_size(arr1)
arr2 = [
  ['a'],
  ['b', 'c', 'd', 'e']
]
puts two_dimensional_size(arr2)
  STRING
  answer_string=<<-STRING
9
5
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# uncompress_string =================================================================================================#
#====================================================================================================================#

rolling_count+=1
'197'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method `uncompress_string(str)` that takes in a "compressed" string and  #
# returns the "uncompressed" version of the string. In the input `str`, every      #
# letter is followed by a single digit number that specifies how many times that   #
# character is repeated. HINT: Use the built-in `to_i` function to turn the string #
# representation of a number into an integer number ('42').to_i   => 42            #
#                                                                                  #
# Examples:                                                                        #
#            uncompress_string('a2b4c1')           => 'aabbbbc'                    #
#            uncompress_string('b1o2t1')           => 'boot'                       #
#            uncompress_string('x3y1x2z4')         => 'xxxyxxzzzz'                 #
#                                                                                  #
# answers should be:                                                               #
#            => "aabbbbc"                                                          #
#            => "boot"                                                             #
#            => "xxxyxxzzzz"                                                       #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts uncompress_string('a2b4c1')
puts uncompress_string('b1o2t1')
puts uncompress_string('x3y1x2z4')

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def uncompress_string(string)
  new_string=''
  letter=''
  number=0
  string.each_char.with_index do |character,index|
      if index.even?
          letter=character
      else
          number=character.to_i
          new_string+=letter*number
      end
  end
  return new_string
end
puts uncompress_string('a2b4c1').inspect
puts uncompress_string('b1o2t1').inspect
puts uncompress_string('x3y1x2z4').inspect
  STRING
  answer_string=<<-STRING
"aabbbbc"
"boot"
"xxxyxxzzzz"
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# unique_elements ===================================================================================================#
#====================================================================================================================#

rolling_count+=1
'198'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method unique_elements that takes in an array and returns a new array    #
# where all duplicate elements are removed. Solve this using a hash.               #
#                                                                                  #
# Hint: all keys of a hash are automatically unique                                #
#                                                                                  #
# example:                                                                         #
#    unique_elements(['a', 'b', 'a', 'a', 'b', 'c'])        => ["a", "b", "c"]     #
#                                                                                  #
# answers should be:                                                               #
#            => ["a", "b", "c"]                                                    #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts unique_elements(['a', 'b', 'a', 'a', 'b', 'c'])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def unique_elements(array)
  new_hash={}
  array.each{|element| new_hash[element]=0}
  return new_hash.keys
end
puts unique_elements(['a', 'b', 'a', 'a', 'b', 'c']).inspect
  STRING
  answer_string=<<-STRING
["a", "b", "c"]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# upcased ===========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'199'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function `upcased(words)` that takes in an array of words and returns    #
# a new array where every word is upcased.                                         #
#                                                                                  #
# Example:                                                                         #
#          upcased(['hello', 'boOtCaMp', 'PREP!'])                                 #
#                                                                                  #
# answers should be:                                                               #
#            => ['HELLO', 'BOOTCAMP', 'PREP!']                                     #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts upcased(['hello', 'boOtCaMp', 'PREP!'])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def upcased(array)
  array.each_with_index do |word,index|
      array[index]=word.upcase
  end
  return array
end
puts upcased(['hello', 'boOtCaMp', 'PREP!']).inspect
  STRING
  answer_string=<<-STRING
['HELLO', 'BOOTCAMP', 'PREP!']
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# user_names ========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'200'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function `user_names(names)` that takes in an array of names. The        #
# function should return an array containing the corresponding user names. See the #
# examples.                                                                        #
#                                                                                  #
# Examples:                                                                        #
#             names = [                                                            #
#                        'Oscar Alvarez',                                          #
#                        'Danny Catalano',                                         #
#                        'Kurstie Ozuna',                                          #
#                        'Matt Haws'                                               #
#                     ]                                                            #
#              user_names(names)                                                   #
#                                                                                  #
# answers should be:                                                               #
#            => [ 'oalvarez', 'dcatalano', 'kozuna', 'mhaws' ]                     #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

names = [
        'Oscar Alvarez',
        'Danny Catalano',
        'Kurstie Ozuna',
        'Matt Haws'
      ]
puts user_names(names)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def user_names(names)
  new_array=[]
  names.each do |name|
      array_of_names=name.split
      new_string=''
      array_of_names.each_with_index do |nam,index|
          if index%2==0
              new_string+=nam[0].downcase
          else
              new_string+=nam.downcase
          end
      end
      new_array<<new_string
  end
  return new_array
end
names = [
  'Oscar Alvarez',
  'Danny Catalano',
  'Kurstie Ozuna',
  'Matt Haws'
]
puts user_names(names).inspect
  STRING
  answer_string=<<-STRING
['oalvarez', 'dcatalano', 'kozuna', 'mhaws']
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# value_counter =====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'201'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method 'value_counter(hash, val)' that takes in a hash and a value,      #
# the method should return the number of times 'val' repeats as a value in 'hash'. #
#                                                                                  #
# Example:                                                                         #
#      obj1 = {1=>'Anne', 2=>'Alvin', 3=>'Anne', 4=>'Anne'}                        #
#      value_counter(obj1, 'Anne')                                                 #
#                                                                                  #
#      obj2 = {'Anne'=>50, 'Alvin'=>1, 'JJ'=>100, 'Roman'=>100}                    #
#      value_counter(obj2, 88)                                                     #
#                                                                                  #
#      pairs = {'Anne'=>'Roman', 'Alvin'=>'Roman', 'JJ'=>'Anne', 'Roman'=>'Anne'}  #
#      value_counter(pairs, 'Roman')                                               #
#                                                                                  #
# answers should be:                                                               #
#            => 3                                                                  #
#            => 0                                                                  #
#            => 2                                                                  #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

obj1 = {1=>'Anne', 2=>'Alvin', 3=>'Anne', 4=>'Anne'}
puts value_counter(obj1, 'Anne')

obj2 = {'Anne'=>50, 'Alvin'=>1, 'JJ'=>100, 'Roman'=>100}
puts value_counter(obj2, 88)

pairs = {'Anne'=>'Roman', 'Alvin'=>'Roman', 'JJ'=>'Anne', 'Roman'=>'Anne'}
puts value_counter(pairs, 'Roman')

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def value_counter(hash,val)
  counter=0
  hash.each_value do |value|
      counter+=1 if value==val
  end
  return counter
end
obj1 = {1=>'Anne', 2=>'Alvin', 3=>'Anne', 4=>'Anne'}
puts value_counter(obj1, 'Anne')

obj2 = {'Anne'=>50, 'Alvin'=>1, 'JJ'=>100, 'Roman'=>100}
puts value_counter(obj2, 88)

pairs = {'Anne'=>'Roman', 'Alvin'=>'Roman', 'JJ'=>'Anne', 'Roman'=>'Anne'}
puts value_counter(pairs, 'Roman')
  STRING
  answer_string=<<-STRING
3
0
2
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# value_pair ========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'202'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method `value_pair(hsh1, hsh2, key)` that takes in two hashes and a key  #
# (string). The method should return an array containing the corresponding values  #
# of the hashes for the given key.                                                 #
#                                                                                  #
# Examples:                                                                        #
#          object1 = {'name'=>'One', 'location'=>'NY', 'age'=> 3}                  #
#          object2 = {'name'=>'Two', 'location'=>'SF'}                             #
#          value_pair(object1, object2, 'location')                                #
#          value_pair(object1, object2, 'name')                                    #
#                                                                                  #
# answers should be:                                                               #
#            => [ 'NY', 'SF' ]                                                     #
#            => [ 'One', 'Two' ]                                                   #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

object1 = {'name'=>'One', 'location'=>'NY', 'age'=> 3}
object2 = {'name'=>'Two', 'location'=>'SF'}
puts value_pair(object1, object2, 'location')
puts value_pair(object1, object2, 'name')

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def value_pair(hash1,hash2,key)
  return [hash1[key],hash2[key]]
end
object1 = {'name'=>'One', 'location'=>'NY', 'age'=> 3}
object2 = {'name'=>'Two', 'location'=>'SF'}
puts value_pair(object1, object2, 'location').inspect
puts value_pair(object1, object2, 'name').inspect
  STRING
  answer_string=<<-STRING
['NY', 'SF']
['One', 'Two']
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end



#====================================================================================================================#
# vigenere_cipher ===================================================================================================#
#====================================================================================================================#

rolling_count+=1
'203'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Caesar's cipher takes a word and encrypts it by offsetting each letter in the    #
# word by a fixed number, the key. For a key of 3, for example: a -> d, p -> s, and#
# y -> b                                                                           #
#                                                                                  #
# Vigenere's Cipher is a Caesar cipher, but instead of a single key, a sequence    #
# of keys is used. For example, if we encrypt "bananasinpajamas" with the key      #
# sequence [1, 2, 3], the result would be "ccqbpdtkqqcmbodt":                      #
#                                                                                  #
# Word:   b a n a n a s i n p a j a m a s                                          #
# Keys:   1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1                                          #
# Cipher: c c q b p d t k q q c m b o d t                                          #
#                                                                                  #
# Write a method vigenere_cipher(string, key_sequence, alphabet) that takes a      #
# string and a key-sequence, returning the encrypted word.                         #
#                                                                                  #
# answers should be:                                                               #
#           => upfssjtivnbo                                                        #
#           => uqftsktjvobp                                                        #
#           => uqhstltjxncq                                                        #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

alphabet='abcdefghijklmnopqrstuvwxyz'
puts vigenere_cipher("toerrishuman", [1], alphabet)
puts vigenere_cipher("toerrishuman", [1, 2], alphabet)
puts vigenere_cipher("toerrishuman", [1, 2, 3], alphabet)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def vigenere_cipher(string, key_sequence, alphabet)
  new_string=''
  string.each_char.with_index do |character,index|
      new_string+=alphabet[(alphabet.index(character)+(key_sequence[index%key_sequence.length]))%alphabet.length]
  end
  return new_string
end
alphabet='abcdefghijklmnopqrstuvwxyz'
puts vigenere_cipher("toerrishuman", [1], alphabet)
puts vigenere_cipher("toerrishuman", [1, 2], alphabet)
puts vigenere_cipher("toerrishuman", [1, 2, 3], alphabet)
  STRING
  answer_string=<<-STRING
upfssjtivnbo
uqftsktjvobp
uqhstltjxncq
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# vowel_cipher ======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'204'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method vowel_cipher that takes in a string and returns a new string      #
# where every vowel becomes the next vowel in the alphabet.                        #
#                                                                                  #
# EXAMPLES:                                                                        #
#            puts vowel_cipher("bootcamp")      => buutcemp                        #
#            puts vowel_cipher("paper cup")     => pepir cap                       #
#                                                                                  #
# answers should be:                                                               #
#            => buutcemp                                                           #
#            => pepir cap                                                          #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts vowel_cipher("bootcamp")
puts vowel_cipher("paper cup")

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def vowel_cipher(string)
  vowels='aeiou'
  new_string=''
  string.each_char do |character|
      if vowels.include?(character)
          vowels.each_char.with_index do |vowel,index|
              if vowel==character
                  new_string+=vowels[(index+1)%vowels.length]
              end
          end
      else
          new_string+=character
      end
  end
  return new_string
end
puts vowel_cipher("bootcamp")
puts vowel_cipher("paper cup")
  STRING
  answer_string=<<-STRING
buutcemp
pepir cap
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# vowelize  =========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'205'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method, vowelize(string), that takes in a string of words and returns    #
# the string vowelized according to the following rules:                           #
#            * if the word ends in a vowel then just repeat the vowel at the end   #
#            * if the word does not end in a vowel then repeat all of the vowels   #
#              after each one                                                      #
#            * if the original word was capitalized then make sure the new word is #
#              also capitalized                                                    #
#                                                                                  #
# example:   my name is sam           => my namee iis saam                         #
#            Dog is my copilot        => Doog iis my coopiiloot                    #
#            Elephants are cool       => Eeleephaants aree cooool                  #
#                                                                                  #
# answers should be:                                                               #
#            => my namee iis saam                                                  #
#            => Doog iis my coopiiloot                                             #
#            => Eeleephaants aree cooool                                           #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts vowelize('my name is sam')
puts vowelize('Dog is my copilot')
puts vowelize('Elephants are cool')

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def ruleize(word)
  vowels='aeiou'
  new_string=''
  if vowels.include?(word[-1])
      return word+word[-1]
  else
      word.each_char do |character|
          if vowels.include?(character)
              new_string+=character+character
          else
              new_string+=character
          end
      end
  end
  return new_string
end
def vowelize(string)
  array_of_words=string.split
  array_of_words.each_with_index do |word,index|
      if word[0].upcase==word[0]
          word=ruleize(word.downcase)
          array_of_words[index]=word.capitalize
      else
          array_of_words[index]=ruleize(word)
      end
  end
  return array_of_words.join(' ')
end
puts vowelize('my name is sam')
puts vowelize('Dog is my copilot')
puts vowelize('Elephants are cool')
  STRING
  answer_string=<<-STRING
my namee iis saam
Doog iis my coopiiloot
Eeleephaants aree cooool
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# whisper_words =====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'206'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method whisper_words that takes in an array of words and returns a new   #
# array containing a whispered version of each word. See the examples. Solve this  #
# using map :).                                                                    #
#                                                                                  #
#           whisper_words(["KEEP", "The", "NOISE", "down"])                        #
#                                                                                  #
# answers should be:                                                               #
#            => ["keep...", "the...", "noise...", "down..."]                       #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts whisper_words(["KEEP", "The", "NOISE", "down"])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def whisper_words(array)
  new_array=[]
  new_array=array.map{|word| word.downcase+'...'}
  return new_array
end
puts whisper_words(["KEEP", "The", "NOISE", "down"]).inspect
  STRING
  answer_string=<<-STRING
["keep...", "the...", "noise...", "down..."]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# winning_hand ======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'207'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method winning_hand(hand1, hand2) that takes in two strings representing #
# a hand of 4 cards. Return the string of the hand with the higher total score. If #
# there is a tie, return 'DRAW'. Possible cards are                                #
#                                                                                  #
#        J, Q, K.                                                                  #
#        J = 1 point                                                               #
#        Q = 2 points                                                              #
#        K = 3 points                                                              #
#                                                                                  #
# Examples:                                                                        #
#             winning_hand('JQKJ', 'QQJJ')            => 'JQKJ'                    #
#             winning_hand('KJKJ', 'QQQK')            => 'QQQK'                    #
#             winning_hand('JKJJ', 'QQJJ')            => 'DRAW'                    #
#             winning_hand('KJKJ', 'QQQQ')            => 'DRAW'                    #
#                                                                                  #
# answers should be:                                                               #
#            => 'JQKJ'                                                             #
#            => 'QQQK'                                                             #
#            => 'DRAW'                                                             #
#            => 'DRAW'                                                             #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts winning_hand('JQKJ', 'QQJJ')
puts winning_hand('KJKJ', 'QQQK')
puts winning_hand('JKJJ', 'QQJJ')
puts winning_hand('KJKJ', 'QQQQ')

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def get_score(hand)
  sum=0
  scores={'K'=>3,'Q'=>2,'J'=>1}
  hand.each_char do |card|
      sum+=scores[card]
  end
  return sum
end
def winning_hand(hand1,hand2)
  if get_score(hand1)==get_score(hand2)
      return 'DRAW'
  else
      return get_score(hand1)>get_score(hand2) ? hand1 : hand2
  end
end
puts winning_hand('JQKJ', 'QQJJ')
puts winning_hand('KJKJ', 'QQQK')
puts winning_hand('JKJJ', 'QQJJ')
puts winning_hand('KJKJ', 'QQQQ')
  STRING
  answer_string=<<-STRING
'JQKJ'
'QQQK'
'DRAW'
'DRAW'
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# wonky_coins =======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'208'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Catsylvanian money is a strange thing: they have a coin for every                #
# denomination (including zero!). A wonky change machine in Catsylvania takes      #
# any coin of value N and returns 3 new coins, valued at N/2, N/3 and N/4          #
# (rounding down).                                                                 #
#                                                                                  #
# Write a method 'wonky_coins(n)' that returns the number of coins you             #
# are left with if you take all non-zero coins and keep feeding them               #
# back into the machine until you are left with only zero-value coins.             #
#                                                                                  #
# answers should be:                                                               #
#           => wonky_coins(1).should == 3                                          #
#           => wonky_coins(5).should == 11                                         #
#           => wonky_coins(6).should == 15                                         #
#           => wonky_coins(0).should == 1                                          #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts 'wonky_coins(1) == '+wonky_coins(1)
puts 'wonky_coins(5) == '+wonky_coins(5)
puts 'wonky_coins(6) == '+wonky_coins(6)
puts 'wonky_coins(0) == '+wonky_coins(0)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: HARD  (FUNCTIONAL PROGRAMMING)                                       #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def wonky_coins(number)
  return 1 if number==0
  new_array=[number]
  zero_counter=0
  change=[2,3,4]
  while !new_array.empty?
      coin=new_array.shift
      change.each do |n|
          if coin/n!=0
              new_array<<coin/n
          else
              zero_counter+=1
          end
      end
  end
  return zero_counter
end
puts 'wonky_coins(1) == '+wonky_coins(1).to_s
puts 'wonky_coins(5) == '+wonky_coins(5).to_s
puts 'wonky_coins(6) == '+wonky_coins(6).to_s
puts 'wonky_coins(0) == '+wonky_coins(0).to_s
  STRING
  answer_string=<<-STRING
wonky_coins(1).should == 3
wonky_coins(5).should == 11
wonky_coins(6).should == 15
wonky_coins(0).should == 1
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# word_Sandwich =====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'209'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function `word_Sandwich(outer_word, inner_word)` that takes in two       #
# strings and returns a string representing a word sandwich. See the examples      #
# below.                                                                           #
#                                                                                  #
# Examples:                                                                        #
#            word_Sandwich('bread', 'cheese')      => 'BREADcheeseBREAD'           #
#            word_Sandwich('BREAD', 'CHEESE')      => 'BREADcheeseBREAD'           #
#            word_Sandwich('HeLLo', 'worLD')       => 'HELLOworldHELLO'            #
#                                                                                  #
# answers should be:                                                               #
#            => 'BREADcheeseBREAD'                                                 #
#            => 'BREADcheeseBREAD'                                                 #
#            => 'HELLOworldHELLO'                                                  #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts word_sandwich('bread', 'cheese')
puts word_sandwich('BREAD', 'CHEESE')
puts word_sandwich('HeLLo', 'worLD')

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def word_sandwich(outer_word,inner_word)
  return outer_word.upcase+inner_word.downcase+outer_word.upcase
end
puts word_sandwich('bread', 'cheese')
puts word_sandwich('BREAD', 'CHEESE')
puts word_sandwich('HeLLo', 'worLD')
  STRING
  answer_string=<<-STRING
'BREADcheeseBREAD'
'BREADcheeseBREAD'
'HELLOworldHELLO'
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# word_lengths ======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'210'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method word_lengths that takes in a sentence string and returns a hash   #
# where every key is a word of the sentence, and its' corresponding value is the   #
# length of that word.                                                             #
#                                                                                  #
# example:                                                                         #
#         word_lengths("this is fun")                                              #
#         word_lengths("When in doubt, leave it out")                              #
#                                                                                  #
# answers should be:                                                               #
#            => {"this"=>4, "is"=>2, "fun"=>3}                                     #
#            => {"When"=>4, "in"=>2, "doubt,"=>6, "leave"=>5, "it"=>2, "out"=>3}   #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts word_lengths("this is fun")
puts word_lengths("When in doubt, leave it out")

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def word_lengths(string)
  new_hash={}
  array_of_words=string.split
  array_of_words.each do |word|
      new_hash[word]=word.length
  end
  return new_hash
end
puts word_lengths("this is fun")
puts word_lengths("When in doubt, leave it out")
  STRING
  answer_string=<<-STRING
{"this"=>4, "is"=>2, "fun"=>3}
{"When"=>4, "in"=>2, "doubt,"=>6, "leave"=>5, "it"=>2, "out"=>3}
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# word_periods ======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'211'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function `word_periods(sentence)` that takes in a sentence and returns a #
# new sentence where every word has period after it.                               #
#                                                                                  #
# Examples:                                                                        #
#           word_periods('hello world')                                            #
#           word_periods('what is the weather today')                              #
#                                                                                  #
# answers should be:                                                               #
#            => 'hello. world.'                                                    #
#            => 'what. is. the. weather. today.'                                   #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts word_periods('hello world')
puts word_periods('what is the weather today')

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def word_periods(string)
  array_of_words=string.split
  array_of_words.each_with_index do |word,index|
      array_of_words[index]=word+'.'
  end
  return array_of_words.join(' ')
end
puts word_periods('hello world').inspect
puts word_periods('what is the weather today').inspect
  STRING
  answer_string=<<-STRING
'hello. world.'
'what. is. the. weather. today.'
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# word_unscrambler ==================================================================================================#
#====================================================================================================================#

rolling_count+=1
'212'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function word_unscrambler that takes two inputs: a scrambled word and    #
# a dictionary of real words.  Your program must then output all words that our    #
# scrambled word can unscramble to. Do not use sort!                               #
#                                                                                  #
#                                                                                  #
# answers should be:                                                               #
#           => ["tac"]                                                             #
#           => []                                                                  #
#           => ["tac"]                                                             #
#           => ["tac"]                                                             #
#           => ["turn", "runt", "nurt"]                                            #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts word_unscrambler("cat", ["tac"])
puts word_unscrambler("cat", ["tom"])
puts word_unscrambler("cat", ["tic", "toc", "tac", "toe"])
puts word_unscrambler("cat", ["scatter", "tac", "ca"] ).to_s
puts word_unscrambler("turn", ["numb", "turn", "runt", "nurt"])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: HARD (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def is_anagram?(string1,string2)
  return false if string1.length!=string2.length
  string1.each_char do |character|
      return false if !string2.include?(character)
  end
  return true
end
def word_unscrambler(string,arr)
  new_array=[]
  arr.each do |word|
      new_array<<word if is_anagram?(string,word)
  end
  return new_array
end
puts word_unscrambler("cat", ["tac"]).inspect
puts word_unscrambler("cat", ["tom"]).inspect
puts word_unscrambler("cat", ["tic", "toc", "tac", "toe"]).inspect
puts word_unscrambler("cat", ["scatter", "tac", "ca"] ).inspect
puts word_unscrambler("turn", ["numb", "turn", "runt", "nurt"]).inspect
  STRING
  answer_string=<<-STRING
["tac"]
[]
["tac"]
["tac"]
["turn", "runt", "nurt"]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# word_yeller =======================================================================================================#
#====================================================================================================================#

rolling_count+=1
'213'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function 'word_yeller(sentence)' that takes in a sentence string as      #
# input.It should return the sentence where every word has an exclamation point    #
# behind it, except words that already have punctuation. Punctuation marks are     #
# ". , ! ? ; :"                                                                    #
#                                                                                  #
# answers should be:                                                               #
#  => "Stop! it! now! Please, wont! you! stop?"                                    #
#  => "Go! to! the! store! and! grab! the! following: milk, bread, rum, and! cake!"#
#                                                                                  #
#.. CUT AND PASTE .................................................................#

sent = "Stop it now! Please, wont you stop?"
puts word_yeller(sent)
words = "Go to the store and grab the following: milk, bread, rum, and cake"
puts word_yeller(words)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: MEDIUM (FUNCTIONAL PROGRAMMING)                                      #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def word_yeller(string)
punctuation='.,!?;:'
array_of_words=string.split
array_of_words.each_with_index do |word,index|
    if !punctuation.include?(word[-1])
        array_of_words[index]=word+'!'
    end
end
return array_of_words.join(' ')
end
sent = "Stop it now! Please, wont you stop?"
puts word_yeller(sent)
words = "Go to the store and grab the following: milk, bread, rum, and cake"
puts word_yeller(words)
  STRING
  answer_string=<<-STRING
"Stop! it! now! Please, wont! you! stop?"
"Go! to! the! store! and! grab! the! following: milk, bread, rum, and! cake!"
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# yell ==============================================================================================================#
#====================================================================================================================#

rolling_count+=1
'214'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method yell(words) that takes in an array of words and returns a new     #
# array where every word from the original array has an exclamation point after it.#
#                                                                                  #
# EXAMPLES:                                                                        #
#           puts yell(["hello", "world"]) # => ["hello!", "world!"]                #
#           puts yell(["code", "is", "cool"]) # => ["code!", "is!", "cool!"]       #
#                                                                                  #
# answers should be:                                                               #
#            => ["hello!", "world!"]                                               #
#            => ["code!", "is!", "cool!"]                                          #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts yell(["hello", "world"])
puts yell(["code", "is", "cool"])

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def yell(words)
  words.each_with_index{|word,indx| words[indx]=word+'!'}
  return words
end
puts yell(["hello", "world"]).inspect
puts yell(["code", "is", "cool"]).inspect
  STRING
  answer_string=<<-STRING
["hello!", "world!"]
["code!", "is!", "cool!"]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# yell_II ===========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'215'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function `yell_II` that takes in a string and returns a "yelled"         #
# version of that string.                                                          #
#                                                                                  #
# Examples:                                                                        #
#          yell_II("I want to go to the store")                                    #
#          yell_II("Time to program")                                              #
#                                                                                  #
# answers should be:                                                               #
#            => "I WANT TO GO TO THE STORE!!!"                                     #
#            => "TIME TO PROGRAM!!!"                                               #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts yell_II("I want to go to the store")
puts yell_II("Time to program")

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def yell_II(string)
  array_of_words=string.split
  array_of_words[-1]+='!!!'
  array_of_words.each_with_index do |word,index|
      array_of_words[index]=word.upcase
  end
  return array_of_words.join(' ')
end
puts yell_II("I want to go to the store").inspect
puts yell_II("Time to program").inspect
  STRING
  answer_string=<<-STRING
"I WANT TO GO TO THE STORE!!!"
"TIME TO PROGRAM!!!"
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# yell_sentence =====================================================================================================#
#====================================================================================================================#

rolling_count+=1
'216'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a method yell_sentence that takes in a sentence string and returns a new   #
# sentence where every word is yelled. See the examples. Use map to solve this.    #
#                                                                                  #
#         yell_sentence("I have a bad feeling about this")                         #
#                                                                                  #
# answers should be:                                                               #
#            => "I! HAVE! A! BAD! FEELING! ABOUT! THIS!"                           #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

puts yell_sentence("I have a bad feeling about this")

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: EASY (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def yell_sentence(string)
  new_array=[]
  array_of_words=string.split
  new_array=array_of_words.map{|word| word.upcase+'!'}
  return new_array.join(' ')
end
puts yell_sentence("I have a bad feeling about this")
  STRING
  answer_string=<<-STRING
"I! HAVE! A! BAD! FEELING! ABOUT! THIS!"
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
end




#====================================================================================================================#
# zip_array =========================================================================================================#
#====================================================================================================================#

rolling_count+=1
'217'
if random_question==rolling_count
#..............................................................................
  question_string=<<-STRING
####################################################################################
# Write a function `zip_array(arr1, arr2)` that takes in two arrays and "zips"     #
# them together by returning a single 2D-array. Assume that both input arrays have #
# the same length.                                                                 #
#                                                                                  #
# Example:                                                                         #
#           a1 = ['a', 'b', 'c', 'd']                                              #
#           a2 = [10, 20, 30, 40]                                                  #
#           puts zip_array(a1, a2)                                                 #
#                                                                                  #
# answers should be:                                                               #
#            => [ [ 'a', 10 ], [ 'b', 20 ], [ 'c', 30 ], [ 'd', 40 ] ]             #
#                                                                                  #
#.. CUT AND PASTE .................................................................#

a1 = ['a', 'b', 'c', 'd']
a2 = [10, 20, 30, 40]
puts zip_array(a1, a2)

#.. CUT AND PASTE .................................................................#
#                                                                                  #
# DIFFICULTY: HARD (FUNCTIONAL PROGRAMMING)                                        #
#                                                                                  #
####################################################################################
  STRING
  ruby_string=<<-STRING
def zip_array(array1,array2)
  new_array=[]
  array1.each_with_index do |element,index|
      new_array<<[element,array2[index]]
  end
  return new_array
end
a1 = ['a', 'b', 'c', 'd']
a2 = [10, 20, 30, 40]
puts zip_array(a1, a2).inspect
  STRING
  answer_string=<<-STRING
[['a', 10], ['b', 20], ['c', 30], ['d', 40]]
STRING
  result,drill_status=coding_test4(question_string,result,random_question,questions_to_go,drill_status,ruby_string,answer_string)
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

