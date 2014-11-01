class AcceptMailer < ActionMailer::Base
  default from: "ch12b034@smail.iitm.ac.in"

  def accept_notify(requestbook,user)
    @book = requestbook.book
    @user = user
    mail(to:@user.username.downcase+"@smail.iitm.ac.in",subject:"Student Library: Book Approval Needed")
  end
end
