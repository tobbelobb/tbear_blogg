const Cart = (() => {
  const _cartKey = 'cart';
  const _totalCostKey = 'totalCost';

  const _getCart = () => JSON.parse(localStorage.getItem(_cartKey)) || [];
  const _getTotalCost = () => parseFloat(localStorage.getItem(_totalCostKey)) || 0;

  const _setCart = (cart) => localStorage.setItem(_cartKey, JSON.stringify(cart));
  const _setTotalCost = (totalCost) => localStorage.setItem(_totalCostKey, totalCost);

  const addToCart = (itemName, itemPrice) => {
    let cart = _getCart();
    cart.push({ name: itemName, price: itemPrice });
    _setCart(cart);

    let totalCost = _getTotalCost() + itemPrice;
    _setTotalCost(totalCost);

    return { cart, totalCost };
  };

  const getCartData = () => {
    return { cart: _getCart(), totalCost: _getTotalCost() };
  };

  return {
    addToCart,
    getCartData,
  };
})();
