# Venoid Datatable Component

Datatable component provides you good options how to load and render your data in a simple table.

## Props
| Prop         | Type    | Default   |   |   |
|---------------|---------|-----------|---|---|
| table-columns | Array   | undefined |   |   |
| table-data    | Array   | undefined |   |   |
| is-loading    | Boolean | false     |   |   |

### Table columns
Array of objects with this options:
- type: string representing field type (id, number or string)

- label

- field: function which has in parameter row data, you can define how data will be rendered

- width: string with number, which indicated width of a column

### Table data
Array with your data.

### IsLoading
When true loading animation appears.

## Demo
To see demo run a project:
1. Install npm dependencies
2. Run with `npm run serve` / `yarn serve`
