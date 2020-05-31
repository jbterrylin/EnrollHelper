# flutter_mobx_cb

A ideal structure codebase using mobx and provider in Flutter. For http is free to implement depend on your own implementation, but here will use Dio as requester. Currently this codebase is using mobx as state management, provider is be like Injector & Consumer. Every page have their own provider and state so it would have a global state too at main level to prevent state conflict between pages. Since build context almost is everything when doing any action so almost everything here will need build context and respect with HOC concepts.

# Folder Structure

### api

Api is mainly for storing http request & response.

### components

Component is mainly storing those view is shared between many pages.

### pages

Pages is mainly storing pages usually for those need state control.

### service

Service is mainly storing third party services like http requester, audio player, recorder, location service.

### utils

Utils is just store utility methods.


# Development Guideline

### Application State Design

We using mobx as state management & provider as injector. We will have a global level / app level state called `AppMobx`. You can use it anywhere of your widget, For every widget have own mobx state and have to inject mobx using provider at Page & Widget use the mobx and take it from provider.

### Naming Conventions

* For mobx state file, we suggest go with `[page_name]Mobx`.
* For ui / view file, we suggest go with `[page_name]Page` & `[page_name]Widge`.

### Page Design Structure

Every page is a new pages widget, as much as possible don't make the page dynamic mean one page repeatly use unless it's design and all the thing quite similar. Why we do this? I don't want anyone because of want to support dynamically rendering then break the type-safety by default so not suggested go with dynamic render unless components.

### Start App

```
$ flutter packages pub run build_runner build
$ flutter run
```