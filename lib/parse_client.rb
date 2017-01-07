module ParseClient
  def self.send_push_to_user(recipient_id:, alert:, amazon_tags:)
    # we cannot use parse, we have to update this with other platform

    # amazon_tags = amazon_tags.split(', ') if amazon_tags
    # push = Parse::Push.new({alert: alert, amazon_tags: amazon_tags }, "user_#{recipient_id}")
    # push.type = recipient_id.length == 64 ? 'ios' : 'android'
    # push.save
  end
end
