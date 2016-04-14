import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    createTrack(url) {
      var track = this.store.createRecord('track', {
        url: url
      });

      track.save();
    }
  }
});
