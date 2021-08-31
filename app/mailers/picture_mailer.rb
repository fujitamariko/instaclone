class PictureMailer < ApplicationMailer
    def post_mail(picture)
        @picture = picture
        mail to: "like.white.chrysanthemum@gmail.com", subject: "投稿完了メール"
    end
end