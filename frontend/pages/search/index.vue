<template>
  <div>
    <v-layout justify-center>
      <v-form>
        <div class="container">
          <v-col>
            <v-row class="pb-5">
              <v-text-field
                v-model="searchParameters.keywords"
                append-icon="search"
                label="キーワードで検索"
                hide-details
                filled
                rounded
                dense
              >
              </v-text-field>
            </v-row>

            <v-col class="pb-5">
              <v-simple-table>
                <template v-slot:default>
                  <thead>
                    <tr>
                      <th class="text-center">項目</th>
                      <th class="text-center">選択</th>
                    </tr>
                  </thead>

                  <tbody>
                    <tr>
                      <th>本気度</th>
                      <td>
                        <v-radio-group v-model="seriousness" row>
                          <v-radio label="ガチ" value="serious"></v-radio>
                          <v-radio label="エンジョイ" value="enjoy"></v-radio>
                          <v-radio label="未設定" value="none"></v-radio>
                        </v-radio-group>
                      </td>
                    </tr>

                    <tr>
                      <th>性別</th>
                      <td>
                        <v-radio-group v-model="gender" row>
                          <v-radio label="男" value="male"></v-radio>
                          <v-radio label="女" value="female"></v-radio>
                          <v-radio label="その他" value="other"></v-radio>
                        </v-radio-group>
                      </td>
                    </tr>

                    <tr>
                      <th>体系</th>
                      <td>
                        <v-select
                          :items="body_shape"
                          label="体系"
                          multiple
                        ></v-select>
                      </td>
                    </tr>

                    <tr>
                      <th>年齢</th>
                      <td>
                        <v-row class="table-element">
                          <v-col>
                            <v-text-field
                              placeholder="20"
                              outlined
                              suffix="歳"
                              dense
                              hide-details
                              class="minimum-text-field"
                              maxlength="3"
                              type="number"
                            ></v-text-field>
                          </v-col>
                          <h1>~</h1>
                          <v-col>
                            <v-text-field
                              placeholder="25"
                              outlined
                              suffix="歳"
                              dense
                              hide-details
                              class="minimum-text-field"
                              maxlength="3"
                              type="number"
                            ></v-text-field>
                          </v-col>
                        </v-row>
                      </td>
                    </tr>

                    <tr>
                      <th>体重</th>
                      <td>
                        <v-row class="table-element">
                          <v-col>
                            <v-text-field
                              placeholder="60"
                              outlined
                              suffix="kg"
                              dense
                              hide-details
                              class="minimum-text-field"
                              maxlength="3"
                              type="number"
                            ></v-text-field>
                          </v-col>
                          <h1>~</h1>
                          <v-col>
                            <v-text-field
                              placeholder="70"
                              outlined
                              suffix="kg"
                              dense
                              hide-details
                              class="minimum-text-field"
                              maxlength="3"
                              type="number"
                            ></v-text-field>
                          </v-col>
                        </v-row>
                      </td>
                    </tr>

                    <tr>
                      <th>身長</th>
                      <td>
                        <v-row class="table-element">
                          <v-col>
                            <v-text-field
                              placeholder="170"
                              outlined
                              suffix="cm"
                              dense
                              hide-details
                              class="minimum-text-field"
                              maxlength="3"
                              type="number"
                            ></v-text-field>
                          </v-col>
                          <h1>~</h1>
                          <v-col>
                            <v-text-field
                              placeholder="175"
                              outlined
                              suffix="cm"
                              dense
                              hide-details
                              class="minimum-text-field"
                              maxlength="3"
                              type="number"
                            ></v-text-field>
                          </v-col>
                        </v-row>
                      </td>
                    </tr>
                  </tbody>
                </template>
              </v-simple-table>
            </v-col>

            <v-flex text-center>
              <v-btn color="#ffac12" dark large @click="submitSearch">
                検索する
              </v-btn>
            </v-flex>
          </v-col>
        </div>
      </v-form>
    </v-layout>
  </div>
</template>

<script>
export default {
  data: () => ({
    body_shape: [
      '未設定',
      '痩せ型筋肉質',
      '普通筋肉質',
      '肥満型筋肉質',
      '痩せ型',
      '普通',
      '肥満型',
      'その他'
    ],
    searchParameters: {
      keywords: null,
      page: null,
      seriousness: null,
      gender: null,
      figure: null,
      ageMin: null,
      ageMax: null,
      weightMin: null,
      weightMax: null,
      heightMin: null,
      heightMax: null
    },
    seriousnessHash: { none: 0, serious: 1, enjoy: 2 },
    gendersHash: { male: 1, female: 2, other: 3 }
  }),

  computed: {
    seriousness: {
      set(val) {
        // HACK: サーバ側の求めるデータがIDなので、文字列からIDに変換している。IDが変わっても変更しやすいようにハッシュで一元管理している
        this.searchParameters.seriousness = this.seriousnessHash[val]
      },
      get() {
        return this.searchParameters.seriousness
      }
    },
    gender: {
      set(val) {
        this.searchParameters.gender = this.gendersHash[val]
      },
      get() {
        return this.searchParameters.gender
      }
    }
  },

  methods: {
    submitSearch() {
      console.log('submit')
      console.log(this.searchParameters)
      // this.$store.commit('users/setSearchParameters', { parameters })
    }
  }
}
</script>

<style>
.minimum-text-field {
  transform: scale(0.8);
}
.table-element {
  align-items: center;
}
</style>
