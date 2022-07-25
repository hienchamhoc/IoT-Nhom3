import React from 'react';
import { Chart } from 'react-google-charts';

function SensorChart({ data }) {

    return (
        <Chart
            width={'100%'}
            height={'400px'}
            chartType="LineChart"
            loader={<div>Đang tải</div>}
            data={data}
            options={{
                title: 'Thời gian sử dụng',
                vAxis: {
                    title: 'Hours',
                },
                series: {
                    0: { curveType: 'function' },
                    1: { curveType: 'function' },
                },
                legend: { position: "bottom" }
            }}
        />
    );
}

export default SensorChart;