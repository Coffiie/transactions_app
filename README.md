# Sample Flutter App With MVVM

This app basically shows us how to make flutter apps using MVVM scalable and reusable.

## Some must knows about what this app is trying to achieve

- Views are dumb and stateless.
- Viewmodels wrap / bind around views and should only be used for state management of the views. Viewmodels should not make any api calls. Viewmodels may call other service methods.
- Viewmodels should only communicate with repository for data needs.
- Repositories are the single source of truth. Repositories should always reflect authentic and trustworthy data.
- Repositories decide whether the app needs to fetch data from the api or from the local storage.
- Repositories may not directly make api calls, however, repositories may call other services that may call apis.
- If a pattern repeats twice, that is code duplication. Such patterns should be moved either to their required classes, or if they dont belong in any, should be moved to a helper class.

If you have an opinion or another useful pattern, I would love to hear about it! Just send me a DM on my LinkedIn.
https://www.linkedin.com/in/rawahamuhammad/

