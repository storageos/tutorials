## Where do I view StorageOS tutorials?

The StorageOS interactive scenarios can be viewed at https://play.storageos.com.

## Contributing to the docs

Contributions are welcomed and gratefully received. To contribute, you should fork the repo and submit updates as pull requests for review. Commits to master on this repo will be automatically updated to Katacoda.

Notes:
* `index.json` is the key file for defining the scenario in each directory.
* `"imageid": "docker-direct"` enables sudo access for an environment.
* `"imageid": "storageos-docker"` is our custom three node environment defined in the [Packer script here](https://github.com/katacoda-scenarios/storageos-tutorials/blob/master/environments/docker/packer.json).

### Content guidelines

Each tutorial should be self contained, without dependencies on other tutorials.

Use short, readable, but full English sentences throughout.

### Testing changes

The best way to test tutorials is to create your own Katacoda account and link it to your Github fork. Once you're happy with the fork, pull request to upstream and once merged, Katacoda will automatically update.

## Getting help

For errors in the tutorials or requests:
* [Raise an issue](https://github.com/storageos/tutorials/issues/new)

For help with StorageOS:
* [Public documentation](https://docs.storageos.com)
* [Slack channel](https://slack.storageos.com/)
* [Contact support](mailto:support@storageos.com)

For help with Katacoda:
* [Katacoda documentation](https://www.katacoda.com/docs)
* [Example scenarios](https://github.com/katacoda-scenarios)
* Contact [ben@katacoda.com](mailto:ben@katacoda.com)
