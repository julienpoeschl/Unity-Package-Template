# Template
This is a template to create [Unity](https://unity.com) packages. Unity packages are installed into `/Packages` instead of `/Assets`. They are a great way of clearing of your `/Assets` folder and allow you easily reuse systems you've already built.

# Installation
**Local Installation (for development)**

You'll firstly want to get a local version of your package for development.

1. Use this template to create a new repository (recommended) or clone this one directly.
2. Now open a Unity project to develop your own package. Open two instances of your prefered IDE (recommended). One for your local version of your repository and the other for the Unity project.
3. The empty template can be imported to your Unity project as is, but you might want to first exchange every occurence of `yourname` or `packagename` with your own. The template also contains two `README` (one in the repository root and another in the package folder) and a `LICENSE` that you could update.

Here is a list of all files that contain `yourname` or `packagename`:
- `package.json`
- ...


4. In your Unity project (IDE) access the `manifest.json` in `/Package`. Add an entry with `com.yourname.packagename` (or your new names) and link it to your local path using the `file:` prefix: `"file:C:/.../com.yourname.packagename"` (Windows example).
5. Now reload the Unity Editor. The package should get installed automatically.
6. Now you can use the first IDE instance to work on your package and either close the second or develop the project.
   
**Installation from Github**

After finishing your package, you can import it from [Github](https://github.com) instead of locally.

1. Upload your package to Github or push your final changes.
2. Use `git tag v1.0.0` and `git push origin v1.0.0` with your prefered version.
3. Now you should be able to use `https://github.com/yourname/yourpackage.git#v1.0.0` or `"https://github.com/yourname/yourpackage.git?path=com.yourname.yourpackage#v1.0.0"` instead of the local path in the `manifest.json` of your desired project. You should also be able to find you project in the Package Manager via the Github link.
