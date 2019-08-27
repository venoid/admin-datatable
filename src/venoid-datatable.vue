<template>
  <b-table :data="tableData" :hoverable="true" :loading="isLoading">
    <template slot-scope="props">
      <b-table-column
        v-for="(column, index) in tableColumns"
        :key="index"
        :label="column.label"
        :width="column.width"
        :numeric="column.type === 'id'"
      >
        <div v-if="column.type === 'action'" class="buttons">
          <b-button
            v-for="(action, i) in column.actions"
            :key="`button.${i}`"
            type="is-primary"
            size="is-small"
            outlined
            @click="action.callback(props.row)"
          >
            <b-icon
              :icon="action.icon || 'help-circle'"
              size="is-small"
            ></b-icon>
          </b-button>
        </div>
        <div v-else>
          {{ column.field(props.row) }}
        </div>
      </b-table-column>
    </template>

    <template slot="empty">
      <section class="section">
        <div class="content has-text-grey has-text-centered">
          <p>
            <b-icon icon="emoticon-sad" size="is-large"> </b-icon>
          </p>
          <p>Nothing here.</p>
        </div>
      </section>
    </template>
  </b-table>
</template>

<script>
import axios from 'axios'

export default {
  name: 'venoid-datatable',
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
    }
  },
  async created() {
    this.isLoading = true
    const { data } = await axios.get(this.api)
    this.tableData = data
    this.isLoading = false
  },
  data() {
    return {
      tableData: [],
      isLoading: false
    }
  }
}
</script>
