# Venoid Admin Datatable Component

Datatable component for your administration provides you good options how to load and render your data in a simple table.

![screenshot-example](https://bitbucket.org/venoid/admin-datatable/raw/a28b0c2d65dc8d3b0a5519a9ed44c9c66e51a706/images/example.png)

## Props
| Props         | Type    | Default   |                                      |
|---------------|---------|-----------|--------------------------------------|
| table-columns | Array   | undefined | Array of objects with options   |
| table-data    | Array   | undefined | Array with your data                 |
| is-loading    | Boolean | false     | When true, loading animation appears |

#### table-columns options
```
{
  type: 'string' // Enum['id', 'number', 'string ],
  label: 'Name'  // String,
  field: (row) => row.name //Render function for data,
  width: '60' // String
}
```

## Demo
To see demo run a project:

1. Install npm dependencies
2. Run with `npm run serve` / `yarn serve`
