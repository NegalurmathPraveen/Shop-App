# shop_app

- A Flutter application developed with Clean Architecture and BLoC for efficient state management.
- Features smooth API integration, lazy loading, and robust error handling.

The app retrieves the product list using the following API: https://fakestoreapi.com/products

## Getting Started

Use Build runner to auto generate the code
```
flutter clean

dart run build_runner watch build --delete-conflicting-outputs
```

## Assumptions
- The favourites feature was implemented using the product list provided by the API (an ideal implementation would require modifications to the API).
- Pagination was not implemented due to the absence of pagination in the current API.

## Challenges Faced
- The implementation could have been more robust if specific changes were made to the products API.
- The absence of a search API limited the ability to enhance the search functionality.