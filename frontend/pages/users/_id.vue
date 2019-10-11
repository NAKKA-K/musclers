<template>
  <v-container fluid fill-height>
    <v-layout justify-center>
      <v-flex xs12 sm6 md6>
        <v-card height="70vh" class="user-card" outlined raised>
          <v-list>
            <v-list-item class="justify-center">
              <v-list-item-avatar size="280">
                <v-img :src="user.thumbnail"></v-img>
              </v-list-item-avatar>
            </v-list-item>
            <v-list-item-content class="headline text-center title-space">
              <v-list-item-title class="title">
                {{ user.nickname }}
              </v-list-item-title>
              <div class="user-description">
                {{ user.description }}
              </div>
            </v-list-item-content>
          </v-list>

          <v-tabs v-model="tab" fixed-tabs background-color="#FEBA00">
            <v-tab>
              基本情報
            </v-tab>
            <v-tab>
              自慢の部位
            </v-tab>
          </v-tabs>

          <v-tabs-items v-model="tab">
            <v-tab-item>
              <v-list>
                <user-detail-card-item
                  :item="{
                    title: '年齢',
                    value: user.age,
                    default: 'none'
                  }"
                />
                <user-detail-card-item
                  :item="{
                    title: '性別',
                    value: user.gender,
                    default: 'none'
                  }"
                />
                <user-detail-card-item
                  :item="{
                    title: '身長',
                    value: user.height,
                    default: 'none'
                  }"
                />
                <user-detail-card-item
                  :item="{
                    title: '体重',
                    value: user.weight,
                    default: 'none'
                  }"
                />
                <user-detail-card-item
                  :item="{
                    title: '体型',
                    value: user.figure,
                    default: 'none'
                  }"
                />
                <user-detail-card-item
                  :item="{
                    title: '筋肉量',
                    value: user.muscle_mass,
                    default: 'none'
                  }"
                />
                <user-detail-card-item
                  :item="{
                    title: '体脂肪率',
                    value: user.body_fat_percentage,
                    default: 'none'
                  }"
                />
                <user-detail-card-item
                  :item="{
                    title: '本気度',
                    value: user.seriousness,
                    default: 'none'
                  }"
                />
              </v-list>
            </v-tab-item>

            <v-tab-item>
              <!--
                TODO: 自慢の部位が登録できるようになった時に
                      画面をデザインして実装する
              -->
            </v-tab-item>
          </v-tabs-items>
        </v-card>

        <div class="move-items">
          <nuxt-link :to="`/users/${user.id - 1}`" class="move-icon">
            <v-icon color="#FEBA00" x-large>arrow_back_ios</v-icon>
          </nuxt-link>
          <nuxt-link :to="`/users/${user.id + 1}`" class="move-icon">
            <v-icon color="#FEBA00" x-large>arrow_forward_ios</v-icon>
          </nuxt-link>
        </div>
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
import UserDetailCardItem from '../../components/UserDetailCardItem.vue'

export default {
  components: {
    UserDetailCardItem
  },

  data() {
    return {
      tab: null
    }
  },
  async asyncData({ $axios, params, error }) {
    const response = await $axios
      .get(`/api/users/${params.id}`)
      .catch((err) => {
        console.log(err)
        console.log(err.response)
        return err.response
      })

    if (!response) {
      throw new Error('ネットワークに接続できませんでした')
      // TODO: もう少し何とかする。toastとか出す?
    } else if (response.status !== 200) {
      error({ status: response.status, message: response.data.message })
      return
    }

    return {
      user: response.data.data
    }
  }
}
</script>

<style scoped>
.user-card {
  overflow-y: auto;
}
.move-items {
  text-align: center;
  margin-top: 3%;
}
div .move-icon {
  text-decoration: none;
  padding: 15px;
}

.title-space {
  margin-left: 10%;
  width: 80%;
}

.user-description {
  font-size: 0.875rem;
}
</style>
