export function initialize(store, router) { 
    
    router.beforeEach((to, from, next) => {
      
      const requiresAuth = to.matched.some(record => record.meta.Auth);
      const ses_storage = localStorage.getItem('ses_storage') ? true : false;
      const Guest = to.matched.some(record => record.meta.Guest);

      if(requiresAuth && !ses_storage){
        store.dispatch('auth/AC_SIGNOUT')
        .then(() => {
          next({
            name: 'signin'
          })
        }).catch(() => {
          next({
            name: 'signin'
          })
        });
      } else if (to.path == '/admin' && ses_storage){
        console.log("dashboard")
        next({
          name:'dashboard'
        });
      } else {
        
        next();
        
      }
      
    })
}