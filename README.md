# build-unreal-engine-game
Builds Unreal Engine game, currently supporting UE5.0.x

## About the building process
- Build: This stage compiles the executeables for the selected platform.
- Cook: This stage cooks content by executing the Editor in a special mode.
- Stage: This stage copies the executables and content to a staging area; a standalone directory outside of the development directory.
- Package: This stage packages the project into a platform's native distribution format.
- Deploy: This stage deploys the build to a target device.

More information:
https://docs.unrealengine.com/5.0/en-US/build-operations-cooking-packaging-deploying-and-running-projects-in-unreal-engine/
