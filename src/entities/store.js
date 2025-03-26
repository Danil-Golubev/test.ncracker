import { defineStore } from "pinia";

export const useDataStore = defineStore("dataStore", {
  state: () => ({
    cities: ["Москва", "Санкт-Петербург", "Новосибирск"],
    workshops: {
      Москва: ["Цех 1", "Цех 2"],
      "Санкт-Петербург": ["Цех 3", "Цех 4"],
      Новосибирск: ["Цех 5"],
    },
    employees: {
      "Цех 1": ["Иванов", "Петров"],
      "Цех 2": ["Сидоров"],
      "Цех 3": ["Кузнецов"],
      "Цех 4": ["Смирнов", "Васильев"],
      "Цех 5": ["Федоров"],
    },
    teams: ["Бригада A", "Бригада B", "Бригада C"],
    shifts: ["Первая", "Вторая", "Ночная"],

    selectedCity: "",
    selectedWorkshop: "",
    selectedEmployee: "",
    selectedTeam: "",
    selectedShift: "",
  }),

  actions: {
    setCity(city) {
      this.selectedCity = city;
      this.selectedWorkshop = "";
      this.selectedEmployee = "";
    },
    setWorkshop(workshop) {
      this.selectedWorkshop = workshop;
      this.selectedEmployee = "";
    },
    setEmployee(employee) {
      this.selectedEmployee = employee;
    },
    setTeam(team) {
      this.selectedTeam = team;
    },
    setShift(shift) {
      this.selectedShift = shift;
    },
    resetFormValues() {
      this.selectedCity = "";
      this.selectedWorkshop = "";
      this.selectedEmployee = "";
      this.selectedTeam = "";
      this.selectedShift = "";
    },
  },
});
