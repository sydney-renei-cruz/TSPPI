/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


Demo.prototype.addSorting = function () {
  document.querySelector('.sort-options').addEventListener('change', this._handleSortChange.bind(this));
};

Demo.prototype._handleSortChange = function (evt) {
  var value = evt.target.value;
  var options = {};

  function sortByDate(element) {
    return element.getAttribute('data-groups');
  }

  function sortByTitle(element) {
    return element.getAttribute('data-title').toLowerCase();
  }

  if (value === 'groups') {
    options = {
      reverse: true,
      by: sortByDate
    };
  } else if (value === 'title') {
    options = {
      by: sortByTitle
    };
  }

  this.shuffle.sort(options);
};