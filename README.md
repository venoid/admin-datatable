# Venoid Admin Datatable Component

[![npm](https://img.shields.io/npm/v/@venoid/admin-datatable?color=green)](https://www.npmjs.com/package/@venoid/admin-datatable)
![npm bundle size (scoped)](https://img.shields.io/bundlephobia/min/@venoid/admin-datatable)

Datatable component for your administration provides you good options how to load your data from an api to a table with an pagination.

![screenshot-example](https://raw.githubusercontent.com/venoid/admin-datatable/master/images/example.png)

## Props
| Props         | Type    | Default   |                                      |
|---------------|---------|-----------|--------------------------------------|
| table-columns | Array   | undefined | Array of objects with [options](#table-column-options)   |
| on-api-call   | Function | undefined | Function which is resolving your api call. Should return promise! [Example here](#on-api-call-function) |
| current-page   | Number  | 1         | Number of the current page (if paginated is true) |
| per-page-options   | Array  | [{value: '5', label: 5}, {value: '10', label: 10}, {value: '15', label: 15}, {value: '20', label: 20}]         | Define your own select box with per page options (if paginated is true) |

#### table-column options
```
{
  type: 'string' // Enum['id', 'number', 'string ],
  label: 'Name'  // String,
  field: (row) => row.name //Render function for data,
  width: '60' // String
}
```

#### on-api-call function
- This function is called on component create and everytime some action in datatable happens (click on a new page, selec per page etc.)
- In parameter is an object with a `currentPage` and `perPageCount`. It indicates current page and count of data displayed on a page. Additional properties will be added soon...

```
// your on-api-call function
getBooks({ currentPage }) {
  return new Promise(async (resolve, reject) => { // return promise, which will be resolved inside the component
    try {
      const { data } = await axios.get("https://my-json-server.typicode.com/dmitrijt9/book-api-mock/books") // make your request (axios is just for example, you can call also call graphql server using apollo etc.)
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
