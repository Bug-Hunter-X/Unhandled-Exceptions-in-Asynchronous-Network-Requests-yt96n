# Unhandled Exceptions in Dart Asynchronous Network Requests
This example demonstrates a common error in Dart: failing to handle JSON decoding exceptions and providing inadequate exception handling in asynchronous network operations.  Improper exception handling can lead to application crashes or unpredictable behavior.  The solution demonstrates best practices for handling various exception types and improving code robustness.

## Bug
The `fetchData` function uses `jsonDecode` without handling potential `FormatException` if the server returns malformed JSON.  The `catch` block is too generic and doesn't provide specific handling for different types of exceptions (e.g., network errors).

## Solution
The solution enhances the code to:

1. Explicitly handle `FormatException` during JSON decoding.
2. Differentiate and handle various exception types (e.g., `SocketException`, `FormatException`, `TimeoutException`)  with appropriate error messages and recovery strategies.
3. Provide informative error messages to the user.

This improved error handling makes the application more robust and user-friendly.