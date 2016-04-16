import { test } from 'qunit';
import moduleForAcceptance from 'tracks-n-tags/tests/helpers/module-for-acceptance';

moduleForAcceptance('Acceptance | new track');

test('Add new track', function(assert) {
  var url = 'http://my-url.com';

  visit('/tracks');
  fillIn('input.url', url);
  click('button');

  andThen(function() {
    assert.equal(find('ul.tracks li:first').text().trim(), url);
  });
});

test('List tracks', function(assert) {
  server.createList('track', 10);

  visit('/tracks');

  andThen(function() {
    assert.equal(find('ul.tracks li').length, 10);
  });
});

test('Show track urls', function(assert) {
  var url = 'http://1.my-url.com';
  server.create('track', { url: url });

  visit('/tracks');

  andThen(function() {
    assert.equal(find('ul.tracks li:first').text().trim(), url);
  });
});
