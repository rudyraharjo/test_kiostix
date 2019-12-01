<template>
    <div>
        <v-navigation-drawer
        class="grey lighten-5"
        v-model="drawer"
        :clipped="$vuetify.breakpoint.lgAndUp"
        app
        >
            <template v-slot:prepend>
                <v-list-item two-line>
                    <v-list-item-avatar>
                        <img src="https://randomuser.me/api/portraits/women/81.jpg">
                    </v-list-item-avatar>

                    <v-list-item-content>
                        <v-list-item-title>Jane Smith</v-list-item-title>
                        <v-list-item-subtitle>Logged In</v-list-item-subtitle>
                    </v-list-item-content>

                </v-list-item>
            </template>
            
            <v-divider></v-divider>

            <v-list dense>

                <template v-for="item in itemsMenu">
                    
                    <v-layout v-if="item.heading" :key="item.heading" row align-center>
                        <v-flex xs6>
                            <v-subheader v-if="item.heading">
                                {{ item.heading }}
                            </v-subheader>
                        </v-flex>
                        <v-flex xs6 class="text-xs-center">
                            <a href="#!" class="body-2 black--text">EDIT</a>
                        </v-flex>
                    </v-layout>

                    <v-list-group
                        v-else-if="item.children"
                        :key="item.text"
                        v-model="item.model"
                        :prepend-icon="item.model ? item.icon : item['icon-alt']"
                        append-icon=""
                        >
                        <template v-slot:activator>
                            <v-list-item>
                                <v-list-item-content>
                                    <v-list-item-title>
                                        {{ item.text }}
                                    </v-list-item-title>
                                </v-list-item-content>
                            </v-list-item>
                        </template>

                        <v-list-item v-for="(child, i) in item.children" :key="i" @click="navclick(child.url)" style="margin-left: 10%;
">
                            <v-list-item-action v-if="child.icon">
                                <v-icon>{{ child.icon }}</v-icon>
                            </v-list-item-action>
                            <v-list-item-content>
                                <v-list-item-title>
                                    {{ child.text }}
                                </v-list-item-title>
                            </v-list-item-content>
                        </v-list-item>

                    </v-list-group>

                    <v-list-item v-else :key="item.text" @click="navclick(item.url)">
                        
                        <v-list-item-action>
                            <v-icon>{{ item.icon }}</v-icon>
                        </v-list-item-action>
                        <v-list-item-content>
                            <v-list-item-title :to="item.url">
                                {{ item.text }}
                            </v-list-item-title>
                        </v-list-item-content>

                    </v-list-item>

                </template>
            </v-list>
            <template v-slot:append>
                <div class="pa-2">
                    <v-btn block>Logout</v-btn>
                </div>
            </template>
        </v-navigation-drawer>
        
        <v-app-bar :clipped-left="$vuetify.breakpoint.lgAndUp" app color="blue darken-3" dark>
            <v-toolbar-title style="width: 300px" class="ml-0 pl-3">
                <v-app-bar-nav-icon @click.stop="drawer = !drawer"></v-app-bar-nav-icon>
                <span class="hidden-sm-and-down">BukuMasaDepan</span>
            </v-toolbar-title>
            <v-text-field
                flat
                solo-inverted
                hide-details
                prepend-inner-icon="search"
                label="Search"
                class="hidden-sm-and-down"
                >
            </v-text-field>
            <v-spacer></v-spacer>
            <v-btn icon>
                <v-icon>apps</v-icon>
            </v-btn>
            <v-btn icon>
                <v-icon>notifications</v-icon>
            </v-btn>
            <v-btn icon large>
                <v-avatar
                size="32px"
                item
                >
                    <v-img
                        src="https://cdn.vuetifyjs.com/images/logos/logo.svg"
                        alt="Vuetify"
                    >
                    </v-img>
                </v-avatar>
            </v-btn>
        </v-app-bar>

    </div>
</template>
<script>

    import { mapGetters } from 'vuex'

    export default {
        data () {
            return {
                drawer:null,
                itemsMenu: [
                    { icon: 'dashboard', text: 'Dashboard', url:"dashboard" },
                    {
                        icon: 'keyboard_arrow_up',
                        'icon-alt': 'keyboard_arrow_down',
                        text: 'Master Data',
                        model: true,
                        children: [
                            { icon: '', text: 'Buku', url: "book" },
                            { icon: '', text: 'Kategori Buku' , url:"bookcategory"},
                            { icon: '', text: 'Penulis' , url:"author"},
                        ],
                    },
                    // {
                    //     icon: 'keyboard_arrow_up',
                    //     'icon-alt': 'keyboard_arrow_down',
                    //     text: 'More',
                    //     model: true,
                    //     children: [
                    //         { text: 'Import' },
                    //         { text: 'Export' },
                    //         { text: 'Print' },
                    //         { text: 'Undo changes' },
                    //         { text: 'Other contacts' },
                    //     ],
                    // },
                    //{ icon: 'settings', text: 'Settings' },
                    // { icon: 'chat_bubble', text: 'Send feedback' },
                    //{ icon: 'help', text: 'Help' },
                    // { icon: 'phonelink', text: 'App downloads' },
                    // { icon: 'keyboard', text: 'Go to the old version' },
                ],
            }
        },
        methods: {
            test(){
                console.log("test")
            },
            navclick(route) {
                if (route != this.$router.currentRoute.name)
                    this.$router.push({ name: route })
            }
        },
        mounted() {
            // console.log('Menu Component mounted.')
        },
          
    }
</script>