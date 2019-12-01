// State
const state = {
    listbookcategories: [],
}

// getters
const getters = {
    GET_DATA(state){
        return state.listbookcategories !== null
    }
}

// mutations
const mutations = {
    MUT_GET(state, payload) {
        state.listbookcategories = payload
    },
    MUT_ADD(state, payload){
        state.listbookcategories.push(payload.result)
    },
    MUT_UPDATE(state, payload){
        const idx = state.listbookcategories.map(t => t.id).indexOf(payload.result.id)
        state.listbookcategories.splice(idx, 1, payload.result)
    },
    MUT_DELETE(state, payload){
        state.listbookcategories.splice(payload, 1)
    }
}

// actions
const actions = {

    ACT_LOADBOOKCATEGORIES(context, credentials) {  
              
        const Type = JSON.parse(localStorage.getItem('ses_storage')).token.token_type
        const Token = JSON.parse(localStorage.getItem('ses_storage')).token.access_token
        axios.defaults.headers.common['Authorization'] = Type +' '+ Token

        return new Promise((resolve, reject) => {
            axios.get(credentials)
            .then(res => {
                if(res.data.success){
                    // console.log(res.data)
                    context.commit('MUT_GET', res.data.result)
                    resolve(res.data.result)
                } else {
                    reject('No Data')
                }
            })
            .catch(err => {
                reject(err)
            })
        });
    },
    ACT_SAVE(context, credentials) {
        
        const Type = JSON.parse(localStorage.getItem('ses_storage')).token.token_type
        const Token = JSON.parse(localStorage.getItem('ses_storage')).token.access_token
        axios.defaults.headers.common['Authorization'] = Type +' '+ Token

        return new Promise((resolve, reject) => {
            axios.post('/book-category/add', {
                name: credentials.name,
                description: credentials.description,
            })
            .then(res => {
                
                if(res.data.success){
                    context.commit('MUT_ADD', res.data)
                    resolve(res.data.result)
                } else {
                    reject('Failed add table . Please Form Field')
                }
            })
            .catch(err => {
                reject(err)
            })
        });
    },
    ACT_UPDATE(context, credentials) {
        const Type = JSON.parse(localStorage.getItem('ses_storage')).token.token_type
        const Token = JSON.parse(localStorage.getItem('ses_storage')).token.access_token
        axios.defaults.headers.common['Authorization'] = Type +' '+ Token

        return new Promise((resolve, reject) => {
            axios.post('/book-category/update', {
                id:credentials.id,
                name: credentials.name,
            })
            .then(res => {
                if(res.data.success){
                    context.commit('MUT_UPDATE', res.data)
                    resolve(res.data.result)
                } else {
                    reject('Failed add table . Please Form Field')
                }
            })
            .catch(err => {
                reject(err)
            })
        });
    },
    ACT_DELETED(context, credentials) {
        const Type = JSON.parse(localStorage.getItem('ses_storage')).token.token_type
        const Token = JSON.parse(localStorage.getItem('ses_storage')).token.access_token
        axios.defaults.headers.common['Authorization'] = Type +' '+ Token

        return new Promise((resolve, reject) => {
            axios.post('/book-category/delete', {
                id:credentials.id
            })
            .then(res => {
                console.log(res.data)
                if(res.data.success){
                    context.commit('MUT_DELETE', credentials.index)
                    resolve(res.data)
                } else {
                    reject('Failed delete category')
                }
            })
            .catch(err => {
                reject(err)
            })
        });

    }

}

export default {
    namespaced: true,
    state,
    getters,
    actions,
    mutations
}