<template>
  <div>
    <div class="top-wrapper">
      <div class="container">
        <h1>筋トレであなたの</h1>
        <h1>人生を笑顔に</h1>
        <p>
          筋トレ初心者から上級者の方までご利用できるマッチングアプリです。
        </p>
        <p>
          Muscler'sで友達を作り筋トレライフを充実させましょう！！
        </p>
        <div class="register-wrapper mt-5">
          <v-btn to="/auth/login" class="register-btn" dark nuxt>
            Muscler'sを始める
          </v-btn>
        </div>
      </div>
    </div>
    <div class="services-wrapper">
      <div class="container">
        <div class="service-heading">
          <h2>Musclersには様々な仕組みがあります</h2>
        </div>
        <div class="services">
          <div class="service-box">
            <div class="service-icon">
              <v-icon size="120">emoji_people</v-icon>
              <p>マッチング</p>
            </div>
            <p class="service-text">
              様々な筋肉と出会うことが出来ます。
            </p>
          </div>
          <div class="service-box">
            <div class="service-icon">
              <v-icon size="120">person_add</v-icon>
              <p>友達申請</p>
            </div>
            <p class="service-text">
              気になる人と繋がりを作ることができます。
            </p>
          </div>
          <div class="service-box">
            <div class="service-icon">
              <v-icon size="120">message</v-icon>
              <p>メッセージ</p>
            </div>
            <p class="service-text">
              友達になった人とやり取りすることが出来ます。
            </p>
          </div>
          <div class="service-box">
            <div class="service-icon">
              <v-icon size="120">search</v-icon>
              <p>検索</p>
            </div>
            <p class="service-text">
              自分好みの筋肉を詳細に検索できます。
            </p>
          </div>
          <div class="service-box">
            <div class="service-icon">
              <v-icon size="120">group</v-icon>
              <p>グループ</p>
            </div>
            <p class="service-text">
              グループを作成し、話し合うことが出来ます。
            </p>
          </div>
          <div class="service-box">
            <div class="service-icon">
              <v-icon size="120">fitness_center</v-icon>
              <p>筋肉</p>
            </div>
            <p class="service-text">
              Musclersを用いて筋肉ライフを充実させましょう。
            </p>
          </div>
          <div class="clear-float-left" />
        </div>
      </div>
    </div>
    <div class="register-wrapper register-wrapper-bottom my-12 px-4">
      <v-btn
        to="/auth/login"
        class="register-btn register-btn-primary"
        dark
        nuxt
      >
        Muscler'sを始める
      </v-btn>
    </div>
  </div>
</template>
<script>
export default {
  layout: 'index'
}
</script>
<style lang="scss" scoped>
@import '~/assets/scss/lp.scss';
</style>
