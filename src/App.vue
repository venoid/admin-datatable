<template>
  <div id="app">
    <h1>Venoid datatable</h1>
    <venoid-datatable
      :table-columns="tableColumns"
    />
  </div>
</template>

<script>
import VenoidDatatable from './venoid-datatable.vue';
export default {
  name: 'app',
  components: {
    VenoidDatatable,
  },
  data() {
    return {
      tableColumns: [
        {
          type: 'id',
          field: (r) => r.id,
          label: 'ID',
          width: '20'
        },
        {
          type: 'string',
          label: 'Title',
          field: (r) => r.title,
          width: '60'
        },
        {
          type: 'number',
          label: 'Author Id',
          field: (r) => r.author_id,
          width: '60'
        },
        {
          type: 'number',
          label: 'Pages',
          field: (r) => r.pages,
          width: '60'
        },
        {
          type: 'string',
          label: 'Release Date',
          field: (r) => r.releaseDate,
          width: '60'
        },
        {
          type: 'string',
          label: 'ISBN',
          field: (r) => r.isbn,
          width: '60'
        },
        {
          type: 'action',
          label: 'Actions',
          width: '5',
          actions: [
            {
              callback: (rowData) => {
                this.test(rowData)
              },
              icon: 'pencil'
            }
          ]
        }
      ]
    }
  },
  methods: {
    test(data) {
      window.confirm(`${data.title}`)
    }
  }
};
</script>

<style lang="scss">
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
