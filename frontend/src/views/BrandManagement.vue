<template>
  <v-data-table
    :headers="headers"
    :items="desserts"
    class="elevation-1"
  >
    <template #top>
      <v-toolbar
        flat
      >
        <v-divider
          class="mx-4"
          inset
          vertical
        />
        <v-spacer />
        <v-dialog
          v-model="dialog"
          max-width="500px"
        >
          <template #activator="{ props }">
            <v-btn
              color="primary"
              dark
              class="mb-2"
              v-bind="props"
            >
              New Item
            </v-btn>
          </template>
          <v-card>
            <v-card-title>
              <span class="text-h5">{{ formTitle }}</span>
            </v-card-title>

            <v-card-text>
              <v-container>
                <v-row>
                  <v-col
                    cols="12"
                    sm="6"
                    md="4"
                  >
                    <v-text-field
                      v-model="editedItem.name"
                      label="Name"
                    />
                  </v-col>
                  <v-col
                    cols="12"
                    sm="6"
                    md="4"
                  >
                    <v-text-field
                      v-model="editedItem.logo"
                      label="Logo"
                    />
                  </v-col>
                  <v-col
                    cols="12"
                    sm="6"
                    md="4"
                  >
                    <v-text-field
                      v-model="editedItem.website_url"
                      label="Website Url"
                    />
                  </v-col>
                  <v-col
                    cols="12"
                    sm="6"
                    md="4"
                  >
                    <v-text-field
                      v-model="editedItem.founded_year"
                      label="Founded Year"
                    />
                  </v-col>
                  <v-col
                    cols="12"
                    sm="6"
                    md="4"
                  >
                    <v-text-field
                      v-model="editedItem.primary_contact"
                      label="Primary contact"
                    />
                  </v-col>
                </v-row>
              </v-container>
            </v-card-text>

            <v-card-actions>
              <v-spacer />
              <v-btn
                color="blue-darken-1"
                variant="text"
                @click="close"
              >
                Cancel
              </v-btn>
              <v-btn
                color="blue-darken-1"
                variant="text"
                @click="save"
              >
                Save
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
        <v-dialog
          v-model="dialogDelete"
          max-width="500px"
        >
          <v-card>
            <v-card-title class="text-h5">
              Are you sure you want to delete this brand?
            </v-card-title>
            <v-card-actions>
              <v-spacer />
              <v-btn
                color="blue-darken-1"
                variant="text"
                @click="closeDelete"
              >
                Cancel
              </v-btn>
              <v-btn
                color="blue-darken-1"
                variant="text"
                @click="deleteItemConfirm"
              >
                OK
              </v-btn>
              <v-spacer />
            </v-card-actions>
          </v-card>
        </v-dialog>
      </v-toolbar>
    </template>
    <template #item.actions="{ item }">
      <v-icon
        size="small"
        class="me-2"
        @click="editItem(item.raw)"
      >
        mdi-pencil
      </v-icon>
      <v-icon
        size="small"
        @click="deleteItem(item.raw)"
      >
        mdi-delete
      </v-icon>
    </template>
    <template #no-data>
      <v-btn
        color="primary"
        @click="initialize"
      >
        Reset
      </v-btn>
    </template>
  </v-data-table>
</template>
<script setup>
import {computed, onMounted, ref, watch} from "vue";
import {
  VDataTable
} from "vuetify/labs/VDataTable";
    const dialog = ref (false)
    const dialogDelete = ref (false)
    const headers = ref([
      {
        title: 'Name',
        align: 'start',
        key: 'name',
        sortable: false
      },
      { title: 'Logo', key: 'logo', sortable: false  },
      { title: 'Website Url', key: 'website_url' ,  sortable: false},
      { title: 'Founded Year', key: 'founded_year', sortable: false },
      { title: 'Primary Contact', key: 'primary_contact' ,  sortable: false},
      { title: 'Actions', key: 'actions', sortable: false },
    ])
    const desserts =   ref([
      {
        name: 'Bradtke1 Inc',
        logo: 'https://loremflickr.com/50/50',
        website_url: 'http://ward.example/rozella.hane',
        founded_year: 1955,
        primary_contact: 'Sanora Berge',
      },
      {
        name: 'Bradtke2 Inc',
        logo: 'https://loremflickr.com/50/50',
        website_url: 'http://ward.example/rozella.hane',
        founded_year: 1955,
        primary_contact: 'Sanora Berge',
      },
      {
        name: 'Bradtke3 Inc',
        logo: 'https://loremflickr.com/50/50',
        website_url: 'http://ward.example/rozella.hane',
        founded_year: 1955,
        primary_contact: 'Sanora Berge',
      },
      {
        name: 'Bradtke4 Inc',
        logo: 'https://loremflickr.com/50/50',
        website_url: 'http://ward.example/rozella.hane',
        founded_year: 1955,
        primary_contact: 'Sanora Berge',
      }
    ])
    const editedIndex = ref(-1)
    const editedItem = ref ({
      name: '',
      logo: '',
      website_url: '',
      founded_year: 0,
      primary_contact: ''
    })
    const defaultItem = ref({
      name: '',
      logo: '',
      website_url: '',
      founded_year: 0,
      primary_contact: ''
    })

const formTitle = computed(() => {
  return editedIndex.value === -1 ? 'New Item' : 'Edit Item'
})

watch(dialog, (val) => {
  val || close()
})

watch(dialogDelete, (val) => {
  val || closeDelete()
})

const  editItem = (item) => {
      editedIndex.value = desserts.value.indexOf(item)
      editedItem.value = Object.assign({}, item)
      dialog.value = true
    }
const deleteItem = (item) => {
      editedIndex.value = desserts.value.indexOf(item)
      editedItem.value = Object.assign({}, item)
      dialogDelete.value = true
    }
const deleteItemConfirm = ()  => {
      desserts.value.splice(editedIndex.value, 1)
      closeDelete()
    }

const  close = () => {
      dialog.value = false
}

const  closeDelete = () => {
      dialogDelete.value = false
    }

const  save = ()  => {
      if (editedIndex.value > -1) {
        Object.assign(desserts.value[editedIndex.value], editedItem.value)
      } else {
        desserts.value.push(editedItem.value)
      }
      close()
    }
</script>
