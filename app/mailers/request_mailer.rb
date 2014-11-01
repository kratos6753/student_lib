class RequestMailer < ActionMailer::Base
  default from: "ch12b034@smail.iitm.ac.in"

  def request_notify(user)
    @user = user
    mail(to:user+"@smail.iitm.ac.in",subject:"Student Library: Book Request")
  end
end
