# Sample

Implementation of https://github.com/apegroup/Code-test?tab=readme-ov-file

```
Used
    1. SwiftUI + Combine
    2. Since sample accessing colors and images from asset catalog via static properties, Xcode Version 15.3 needed to run the project.
Assumptions
    1. Number of filters is dynamic: unique set of all filters is shown
    2. No use of thirdparty libraries
    3. Navigation bar should be native. Arrow in figma looks not native iOS;).
    4. Reused asset for “Top Rated” for all filters, due to no export options.
        
What is left
    1. Networking layer: 
        1. API calls to fetch filter names for each filter id
        2. API call for open status
2. Screenshot tests, Unit tests, etc.

What is implemented in video:

```
