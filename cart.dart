class ShoppingCart {
  List<Map<String, dynamic>> items = [];

  void addItem(String name, double price, int quantity) {
    items.add({
      'name': name,
      'price': price,
      'quantity': quantity,
    });
  }

  void removeItem(int index) {
    items.removeAt(index);
  }

  double calc() {
    double total = 0;
    for (var item in items) {
      total += item['price'] * item['quantity'];
    }
    return total;
  }

  void discount() {
    // Implement discount logic based on quantity or item type
    // Example: 10% discount for orders over $100
    double total = calc();
    if (total > 100) {
      for (var item in items) {
        item['price'] *= 0.9; // Apply 10% discount
      }
    }
  }
}

void main() {
  ShoppingCart cart = ShoppingCart();
  cart.addItem('Product A', 19.99, 2);
  cart.addItem('Product B', 29.99, 1);
  cart.addItem('Product C', 14.99, 3);

  print('Total before discounts: \$${cart.calc()}');
  cart.discount();
  print('Total after discounts: \$${cart.calc()}');
}