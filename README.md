# Venoid Admin Datatable Component

[![npm](https://img.shields.io/npm/v/@venoid/admin-datatable?color=green)](https://www.npmjs.com/package/@venoid/admin-datatable)
![npm bundle size (scoped)](https://img.shields.io/bundlephobia/min/@venoid/admin-datatable)

Datatable component for your administration provides you good options how to load your data from an api to a table with an pagination.

![screenshot-example](https://camo.githubusercontent.com/ff5a0541832d8019432578c7c020d4e8699f6cf5/68747470733a2f2f6269746275636b65742e6f72672f76656e6f69642f61646d696e2d646174617461626c652f7261772f306138663036303464366163613665623538393736656538663839303033306532633539623766312f696d616765732f6578616d706c652e706e67)

## Props
| Props         | Type    | Default   |                                      |
|---------------|---------|-----------|--------------------------------------|
| table-columns | Array   | undefined | Array of objects with options   |
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
