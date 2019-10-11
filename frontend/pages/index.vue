<template>
  <div>
    <div class="top-wrapper">
      <div class="container">
        <h1>筋肉を今よりも素敵に。</h1>
        <p>筋肉大好き人間が集まるマッチングアプリです。</p>
        <p>他人が投稿した筋肉を見たり、筋トレをしましょう。</p>
        <div class="register-wrapper mt-5">
          <v-btn to="/auth/login" class="register-btn" color="#FFAC12" nuxt>
            Musclersを始める
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
              <v-icon color="#FEBA00" size="90">emoji_people</v-icon>
              <p>マッチング</p>
            </div>
            <p class="service-text">
              様々な筋肉と出会うことが出来ます。
            </p>
          </div>
          <div class="service-box">
            <div class="service-icon">
              <v-icon color="#FEBA00" size="90">person_add</v-icon>
              <p>友達申請</p>
            </div>
            <p class="service-text">
              気になる人と繋がりを作ることができます。
            </p>
          </div>
          <div class="service-box">
            <div class="service-icon">
              <v-icon color="#FEBA00" size="90">message</v-icon>
              <p>メッセージ</p>
            </div>
            <p class="service-text">
              友達になった人とやり取りすることが出来ます。
            </p>
          </div>
          <div class="service-box">
            <div class="service-icon">
              <v-icon color="#FEBA00" size="90">search</v-icon>
              <p>検索</p>
            </div>
            <p class="service-text">
              自分好みの筋肉を詳細に検索できます。
            </p>
          </div>
          <div class="service-box">
            <div class="service-icon">
              <v-icon color="#FEBA00" size="90">group</v-icon>
              <p>グループ</p>
            </div>
            <p class="service-text">
              グループを作成し、話し合うことが出来ます。
            </p>
          </div>
          <div class="service-box">
            <div class="service-icon">
              <v-icon color="#FEBA00" size="90">fitness_center</v-icon>
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
    <div class="register-wrapper">
      <div class="container">
        <nuxt-link to="/auth/login" class="btn">
          BookBokを始める
        </nuxt-link>
      </div>
    </div>
>>>>>>> 9893cb81640a10e6011059ec14a38606a1aa9bdf
  </div>
</template>
<script>
export default {
  layout: 'index'
}
</script>
<style>
@import '@/assets/css/index.css';
</style>
