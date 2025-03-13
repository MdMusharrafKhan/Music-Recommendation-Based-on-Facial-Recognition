var canvasElement = document.getElementById("feed");
var config = {
    type:"bar",
    data:{
        labels:["1Star","2Star","3Star","4Star","5Star"],
        datasets:[{label:"Number of Ratings",data:[5,29,13,18,43],
        backgroundColor: [
            'rgba(255, 99, 132, 0.2)',
            'rgba(255, 159, 64, 0.2)',
            'rgba(255, 205, 86, 0.2)',
            'rgba(75, 192, 192, 0.2)',
            'rgba(54, 162, 235, 0.2)'
        ],
        borderColor: [
            'rgb(255, 99, 132)',
            'rgb(255, 159, 64)',
            'rgb(255, 205, 86)',
            'rgb(75, 192, 192)',
            'rgb(54, 162, 235)'
        ],
        borderWidth: 1,}],
    },
};

var feedbackChart = new Chart(canvasElement,config);
