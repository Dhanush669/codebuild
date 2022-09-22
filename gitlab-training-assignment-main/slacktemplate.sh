#!/bin/bash
# set -euo pipefail
FAILURE=1
SUCCESS=0
SLACKWEBHOOKURL="https://hooks.slack.com/services/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"
function print_slack_summary_build() {
    local slack_msg_header
    local slack_msg_body
    local slack_channel

        slack_msg_header=":heavy_check_mark: *Build to ${ENVIRONMENTNAME} succeeded*"
        #slack_channel="gitlab-training"
cat <<-SLACK
            {
                "blocks": [
                    {
                        "type": "section",
                        "text": {
                            "type": "mrkdwn",
                            "text": "${slack_msg_header}"
                        }
                    },
                    {
                        "type": "divider"
                    },
                    {   
                        "type": "section",
                        "fields": [
                            {
                                "type": "mrkdwn",
                                "text": "*Stage:*\n${CI_JOB_STAGE}"
                            },
                            {
                                "type": "mrkdwn",
                                "text": "*Pushed By:*\n${GITLAB_USER_NAME}"
                            },
                            
                            {
                                "type": "mrkdwn",
                                "text": "*Pipe Line Time:*\n$(date)"
                            },
                            {
                                "type": "mrkdwn",
                                "text": "*Commit Branch:*\n${CI_COMMIT_REF_NAME}"
                            },
                            {
                                "type": "mrkdwn",
                                "text": "*Job URL:*\nGITLAB_REPO_URL/${CI_JOB_URL}"
                            }
                        ]
                    },
                    {
                        "type": "divider"
                    }
                ]
}
SLACK
}

# function share_slack_update_build() {
#local slack_webhook
#slack_webhook="$SLACKWEBHOOKURL"
curl -X POST                                           \
        --data-urlencode "payload=$(print_slack_summary_build)"  \
        "${SLACKWEBHOOKURL}"
# }
