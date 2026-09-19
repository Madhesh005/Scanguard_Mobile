class ApiConstants {
  // Replace this with your actual backend URL when ready
  static const String baseUrl = 'http://localhost:3000/api'; 
  
  // Auth
  static const String loginEndpoint = '/auth/login';
  static const String registerEndpoint = '/auth/register';

  // Stores
  static const String storesEndpoint = '/stores';
  
  // Products
  static const String productsEndpoint = '/products';
  // Example usage: /products/barcode/:barcode?storeId=x
  static String productByBarcodeEndpoint(String barcode) => '/products/barcode/$barcode';

  // Cart
  static const String cartEndpoint = '/cart';
  static const String cartAddEndpoint = '/cart/add';
  static const String cartUpdateEndpoint = '/cart/update';
  static const String cartRemoveEndpoint = '/cart/remove';
  
  // Checkout
  static const String checkoutEndpoint = '/checkout';

  // Transactions
  static const String transactionsEndpoint = '/transactions';

  // Reviews
  // Example usage: /reviews/:storeId
  static String reviewsEndpoint(String storeId) => '/reviews/$storeId';

  // Admin
  static const String adminDashboardEndpoint = '/admin/dashboard';
  static const String adminTopProductsEndpoint = '/admin/top-products';
  static const String adminLowStockEndpoint = '/admin/low-stock';
  static const String adminTransactionsEndpoint = '/admin/transactions';
}
