import path from 'path'
import rimraf from 'rimraf'
import chalk from 'chalk'
import webpack from 'webpack'
import { config } from '../webpack.config'

/*
Build webpack bundle

- 🔥 whatever is currently in `output`
- Build both Webpack configs into `output`
- Call the default export of the prerender bundle
- Watch for changes, rinse & repeat

That's all. You won't even find a dev server in here!
**********************************************************/

const mode = process.argv[2]
const bundleConfig = config(mode) as webpack.Configuration

if (bundleConfig.output?.path != null) {
  rimraf(
    path.resolve(bundleConfig.output.path, './*'),
    (error?: Error | null): void => {
      if (error) {
        console.error(chalk.red(error))
        process.exit()
      }

      const mode = process.argv[2]
      const compiler = webpack([bundleConfig])

      const watching = compiler.watch({}, (_err, compilation): void => {
        if (compilation === undefined) return

        compilation.stats.forEach((stats) => {
          console.log(stats.toString({ colors: true }))
        })

        if (mode === 'production') {
          watching.close(() => {})
          if (compilation.hasErrors()) process.exit(1)
        }
      })
    }
  )
}
