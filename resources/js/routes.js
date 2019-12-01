export const routes = [
    {
        path: '/admin/dashboard',
        name: 'dashboard',
        component: () => import('./pages/Dashboard'),
        meta: {
            Auth: true,
        }
    },
    {
        path: '/admin/author',
        name: 'author',
        component: () => import('./pages/author/Index'),
        meta: {
            Auth: true,
        },
    },
    {
        path: '/admin/book',
        name: 'book',
        component: () => import ('./pages/book/Index'),
        meta: {
            Auth: true,
        }
    },
    {
        path: '/admin/bookcategory',
        name: 'bookcategory',
        component: () => import ('./pages/bookcategory/Index'),
        meta: {
            Auth: true,
        }
    },
    {
        path: '/admin/signin',
        name: 'signin',
        component: () => import('./pages/auth/SignIn'),
        meta: {
            Guest: true,
        }
    },
    { path: '*', redirect: '/admin/dashboard' },
]