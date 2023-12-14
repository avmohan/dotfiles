const personal = {
  name: "Google Chrome",
  profile: "Profile 1",
};

const work = {
  name: "Google Chrome",
  profile: "Default",
};

module.exports = {
  defaultBrowser: "Firefox",
  options: {
      hideIcon: false,
      checkForUpdate: true,
  },
  handlers: [
      // Links opened from Flock
      {
          match: ({
              opener
          }) => ["Flock"].includes(opener.name),
          browser: work,
      },
      // Matches links containing the name of my company
      {
          match: ["zeta-tm.atlassian.net/*", "bitbucket.org/zetaengg/*", "*.zetaapps.in/*", "*.zeta.in/*"],
          browser: work,
      },
      // Social media
      {
          match: /facebook|twitter|instagram|leetcode|teamblind/,
          browser: personal,
      }
  ],
};

