const CartCount = (() => {
  const _countKey = 'count';
  const get = () => JSON.parse(localStorage.getItem(_countKey)) || 0;
  const set = (count) => localStorage.setItem(_countKey, JSON.stringify(count));

  return {
    get,
    set,
  };
})();
