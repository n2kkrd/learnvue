<template>
    <div>
      <student-chart></student-chart>
    </div>
  </template>
  
  <script>
  import StudentChart from '@/components/grade/StudentChart.vue'
  
  export default {
    name: 'SecondView',
    components: {
      StudentChart
    }
  }
  </script>
  