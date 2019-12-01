<template>
    <v-layout>
        <v-flex xs12>
            <v-layout column>
                
                <div class="app-page-title grey lighten-4">
                    <div class="page-title-wrapper">
                        <div class="page-title-heading">
                            <div class="page-title-icon">
                                <v-img src="https://cdn.vuetifyjs.com/images/logos/logo.svg" alt="Vuetify"></v-img>
                            </div>
                            <div>
                                Kategori Buku
                                <div class="page-title-subheading">
                                    <div class="breadcrumbs">
                                        <v-breadcrumbs :items="itembreadcrumbs" style="padding:0">
                                            <template v-slot:item="props">
                                            <v-breadcrumbs-item
                                                :to="{name : props.item.href }"
                                                :class="[props.item.disabled && 'disabled']"
                                            >
                                                {{ props.item.text.toUpperCase() }}
                                            </v-breadcrumbs-item>
                                            </template>
                                        </v-breadcrumbs>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="page-title-actions">
                            <div class="my-2">
                                <v-btn color="primary" dark class="mb-2" @click="addItem()">
                                    <v-icon left dark>mdi-plus-box</v-icon> Tambah
                                </v-btn>
                                <!-- <v-btn color="primary" dark class="mb-2" :to="{name:'tableAdd'}" >
                                    <v-icon left dark>mdi-plus-box</v-icon> Tambah
                                </v-btn> -->
                            </div>
                        </div>

                    </div>
                </div>
                
                <br />
                
                <v-card>
                    <v-card-title>
                        List Kategori Buku
                        <v-spacer></v-spacer>
                        
                        <v-text-field
                            v-model="search"
                            append-icon="search"
                            label="Search"
                            single-line
                            hide-details
                            >
                        </v-text-field>

                    </v-card-title>

                    <v-data-table
                        :headers="headers"
                        :items="itemcategorybook"
                        :search="search">

                        <template v-slot:item.action="{ item }">
                            <v-icon small class="mr-2" @click="editItem(item)">
                                edit
                            </v-icon>
                            <v-icon small @click="deleteItem(item, 'no')">
                                delete
                            </v-icon>

                        </template>

                    </v-data-table>

                </v-card>

                <v-row justify="center">

                    <v-dialog v-model="dialog" persistent max-width="500px">
                        <v-card>
                            <v-card-title>
                                <span class="headline">{{ formTitle }}</span>
                            </v-card-title>

                            <v-card-text>
                                <v-container>
                                    <v-row>
                                    <v-col cols="12" sm="12" md="12">
                                        <v-text-field v-model="editedItem.name" label="Name"></v-text-field>
                                    </v-col>
                                    </v-row>
                                </v-container>
                            </v-card-text>

                            <v-card-actions>
                                <v-spacer></v-spacer>
                                <v-btn color="blue darken-1" text @click="close">Cancel</v-btn>
                                <v-btn color="primary" :loading="btnLoading" @click="save">{{formBtnTitle}}</v-btn>
                            </v-card-actions>
                        </v-card>
                    </v-dialog>
                    
                    <v-dialog v-model="dialogDelete" persistent max-width="290">
                        <v-card>
                            <v-card-title class="headline">Hapus data?</v-card-title>
                            <v-card-text>
                                Data <b><i>{{itemTemp.name}}</i></b> akan terhapus permanent apa anda yakin ?
                            </v-card-text>
                            <v-card-actions>
                                <v-spacer></v-spacer>

                                <v-btn @click="dialogDelete = false">Cancel</v-btn>
                                <v-btn color="primary" :loading="btnLoading" @click="deleteItem(itemTemp, 'ok')">OK</v-btn>
                                
                                <!-- <v-btn color="green darken-1" text @click="dialogDelete = false">Cancel</v-btn>
                                <v-btn color="green darken-1" text :loading="btnLoading" @click="deleteItem(itemTemp, 'ok')">OK</v-btn> -->
                            </v-card-actions>
                        </v-card>
                    </v-dialog>
                </v-row>  

            </v-layout>
        </v-flex>
    </v-layout>
