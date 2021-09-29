class UserMailer < ActionMailer::Base
    #default :from => "kk.com"
    #will work when we get a true domain from which we can send email
    #for now go to your server to get the confirm token url for every users
 def registration_confirmation(user)
    @user = user
      mail(
       from: "<txapp.utc@gmail.com>",
       to: "#{user.name} <#{user.email}>",
       subject: "Registration Confirmation"
     )
 end
end