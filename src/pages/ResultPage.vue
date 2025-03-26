<template>
  <div class="blockMain">
    <h1>Сохраненные данные</h1>
    <p><strong>Город:</strong> {{ store.selectedCity }}</p>
    <p><strong>Цех:</strong> {{ store.selectedWorkshop }}</p>
    <p><strong>Сотрудник:</strong> {{ store.selectedEmployee }}</p>
    <p><strong>Бригада:</strong> {{ store.selectedTeam }}</p>
    <p><strong>Смена:</strong> {{ store.selectedShift }}</p>
    <button @click="goBack">Назад</button>
  </div>
</template>

<script>
import { useDataStore } from "../entities/store";
import { useRouter } from "vue-router";

export default {
  setup() {
    const store = useDataStore();
    const router = useRouter();

    const goBack = () => {
      router.push("/");
      store.resetFormValues();
    };

    return { store, goBack };
  },
};
</script>
<style>
.blockMain {
  display: flex;
  flex-direction: column;
  text-align: center;
  justify-content: space-between;
  background-color: var(--block-color);
  padding: 25px;
  align-items: center;
  border-radius: 25px;
  width: 400px;
  height: 500px;
}
</style>
