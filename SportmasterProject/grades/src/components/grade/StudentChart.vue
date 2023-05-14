<template>
  <v-container>
    <v-row>
      <v-col cols="6">
        <v-card>
          <v-card-title>Круговая диаграмма распределения оценок</v-card-title>
          <v-card-text>
            <canvas ref="pieChart" width="400" height="400"></canvas>
          </v-card-text>
        </v-card>
      </v-col>
      <v-col cols="6">
        <v-card>
          <v-card-title>Столбчатая диаграмма распределения оценок по курсам</v-card-title>
          <v-card-text>
            <canvas ref="barChart" width="400" height="400"></canvas>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import Chart from 'chart.js';

export default {
  name: 'StudentChart',
  data() {
    return {
      pieData: [],
      barData: [],
      pieChart: null,
      barChart: null,
    };
  },
  async created() {
    await this.loadData();
    
  },
  methods: {
    async loadData() {
        await this.$store. dispatch ("grade/getCourses");
        await this.$store.dispatch ("grade/getGrades");
        this.pieData = this.$store.state.grade.grades;
        this.barData = this.$store.state.grade.courses; 
        console.log(this.pieData)
        this.createPieChart();
        this.createBarChart();
        
        
    },
    createPieChart() {
      
      const data = {
        labels: this.pieData.map((grade) => grade.studentName),
        datasets: [
          {
            data: this.pieData.map((grade) => grade.grade),
            backgroundColor: [
              '#FF6384',
              '#36A2EB',
              '#FFCE56',
              '#8DFF00',
              '#FF5733',
              '#C41E3D',
            ],
            hoverBackgroundColor: [
              '#FF6384',
              '#36A2EB',
              '#FFCE56',
              '#8DFF00',
              '#FF5733',
              '#C41E3D',
            ],
          },
        ],
      };
      const options = {
        responsive: true,
        maintainAspectRatio: false,
        legend: {
          display: true,
          position: 'right',
          align: 'center',
          labels: {
            boxWidth: 20,
            fontSize: 12,
          },
        },
        tooltips: {
          mode: 'index',
          intersect: false,
        },
      };
      this.pieChart = new Chart(this.$refs.pieChart, {
        type: 'pie',
        data,
        options,
      });
    },
    createBarChart() {
      const data = {
        labels: this.barData.map((course) => course.courseName),
        datasets: [
          {
            label: 'Оценки',
            backgroundColor: '#4CAF50',
            data: this.barData.map((course) => course.averageGrade),
          },
        ],
      };
      const options = {
        responsive: true,
        maintainAspectRatio: false,
        scales: {
          yAxes: [
            {
              ticks: {
                beginAtZero: true,
              },
            },
          ],
        },
        legend: {
          display: false,
        },
        tooltips: {
          mode: 'index',
          intersect: false,
        },
      };
      this.barChart = new Chart(this.$refs.barChart, {
        type: 'bar',
        data,
        options,
      });
    },
  },
};
</script>
