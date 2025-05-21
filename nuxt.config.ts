// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: "2024-11-01",
  devtools: { enabled: true },
  css: ['~/assets/css/main.style.css'],
  app: {
    head: {
      title: "Portfolio",
    },
  },
  vite: {
    server: {
      allowedHosts: [".loca.lt"],
    },
  },
});
