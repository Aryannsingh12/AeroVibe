const express = require('express');
const cors = require('cors');
const client = require('prom-client'); // Native Prometheus metric visualizer connector

const app = express();
const PORT = process.env.PORT || 5000;

app.use(cors());
app.use(express.json());

// Enable collection of default Node.js system telemetry (CPU usage, Memory heap tracking, etc.)
const collectDefaultMetrics = client.collectDefaultMetrics;
collectDefaultMetrics({ register: client.register });

// Define custom business infrastructure metrics
const orderCounter = new client.Counter({
    name: 'aerovibe_processed_orders_total',
    help: 'Total number of custom product orders processed on the AeroVibe storefront'
});

const errorCounter = new client.Counter({
    name: 'aerovibe_injected_failures_total',
    help: 'Total count of user-injected infrastructure pipeline failures'
});

// In-memory state storage fallbacks for instant frontend UI polling requests
let totalOrders = 0;
let totalErrors = 0;

// Standard Business Logic Endpoints
app.get('/api/telemetry', (req, res) => {
    res.status(200).json({
        status: "Healthy",
        total_orders: totalOrders,
        total_errors: totalErrors,
        environment: "local-simulation"
    });
});

app.post('/api/order', (req, res) => {
    totalOrders += 1;
    orderCounter.inc(); // Increment inside the Prometheus memory cache register
    res.status(201).json({ message: "Order processed successfully." });
});

app.post('/api/error-trigger', (req, res) => {
    totalErrors += 1;
    errorCounter.inc(); // Increment inside the Prometheus memory cache register
    res.status(500).json({ error: "Simulated internal server exception injected." });
});

// ========================================================
// CRITICAL: Dedicated Prometheus Metrics Export Route
// ========================================================
app.get('/metrics', async (req, res) => {
    try {
        res.set('Content-Type', client.register.contentType);
        res.end(await client.register.metrics());
    } catch (err) {
        res.status(500).end(err);
    }
});

app.listen(PORT, () => {
    console.log(`[AeroVibe Engine Active] listening cleanly on system port ${PORT}`);
});