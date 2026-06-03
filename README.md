
# Flutter Artist Backend Sandbox

`flutter_artist_backend_sandbox` is a premium, ready-to-use local **fake backend** environment and API sandbox designed for rapid prototyping, educational purposes, and powering complex SaaS or Dashboard applications.

> **Note on Ecosystem Independence:** While this core engine is natively utilized to power the official **flutter_artist_demo** ecosystem, it is designed to be **100% independent**. Developers can use this package for learning purposes or as a standalone simulated backend to prototype any individual or commercial Flutter application without being locked into specific UI frameworks.

---

## ⚡ Web Platform Prerequisite (Crucial)

If you are running your Flutter application on the **Web** platform, the embedded database engine requires the SQLite WebAssembly binary to function locally. Please follow these steps before launching your app:

1. Navigate to the official SQLite download portal: **[https://github.com/simolus3/sqlite3.dart/releases](https://github.com/simolus3/sqlite3.dart/releases)**
2. Find and download the **`sqlite3.wasm`**
3. Copy sqlite3.wasm into the **`web/`** directory of your Flutter project root workspace.

---



[LIVE DEMO](https://o7planning.github.io/demo/flutter/flutter_artist_backend_sandbox_demo/)

[Download Demo Source Code](https://github.com/o7planning/flutter_artist_backend_sandbox_demo)

![Demo GIF](https://o7planning.github.io/docs/flutter/flutter_artist_backend_sandbox/images/demo.gif)
 



##  Installation

Add the following dependencies to your project's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_artist_backend_sandbox: ^latest
  dio: ^latest
  msw_dio_interceptor: ^1.0.5
  url_launcher: ^6.3.2
```

---

##  Quick Start & Dio Integration

To activate the sandbox network layer, fetch the centralized interceptor instance and inject it directly into your `Dio` client configuration pipeline:

```dart
import 'package:dio/dio.dart';
import 'package:msw_dio_interceptor/msw_dio_interceptor.dart';  
import 'package:flutter_artist_backend_sandbox/flutter_artist_backend_sandbox.dart'; 

void setupMockNetworkClient() {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://your-api-domain.com',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ),
  );

  // Initialize and retrieve the standalone artist backend environment interceptor
  final MockInterceptor mockBackendInterceptor = getFlutterArtistBackendSandboxInterceptor();

  dio.interceptors.addAll([
    // Core engine handler to mock relational DB states locally
    mockBackendInterceptor,
  ]);
}

``` 

## ️ Handling Static Resource Images

Many entity payloads returned by the sandbox contain an `imagePath` property (e.g., employee avatars, product images, or album covers) represented as a relative sub-path.

#### Example Payload Context
```json
{
   "id": 2,
   "userName": "tom",
   "fullName": "Tom",
   "enabled": true,
   "activated": true,
   "email": "tom@example.com",
   "accessToken": null,  
   "lastActiveDatetime": null,
   "isSystemUser": true,
   "imagePath": "/static/images/app-user/tom.png"
}

```

To resolve these relative paths into fully qualified, loadable asset URLs inside your Flutter Image widgets, implement the following helper utility logic within your repository or mapping layer:

```dart
const String staticResourceBaseURL = "https://o7planning.github.io/static/demo/flutter/flutter_artist_demo";

String? getStaticResourceURL(String? path) {
  if (path == null || path.isEmpty) {
    return null;
  }
  // If the path is already an absolute network URL or a base64 data string, return as-is
  if (path.startsWith("http://") || 
      path.startsWith("https://") || 
      path.startsWith("data:image")) {
    return path;
  }
  // Otherwise, append the relative path to the official centralized host storage base URL
  return "$staticResourceBaseURL$path";
}

```

You can then pass the computed string securely straight into a `NetworkImage` or `CachedNetworkImage` component to display the asset beautifully in your app layout.


--- 

##  Architecture & API Endpoint Convention

To achieve absolute return-type predictability, all simulated REST paths follow a strict structural naming convention. By looking at the URI prefix, developers can instantly determine the response wrapper layout and level of model granularity:

1. `/rest/page/...` ── Always returns a paginated list structure wrapped inside a `PageDataImpl<I>` class object (`pagination` + `items`).
2. `/rest/record/...` ── Always returns a single entity object with full detailed properties (`Detail` / `Data`).
3. `/rest/action/...` ── Executes pure business logic routines or destructive tasks that explicitly return empty or `void` responses.
4. `/rest/features/...` ── Reserved for advanced simulation capabilities (e.g., Dynamic Field-Based JSON queries).

---

##  Core API Blueprint

Below is an overview of the core available API routes, accompanied by real schema payloads.

### 1. Paginated Data Inquiries (GET: `/rest/page/...`)

*These endpoints wrap responses inside a paginated schema containing standard pagination metrics and an active item collection.*

* `GET /rest/page/album-info/search` ── Dynamic query filter for minimalist album criteria.
* `GET /rest/page/album-info/all` ── Pulls every available album entity into a single unpaginated layout page.
* `GET /rest/page/currency-info/search` ── Query, paginate, and scan basic world currency assets.
* `GET /rest/page/employee-info/search` ── Paginated employee lists with standard text filtering parameters.

#### Example Payload: `GET /rest/page/album-info/all`

```json
{
   "pagination": null,
   "items": [
      {
         "id": 1,
         "code": "A1",
         "name": "Favorite English Songs",
         "seqNum": 10,
         "published": true,
         "locked": true,
         "imagePath": "/static/images/album/"
      },
      {
         "id": 2,
         "code": "A2",
         "name": "Uncategorized",
         "seqNum": 20,
         "published": true,
         "locked": true,
         "imagePath": "/static/images/album/"
      }
   ]
}

```

#### Example Payload: `GET /rest/page/currency-info/search`

```json
{
   "pagination": {
      "currentPage": 1,
      "pageSize": 20,
      "totalItems": 29,
      "totalPages": 2
   },
   "items": [
      {
         "id": "USD",
         "symbol": "$",
         "name": "US Dollar"
      },
      {
         "id": "EUR",
         "symbol": "€",
         "name": "Euro"
      }
   ]
}

```

---

### 2. Single Record Detailed Fetching (GET: `/rest/record/...`)

*These endpoints bypass list metadata and return the absolute exhaustive profile field properties of a specific entry.*

* `GET /rest/record/album-data/{id}` ── Fetches intensive fields, descriptions, and full album settings.
* `GET /rest/record/currency-data/{id}` ── Provides extensive structural summaries and descriptive guidelines for specific currencies.

#### Example Payload: `GET /rest/record/currency-data/USD`

```json
{
   "id": "USD",
   "symbol": "$",
   "name": "US Dollar",
   "description": "The USD (United States dollar) is the official currency of the United States of America. The United States dollar, or U.S. dollar, is made up of 100 cents. It is represented by the symbol $ or US$ to differentiate it from other dollar-based currencies."
}

```

---

### 3. Mutative Record Operations (PUT / POST: `/rest/record/...`)

*Modifies or creates persistent states on the simulated local database table.*

* `PUT /rest/record/customer-data/update-code` ── Modifies unique structural operational codes for clients.
* `PUT /rest/record/customer-data/update-vip` ── Instantly toggles the VIP status metrics of a consumer record.

---

### 4. Pure Logic Actions & Destructions (DELETE / POST: `/rest/action/...`)

*These endpoints perform state execution or deletion tasks, cleanly returning an empty JSON target `{}` upon success.*

* `DELETE /rest/action/employee/delete/{id}` ── Permanently drops an employee record from the running session database.
* `POST /rest/action/contributor/add-multi-by-project-id/{id}` ── Triggers a background transactional procedure to insert batches of workers into a target project workspace.

---

### 5. Specialized Engineering Simulations (GET: `/rest/features/...`)

*Advanced features built to evaluate dynamic structural filters over the network.*

* `GET /rest/features/field-based-json/page/employee-info/{demo-code}` ── Evaluates custom structured dynamic logic blocks transmitted via JSON payload filtering.

#### Example Payload: Dynamic Field-Based JSON Client Object

```json
{
    "connector": "AND",
    "conditions": [
        {
            "field": "searchText",
            "operator": "containsIgnoreCase",
            "value": null
        },
        {
            "connector": "OR",
            "conditions": [
                {
                    "field": "departmentId",
                    "operator": "equalTo",
                    "value": 1
                },
                {
                    "field": "departmentId",
                    "operator": "equalTo",
                    "value": 5
                }
            ]
        }
    ]
}

```

---

##  Complete Documentation Portal

For a full granular catalog of every entity model, interactive API workflow schema, or specialized state configuration blueprints, please check out our official documentation domain site over at **[o7planning Website/Domain]**.
 