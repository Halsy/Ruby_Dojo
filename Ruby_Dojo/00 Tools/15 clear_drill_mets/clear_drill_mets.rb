##################################################################################################################
#                                                                                                                #
# Program:......................clear_drill_mets.rb                                                              #
# Programmer:...................Harold Sy                                                                        #
# Description:..................this program allows me to clear any of the drills metrics on the tracking text   #
#                               file.                                                                            #
# Programmed:...................03/23/2021                                                                       #
# Last modified:................03/23/2021                                                                       #
# Modification notes:...........None                                                                             #
##################################################################################################################

#================================================================================================================#
# main program ==================================================================================================#
#================================================================================================================#

process='y'
while process=='y'
    process='n'

    #==================================#
    # print message about this program #
    #================================================================================================================#
    #                                                                                                                #
    system('cls')                                                                                                    #
    puts "this program clears a drill of its metrics on the ProLanInv text file."                                    #
    puts "if this is what you want to do then hit enter to continue..."                                              #
    wait=gets.chomp                                                                                                  #
    #================================================================================================================#


    #====================================#
    # get the inventory the drill is in  #
    #================================================================================================================#
    # get the inventory that the drill is in and make sure that the inventory name is all caps                       #
    #                                                                                                                #
    puts                                                                                                             #
    print "which inventory is the drill in (example: RUBY): "                                                        #
    inventory=gets.chomp.upcase                                                                                      #
    #================================================================================================================#




    #==========================================================================#
    # get the name of the drill that is to be cleared and the folder it is in  #
    #================================================================================================================#
    # get the name of the drill that is to be cleared, also make sure that the drill name has .rb at the end         #
    # and that we get the name of the folder tha contains the drill                                                  #
    #                                                                                                                #
    puts                                                                                                             #
    print "which drill did you want to clear? "                                                                      #
    drill=gets.chomp                                                                                                 #
    folder=''                                                                                                        #
    Dir.foreach('../../'){|file| folder<<file if file.include?(drill)}                                               #
    #================================================================================================================#




    #========================================================================================#
    # open the ProLanInv text file and read while saving to memory until the drill is found  #
    #================================================================================================================#
    #                                                                                                                #
    #                                                                                                                #
    modified_inventory=''                                                                                            #
    file_read=File.open('../../../../02 text_files/ProLanInv.txt','r')                                               #
    #                                                                                                                #
    # read and save to memory until inventory is found                                                               #
    while !file_read.eof?                                                                                            #
        line=file_read.readline                                                                                      #
        break if line.include?(inventory)                                                                            #
        modified_inventory<<line                                                                                     #
    end                                                                                                              #
    #                                                                                                                #
    # save last line read with inventory name                                                                        #
    modified_inventory<<line                                                                                         #
    #                                                                                                                #
    # read and save to memory until drill is found                                                                   #
    while !file_read.eof?                                                                                            #
        line=file_read.readline                                                                                      #
        break if line.include?(folder)                                                                               #
        modified_inventory<<line                                                                                     #
    end                                                                                                              #
    #                                                                                                                #
    # modify the target line                                                                                         #                                                                              
    line_index=line.index('(')                                                                                       #
    line[line_index+1..line_index+3]='000'                                                                           # 
    line[line_index+19..line_index+21]='000'                                                                         #
    line[line_index+32..line_index+34]='000'                                                                         #
    line[line_index+44..line_index+46]='100'                                                                         #
    line[line_index+62..line_index+64]='000'                                                                         #
    line[line_index+79]='N'                                                                                          #
    line[line_index+91..line_index+93]='000'                                                                         #
    line[line_index+104..line_index+113]='00|00|0000'                                                                #
    line[line_index+119..line_index+128]='00|00|0000'                                                                # 
    #                                                                                                                #
    # save the rest of the text file to memory                                                                       #
    modified_inventory<<line                                                                                         #
    while !file_read.eof?                                                                                            #
        line=file_read.readline                                                                                      #
        modified_inventory<<line                                                                                     #
    end                                                                                                              #
    #                                                                                                                #
    # close file opened for reading                                                                                  #
    file_read.close                                                                                                  #
    #================================================================================================================#




    #=================================================#
    # save modified inventory to inventory text file  #
    #================================================================================================================#
    #                                                                                                                #
    #                                                                                                                #
    file_write=File.open('../../../../02 text_files/ProLanInv.txt','w')                                              #
    file_write.puts modified_inventory                                                                               #
    file_write.close                                                                                                 #
    #================================================================================================================#




    #========================#
    # print message to user  #
    #================================================================================================================#
    #                                                                                                                #
    #                                                                                                                #
    puts                                                                                                             #
    puts "#{folder} was cleared successfully."                                                                       #
    print "clear another inventory (y or n)? "                                                                       #
    process=gets.chomp                                                                                               #
    #================================================================================================================#
end    