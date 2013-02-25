class Catalog

  LIST = [
    :hipster_ipsum,
    :squid_lomo_chambray_high_life,
    :authentication,
    :commit,
    :top_albums,
    :menu_bar,
    :hubot_talker,
    :pow_and_chruby
    # :ruby2_chruby
  ]
  
  ARTICLES = {
    hipster_ipsum: {
      number: 0,
      title: 'Hipster Ipsum',
      tldr: 'Because Lorem Ipsum is waaay too generic.',
      date: Time.new(2011,7,10),
      tags: [1, 2, 3],
      hidden: false
    },

    squid_lomo_chambray_high_life: {
      number: 1,
      title: 'Squid Lomo Chambray High Life',
      tldr: 'Everything you ever needed to know in life. Ever.',
      date: Time.new(2011,7,17),
      tags: false,
      hidden: false
    },

    authentication: {
      number: 2,
      title: 'Public Key Authentication over SSH',
      tldr: 'Add convenience and security to your SSH with public key authentication.',
      date: Time.new(2011,7,22),
      tags: nil,
      hidden: false
    },

    commit: {
      number: 3,
      title: 'Write Good Commit Messages (git)',
      tldr: 'Please be consistent when writing your git commit messages.',
      date: Time.new(2011,8,22),
      tags: nil,
      hidden: false
    },

    top_albums: {
      number: 4,
      title: 'Personal Top-Played Albums',
      tldr: 'Somewhat surprisingly, I actually listen to good music. Check it out on my <a href="http://www.last.fm/user/zenpunch/">last.fm profile</a>.',
      date: Time.new(2012,12,16),
      tags: nil,
      hidden: false
    },

    menu_bar: {
      number: 5,
      title: 'My Mac\'s new menu bar',
      tldr: 'I have removed all clutter from my menu bar and I like it.',
      date: Time.new(2012,12,20),
      tags: false,
      hidden: false
    },

    hubot_talker: {
      number: 6,
      title: 'Hubot on Heroku in Talker',
      tldr: 'Quick instructions on how to set up Hubot for Talker using Heroku.',
      date: Time.new(2013,2,20),
      tags: false,
      hidden: false
    },

    pow_and_chruby: {
      number: 7,
      title: 'Pow and chruby',
      tldr: 'One minute guide on how to set up Pow with chruby and some config tweaks.',
      date: Time.new(2013,2,23),
      tags: false,
      hidden: false
    },

    ruby2_chruby: {
      number: 8,
      title: 'Ruby 2.0 and chruby',
      tldr: 'Follow-up article to why chruby rocks and how to install Ruby 2.0 on it.',
      date: Time.new(2013,2,24),
      tags: false,
      hidden: true
    },

  }

end