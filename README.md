# HashMap
Ruby implementation of HashMap class to store key / value pairs.

## Use Overview
### Create
```
hash_map = HashMap.new
```


### Set a key/value pair
```
hash_map.set('key1', 'value1')
```


### Get Value
```
hash_map.get('key1')
```

### Check if key exists
```
hash_map.has?('key1') # Output: true

hash_map.has?('key11111') # Output: false
```

### Remove key/value pair
```
hash_map.remove('key1')
```


### Get Length
```
hash_map.length # Output: 1
```


### Clear hash_map
```
hash_map.clear
```
Note this removes all entries but does not remove buckets (if buckets have been added) or change capacity (if capacity was increased)


