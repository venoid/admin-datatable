<template>
  <venoid-table
    :table-columns="tableColumns"
    :table-data="tableData"
    :isLoading="isLoading"
    paginated
    :total-data-count="totalDataCount"
    :error-message="errorMessage"
  />
</template>

<script>
import venoidTable from '@venoid/admin-table'

export default {
  name: 'venoid-datatable',
  components: {
    venoidTable
  },
  props: {
    api: {
      type: String,
      default: 'https://my-json-server.typicode.com/dmitrijt9/book-api-mock/books'
    },
    tableColumns: {
      type: Array,
      default() {
        return undefined
      }
    },
    currentPage: {
      type: Number,
      default: 1
    },
    perPageOptions: {
      type: Array,
      default() {
        return [
          {
            value: '5',
            label: 5
          },
          {
            value: '10',
            label: 10
          },
          {
            value: '15',
            label: 15
          },
          {
            value: '20',
            label: 20
          }
        ]
      }
    },
    onApiCall: {
      type: Function,
      default() {
        return undefined
      }
    }
  },
  async created() {
    this.isLoading = true
    try {
      const {data, total} = await this.onApiCall({
        api: this.api
      })
      this.totalDataCount = total
      this.tableData = data
    } catch (e) {
      this.errorMessage = e
    }
    this.isLoading = false
  },
  data() {
    return {
      tableData: [],
      isLoading: false,
      totalDataCount: null,
      errorMessage: null
    }
  }
}
</script>
