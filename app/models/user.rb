class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable,
          :omniauthable, omniauth_providers: [:twitter]
  has_many :user_items, dependent: :destroy
  has_many :foods, through: :user_items
  accepts_nested_attributes_for :user_items
  has_many :order_items
  
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :first_address, presence: true
  validates :second_address, presence: true
  validates :telephone, presence: true
  validates :email, presence: true,uniqueness: true
  
  def leave
    #leave_atに退会時刻を追記
    update_attribute(:leave_at, Time.current)

    # また、userのメールアドレスの頭にleave_atを追加する。
    # メールアドレスを変更すると原則確認メールが送信されるため、
    # 送信をスキップすることを宣言した上でupdateする。
    new_email = self.leave_at.to_i.to_s + '_' + self.email.to_s
    self.skip_reconfirmation!
    update_attribute(:email, new_email)

    # また、social_profilesが存在する場合はuidの頭にもleave_atを追加する
    # fb,twitter両方連携されている場合があるため、each doしている。
    # social_profiles = self.social_profiles
    # social_profiles.each do |sp|
    #   new_uid = self.leave_at.to_i.to_s + '_' + sp.uid.to_s
    #   sp.update_attribute(:uid, new_uid)
    # end
  end
  def self.from_omniauth(auth)
    find_or_create_by(provider: auth["provider"], uid: auth["uid"]) do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.username = auth["info"]["nickname"]
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"]) do |user|
        user.attributes = params
      end
    else
      super
    end
  end
end
