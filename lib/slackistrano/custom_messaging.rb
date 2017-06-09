module Slackistrano
  class CustomMessaging < Messaging::Base
    def payload_for_updating
      {
        attachments: [{
          color: 'warning',
          title: 'Application Deploy Started :arrow_upper_right:',
          fields: [{
            title: 'App Name',
            value: application,
            short: true
          }, {
            title: 'Branch',
            value: branch,
            short: true
          }, {
            title: 'Deployer',
            value: deployer,
            short: true
          }],
          fallback: super[:text]
        }]
      }
    end

    def payload_for_reverting
      {
        attachments: [{
          color: 'warning',
          title: 'Application Rollback Started :arrow_lower_left:',
          fields: [{
            title: 'App Name',
            value: application,
            short: true
          }, {
            title: 'Branch',
            value: branch,
            short: true
          }, {
            title: 'Deployer',
            value: deployer,
            short: true
          }],
          fallback: super[:text]
        }]
      }
    end

    def payload_for_updated
      {
        attachments: [{
          color: 'good',
          title: 'Application Deployed :sparkles:',
          fields: [{
            title: 'App Name',
            value: application,
            short: true
          }, {
            title: 'Branch',
            value: branch,
            short: true
          }, {
            title: 'Deployer',
            value: deployer,
            short: true
          }, {
            title: 'Time',
            value: elapsed_time,
            short: true
          }],
          fallback: super[:text]
        }]
      }
    end

    def payload_for_reverted
      {
        attachments: [{
          color: 'good',
          title: 'Application Rollbacked :sweat_drops:',
          fields: [{
            title: 'App Name',
            value: application,
            short: true
          }, {
            title: 'Branch',
            value: branch,
            short: true
          }, {
            title: 'Deployer',
            value: deployer,
            short: true
          }, {
            title: 'Time',
            value: elapsed_time,
            short: true
          }],
          fallback: super[:text]
        }]
      }
    end

    def payload_for_failed
      {
        attachments: [{
          color: 'danger',
          title: 'Application Deploy Failed :innocent:',
          fields: [{
            title: 'App Name',
            value: application,
            short: true
          }, {
            title: 'Branch',
            value: branch,
            short: true
          }, {
            title: 'Deployer',
            value: deployer,
            short: true
          }, {
            title: 'Time',
            value: elapsed_time,
            short: true
          }],
          fallback: super[:text]
        }]
      }
    end

    def deployer
      Etc.getpwnam(ENV['USER']).gecos
    end
  end
end
