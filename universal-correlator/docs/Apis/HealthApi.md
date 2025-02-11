# HealthApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**health**](HealthApi.md#health) | **GET** /health | Returns a health summary |


<a name="health"></a>
# **health**
> List health(component)

Returns a health summary

### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **component** | **String**| The component to return health for | [optional] [default to null] |

### Return type

[**List**](../Models/HealthState.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

