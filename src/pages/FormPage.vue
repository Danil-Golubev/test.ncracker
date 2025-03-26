<template>
  <div class="formBlock">
    <h1>Выберите данные</h1>
    <form class="formContent" @submit.prevent="saveData">
      <select
        class="selectCustom"
        v-model="selectedCity"
        @change="updateWorkshops"
      >
        <option disabled value="">Выберите город</option>
        <option v-for="city in cities" :key="city" :value="city">
          {{ city }}
        </option>
      </select>

      <select
        class="selectCustom"
        v-model="selectedWorkshop"
        @change="updateEmployees"
        :disabled="!selectedCity"
      >
        <option disabled value="">Выберите цех</option>
        <option
          v-for="workshop in workshops[selectedCity] || []"
          :key="workshop"
          :value="workshop"
        >
          {{ workshop }}
        </option>
      </select>

      <select
        class="selectCustom"
        v-model="selectedEmployee"
        :disabled="!selectedWorkshop"
      >
        <option disabled value="">Выберите сотрудника</option>
        <option
          v-for="employee in employees[selectedWorkshop] || []"
          :key="employee"
          :value="employee"
        >
          {{ employee }}
        </option>
      </select>

      <select class="selectCustom" v-model="selectedTeam">
        <option disabled value="">Выберите бригаду</option>
        <option v-for="team in teams" :key="team" :value="team">
          {{ team }}
        </option>
      </select>

      <select class="selectCustom" v-model="selectedShift">
        <option disabled value="">Выберите смену</option>
        <option v-for="shift in shifts" :key="shift" :value="shift">
          {{ shift }}
        </option>
      </select>

      <button :disabled="!isFormFilled" type="submit">Сохранить</button>
    </form>
  </div>
</template>

<script>
import { useDataStore } from "../entities/store";
import { useRouter } from "vue-router";
import { computed } from "vue";

export default {
  setup() {
    const store = useDataStore();
    const router = useRouter();

    const cities = computed(() => store.cities);
    const workshops = computed(() => store.workshops);
    const employees = computed(() => store.employees);
    const teams = computed(() => store.teams);
    const shifts = computed(() => store.shifts);

    const selectedCity = computed({
      get: () => store.selectedCity,
      set: (value) => store.setCity(value),
    });

    const selectedWorkshop = computed({
      get: () => store.selectedWorkshop,
      set: (value) => store.setWorkshop(value),
    });

    const selectedEmployee = computed({
      get: () => store.selectedEmployee,
      set: (value) => store.setEmployee(value),
    });

    const selectedTeam = computed({
      get: () => store.selectedTeam,
      set: (value) => store.setTeam(value),
    });

    const selectedShift = computed({
      get: () => store.selectedShift,
      set: (value) => store.setShift(value),
    });

    const updateWorkshops = () => {
      store.setWorkshop("");
      store.setEmployee("");
    };

    const updateEmployees = () => {
      store.setEmployee("");
    };

    const saveData = () => {
      router.push("/result");
    };
    const isFormFilled = computed(() => {
      return (
        selectedCity.value &&
        selectedTeam.value &&
        selectedWorkshop.value &&
        selectedShift.value &&
        selectedWorkshop.value
      );
    });

    return {
      cities,
      workshops,
      employees,
      teams,
      shifts,
      selectedCity,
      selectedWorkshop,
      selectedEmployee,
      selectedTeam,
      selectedShift,
      updateWorkshops,
      updateEmployees,
      saveData,
      isFormFilled,
    };
  },
};
</script>

<style>
.formBlock {
  display: flex;
  flex-direction: column;
  gap: 40px;
  text-align: center;
  padding: 25px;
  border-radius: 50px;
  width: 480px;
  height: 540px;
  background-color: var(--block-color);
  color: var(--text-color-2);
}

.formContent {
  align-items: center;
  gap: 40px;
  display: flex;
  flex-direction: column;
}
.selectCustom {
  -webkit-appearance: none;
  display: flex;
  text-align: center;
  cursor: pointer;
  height: 40px;
  width: 90%;
  border-radius: 25px;
  font-size: 18px;
  background-color: rgba(167, 173, 255, 0.155);
  color: var(--text-color-1);
  border: none;
}
</style>
