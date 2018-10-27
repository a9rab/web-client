<template>
    <div id="map"></div>
</template>

<script>
export default {
    data () {
        return {
            map: null,
            positions: []
        }
    },

    mounted () {
        this.map = new google.maps.Map(document.querySelector('#map'), {
          center: {lat: 35.0, lng: 2.7},
          zoom: 8
        })

        this.$http.get(`/positions?email=${current_user.email}`).then(({data}) => {
            data.forEach(point => {
                data.marker = this.createMarker(point)
            })
            this.positions = data;
        });
    },

    methods: {
        createMarker (point) {
            let contentString = "<div class=\"card\">"+
              "<header class=\"card-header\">"+
              "<i class=\"fa fa-user-circle fa-3x\"></i>"+
              " <b>" + point.name + "</b><br />"+
              "</header></div>";
            let marker = new google.maps.Marker({
                position: point,
                map: this.map,
                title: point.name
            });

            let infowindow = new google.maps.InfoWindow({
                content: contentString
            });

            marker.addListener('click', function() {
                infowindow.open(this.map, marker);
            });

            return marker;
        },
    }
}
</script>

