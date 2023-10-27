Useful Stuff
============

Things that I find useful, and that help in my day-to-day tasks -- a
'toolbelt'.
I'm mostly writing these things here because I set them up, then a week later they need maintenance, but I completely forgot how I wired everything together. I'll use this repo as my map to find my way home, hoping that it makes some sense to me when I need it.

# Using Grafana to monitor my laptop

Started getting interested in Grafana and Prometheus, so decided to use Project 1 from [this list](https://grafana.com/blog/2021/01/08/get-started-with-prometheus-with-these-three-easy-projects/) to learn use it to visualize metrics on my local machine. When I got to the bit about adding the Node Exporter Metrics Dashboard to Grafana, I actually typed the ID to [this much cooler dashboard instead](https://github.com/rfmoz/grafana-dashboards/tree/master#node-exporter-full). Instead of getting the more basic view from Project 1, I got this much more detailed view instead:

![image](https://github.com/claudiusbr/useful_stuff/assets/13047598/53ec30eb-4ba9-4233-8393-01cfb7304136)

I thought to myself this is worth keeping, so I moved the runnable files from my `/training` directory to my `/projects/custom-apps` one. This included both the [Node Exporter](https://prometheus.io/docs/guides/node-exporter/) and the running version of Prometheus that I got from following [this guide](https://prometheus.io/docs/introduction/first_steps/).

Then I created two systemd service units, one to start node exporter, and the other to start prometheus itself. I already had grafana running as a service ([installed from apt](https://grafana.com/docs/grafana/latest/setup-grafana/installation/debian/#install-from-apt-repository)), so now all of them can be monitored with `systemctl`.

If this stuff ever breaks, check out the service units in `/etc/systemd/system` called `node-exporter-for-prometheus.service` and `prometheus-for-node-exporter.service`. If everything is ok there, check out what's happening inside `~/projects/custom-apps/prometheus-for-node-exporter`.
Grafana runs on `localhost:3000` by default, Node Exporter runs on `localhost:9100` and Prometheus on `localhost:9090`. 
