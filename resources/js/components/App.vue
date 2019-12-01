<template>
    <div id="app">
        <v-app id="inspire">
            
            <Navbar v-if="IS_LOGGEDIN" />

            <v-content class="white">
                <v-container>
                    <router-view></router-view>
                </v-container>
            </v-content>
            
            <v-footer app>
                <!-- -->
            </v-footer>
        </v-app>
    </div>
</template>

<script>

    import { mapGetters } from 'vuex'
    
    import Navbar from './NavBar'

    export default {
        components: {
            Navbar,
        }, 
        data() {
            return {
                dialog: false,
            }
        },
        watch: {
            
        },
        mounted() {
            // console.log('App Component mounted.')
        },
        computed: {
            ...mapGetters({
                IS_LOGGEDIN: 'auth/IS_LOGGEDIN'
            }),
        },
    }
</script>
