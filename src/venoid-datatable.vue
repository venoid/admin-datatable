<template>
  <venoid-table
    :table-columns="tableColumns"
    :table-data="tableData"
    :isLoading="isLoading"
    paginated
    :total-data-count="totalDataCount"
    :error-message="errorMessage"
    :current-page="currentPage"
    @pagination-change="apiCall"
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
  data() {
    return {
      tableData: [],
      isLoading: false,
      totalDataCount: null,
      errorMessage: null,
      page: this.currentPage
    }
  },
  methods: {
    async apiCall({ currentPage, perPage }) {
      this.isLoading = true
      try {
        const {data, total} = await this.onApiCall({
          currentPage,
          perPageCount: perPage
        })
        this.totalDataCount = total
        this.tableData = data
      } catch (e) {
        this.errorMessage = e
      }
      this.isLoading = false
    }
  }
}
</script>
