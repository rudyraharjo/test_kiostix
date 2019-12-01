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
                                Buku
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
                            </div>
                        </div>

                    </div>
                </div>
                
                <br />

                <v-card>
                    <v-card-title>
                        
                        List Buku
                        <v-spacer></v-spacer>
                        <v-row>
                            <v-flex sm6 d-flex>
                                <v-select
                                    :items="itemauthors"
                                    label="Filter Nama Penulis"
                                    item-text="name"
                                    item-value="id"
                                    @change="filterByAuthor"
                                ></v-select>
                            </v-flex>
                            <v-flex sm6 d-flex>
                                <v-text-field
                                    v-model="search"
                                    append-icon="search"
                                    label="Search"
                                    single-line
                                    hide-details
                                    >
                                </v-text-field>
                            </v-flex>
                        </v-row>
                        <v-spacer></v-spacer>

                    </v-card-title>

                    <v-data-table
                        :headers="headers"
                        :items="itemsbooks"
                        :search="search">

                        <template v-slot:item.pic="{ item }">
                            <v-img :src="item.pic" :alt="item.name" width="200px" height="80px"></v-img>
                        </template>

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

                    <v-dialog v-model="dialog" persistent max-width="600px">
                        <v-card>
                            <v-card-title>
                                <span class="headline">{{ formTitle }}</span>
                            </v-card-title>

                            <v-form
                                ref="form"
                                v-model="valid"
                                :lazy-validation="lazy"
                                
                            >
                                
                                <v-card-text>
                                    <v-container>
                                        <v-row>
                                            <v-col cols="12" sm="12" md="12">
                                                <v-text-field v-model="editedItem.name" label="Nama Buku"></v-text-field>
                                            </v-col>
                                            <v-col cols="12" sm="12" md="6">
                                                <v-select
                                                item-text="name"
                                                item-value="id"
                                                v-model="editedItem.id_author"
                                                :items="itemauthors"
                                                label="Penulis"
                                                required
                                                ></v-select>
                                            </v-col>
                                            <v-col cols="12" sm="12" md="6">
                                                <v-select
                                                    item-text="name"
                                                    item-value="id"
                                                    v-model="editedItem.id_categorybook"
                                                    :items="itembookcategories"
                                                    label="Kategori"
                                                    required
                                                ></v-select>
                                            </v-col>
                                            <v-col cols="12" sm="12" md="12">
                                                <v-file-input
                                                    :rules="rules"
                                                    accept="image/png, image/jpeg, image/bmp"
                                                    placeholder="Pilih gambar"
                                                    prepend-icon="mdi-camera"
                                                    label="Pilih gambar"
                                                    @change="onFileChanged"
                                                ></v-file-input>

                                                <!-- <v-card class="mx-auto" max-width="400" v-if="imageUrl != ''">
                                                    <v-img class="white--text align-end" height="200px" :src="imageUrl">
                                                    </v-img>
                                                </v-card> -->

                                            </v-col>
                                            
                                            <v-col cols="12" sm="12" md="12">
                                                <v-text-field v-model="editedItem.description" label="Deskripsi"></v-text-field>
                                            </v-col>
                                            
                                        </v-row>
                                    </v-container>
                                </v-card-text>

                                <v-card-actions>
                                    <v-spacer></v-spacer>
                                    <v-btn color="blue darken-1" text @click="close">Cancel</v-btn>
                                    <v-btn color="primary" :loading="btnLoading" @click="save">{{formBtnTitle}}</v-btn>
                                </v-card-actions>

                            </v-form>
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

                                <!-- <v-btn color="primary darken-1" text @click="dialogDelete = false">Cancel</v-btn>
                                <v-btn color="red darken-1" text :loading="btnLoading" @click="deleteItem(itemTemp, 'ok')">OK</v-btn> -->
                            </v-card-actions>
                        </v-card>
                    </v-dialog>
                </v-row>  
                
            </v-layout>
        </v-flex>
    </v-layout>
</template>

