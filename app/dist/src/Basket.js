// Generated by CoffeeScript 1.7.1
(function() {
  var Basket;

  Basket = (function() {
    function Basket() {}

    Basket.prototype.items = [];

    Basket.prototype.distinctCount = 0;

    Basket.prototype.totalCount = 0;

    Basket.prototype.add = function(item, quantity) {
      var curItemLoc;
      if (this.itemExistsInBasket(item.id)) {
        curItemLoc = this.getItemLocation(item.id);
        this.items[curItemLoc].quantity += quantity;
      } else {
        this.items.push({
          "item_id": item.id,
          "quantity": quantity
        });
        this.distinctCount++;
      }
      return this.totalCount += quantity;
    };

    Basket.prototype.getQuantity = function(item_id) {
      var i, _i, _len, _ref;
      _ref = this.items;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        i = _ref[_i];
        if (i.item_id === item_id) {
          return i.quantity;
        }
      }
      return false;
    };

    Basket.prototype.itemExistsInBasket = function(item_id) {
      var i, _i, _len, _ref;
      _ref = this.items;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        i = _ref[_i];
        if (i.item_id === item_id) {
          return true;
        }
      }
      return false;
    };

    Basket.prototype.getItemLocation = function(item_id) {
      var count, i, _i, _len, _ref;
      count = 0;
      _ref = this.items;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        i = _ref[_i];
        if (i.item_id === item_id) {
          return count;
        }
        count++;
      }
      return false;
    };

    return Basket;

  })();

  window.Basket = Basket;

}).call(this);
