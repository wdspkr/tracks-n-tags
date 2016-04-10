import DS from 'ember-data';

var Track = DS.Model.extend({
  url: DS.attr()
});

// Track.reopenClass({
//   FIXTURES: [
//     { id: 1,
//       url: "https://soundcloud.com/jenniferrrer/fish-whistle-02-w-djboyzclub-dublab-3816"},
//     { id: 2,
//       url: "https://soundcloud.com/autobrennt/118-autobrenntpodcast-paco-risikogruppe"},
//     { id: 3,
//       url: "https://soundcloud.com/capturedtracks/charlie-hilton-funny-anyway-1"}
//   ]
// });

export default Track;
