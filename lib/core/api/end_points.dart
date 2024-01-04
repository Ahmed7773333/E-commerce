class EndPoints {
  //Authentication
  static const String login = '/api/v1/auth/signin';
  static const String signup = '/api/v1/auth/signup';
  static const String forgetPassword = '/api/v1/auth/forgotPasswords';
  static const String verify = '/api/v1/auth/verifyResetCode';
  static const String changePassword = '/api/v1/users/changeMyPassword';
  static const String resetPassword = '/api/v1/auth/resetPassword';
  static const String updateMe = '/api/v1/users/updateMe/';
  static const String getAllUsers = '/api/v1/users';
  //Products
  static const String getAllProducts = '/api/v1/products';
  static const String getOffers =
      '/api/v1/products?category[in]=6439d5b90049ad0b52b90048';
  //categories
  static const String categories = '/api/v1/categories';
  //SubCategories
  static const String getAllSubCategories = '/api/v1/subcategories';
  static const String getAllSubCategoryOfSomeCategory =
      '/api/v1/categories/6407ea3d5bbc6e43516931df/subcategories';
  //Brands
  static const String brands = '/api/v1/brands';
  //Wishlist
  static const String wishList = '/api/v1/wishlist';
  //addresses
  static const String addresses = '/api/v1/addresses';

//cart
  static const String cart = '/api/v1/cart';

  //Orders
  static const String getOrder = '/api/v1/orders/';
  static const String getUserOrder =
      '/api/v1/orders/user/6407cf6f515bdcf347c09f17';
  static const String checkOutOrder =
      '/api/v1/orders/checkout-session/642e5663fc6ec80008fc40bf?url=http://localhost:4200';
}
