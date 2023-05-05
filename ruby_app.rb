class User
    attr_accessor :first_name, :last_name, :email, :telephone

    def initialize(first_name, last_name, email, telephone)
        @first_name = first_name
        @last_name = last_name
        @email = email
        @telephone = telephone
    end
end

option = 0
users = []
telephone =0

loop do
    sleep(1)
    puts "Welcome, this is a Contact Book. Write the number"
    puts "1. Create contact"
    puts "2. Read contact"
    puts "3. Update contact"
    puts "4. Delete contact"
    puts "5. Generate report"
    puts "6. Exit"
    
    option = gets.to_i

    case option 
        when 1
            puts "First name"
            first_name = gets.chomp
            puts "Last name"
            last_name = gets.chomp
            puts "E-mail"
            email = gets.chomp
            loop do 
            puts "Telephone"
            telephone = gets.chomp

                if telephone.to_i == 0
                    puts "Telephone is not a number"
                end
                
            break if telephone.to_i > 0
            end

            user =User.new(first_name, last_name, email, telephone)
            users.push(user)

            puts "New user added #{first_name} #{last_name}, #{email}, #{telephone}"

        when 2
            puts "List of users"
            users.each do |user|
                puts "#{user.first_name} #{user.last_name}, #{user.email}, #{user.telephone}"
            end
        when 3
            puts "Write the first name of user to edit"
            search_user = gets.chomp
            users.each do |user|
                if user.first_name == search_user
                    puts "#{user.first_name} #{user.last_name}, #{user.email}, #{user.telephone}"
                        puts "First name"
                        first_name = gets.chomp
                        user.first_name = first_name
                        puts "Last name"
                        last_name = gets.chomp
                        user.last_name = last_name
                        puts "E-mail"
                        email = gets.chomp
                        user.email = email
                        puts "Telephone"
                        telephone = gets.chomp
                        user.telephone = telephone
                    puts "User was update successfully"
                    break
                else
                    puts "There's not an user with that name"
                end
            end
        when 4
            puts "Write the first name of user to edit"
            search_user = gets.chomp
            users.each do |user|
                if user.first_name == search_user
                    puts "¿Do you want delete to user: "
                    puts "#{user.first_name} #{user.last_name}, #{user.email}, #{user.telephone}? \nYes or Not?"
                    answer = gets.chomp
                        if answer == "Yes" || answer == "yes" || answer == "YES"
                            users.delete_if {|user| user.first_name == search_user}
                            puts "User was delete successfully"
                        else
                            puts "You didn't delete the user"
                        end
                else
                    puts "There's not an user with that name"
                end
                break
            end
        when 5
            File.write("Users.txt", "")

            users.each do |user|
              File.write("Users.txt", "#{user.first_name},#{user.last_name},#{user.email},#{user.telephone}\n", mode: "a")
            end
        when 6
            puts "¡See you later!"
        else 
            puts "Write a valid number"
    end
    
    break if option == 6
end