<template>
  <div id="app">
    <h1>Venoid datatable</h1>
    <venoid-datatable :is-loading="isLoading"
      :table-columns="tableColumns"
      :table-data="tableData"/>
  </div>
</template>

<script>
import VenoidDatatable from './Datatable.vue';
export default {
  name: 'app',
  components: {
    VenoidDatatable,
  },
  data() {
    return {
      isLoading: false,
      tableColumns: [
        {
          type: 'id',
          field: (r) => r.id,
          label: 'ID',
          width: '20'
        },
        {
          type: 'string',
          label: 'Name',
          field: (r) => r.name,
          width: '60'
        },
        {
          type: 'string',
          label: 'Surname',
          field: (r) => r.surname,
          width: '60'
        },
        {
          type: 'string',
          label: 'Fullname',
          field: (r) => `${r.name} ${r.surname}`,
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
      ],
      tableData: [
        {
          id: 1,
          name: 'John',
          surname: 'Doe'
        },
        {
          id: 2,
          name: 'Luke',
          surname: 'Skywalker'
        },
        {
          id: 3,
          name: 'Barbara',
          surname: 'Streisand'
        }
      ]
    }
  },
  methods: {
    test(data) {
      window.confirm(`${data.name} ${data.surname}`)
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
