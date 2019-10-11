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
              <v-checkbox
                v-model="checkbox"
                label="Do you agree?"
                required
              ></v-checkbox>
              <v-checkbox
                v-model="checkbox"
                label="Do you agree?"
                required
              ></v-checkbox>
              <v-checkbox
                v-model="checkbox"
                label="Do you agree?"
                required
              ></v-checkbox>
            </v-row>
            <v-row>
              <v-select label="Item" required></v-select>
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
<script></script>
