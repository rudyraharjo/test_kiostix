(window.webpackJsonp=window.webpackJsonp||[]).push([[4],{56:function(t,e,i){"use strict";i.r(e);var a={data:function(){return{valid:!0,lazy:!1,rules:[function(t){return!t||t.size<2e6||"Ukuran Gambar harus kurang dari 2 MB!"}],values:null,btnLoading:!1,itemTemp:[],search:"",byauthor:0,headers:[{text:"Pic",value:"pic"},{text:"Judul Buku",align:"left",value:"name"},{text:"Penulis",align:"left",value:"author_name"},{text:"Kategori",value:"category_book"},{text:"Actions",value:"action",sortable:!1}],itembreadcrumbs:[{text:"Dashboard",disabled:!1,href:"dashboard"},{text:"Book",disabled:!0,href:"book"}],editedIndex:-1,deleteIndex:-1,editedItem:{name:"",id_author:0,id_categorybook:0,image:"",description:""},defaultItem:{name:"",id_author:0,id_categorybook:0,image:"",description:""},dialog:!1,dialogDelete:!1,file_upload:""}},watch:{dialog:function(t){t||this.close()}},mounted:function(){},created:function(){this.loadBookList(),this.loadBookCategories(),this.loadauthor()},methods:{filterByAuthor:function(t){this.$store.dispatch("book/ACT_GETBYAUTHORID",{id:t})},onFileChanged:function(){event.target.files.length&&(this.editedItem.image=event.target.files[0])},loadBookList:function(t){t=t||"book/list",this.$store.dispatch("book/ACT_LOADBOOK",t)},loadBookCategories:function(t){t=t||"book-category/list",this.$store.dispatch("bookcategories/ACT_LOADBOOKCATEGORIES",t)},loadauthor:function(t){t=t||"author/list",this.$store.dispatch("author/ACT_LOADAUTHORS",t)},save:function(){var t=this;if(this.btnLoading=!0,this.editedIndex>-1){var e=new FormData;e.append("id",this.editedItem.id),e.append("name",this.editedItem.name),e.append("id_author",this.editedItem.id_author),e.append("id_categorybook",this.editedItem.id_categorybook),e.append("pic",this.editedItem.image),e.append("description",this.editedItem.description),this.$store.dispatch("book/ACT_UPDATE",e).then((function(t){toast.fire({type:"success",title:"Success Updated Book"})})).catch((function(t){toast.fire({type:"error",title:"Failed Update please check form field"})})).finally((function(){t.btnLoading=!1,t.close()}))}else{var i=new FormData;i.append("name",this.editedItem.name),i.append("id_author",this.editedItem.id_author),i.append("id_categorybook",this.editedItem.id_categorybook),i.append("pic",this.editedItem.image),i.append("description",this.editedItem.description),this.$store.dispatch("book/ACT_SAVE",i).then((function(t){toast.fire({type:"success",title:"Success Created Menu"})})).catch((function(t){toast.fire({type:"error",title:"Failed Update please check form field"})})).finally((function(){t.btnLoading=!1,t.close()}))}},addItem:function(){this.dialog=!0},editItem:function(t){var e=this;this.editedIndex=this.itemsbooks.indexOf(t),this.editedItem={id:t.id,name:t.name,id_author:parseInt(t.author),id_categorybook:parseInt(t.id_categorybook),description:t.description},setTimeout((function(){e.dialog=!0}),500)},deleteItem:function(t,e){var i=this,a=this.itemsbooks.indexOf(t);this.itemTemp=t,"ok"==e?(this.btnLoading=!0,this.$store.dispatch("book/ACT_DELETED",{index:a,id:t.id}).then((function(t){toast.fire({type:"success",title:"Success Deleted Book"})})).catch((function(t){toast.fire({type:"error",title:"Failed Update please connection"})})).finally((function(){i.btnLoading=!1,i.dialogDelete=!1,i.close()}))):this.dialogDelete=!0},close:function(){this.editedItem=Object.assign({},this.defaultItem),this.categories=[],this.editedIndex=-1,this.dialog=!1}},computed:{itemsbooks:function(){return this.$store.state.book.listbooks},itembookcategories:function(){return this.$store.state.bookcategories.listbookcategories},itemauthors:function(){return this.$store.state.author.listauthors},formTitle:function(){return-1===this.editedIndex?"Tambah Data":"Edit Data"},formBtnTitle:function(){return-1===this.editedIndex?"Simpan":"Update"}}},o=i(0),s=Object(o.a)(a,(function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("v-layout",[i("v-flex",{attrs:{xs12:""}},[i("v-layout",{attrs:{column:""}},[i("div",{staticClass:"app-page-title grey lighten-4"},[i("div",{staticClass:"page-title-wrapper"},[i("div",{staticClass:"page-title-heading"},[i("div",{staticClass:"page-title-icon"},[i("v-img",{attrs:{src:"https://cdn.vuetifyjs.com/images/logos/logo.svg",alt:"Vuetify"}})],1),t._v(" "),i("div",[t._v("\n                            Buku\n                            "),i("div",{staticClass:"page-title-subheading"},[i("div",{staticClass:"breadcrumbs"},[i("v-breadcrumbs",{staticStyle:{padding:"0"},attrs:{items:t.itembreadcrumbs},scopedSlots:t._u([{key:"item",fn:function(e){return[i("v-breadcrumbs-item",{class:[e.item.disabled&&"disabled"],attrs:{to:{name:e.item.href}}},[t._v("\n                                            "+t._s(e.item.text.toUpperCase())+"\n                                        ")])]}}])})],1)])])]),t._v(" "),i("div",{staticClass:"page-title-actions"},[i("div",{staticClass:"my-2"},[i("v-btn",{staticClass:"mb-2",attrs:{color:"primary",dark:""},on:{click:function(e){return t.addItem()}}},[i("v-icon",{attrs:{left:"",dark:""}},[t._v("mdi-plus-box")]),t._v(" Tambah\n                            ")],1)],1)])])]),t._v(" "),i("br"),t._v(" "),i("v-card",[i("v-card-title",[t._v("\n                    \n                    List Buku\n                    "),i("v-spacer"),t._v(" "),i("v-row",[i("v-flex",{attrs:{sm6:"","d-flex":""}},[i("v-select",{attrs:{items:t.itemauthors,label:"Filter Nama Penulis","item-text":"name","item-value":"id"},on:{change:t.filterByAuthor}})],1),t._v(" "),i("v-flex",{attrs:{sm6:"","d-flex":""}},[i("v-text-field",{attrs:{"append-icon":"search",label:"Search","single-line":"","hide-details":""},model:{value:t.search,callback:function(e){t.search=e},expression:"search"}})],1)],1),t._v(" "),i("v-spacer")],1),t._v(" "),i("v-data-table",{attrs:{headers:t.headers,items:t.itemsbooks,search:t.search},scopedSlots:t._u([{key:"item.pic",fn:function(t){var e=t.item;return[i("v-img",{attrs:{src:e.pic,alt:e.name,width:"200px",height:"80px"}})]}},{key:"item.action",fn:function(e){var a=e.item;return[i("v-icon",{staticClass:"mr-2",attrs:{small:""},on:{click:function(e){return t.editItem(a)}}},[t._v("\n                            edit\n                        ")]),t._v(" "),i("v-icon",{attrs:{small:""},on:{click:function(e){return t.deleteItem(a,"no")}}},[t._v("\n                            delete\n                        ")])]}}])})],1),t._v(" "),i("v-row",{attrs:{justify:"center"}},[i("v-dialog",{attrs:{persistent:"","max-width":"600px"},model:{value:t.dialog,callback:function(e){t.dialog=e},expression:"dialog"}},[i("v-card",[i("v-card-title",[i("span",{staticClass:"headline"},[t._v(t._s(t.formTitle))])]),t._v(" "),i("v-form",{ref:"form",attrs:{"lazy-validation":t.lazy},model:{value:t.valid,callback:function(e){t.valid=e},expression:"valid"}},[i("v-card-text",[i("v-container",[i("v-row",[i("v-col",{attrs:{cols:"12",sm:"12",md:"12"}},[i("v-text-field",{attrs:{label:"Nama Buku"},model:{value:t.editedItem.name,callback:function(e){t.$set(t.editedItem,"name",e)},expression:"editedItem.name"}})],1),t._v(" "),i("v-col",{attrs:{cols:"12",sm:"12",md:"6"}},[i("v-select",{attrs:{"item-text":"name","item-value":"id",items:t.itemauthors,label:"Penulis",required:""},model:{value:t.editedItem.id_author,callback:function(e){t.$set(t.editedItem,"id_author",e)},expression:"editedItem.id_author"}})],1),t._v(" "),i("v-col",{attrs:{cols:"12",sm:"12",md:"6"}},[i("v-select",{attrs:{"item-text":"name","item-value":"id",items:t.itembookcategories,label:"Kategori",required:""},model:{value:t.editedItem.id_categorybook,callback:function(e){t.$set(t.editedItem,"id_categorybook",e)},expression:"editedItem.id_categorybook"}})],1),t._v(" "),i("v-col",{attrs:{cols:"12",sm:"12",md:"12"}},[i("v-file-input",{attrs:{rules:t.rules,accept:"image/png, image/jpeg, image/bmp",placeholder:"Pilih gambar","prepend-icon":"mdi-camera",label:"Pilih gambar"},on:{change:t.onFileChanged}})],1),t._v(" "),i("v-col",{attrs:{cols:"12",sm:"12",md:"12"}},[i("v-text-field",{attrs:{label:"Deskripsi"},model:{value:t.editedItem.description,callback:function(e){t.$set(t.editedItem,"description",e)},expression:"editedItem.description"}})],1)],1)],1)],1),t._v(" "),i("v-card-actions",[i("v-spacer"),t._v(" "),i("v-btn",{attrs:{color:"blue darken-1",text:""},on:{click:t.close}},[t._v("Cancel")]),t._v(" "),i("v-btn",{attrs:{color:"primary",loading:t.btnLoading},on:{click:t.save}},[t._v(t._s(t.formBtnTitle))])],1)],1)],1)],1),t._v(" "),i("v-dialog",{attrs:{persistent:"","max-width":"290"},model:{value:t.dialogDelete,callback:function(e){t.dialogDelete=e},expression:"dialogDelete"}},[i("v-card",[i("v-card-title",{staticClass:"headline"},[t._v("Hapus data?")]),t._v(" "),i("v-card-text",[t._v("\n                            Data "),i("b",[i("i",[t._v(t._s(t.itemTemp.name))])]),t._v(" akan terhapus permanent apa anda yakin ?\n                        ")]),t._v(" "),i("v-card-actions",[i("v-spacer"),t._v(" "),i("v-btn",{on:{click:function(e){t.dialogDelete=!1}}},[t._v("Cancel")]),t._v(" "),i("v-btn",{attrs:{color:"primary",loading:t.btnLoading},on:{click:function(e){return t.deleteItem(t.itemTemp,"ok")}}},[t._v("OK")])],1)],1)],1)],1)],1)],1)],1)}),[],!1,null,null,null);e.default=s.exports}}]);