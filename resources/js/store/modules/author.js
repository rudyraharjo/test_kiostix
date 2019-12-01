// State
const state = {
    listauthors: [],
}

// getters
const getters = {
    GET_DATA(state){
        return state.listauthors !== null
    }
}

// mutations
const mutations = {
    MUT_GET(state, payload) {
        state.listauthors = payload
    },
    MUT_ADD(state, payload){
        state.listauthors.push(payload.result)
    },
    MUT_UPDATE(state, payload){
        const idx = state.listauthors.map(t => t.id).indexOf(payload.result.id)
        state.listauthors.splice(idx, 1, payload.result)
    },
    MUT_DELETE(state, payload){
        state.listauthors.splice(payload, 1)
    }
}

// actions
const actions = {

    ACT_LOADAUTHORS(context, credentials) {  
              
        const Type = JSON.parse(localStorage.getItem('ses_storage')).token.token_type
        const Token = JSON.parse(localStorage.getItem('ses_storage')).token.access_token
        axios.defaults.headers.common['Authorization'] = Type +' '+ Token

        return new Promise((resolve, reject) => {
            axios.get(credentials)
            .then(res => {
                if(res.data.success){
                    context.commit('MUT_GET', res.data.result)
                    // resolve(res.data.result)
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
            axios.post('/author/add', {
                name: credentials.name,
                bio: credentials.bio,
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
            axios.post('/author/update', {
                id:credentials.id,
                name: credentials.name,
                bio: credentials.bio,
            })
            .then(res => {
                if(res.data.success){
                    context.commit('MUT_UPDATE', res.data)
                    resolve(res.data.result)
                } else {
                    reject('Failed update table . Please Form Field')
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
            axios.post('/author/delete', {
                id:credentials.id
            })
            .then(res => {
                if(res.data.success){
                    context.commit('MUT_DELETE', credentials.index)
                    resolve(res.data)
                } else {
                    reject('Failed delete author')
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