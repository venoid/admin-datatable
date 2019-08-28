<template>
  <div id="app">
    <h1>Venoid datatable</h1>
    <div class="example-container">
      <venoid-datatable
        :table-columns="tableColumns"
        :on-api-call="getBooks"
      />
    </div>
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
    },
    getBooks({ currentPage, perPageCount }) {
      return new Promise(async (resolve, reject) => {
        var oReq = new XMLHttpRequest();
        oReq.onreadystatechange = function() {
          if (this.readyState == 4 && this.status == 200) {
            resolve({
              data: JSON.parse(this.responseText),
              total: JSON.parse(this.responseText).length
            })
          }
          if (this.status == 404) {
              reject('API endpoint not found')
          }
        }
        oReq.open("GET", "https://my-json-server.typicode.com/dmitrijt9/book-api-mock/books")
        oReq.onerror = function(e) {
          reject(e)
        }
        oReq.send()
      })
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

.example-container {
  padding-top: 16px;
  margin: auto;
  max-width: 80%;
}
</style>
