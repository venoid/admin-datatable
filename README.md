# 2Fresh Vue Components

### You are in Vue components library by 2Fresh!

![2fres_logo](https://assets.website-files.com/5ab9315060e600995ece7103/5ac48a61bbe2f5354cd275e3_2FHeart.svg)

## How to add new component

### Run project

```bash
# Install dependencies
yarn install

# Run
yarn serve
```

### Create new Vue component

1. **Create new Vue component and test it properly!**
You can use `/src/App.vue` component as a playground

    Always create coresponding folder for a component
```
.
|-- components
|   └── <ComponentName>
|       └── <ComponentName>.vue
```

2. When you done - import component in `/src/components/index.js` and then export as bundle

```javascript
// import
import <ComponentName> from "./<ComponentName>/<ComponentName>"

// export - please keep the fresh prefix!
export const fresh_<componentName> = <ComponentName>;
```

## How to publish to npm

1. make sure you are in **2f** scope

    You can achieve that using this command ```npm config get scope```

    And set scope using this command ```npm config set scope 2f```

2. make sure that npm registry is set to `https://registry.npmjs.org/`

    ***But it should be set by default...***

    Again you can check that using ```npm config get registry```

    And set using ```npm config set registry https://registry.npmjs.org/```

3. run publish command `yarn push-npm`

    You will be asked for new version and npm login.

    New version will be automatically pushed to the repository.
