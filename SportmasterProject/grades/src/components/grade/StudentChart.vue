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
import Chart from 'chart.js/auto'

export default {
name: 'StudentChart',
data () {
  return {
    pieChart: null,
    barChart: null,
  }
},
async created () {
  await this.loadData()

},
computed: {
  chartData: function () {
    const gradeCounts = {}
    const studentsByGrade = {}
    this.$store.state.grade.grades.forEach((grade) => {
      const gradeValue = grade.grade
      if (!gradeCounts[gradeValue]) {
        gradeCounts[gradeValue] = 0
        studentsByGrade[gradeValue] = []
      }
      gradeCounts[gradeValue]++
      studentsByGrade[gradeValue].push(this.$store.state.student.students.get(grade.studentCode))
    })

    return Object.entries(gradeCounts).map(([gradeValue, count]) => ({
      gradeValue,
      count,
      students: studentsByGrade[gradeValue],
    }))
  },
  chartDataAndOptions: function () {
    const chartData = this.chartData
    const data = {
      labels: chartData.map((grade) => grade.gradeValue),
      datasets: [
        {
          data: chartData.map((grade) => grade.count),
          backgroundColor: [
            '#FF6384',
            '#36A2EB',
            '#FFCE56',
            '#8DFF00',
            '#FF5733',
            '#C41E3D',
          ],
        },
      ],
    }
    const options = {
      responsive: true,
      maintainAspectRatio: false,
      plugins: {
        tooltip: {
          callbacks: {
            label: function (tooltipItem) {
              const array = chartData[tooltipItem.dataIndex].students.map(({ fullName }) => fullName)
              array.unshift(tooltipItem.raw)
              return array
            }
          },
        },
      }
    }

    return { data, options }
  }
},
methods: {
  async loadData () {
    await this.$store.dispatch('student/getStudents')
    await this.$store.dispatch('grade/getCourses')
    await this.$store.dispatch('grade/getGrades')

    this.createPieChart()
    this.createBarChart()
  },

  createPieChart () {
    this.pieChart = new Chart(this.$refs.pieChart, {
      type: 'pie',
      ...this.chartDataAndOptions,
    })
  },
  createBarChart () {
    const { data, options } = this.chartDataAndOptions
    options.plugins.legend = {
      display: false
    }
    this.barChart = new Chart(this.$refs.barChart, {
      type: 'bar',
      data,
      options,
    })
  },
},
}
</script>
