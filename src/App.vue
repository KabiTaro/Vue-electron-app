<template>
  <v-app>
    <Header />
    <!--メイン画面-->
    <v-content>
      <v-fade-transition mode="out-in">
        <router-view />
      </v-fade-transition>
    </v-content>

    <Footer />

    <v-container fluid>
      <Navigation />
      <Level/>
    </v-container>
  </v-app>
</template>

<script>
import Header from "@/components/global/Header";
import Footer from "@/components/global/Footer";
import Navigation from "@/components/global/Navigation_Yousei";
import Level from "@/components/global/Level";
export default {
  components: {
    Header,
    Footer,
Level,
    Navigation
  },
  computed: {
    yousei() {
      return require("@/assets/yosei.png");
    },
    message: function() {
      return this.$store.getters["message/msg"];
    },
    type: function() {
      return this.$store.getters["message/type"];
    }
  }
};
</script>
