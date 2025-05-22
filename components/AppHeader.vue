<template>
  <header :class="['site-header', { 'scrolled': isScrolled }]">
    <div class="header-inner">
      <div class="logo">Mathieu Danière</div>
      <nav class="nav">
      <!-- Do a component language selector -->

        <!-- Hamburger (mobile only) -->
        <button class="hamburger" @click="toggleMenu" aria-label="Toggle Menu">
          ☰
        </button>
      </nav>
    </div>


    <!-- <HamburgerMobileMenu v-if="isMenuOpen" @close="isMenuOpen = false" /> -->
  </header>
</template>

<script lang="ts" setup>
import { ref } from 'vue'

const isMenuOpen = ref(false)
const toggleMenu = () => {
  isMenuOpen.value = !isMenuOpen.value
}

const toggleLang = () => {
  console.log('Language icon clicked (mock)')
}

const isScrolled = ref(false)

const handleScroll = () => {
  isScrolled.value = window.scrollY > 10
}

onMounted(() => {
  window.addEventListener('scroll', handleScroll)
})

onUnmounted(() => {
  window.removeEventListener('scroll', handleScroll)
})
</script>

<style scoped>
.site-header {
  position: sticky;
  top: 0;
  z-index: 1000;
  backdrop-filter: blur(20px);
  -webkit-backdrop-filter: blur(20px);
  transition: background-color 0.3s ease, backdrop-filter 0.3s ease;
  padding: 1rem 2rem;
}

.header-inner {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.site-header.scrolled {
  background-color: rgba(16, 4, 29, 0.6);
}

.logo {
  font-family: 'Space Grotesk', sans-serif;
  font-weight: 700;
  font-size: 1.5rem;
  color: var(--color-text);
}

.nav {
  display: flex;
  align-items: center;
  gap: 1.25rem;
}

.hamburger {
  background: none;
  border: none;
  color: var(--color-text);
  font-size: 1.5rem;
  display: none;
  cursor: pointer;
}

@media (max-width: 768px) {
  .hamburger {
    display: block;
  }
}
</style>
