class OfferMailer < ActionMailer::Base
  default from: "notifications@inmo.megiteam.pl"

  def price_changed(offer)
    recipients = offer.subscribers.map(&:email)

    @offer = offer
    mail(bcc: recipients, subject: "price of offer #{offer.title} has changed")
  end

  def report(offer, user, report)
    recipients = User.admin.map(&:email)

    @offer = offer
    @user = user
    @report = report

    mail(to: recipients, subject: "offer #{@offer.title} reported")
  end
end