</template>

<script>
    import { mapState, mapGetters } from 'vuex'

    export default {
        data: () => ({
            
            btnLoading: false,
            itemTemp:[],
            search: '',
            headers: [
                { text: 'Nama', align: 'left', value: 'name',},
                { text: 'Dibuat', value: 'created_at' },
                { text: 'Actions', value: 'action', sortable: false },
            ], 
            itembreadcrumbs: [
                {
                    text: 'Book',
                    disabled: false,
                    href: 'book',
                },
                {
                    text: 'Kategori Buku',
                    disabled: true,
                    href: 'bookcategory',
                },
            ],
            editedIndex: -1,
            deleteIndex:-1,
            editedItem: {
                name: '',
            },
            defaultItem: {
                name: '',
            },
            dialog: false, 
            dialogDelete:false,

        }),
        watch: {

            dialog (val) {
                val || this.close()
            },

        },
        mounted (){
            
        },
        created() {
            this.loadBookCategories();
        },
        methods: {
            
            loadBookCategories(url){
                url = url || 'book-category/list';
                this.$store.dispatch('bookcategories/ACT_LOADBOOKCATEGORIES', url)
            },
            save () {
                this.btnLoading = true

                if (this.editedIndex > -1) {
                    
                    this.$store.dispatch('bookcategories/ACT_UPDATE', this.editedItem)
                    .then(res =>{
                        toast.fire({
                            type: 'success',
                            title: "Success Updated Category"
                        });
                    })
                    .catch(err => {
                        toast.fire({
                            type: 'error',
                            title: 'Failed Deleted Category, Please Check Connection & Try Again .'
                        });
                    })
                    .finally(()=>{
                        this.btnLoading = false
                        this.close()
                    });
                    
                } else {
                    this.$store.dispatch('bookcategories/ACT_SAVE', this.editedItem)
                    .then(res =>{
                        toast.fire({
                            type: 'success',
                            title: "Success Created Category"
                        });
                    })
                    .catch(err => {
                        toast.fire({
                            type: 'error',
                            title: 'Failed Deleted Category, Please Check Connection & Try Again .'
                        });
                    })
                    .finally(()=>{
                        this.btnLoading = false
                        this.close()
                    });
                }
                
            },
            addItem(){
                this.dialog = true
            },
            editItem(item){
                this.editedIndex = this.itemcategorybook.indexOf(item)
                this.editedItem = Object.assign({}, item)
                this.dialog = true
            },
            deleteItem(item, value) {
                const deleteIndex = this.itemcategorybook.indexOf(item)
                this.itemTemp = item
                if(value == "ok"){
                    this.btnLoading = true
                    this.$store.dispatch('bookcategories/ACT_DELETED', {
                        index: deleteIndex,
                        id:item.id
                    })
                        .then(res =>{
                            toast.fire({
                                type: 'success',
                                title: "Success Deleted Category"
                            });
                        })
                        .catch(err => {
                            console.log(err)
                            toast.fire({
                                type: 'error',
                                title: 'Request Failed, Please Check Connection & Try Again .'
                            });
                        })
                        .finally(()=>{
                            this.btnLoading = false
                            this.dialogDelete = false
                            this.close()
                        });
                } else {
                    this.dialogDelete = true
                }
                
                // confirm('Are you sure you want to delete this item?') && this.itemcategorybook.splice(index, 1)
            },
            close () {
                this.dialog = false
                setTimeout(() => {
                this.editedItem = Object.assign({}, this.defaultItem)
                this.editedIndex = -1
                }, 300)
            },
        },
        computed:{
            itemcategorybook () {
                return this.$store.state.bookcategories.listbookcategories
            },
            formTitle () {
                return this.editedIndex === -1 ? 'Tambah Data' : 'Edit Data'
            },
            formBtnTitle () {
                return this.editedIndex === -1 ? 'Simpan' : 'Update'
            },
        }
            
    }
</script>