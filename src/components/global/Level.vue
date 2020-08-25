<template>
  <v-card max-width="250" class="elevation-0 level-layout" color="rgba(0, 0, 0, 0.0)" fluid tile>
    <v-row fluid>
      <v-col cols="4">
        <v-img height="100" width="125" :src="hitokage" contain></v-img>
      </v-col>
      <v-col cols="8">
        <v-card-title class="text-no-wrap">Level:{{this.user_level}}</v-card-title>
        <v-progress-linear :buffer-value="this.level_achievement_rate" stream color="cyan"></v-progress-linear>
        <p class="caption text-no-wrap">残り{{this.next_requiredexp}}Expでレベルアップ</p>
      </v-col>
    </v-row>{{this.level_achievement_rate}}
  </v-card>
</template>

<script>
export default {
  name: "v-kawaii-yousei",
  created() {
    this.$store.dispatch("level/LevelGet");
  },

  computed: {
    user_level: function() {
      return this.$store.getters["level/user_level"];
    },
    next_requiredexp: function() {
      return this.$store.getters["level/next_requiredexp"];
    },
    level_achievement_rate: function() {
      return this.$store.getters["level/level_achievement_rate"];
    },
    hitokage() {
      return require("@/assets/hitokage.png");
    }
  }
};
</script>
<style scoped>
.level-layout {
  z-index: 4;
  bottom: 3px;
  position: absolute;
  left: 0px;
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