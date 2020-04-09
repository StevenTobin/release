{
  prometheusAlerts+:: {
    groups+: [
      {
        name: 'ci-absent',
        rules: [
          {
            alert: '%sDown' % name,
            expr: |||
              absent(up{job="%s"} == 1)
            ||| % name,
            'for': '5m',
            labels: {
              severity: 'critical',
            },
            annotations: {
              message: 'The service %s has been down for 5 minutes.' % name,
            },
          }
          for name in ['deck', 'deck-internal', 'ghproxy', 'hook', 'jenkins-dev-operator', 'jenkins-operator', 'kata-jenkins-operator', 'plank', 'release-controller', 'release-controller-ocp', 'release-controller-ocp-s390x', 'release-controller-ocp-ppc64le', 'sinker', 'tide']
        ],
      },
    ],
  },
}
