// State
const state = {
    listbooks: [],
}

// getters
const getters = {
    GET_DATA(state){
        return state.listbooks !== null
    }
}

// mutations
const mutations = {
    MUT_GET(state, payload) {
        state.listbooks = payload
    },
    MUT_UPDATELIST(state, payload){
        state.listbooks = payload.result
    },
    MUT_ADD(state, payload){
        state.listbooks.push(payload.result)
    },
    MUT_UPDATE(state, payload){
        // console.log(payload)
        const idx = state.listbooks.map(t => t.id).indexOf(payload.result.id)
        state.listbooks.splice(idx, 1, payload.result)
    },
    MUT_DELETE(state, payload){
        state.listbooks.splice(payload, 1)
    },
}

// actions
const actions = {

    ACT_LOADBOOK(context, credentials) {  
              
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
            axios.post('/book/add', credentials,{
                headers: {
                    'Content-Type': 'multipart/form-data'
                }
            })
            .then(res => {
                // console.log(res.data)
                if(res.data.success){
                    context.commit('MUT_ADD', res.data)
                    resolve(res.data.result)
                } else {
                    
                    reject('Failed add table . Please Form Field')
                }
            })
            .catch(err => {
                // console.log(err)
                reject(err)
            })
        });
    },
    ACT_UPDATE(context, credentials) {
        const Type = JSON.parse(localStorage.getItem('ses_storage')).token.token_type
        const Token = JSON.parse(localStorage.getItem('ses_storage')).token.access_token
        axios.defaults.headers.common['Authorization'] = Type +' '+ Token

        return new Promise((resolve, reject) => {
            axios.post('/book/update', credentials,{
                headers: {
                    'Content-Type': 'multipart/form-data'
                }
            })
            .then(res => {
                if(res.data.success){
                    context.commit('MUT_UPDATE', res.data)
                    resolve(res.data.result)
                } else {
                    // console.log(res.data.error)
                    reject('Failed update data . Please Check Form Field')
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
            axios.post('/book/delete', {
                id:credentials.id
            })
            .then(res => {
                if(res.data.success){
                    context.commit('MUT_DELETE', credentials.index)
                    resolve(res.data)
                } else {
                    reject('Failed delete table')
                }
            })
            .catch(err => {
                reject(err)
            })
        });

    },
    ACT_GETBYAUTHORID(context, credentials) {
        const Type = JSON.parse(localStorage.getItem('ses_storage')).token.token_type
        const Token = JSON.parse(localStorage.getItem('ses_storage')).token.access_token
        axios.defaults.headers.common['Authorization'] = Type +' '+ Token

        return new Promise((resolve, reject) => {
            axios.post('/book/searchByauthor', {
                id:credentials.id
            })
            .then(res => {
                if(res.data.success){
                    context.commit('MUT_UPDATELIST', res.data)
                } else {
                    reject('Failed delete table')
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