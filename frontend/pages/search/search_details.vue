<template>
  <div>
    <v-layout justify-center>
      <v-form>
        <div class="container">
          <v-col>
            <v-row class="pb-5">
              <v-text-field
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
              <v-simple-table
                :dense="dense"
                :fixed-header="fixedHeader"
                :height="height"
              >
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
                        <v-radio-group row>
                          <v-radio label="ガチ" value="sirias"></v-radio>
                          <v-radio label="エンジョイ" value="enjoy"></v-radio>
                          <v-radio label="未設定" value="none"></v-radio>
                        </v-radio-group>
                      </td>
                    </tr>
                    <tr>
                      <th>性別</th>
                      <td>
                        <v-radio-group row>
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
                  </tbody>
                </template>
              </v-simple-table>
            </v-col>
            <v-flex text-center>
              <v-btn color="light-blue darken-2">
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
  data() {
    return {
      body_shape: [
        '未設定',
        '痩せ型筋肉質',
        '普通筋肉質',
        '肥満型筋肉質',
        '痩せ型',
        '普通',
        '肥満型',
        'その他'
      ]
    }
  }
}
</script>
