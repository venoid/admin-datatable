# Venoid Admin Datatable Component

Datatable component for your administration provides you good options how to load your data from an api to a table with an pagination.

![screenshot-example](https://bitbucket.org/venoid/admin-datatable/raw/a28b0c2d65dc8d3b0a5519a9ed44c9c66e51a706/images/example.png)

## Props
| Props         | Type    | Default   |                                      |
|---------------|---------|-----------|--------------------------------------|
| table-columns | Array   | undefined | Array of objects with options   |
| api           | String   | "https://my-json-server.typicode.com/dmitrijt9/book-api-mock/books" | API url from which you want to get data |
| on-api-call   | Function | undefined | Function which is resolving your api call. Should return promise! Example below.. |
| current-page   | Number  | 1         | Number of the current page (if paginated is true) |
| per-page-options   | Array  | [{value: '5', label: 5}, {value: '10', label: 10}, {value: '15', label: 15}, {value: '20', label: 20}]         | Define your own select box with per page options (if paginated is true) |

#### table-columns options
```
{
  type: 'string' // Enum['id', 'number', 'string ],
  label: 'Name'  // String,
  field: (row) => row.name //Render function for data,
  width: '60' // String
}
```

#### on-api-call function example
- This function is called on component mount
- In parameter is an object with an `api` you've sent to props (additional properties will be added soon)

```
// your on-api-call function
getBooks({ api }) {
  return new Promise(async (resolve, reject) => { // return promise, which will be resolved inside the component
    try {
      const { data } = await axios.get(api) // make your request (axios is just for example, you can call also call graphql server using apollo etc.)
      resolve({ // in resolve function return your data (array) and total count of the data to make pagination work properly
        data,
        total: data.length
      })
    } catch (e) {
      reject(e) // what happens when request fails
    }
  })
}
```

## Demo
To see demo run a project:

1. Install npm dependencies
2. Run with `npm run serve` / `yarn serve`
