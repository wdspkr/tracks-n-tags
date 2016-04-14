import Ember from 'ember';

export default Ember.Component.extend({
  url: null,
  actions: {
    createTrack() {
      this.get('createTrack')(this.get('url'));
    }
  }
});
