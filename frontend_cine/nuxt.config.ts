// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled: true },
  css: [
    'normalize.css'
  ],
  modules: ['@pinia/nuxt', '@nuxt/image'],
  app: {
    head: {
      title: 'A22JLF',
      htmlAttrs: {
        lang: 'es ca en',
       
      },
      meta: [
        { charset: 'utf-8' },
        { name: 'viewport', content: 'width=device-width, initial-scale=1' },
        { hid: 'description', name: 'description', content: 'Reserva les teves entrades de cinema en línia de manera fàcil i ràpida. Descobreix les últimes estrenes, consulta la programació i gaudeix de la millor experiència cinematogràfica amb nosaltres.' },
        { name: 'author', content: 'Josu Largo Fernandez' },
        { name: 'keywords', content: 'cinema, pel·lícules, reserva entrades, estrenes, película, entradas, estrenos, cine, movies, showings, cinema' } // Keywords relevant to the cinema booking site


      ],
      link: [
        { rel: 'icon', type: 'image/svg+xml', href: '/icons/cinema.svg' }
      ]
    }
  },
  nitro: {
    prerender: {
      routes: ['/register', '/perfil', '/login', '/', '/estrenos', '/checkout', '/${id}', '/admin', '/admin/movies', '/admin/movies/create', '/admin/movies/${id}', '/admin/sessions', '/admin/seats', ]
    }
  },


  /* set lang and title and other meta tags */


})