<script>
    export default {
        
        data: () => ({
            valid: true,
            lazy: false,
            rules: [
                value => !value || value.size < 2000000 || 'Ukuran Gambar harus kurang dari 2 MB!',
            ],
            values: null,
            btnLoading: false,
            itemTemp:[],
            search: '',
            byauthor:0,
            headers: [
                { text: 'Pic', value: 'pic' },
                { text: 'Judul Buku', align: 'left', value: 'name'},
                { text: 'Penulis', align: 'left', value: 'author_name'},
                { text: 'Kategori', value: 'category_book' },
                { text: 'Actions', value: 'action', sortable: false },
            ], 
            itembreadcrumbs: [
                {
                    text: 'Dashboard',
                    disabled: false,
                    href: 'dashboard',
                },
                {
                    text: 'Book',
                    disabled: true,
                    href: 'book',
                },
            ],
            editedIndex: -1,
            deleteIndex:-1,
            editedItem: {
                name: '',
                id_author:0,
                id_categorybook:0,
                image:'',
                description: '',
            },
            defaultItem: {
                name: '',
                id_author:0,
                id_categorybook:0,
                image:'',
                description: '',
            },
            dialog: false, 
            dialogDelete:false,
            file_upload:''
        }),
        watch: {

            dialog (val) {
                val || this.close()
            },

        },
        mounted (){
            
        },
        created() {
            this.loadBookList();
            this.loadBookCategories();
            this.loadauthor();
        },
        methods: {
            filterByAuthor(val) {
                this.$store.dispatch('book/ACT_GETBYAUTHORID', {id:val})
                
            },
            onFileChanged(){                
                if (!event.target.files.length) return;
                this.editedItem.image = event.target.files[0];
            },
            
            loadBookList(url){
                url = url || 'book/list';
                this.$store.dispatch('book/ACT_LOADBOOK', url)
            },
            loadBookCategories(url){
                url = url || 'book-category/list';
                this.$store.dispatch('bookcategories/ACT_LOADBOOKCATEGORIES', url)
            },
            loadauthor(url){
                url = url || 'author/list';
                this.$store.dispatch('author/ACT_LOADAUTHORS', url)
            },
            save () {

                this.btnLoading = true

                if (this.editedIndex > -1) {

                    let formData = new FormData();
                    formData.append('id', this.editedItem.id);
                    formData.append('name', this.editedItem.name);
                    formData.append('id_author', this.editedItem.id_author);
                    formData.append('id_categorybook', this.editedItem.id_categorybook);
                    formData.append('pic', this.editedItem.image);
                    formData.append('description', this.editedItem.description);
                    
                    this.$store.dispatch('book/ACT_UPDATE', formData)
                    .then(res =>{
                        toast.fire({
                            type: 'success',
                            title: "Success Updated Book"
                        });
                    })
                    .catch(err => {
                        toast.fire({
                            type: 'error',
                            title: 'Failed Update please check form field'
                        });
                        
                    })
                    .finally(()=>{
                        this.btnLoading = false
                        this.close()
                    });
                    
                } else {

                    
                    //if(this.$refs.form.validate()) { 
                        
                        let formData = new FormData();

                        formData.append('name', this.editedItem.name);
                        formData.append('id_author', this.editedItem.id_author);
                        formData.append('id_categorybook', this.editedItem.id_categorybook);
                        formData.append('pic', this.editedItem.image);
                        formData.append('description', this.editedItem.description);

                        this.$store.dispatch('book/ACT_SAVE', formData)
                        .then(res =>{
                            toast.fire({
                                type: 'success',
                                title: "Success Created Menu"
                            });
                        })
                        .catch(err => {
                            toast.fire({
                                type: 'error',
                                title: 'Failed Update please check form field'
                            });
                        })
                        .finally(()=>{
                            this.btnLoading = false
                            this.close()
                        });
                    //}
                }
                
            },
            addItem(){
                this.dialog = true
            },
            editItem(item){
                
                this.editedIndex = this.itemsbooks.indexOf(item)
                // this.editedItem = Object.assign({}, item)                
                this.editedItem= {
                    id:item.id,
                    name: item.name,
                    id_author:parseInt(item.author),
                    id_categorybook:parseInt(item.id_categorybook),                    
                    description: item.description,
                }

                setTimeout(()=>{
                    this.dialog = true
                },500);

            },
            deleteItem(item, value) {
                const deleteIndex = this.itemsbooks.indexOf(item)
                this.itemTemp = item
                
                if(value == "ok"){
                    this.btnLoading = true
                    this.$store.dispatch('book/ACT_DELETED', {
                        index: deleteIndex,
                        id:item.id
                    })
                        .then(res =>{
                            toast.fire({
                                type: 'success',
                                title: "Success Deleted Book"
                            });
                        })
                        .catch(err => {
                            toast.fire({
                                type: 'error',
                                title: 'Failed Update please connection'
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
                
                // confirm('Are you sure you want to delete this item?') && this.itemtables.splice(index, 1)
            },
            close () {
                //console.log(this.$refs.form.value)
                // this.$refs.form.reset()
                this.editedItem = Object.assign({}, this.defaultItem)
                this.categories=[]
                this.editedIndex = -1
                this.dialog = false
            },
        },
        computed:{
            itemsbooks () {
                return this.$store.state.book.listbooks
            },
            itembookcategories(){
                return this.$store.state.bookcategories.listbookcategories
            },
            itemauthors(){
                return this.$store.state.author.listauthors
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