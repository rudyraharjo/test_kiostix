// state
const state = {
    RoleName:'Role Name',
    title:'BukuMasaDepan',
    S_CURRENT_USER: JSON.parse(localStorage.getItem('ses_storage')) || null
}

// getters
const getters = {
    IS_LOGGEDIN(state){
        return state.S_CURRENT_USER !== null
    }
}

// mutations
const mutations = {
    MUT_GET_TOKEN(state, token) {
        state.S_CURRENT_USER = token
    },
    MUT_DESTROY_TOKEN(state) {
        state.S_CURRENT_USER = null
    },
}

// actions
const actions = {

    AC_SIGNIN(context, credentials) {
        // console.log(credentials.email, credentials.password)
        return new Promise((resolve, reject) => {
            axios.post('/auth/signin', {
                email: credentials.email,
                password: credentials.password,
            })
            .then(res => {
                if(res.data.success){
                    localStorage.setItem('ses_storage', JSON.stringify(res.data.result))
                    context.commit('MUT_GET_TOKEN', res.data.result)
                    resolve(res.data.result)
                } else {
                    reject('Unauthorized . Please Check Email & Password')
                }
            })
            .catch(err => {
                console.log(err)
              //reject('Unauthorized . Please Check Email & Password')
            })
        });
    },
    AC_SIGNOUT(context){

        if (context.getters.isLoggedIn) {
            
            const Type = context.state.CurrentUser.token_type
            const Token = context.state.CurrentUser.access_token

            axios.defaults.headers.common['Authorization'] = Type +' '+ Token

            return new Promise((resolve, reject) => {
              axios.post('/api/auth/logout')
                .then(response => {
                  localStorage.removeItem('CurrentUser')
                  context.commit('MUT_DESTROY_TOKEN')
                  resolve(response)
                })
                .catch(error => {
                  localStorage.removeItem('CurrentUser')
                  context.commit('MUT_DESTROY_TOKEN')
                  reject(error)
                })
            });
    
        } else {
            
            return new Promise((resolve, reject) => {                
                context.commit('MUT_DESTROY_TOKEN')
                resolve("Force Remove state")
            });
            
        }
    }

}

export default {
    namespaced: true,
    state,
    getters,
    actions,
    mutations
}