# Template Instructions
1. Use this template to create a new repository (recommended) or clone this one directly.
2. Now open a Unity project to install your own package and open two instances of your prefered IDE (recommended). One for your local version of your repository and in the other for the Unity project.
3. The empty template can be imported to your Unity project as is, but you might want to first exchange every occurence of `yourname` or `packagename` with your own. The template also contains two `README` (one in the repository root and another in the package folder) and a `LICENSE` that you could update.
4. In your Unity project (IDE) access the `manifest.json` in `/Package`. Add an entry with `com.yourname.packagename` (or your new names) and link it to your local path using the `file:` prefix: `"file:C:/.../com.yourname.packagename"`.
5. Now reload the Unity Editor. The package should get installed automatically.
6. Now you can use the first IDE instance to work on your package and either close the second or develop the project.

**Enjoy**
