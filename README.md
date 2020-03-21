# bdd-uitests

This package allows you to write tests in a BDD style. It's Swift's function builders that allow a tiny dsl that makes your tests way more readable.

```swift
func test_iCanSeeTheStars() {
        test {
            Given {
                ILearnABitMore()
                IBuildARocket()
            }
            When {
                ILaunchARocket()
            }
            Then {
                ICanSeeTheStars()
            }
        }
    }
```
