<template>
  <v-card max-width="400" color="rgba(0, 0, 0, 0.0)" elevation="0" class="botton-navigation" tile>
    <div class="d-flex flex-no-wrap justify-space-between">
      <div>
        <v-snackbar
          v-model="message"
          text
          class="custom_snackbar animate__animated animate__pulse animate__infinite"
          dense
          :timeout="0"
          elevation="16"
          :color="type"
        >{{this.message}}</v-snackbar>
      </div>

      <v-img
        height="125"
        width="125"
        :src="yousei"
        contain
        @click="navi_clik()"
        class="animate__animated animate__heartBeat animate__infinite animate__fast"
      ></v-img>
    </div>
  </v-card>
</template>

<script>
export default {
  name: "v-kawaii-yousei",

  methods: {
    navi_clik: function() {
      this.$store.dispatch("message/LoginDateGet");
    }
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
<style scoped>
.botton-navigation {
  z-index: 4;
  bottom: 16px;
  position: absolute;
  right: 5px;
}
</style>
<style lang="scss" scoped>
@import "@/style/variables.scss";

.custom_snackbar {
  position: absolute;
  bottom: $snackbar-bottom;
  left: $snackbar-right;
}
</style>