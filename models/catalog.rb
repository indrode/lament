class Catalog

  ARTICLES = {
    lorem_ipsum: {
      number: 0,
      title: 'Lorem Ipsum',
      tldr: 'Lorem ipsum',
      date: Time.new(2012,12,22),
      tags: [1, 2, 3],
      hidden: true
    },

    authentication: {
      number: 1,
      title: 'Public Key Authentication over SSH',
      tldr: 'Add convenience and security to your SSH with public key authentication.',
      date: Time.new(2011,7,22),
      tags: nil,
      hidden: false
    },

    commit: {
      number: 2,
      title: 'Write Good Commit Messages (git)',
      tldr: 'Please be consistent when writing your git commit messages.',
      date: Time.new(2011,8,22),
      tags: nil,
      hidden: false
    },

    top_albums: {
      number: 3,
      title: 'Personal Top-Played Albums',
      tldr: 'Somewhat surprisingly, I actually listen to good music.',
      date: Time.new(2012,12,16),
      tags: nil,
      hidden: false
    },

    menu_bar: {
      number: 4,
      title: 'My Mac\'s new menu bar',
      tldr: 'I have removed all clutter from my menu bar and I like it.',
      date: Time.new(2012,12,20),
      tags: false,
      hidden: false
    },

  }

end