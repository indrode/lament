class Catalog

  LIST = [
    :hipster_ipsum,
    :squid_lomo_chambray_high_life,
    :authentication,
    :commit,
    :top_albums,
    :menu_bar,
    :hubot_talker,
    :pow_and_chruby,
    :ruby2_chruby,
    :homebrew,
    :puma
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
      title: 'Key Authentication over SSH',
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
      hidden: false
    },

    homebrew: {
      number: 9,
      title: 'Homebrew',
      tldr: 'Cheat sheet for the Mac OS package manager, i.e. something you should know already.',
      date: Time.new(2013,2,26),
      tags: false,
      hidden: false
    },

    puma: {
      number: 10,
      title: 'Rack Apps with Puma',
      tldr: 'Guide for setting up a Rails production environment with nginx and Puma.',
      date: Time.new(2013,8,27),
      tags: false,
      hidden: false
    },
  }

  PHOTOS = [
    ["Lucy", "20061011085605_img_9912"],
    ["Cocoa Beach Surfer", "20061015080224_img_0084"],
    ["Jen", "20061019132554_img_0057"],
    ["Hookahs", "20061119174250_img_0526"],
    ["Parque del Retiro, Madrid", "20061203062828_img_0933"],
    ["Light with Spider Webs", "20061225192604_img_1301"],
    ["Highway Bridge, Germany", "20070103201454_img_0636"],
    ["Burn", "20070112140354_img_1435"],
    ["Cutting Chili", "20070115135051_img_1172"],
    ["King Alfonso XII, Madrid", "20070126143308_img_0932"],
    ["TBD", "20070213145713_img_2196"],
    ["Melissa", "20070213150124_img_2216"],
    ["Boat in Amsterdam", "20070303104600_img_2661a"],
    ["Madrid, Spain", "20070306181600_img_0850"],
    ["Gecko", "20070307195212_img_2414"],
    ["Damplaats, Amsterdam", "20070309182441_img_2653"],
    ["Somewhere in Germany", "20070312154214_img_0633"],
    ["Amsterdam Scene", "20070320065031_img_2662"],
    ["Monkey", "20070403110545_img_3095"],
    ["Duisburg Zoo", "20070408010325_img_3145"],
    ["Aquarium in Duisburg Zoo", "20070412170735_aquarium"],
    ["TBD", "20070525231425_img_3245"],
    ["Sky Scene, Pennsylvania", "20070611222824_img_3585"],
    ["Bomberger Hall, Ursinus College", "20070611223810_img_3652"],
    ["Smithsonian's National Zoo, Washington D.C.", "20070708215615_img_3740"],
    ["Porcupine at Smithsonian's National Zoo", "20071008214658_img_3984"],
    ["Ursinus College, PA", "20071105201601_img_3682"],
    ["Kittens", "20071105203111_img_4306"],
    ["Beer", "20071105203427_img_2186"],
    ["Krefeld, Germany", "20071105204031_img_0994"],
    ["Teatro Coliseum ,Madrid", "20071105204854_img_0763"],
    ["Gran Via, Madrid", "20071105205329_img_0749"],
    ["Lucy - Some years later", "20071115220505_img_3993"],
    ["Montreal at Night", "20071128020055_montreal_hdr2"],
    ["Lion in Montreal", "20080113193906_img_4497"],
    ["Olympic Stadium, Montreal", "20080113195228_img_4578"],
    ["Lake ..., USA", "20080326222453_img_4760"],
    ["Montreal, Canada", "20080401215429_img_4529"],
    ["Gloomy Night", "20080401222153_img_1307"],
    ["Museum 1, London", "20080928080824_img_5759"],
    ["Museum 2, London", "20080928081841_img_5735"],
    ["Museum 3, London", "20080928082617_img_5652"],
    ["London, U.K.", "20080928083816_img_5520"],
    ["Family Portrait", "20081208025908_india1"],
    ["Mumbai at Night", "20090801164943_mumbainight"],
    ["Calangute, Goa", "20090801165831_calangute"],
    ["Do Piaza, Goa", "20090801170302_dopiaza"],
    ["99 - The Movie", "20090801171044_99movie"],
    ["Airport", "20091003061853_flight"],
    ["Grapes, Krefeld", "20091014053817_img_7913"],
    ["Mumbai Street Scene", "20091123175943_img_7338"],
    ["Corner Shop, Mumbai", "20091123181212_img_7300"]
  ]

end