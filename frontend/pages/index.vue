<!--
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
        <v-btn to="/auth/login" class="register-btn" color="#FFAC12" dark nuxt>
          Muscler'sを始める
        </v-btn>
      </div>
    </div>
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
-->
<!-- debug用画面 -->
<template>
  <div>
    <v-layout justify-center>
      <v-form>
        <div class="container">
          <v-col>
            <v-row>
              <v-text-field
                flat
                solo-inverted
                append-icon="search"
                label="キーワードで検索"
                hide-details
              >
              </v-text-field>
            </v-row>
            <v-row>
              <p>本気度</p>
              <v-radio-group row>
                <v-radio label="ガチ" value="radio-1"></v-radio>
                <v-radio label="エンジョイ" value="radio-2"></v-radio>
                <v-radio label="未設定" value="radio-3"></v-radio>
              </v-radio-group>
            </v-row>
            <v-row>
              <p>体系</p>
              <v-select :items="items" label="未選択" multiple></v-select>
            </v-row>
            <v-btn color="info">
              検索する
            </v-btn>
          </v-col>
        </div>
      </v-form>
    </v-layout>
  </div>
</template>
<script>
export default {
  data() {
    return {
      items: ['a', 'b']
    }
  }
}
</script>
<style>
@import '@/assets/css/index.css';
</style>
